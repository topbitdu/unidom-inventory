class CreateUnidomPickItems < ActiveRecord::Migration

  def change

    create_table :unidom_pick_items, id: :uuid do |t|

      t.references :pick_list,      type: :uuid, null: false
      t.references :inventory_item, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.decimal :quantity, null: false, default: 0.0, precision: 12, scale: 2

      t.text :description
      t.text :instruction

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_pick_items, :pick_list_id
    add_index :unidom_pick_items, :inventory_item_id

  end

end
