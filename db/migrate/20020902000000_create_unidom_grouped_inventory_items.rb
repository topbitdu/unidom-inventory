class CreateUnidomGroupedInventoryItems < ActiveRecord::Migration

  def change

    create_table :unidom_grouped_inventory_items, id: :uuid do |t|

      t.references :stored, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :store,  type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :lot,    type: :uuid, null: true

      t.decimal :quantity, null: false, default: 0.0, precision: 12, scale: 2

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_grouped_inventory_items, :stored_id
    add_index :unidom_grouped_inventory_items, :store_id
    add_index :unidom_grouped_inventory_items, :lot_id

  end

end
