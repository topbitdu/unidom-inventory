class CreateUnidomItemIssuings < ActiveRecord::Migration

  def change

    create_table :unidom_item_issuings, id: :uuid do |t|

      t.references :pick_item,      type: :uuid, null: false
      t.references :inventory_item, type: :uuid, null: false,
        polymorphic: { null: false, default: '',  limit: 200 }
      t.references :target_item,    type: :uuid, null: true,
        polymorphic: { null: true,  default: nil, limit: 200 }

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

    add_index :unidom_item_issuings, :pick_item_id
    add_index :unidom_item_issuings, :inventory_item_id
    add_index :unidom_item_issuings, :target_item_id

  end

end
