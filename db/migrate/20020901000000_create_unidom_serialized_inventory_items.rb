class CreateUnidomSerializedInventoryItems < ActiveRecord::Migration

  def change

    create_table :unidom_serialized_inventory_items, id: :uuid do |t|

      t.references :stored, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :store,  type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :lot,    type: :uuid, null: true

      t.string :serial_number, null: false, default: nil, limit: 200

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_serialized_inventory_items, :stored_id
    add_index :unidom_serialized_inventory_items, :store_id
    add_index :unidom_serialized_inventory_items, :lot_id
    add_index :unidom_serialized_inventory_items, :serial_number

  end

end
