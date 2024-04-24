import 'package:drift/drift.dart';
import 'package:drift_dev/src/analysis/options.dart';
import 'package:drift_dev/src/analysis/results/table.dart';
import 'package:test/test.dart';

import '../../test_utils.dart';

void main() {
  test('supports virtual tables across drift files', () async {
    final state = await TestBackend.inTest(
      {
        'a|lib/table.drift': '''
CREATE TABLE example_table (
    json_column TEXT,
    name TEXT,
    content TEXT
);

CREATE VIRTUAL TABLE example_table_search
    USING fts5(
        name, content, content='example_table', content_rowid='rowid'
    );
''',
        'a|lib/queries.drift': '''
import 'table.drift';

exampleSearch: SELECT example_table.**, s.* FROM example_table
    INNER JOIN (
        SELECT rowid,
            highlight(example_table_search, 0, '[match]', '[match]') name,
            snippet(example_table_search, 1, '[match]', '[match]', '...', 10) content,
            bm25(example_table_search) AS rank
        FROM example_table_search WHERE example_table_search MATCH :search
    ) AS s
    ON s.rowid = example_table.rowid;
''',
      },
      options: const DriftOptions.defaults(modules: [SqlModule.fts5]),
    );

    final result = await state.analyze('package:a/queries.drift');
    expect(result.allErrors, isEmpty);
  });

  test('query virtual tables with unknown function', () async {
    final state = await TestBackend.inTest(
      {
        'a|lib/table.drift': '''
CREATE TABLE example_table (
    json_column TEXT,
    name TEXT,
    content TEXT
);

CREATE VIRTUAL TABLE example_table_search
    USING fts5(
        name, content, content='example_table', content_rowid='rowid'
    );

exampleSearch:
SELECT rowid, highlight(example_table_search, 0, '[match]', '[match]') name,
            snippet(example_table_search, 1, '[match]', '[match]', '...', 10) content,
            bm25(example_table_search) AS rank
        FROM example_table_search WHERE example_table_search MATCH simple_query(:search);
        ''',
      },
      options: const DriftOptions.defaults(modules: [SqlModule.fts5]),
    );
    final result = await state.analyze('package:a/table.drift');
    expect(result.allErrors,
        [isDriftError(contains('Function simple_query could not be found'))]);
  });

  test('supports spellfix1 tables', () async {
    final state = await TestBackend.inTest(
      {'a|lib/a.drift': 'CREATE VIRTUAL TABLE demo USING spellfix1;'},
      options: DriftOptions.defaults(
        dialect: DialectOptions(
          null,
          [SqlDialect.sqlite],
          SqliteAnalysisOptions(
            modules: [SqlModule.spellfix1],
          ),
        ),
      ),
    );
    final file = await state.analyze('package:a/a.drift');
    state.expectNoErrors();

    final table = file.analyzedElements.single as DriftTable;
    expect(
      table.columns.map((e) => e.nameInSql),
      containsAll(['word', 'rank', 'distance', 'langid', 'score', 'matchlen']),
    );
  });
}
