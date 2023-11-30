// For more information on using drift, please see https://drift.simonbinder.eu/docs/getting-started/
// A full cross-platform example is available here: https://github.com/simolus3/drift/tree/develop/examples/app

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'main.g.dart';

class Todo extends Table {
  TextColumn get id => text()();

  TextColumn get listid => text().nullable()();

  TextColumn get text$ => text().named('text').nullable()();

  BoolColumn get completed => boolean()();
}

@DataClassName('TodoCategory')
class TodoCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

@TableIndex(name: 'item_title', columns: {#title})
class TodoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text().nullable()();
  IntColumn get categoryId => integer().references(TodoCategories, #id)();

  TextColumn get generatedText => text().nullable().generatedAs(
      title + const Constant(' (') + content + const Constant(')'))();
}

abstract class TodoCategoryItemCount extends View {
  TodoItems get todoItems;
  TodoCategories get todoCategories;

  Expression<int> get itemCount => todoItems.id.count();

  @override
  Query as() => select([
        todoCategories.name,
        itemCount,
      ]).from(todoCategories).join([
        innerJoin(todoItems, todoItems.categoryId.equalsExp(todoCategories.id))
      ]);
}

@DriftView(name: 'customViewName')
abstract class TodoItemWithCategoryNameView extends View {
  TodoItems get todoItems;
  TodoCategories get todoCategories;

  Expression<String> get title =>
      todoItems.title +
      const Constant('(') +
      todoCategories.name +
      const Constant(')');

  @override
  Query as() => select([todoItems.id, title]).from(todoItems).join([
        innerJoin(
            todoCategories, todoCategories.id.equalsExp(todoItems.categoryId))
      ]);
}

@DriftDatabase(tables: [
  Todo,
  TodoItems,
  TodoCategories,
], views: [
  TodoCategoryItemCount,
  TodoItemWithCategoryNameView,
])
class Database extends _$Database {
  Database(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();

        // Add a bunch of default items in a batch
        await batch((b) {
          b.insertAll(todoItems, [
            TodoItemsCompanion.insert(title: 'A first entry', categoryId: 0),
            TodoItemsCompanion.insert(
              title: 'Todo: Checkout drift',
              content: const Value('Drift is a persistence library for Dart '
                  'and Flutter applications.'),
              categoryId: 0,
            ),
          ]);
        });
      },
    );
  }

  // The TodoItem class has been generated by drift, based on the TodoItems
  // table description.
  //
  // In drift, queries can be watched by using .watch() in the end.
  // For more information on queries, see https://drift.simonbinder.eu/docs/getting-started/writing_queries/
  Stream<List<TodoItem>> get allItems => select(todoItems).watch();
}

Future<void> main() async {
  // Create an in-memory instance of the database with todo items.
  final db = Database(NativeDatabase.memory());

  db.allItems.listen((event) {
    print('Todo-item in database: $event');
  });

  // Add category
  final categoryId = await db
      .into(db.todoCategories)
      .insert(TodoCategoriesCompanion.insert(name: 'Category'));

  // Add another entry
  await db.into(db.todoItems).insert(TodoItemsCompanion.insert(
      title: 'Another entry added later', categoryId: categoryId));

  final query = db.select(db.todoItems).join([
    innerJoin(db.todoCategories,
        db.todoCategories.id.equalsExp(db.todoItems.categoryId))
  ]);

  for (final row in await query.get()) {
    print('has row');
    print(row.read(db.todoItems.categoryId));
    print(row.read(db.todoCategories.name));
  }
}
