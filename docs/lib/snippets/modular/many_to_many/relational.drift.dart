// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:drift_docs/snippets/modular/many_to_many/shared.drift.dart'
    as i1;
import 'package:drift_docs/snippets/modular/many_to_many/relational.drift.dart'
    as i2;
import 'package:drift/internal/modular.dart' as i3;
import 'package:drift_docs/snippets/modular/many_to_many/relational.dart' as i4;

abstract class $RelationalDatabase extends i0.GeneratedDatabase {
  $RelationalDatabase(i0.QueryExecutor e) : super(e);
  $RelationalDatabaseManager get managers => $RelationalDatabaseManager(this);
  late final i1.$BuyableItemsTable buyableItems = i1.$BuyableItemsTable(this);
  late final i2.$ShoppingCartsTable shoppingCarts =
      i2.$ShoppingCartsTable(this);
  late final i2.$ShoppingCartEntriesTable shoppingCartEntries =
      i2.$ShoppingCartEntriesTable(this);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities =>
      [buyableItems, shoppingCarts, shoppingCartEntries];
}

class $$BuyableItemsTableFilterComposer
    extends i0.FilterComposer<i0.GeneratedDatabase, i1.$BuyableItemsTable> {
  $$BuyableItemsTableFilterComposer(super.db, super.table);
  i0.ColumnFilters<int> get id => i0.ColumnFilters($table.id);
  i0.ColumnFilters<String> get description =>
      i0.ColumnFilters($table.description);
  i0.ColumnFilters<int> get price => i0.ColumnFilters($table.price);
  i0.ComposableFilter shoppingCartEntriesRefs(
      i0.ComposableFilter Function($$ShoppingCartEntriesTableFilterComposer f)
          f) {
    return $composeWithJoins(
        $db: $db,
        $table: $table,
        referencedTable: i3.ReadDatabaseContainer($db)
            .resultSet<i2.$ShoppingCartEntriesTable>('shopping_cart_entries'),
        getCurrentColumn: (f) => f.id,
        getReferencedColumn: (f) => f.item,
        getReferencedComposer: (db, table) =>
            $$ShoppingCartEntriesTableFilterComposer(db, table),
        builder: f);
  }
}

class $$BuyableItemsTableOrderingComposer
    extends i0.OrderingComposer<i0.GeneratedDatabase, i1.$BuyableItemsTable> {
  $$BuyableItemsTableOrderingComposer(super.db, super.table);
  i0.ColumnOrderings<int> get id => i0.ColumnOrderings($table.id);
  i0.ColumnOrderings<String> get description =>
      i0.ColumnOrderings($table.description);
  i0.ColumnOrderings<int> get price => i0.ColumnOrderings($table.price);
}

class $$BuyableItemsTableProcessedTableManager extends i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.$BuyableItemsTable,
    i1.BuyableItem,
    $$BuyableItemsTableFilterComposer,
    $$BuyableItemsTableOrderingComposer,
    $$BuyableItemsTableProcessedTableManager,
    $$BuyableItemsTableInsertCompanionBuilder,
    $$BuyableItemsTableUpdateCompanionBuilder> {
  const $$BuyableItemsTableProcessedTableManager(super.$state);
}

typedef $$BuyableItemsTableInsertCompanionBuilder = i1.BuyableItemsCompanion
    Function({
  i0.Value<int> id,
  required String description,
  required int price,
});
typedef $$BuyableItemsTableUpdateCompanionBuilder = i1.BuyableItemsCompanion
    Function({
  i0.Value<int> id,
  i0.Value<String> description,
  i0.Value<int> price,
});

class $$BuyableItemsTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.$BuyableItemsTable,
    i1.BuyableItem,
    $$BuyableItemsTableFilterComposer,
    $$BuyableItemsTableOrderingComposer,
    $$BuyableItemsTableProcessedTableManager,
    $$BuyableItemsTableInsertCompanionBuilder,
    $$BuyableItemsTableUpdateCompanionBuilder> {
  $$BuyableItemsTableTableManager(
      i0.GeneratedDatabase db, i1.$BuyableItemsTable table)
      : super(i0.TableManagerState(
            db: db,
            table: table,
            filteringComposer: $$BuyableItemsTableFilterComposer(db, table),
            orderingComposer: $$BuyableItemsTableOrderingComposer(db, table),
            getChildManagerBuilder: (p0) =>
                $$BuyableItemsTableProcessedTableManager(p0),
            getUpdateCompanionBuilder: ({
              i0.Value<int> id = const i0.Value.absent(),
              i0.Value<String> description = const i0.Value.absent(),
              i0.Value<int> price = const i0.Value.absent(),
            }) =>
                i1.BuyableItemsCompanion(
                  id: id,
                  description: description,
                  price: price,
                ),
            getInsertCompanionBuilder: ({
              i0.Value<int> id = const i0.Value.absent(),
              required String description,
              required int price,
            }) =>
                i1.BuyableItemsCompanion.insert(
                  id: id,
                  description: description,
                  price: price,
                )));
}

class $$ShoppingCartsTableFilterComposer
    extends i0.FilterComposer<i0.GeneratedDatabase, i2.$ShoppingCartsTable> {
  $$ShoppingCartsTableFilterComposer(super.db, super.table);
  i0.ColumnFilters<int> get id => i0.ColumnFilters($table.id);
  i0.ComposableFilter shoppingCartEntriesRefs(
      i0.ComposableFilter Function($$ShoppingCartEntriesTableFilterComposer f)
          f) {
    return $composeWithJoins(
        $db: $db,
        $table: $table,
        referencedTable: i3.ReadDatabaseContainer($db)
            .resultSet<i2.$ShoppingCartEntriesTable>('shopping_cart_entries'),
        getCurrentColumn: (f) => f.id,
        getReferencedColumn: (f) => f.shoppingCart,
        getReferencedComposer: (db, table) =>
            $$ShoppingCartEntriesTableFilterComposer(db, table),
        builder: f);
  }
}

class $$ShoppingCartsTableOrderingComposer
    extends i0.OrderingComposer<i0.GeneratedDatabase, i2.$ShoppingCartsTable> {
  $$ShoppingCartsTableOrderingComposer(super.db, super.table);
  i0.ColumnOrderings<int> get id => i0.ColumnOrderings($table.id);
}

class $$ShoppingCartsTableProcessedTableManager
    extends i0.ProcessedTableManager<
        i0.GeneratedDatabase,
        i2.$ShoppingCartsTable,
        i2.ShoppingCart,
        $$ShoppingCartsTableFilterComposer,
        $$ShoppingCartsTableOrderingComposer,
        $$ShoppingCartsTableProcessedTableManager,
        $$ShoppingCartsTableInsertCompanionBuilder,
        $$ShoppingCartsTableUpdateCompanionBuilder> {
  const $$ShoppingCartsTableProcessedTableManager(super.$state);
}

typedef $$ShoppingCartsTableInsertCompanionBuilder = i2.ShoppingCartsCompanion
    Function({
  i0.Value<int> id,
});
typedef $$ShoppingCartsTableUpdateCompanionBuilder = i2.ShoppingCartsCompanion
    Function({
  i0.Value<int> id,
});

class $$ShoppingCartsTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i2.$ShoppingCartsTable,
    i2.ShoppingCart,
    $$ShoppingCartsTableFilterComposer,
    $$ShoppingCartsTableOrderingComposer,
    $$ShoppingCartsTableProcessedTableManager,
    $$ShoppingCartsTableInsertCompanionBuilder,
    $$ShoppingCartsTableUpdateCompanionBuilder> {
  $$ShoppingCartsTableTableManager(
      i0.GeneratedDatabase db, i2.$ShoppingCartsTable table)
      : super(i0.TableManagerState(
            db: db,
            table: table,
            filteringComposer: $$ShoppingCartsTableFilterComposer(db, table),
            orderingComposer: $$ShoppingCartsTableOrderingComposer(db, table),
            getChildManagerBuilder: (p0) =>
                $$ShoppingCartsTableProcessedTableManager(p0),
            getUpdateCompanionBuilder: ({
              i0.Value<int> id = const i0.Value.absent(),
            }) =>
                i2.ShoppingCartsCompanion(
                  id: id,
                ),
            getInsertCompanionBuilder: ({
              i0.Value<int> id = const i0.Value.absent(),
            }) =>
                i2.ShoppingCartsCompanion.insert(
                  id: id,
                )));
}

class $$ShoppingCartEntriesTableFilterComposer extends i0
    .FilterComposer<i0.GeneratedDatabase, i2.$ShoppingCartEntriesTable> {
  $$ShoppingCartEntriesTableFilterComposer(super.db, super.table);
  i0.ColumnFilters<int> get shoppingCartId =>
      i0.ColumnFilters($table.shoppingCart);
  i0.ComposableFilter shoppingCart(
      i0.ComposableFilter Function($$ShoppingCartsTableFilterComposer f) f) {
    return $composeWithJoins(
        $db: $db,
        $table: $table,
        referencedTable: i3.ReadDatabaseContainer($db)
            .resultSet<i2.$ShoppingCartsTable>('shopping_carts'),
        getCurrentColumn: (f) => f.shoppingCart,
        getReferencedColumn: (f) => f.id,
        getReferencedComposer: (db, table) =>
            $$ShoppingCartsTableFilterComposer(db, table),
        builder: f);
  }

  i0.ColumnFilters<int> get itemId => i0.ColumnFilters($table.item);
  i0.ComposableFilter item(
      i0.ComposableFilter Function($$BuyableItemsTableFilterComposer f) f) {
    return $composeWithJoins(
        $db: $db,
        $table: $table,
        referencedTable: i3.ReadDatabaseContainer($db)
            .resultSet<i1.$BuyableItemsTable>('buyable_items'),
        getCurrentColumn: (f) => f.item,
        getReferencedColumn: (f) => f.id,
        getReferencedComposer: (db, table) =>
            $$BuyableItemsTableFilterComposer(db, table),
        builder: f);
  }
}

class $$ShoppingCartEntriesTableOrderingComposer extends i0
    .OrderingComposer<i0.GeneratedDatabase, i2.$ShoppingCartEntriesTable> {
  $$ShoppingCartEntriesTableOrderingComposer(super.db, super.table);
  i0.ColumnOrderings<int> get shoppingCartId =>
      i0.ColumnOrderings($table.shoppingCart);
  i0.ComposableOrdering shoppingCart(
      i0.ComposableOrdering Function($$ShoppingCartsTableOrderingComposer o)
          o) {
    return $composeWithJoins(
        $db: $db,
        $table: $table,
        referencedTable: i3.ReadDatabaseContainer($db)
            .resultSet<i2.$ShoppingCartsTable>('shopping_carts'),
        getCurrentColumn: (f) => f.shoppingCart,
        getReferencedColumn: (f) => f.id,
        getReferencedComposer: (db, table) =>
            $$ShoppingCartsTableOrderingComposer(db, table),
        builder: o);
  }

  i0.ColumnOrderings<int> get itemId => i0.ColumnOrderings($table.item);
  i0.ComposableOrdering item(
      i0.ComposableOrdering Function($$BuyableItemsTableOrderingComposer o) o) {
    return $composeWithJoins(
        $db: $db,
        $table: $table,
        referencedTable: i3.ReadDatabaseContainer($db)
            .resultSet<i1.$BuyableItemsTable>('buyable_items'),
        getCurrentColumn: (f) => f.item,
        getReferencedColumn: (f) => f.id,
        getReferencedComposer: (db, table) =>
            $$BuyableItemsTableOrderingComposer(db, table),
        builder: o);
  }
}

class $$ShoppingCartEntriesTableProcessedTableManager
    extends i0.ProcessedTableManager<
        i0.GeneratedDatabase,
        i2.$ShoppingCartEntriesTable,
        i2.ShoppingCartEntry,
        $$ShoppingCartEntriesTableFilterComposer,
        $$ShoppingCartEntriesTableOrderingComposer,
        $$ShoppingCartEntriesTableProcessedTableManager,
        $$ShoppingCartEntriesTableInsertCompanionBuilder,
        $$ShoppingCartEntriesTableUpdateCompanionBuilder> {
  const $$ShoppingCartEntriesTableProcessedTableManager(super.$state);
}

typedef $$ShoppingCartEntriesTableInsertCompanionBuilder
    = i2.ShoppingCartEntriesCompanion Function({
  required int shoppingCart,
  required int item,
  i0.Value<int> rowid,
});
typedef $$ShoppingCartEntriesTableUpdateCompanionBuilder
    = i2.ShoppingCartEntriesCompanion Function({
  i0.Value<int> shoppingCart,
  i0.Value<int> item,
  i0.Value<int> rowid,
});

class $$ShoppingCartEntriesTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i2.$ShoppingCartEntriesTable,
    i2.ShoppingCartEntry,
    $$ShoppingCartEntriesTableFilterComposer,
    $$ShoppingCartEntriesTableOrderingComposer,
    $$ShoppingCartEntriesTableProcessedTableManager,
    $$ShoppingCartEntriesTableInsertCompanionBuilder,
    $$ShoppingCartEntriesTableUpdateCompanionBuilder> {
  $$ShoppingCartEntriesTableTableManager(
      i0.GeneratedDatabase db, i2.$ShoppingCartEntriesTable table)
      : super(i0.TableManagerState(
            db: db,
            table: table,
            filteringComposer:
                $$ShoppingCartEntriesTableFilterComposer(db, table),
            orderingComposer:
                $$ShoppingCartEntriesTableOrderingComposer(db, table),
            getChildManagerBuilder: (p0) =>
                $$ShoppingCartEntriesTableProcessedTableManager(p0),
            getUpdateCompanionBuilder: ({
              i0.Value<int> shoppingCart = const i0.Value.absent(),
              i0.Value<int> item = const i0.Value.absent(),
              i0.Value<int> rowid = const i0.Value.absent(),
            }) =>
                i2.ShoppingCartEntriesCompanion(
                  shoppingCart: shoppingCart,
                  item: item,
                  rowid: rowid,
                ),
            getInsertCompanionBuilder: ({
              required int shoppingCart,
              required int item,
              i0.Value<int> rowid = const i0.Value.absent(),
            }) =>
                i2.ShoppingCartEntriesCompanion.insert(
                  shoppingCart: shoppingCart,
                  item: item,
                  rowid: rowid,
                )));
}

class $RelationalDatabaseManager {
  final $RelationalDatabase _db;
  $RelationalDatabaseManager(this._db);
  $$BuyableItemsTableTableManager get buyableItems =>
      $$BuyableItemsTableTableManager(_db, _db.buyableItems);
  $$ShoppingCartsTableTableManager get shoppingCarts =>
      $$ShoppingCartsTableTableManager(_db, _db.shoppingCarts);
  $$ShoppingCartEntriesTableTableManager get shoppingCartEntries =>
      $$ShoppingCartEntriesTableTableManager(_db, _db.shoppingCartEntries);
}

class $ShoppingCartsTable extends i4.ShoppingCarts
    with i0.TableInfo<$ShoppingCartsTable, i2.ShoppingCart> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShoppingCartsTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  List<i0.GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shopping_carts';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i2.ShoppingCart> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i2.ShoppingCart map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i2.ShoppingCart(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $ShoppingCartsTable createAlias(String alias) {
    return $ShoppingCartsTable(attachedDatabase, alias);
  }
}

class ShoppingCart extends i0.DataClass
    implements i0.Insertable<i2.ShoppingCart> {
  final int id;
  const ShoppingCart({required this.id});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    return map;
  }

  i2.ShoppingCartsCompanion toCompanion(bool nullToAbsent) {
    return i2.ShoppingCartsCompanion(
      id: i0.Value(id),
    );
  }

  factory ShoppingCart.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return ShoppingCart(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  i2.ShoppingCart copyWith({int? id}) => i2.ShoppingCart(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('ShoppingCart(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i2.ShoppingCart && other.id == this.id);
}

class ShoppingCartsCompanion extends i0.UpdateCompanion<i2.ShoppingCart> {
  final i0.Value<int> id;
  const ShoppingCartsCompanion({
    this.id = const i0.Value.absent(),
  });
  ShoppingCartsCompanion.insert({
    this.id = const i0.Value.absent(),
  });
  static i0.Insertable<i2.ShoppingCart> custom({
    i0.Expression<int>? id,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  i2.ShoppingCartsCompanion copyWith({i0.Value<int>? id}) {
    return i2.ShoppingCartsCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingCartsCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $ShoppingCartEntriesTable extends i4.ShoppingCartEntries
    with i0.TableInfo<$ShoppingCartEntriesTable, i2.ShoppingCartEntry> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShoppingCartEntriesTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _shoppingCartMeta =
      const i0.VerificationMeta('shoppingCart');
  @override
  late final i0.GeneratedColumn<int> shoppingCart = i0.GeneratedColumn<int>(
      'shopping_cart', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
          'REFERENCES shopping_carts (id)'));
  static const i0.VerificationMeta _itemMeta =
      const i0.VerificationMeta('item');
  @override
  late final i0.GeneratedColumn<int> item = i0.GeneratedColumn<int>(
      'item', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
          'REFERENCES buyable_items (id)'));
  @override
  List<i0.GeneratedColumn> get $columns => [shoppingCart, item];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shopping_cart_entries';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i2.ShoppingCartEntry> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('shopping_cart')) {
      context.handle(
          _shoppingCartMeta,
          shoppingCart.isAcceptableOrUnknown(
              data['shopping_cart']!, _shoppingCartMeta));
    } else if (isInserting) {
      context.missing(_shoppingCartMeta);
    }
    if (data.containsKey('item')) {
      context.handle(
          _itemMeta, item.isAcceptableOrUnknown(data['item']!, _itemMeta));
    } else if (isInserting) {
      context.missing(_itemMeta);
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => const {};
  @override
  i2.ShoppingCartEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i2.ShoppingCartEntry(
      shoppingCart: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}shopping_cart'])!,
      item: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}item'])!,
    );
  }

  @override
  $ShoppingCartEntriesTable createAlias(String alias) {
    return $ShoppingCartEntriesTable(attachedDatabase, alias);
  }
}

class ShoppingCartEntry extends i0.DataClass
    implements i0.Insertable<i2.ShoppingCartEntry> {
  final int shoppingCart;
  final int item;
  const ShoppingCartEntry({required this.shoppingCart, required this.item});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['shopping_cart'] = i0.Variable<int>(shoppingCart);
    map['item'] = i0.Variable<int>(item);
    return map;
  }

  i2.ShoppingCartEntriesCompanion toCompanion(bool nullToAbsent) {
    return i2.ShoppingCartEntriesCompanion(
      shoppingCart: i0.Value(shoppingCart),
      item: i0.Value(item),
    );
  }

  factory ShoppingCartEntry.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return ShoppingCartEntry(
      shoppingCart: serializer.fromJson<int>(json['shoppingCart']),
      item: serializer.fromJson<int>(json['item']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'shoppingCart': serializer.toJson<int>(shoppingCart),
      'item': serializer.toJson<int>(item),
    };
  }

  i2.ShoppingCartEntry copyWith({int? shoppingCart, int? item}) =>
      i2.ShoppingCartEntry(
        shoppingCart: shoppingCart ?? this.shoppingCart,
        item: item ?? this.item,
      );
  @override
  String toString() {
    return (StringBuffer('ShoppingCartEntry(')
          ..write('shoppingCart: $shoppingCart, ')
          ..write('item: $item')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(shoppingCart, item);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i2.ShoppingCartEntry &&
          other.shoppingCart == this.shoppingCart &&
          other.item == this.item);
}

class ShoppingCartEntriesCompanion
    extends i0.UpdateCompanion<i2.ShoppingCartEntry> {
  final i0.Value<int> shoppingCart;
  final i0.Value<int> item;
  final i0.Value<int> rowid;
  const ShoppingCartEntriesCompanion({
    this.shoppingCart = const i0.Value.absent(),
    this.item = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  ShoppingCartEntriesCompanion.insert({
    required int shoppingCart,
    required int item,
    this.rowid = const i0.Value.absent(),
  })  : shoppingCart = i0.Value(shoppingCart),
        item = i0.Value(item);
  static i0.Insertable<i2.ShoppingCartEntry> custom({
    i0.Expression<int>? shoppingCart,
    i0.Expression<int>? item,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (shoppingCart != null) 'shopping_cart': shoppingCart,
      if (item != null) 'item': item,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i2.ShoppingCartEntriesCompanion copyWith(
      {i0.Value<int>? shoppingCart,
      i0.Value<int>? item,
      i0.Value<int>? rowid}) {
    return i2.ShoppingCartEntriesCompanion(
      shoppingCart: shoppingCart ?? this.shoppingCart,
      item: item ?? this.item,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (shoppingCart.present) {
      map['shopping_cart'] = i0.Variable<int>(shoppingCart.value);
    }
    if (item.present) {
      map['item'] = i0.Variable<int>(item.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingCartEntriesCompanion(')
          ..write('shoppingCart: $shoppingCart, ')
          ..write('item: $item, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}
