class CreateUnidomInventoryItemVariances < ActiveRecord::Migration

  def change

    create_table :unidom_inventory_item_variances, id: :uuid do |t|

      t.references :inventory_item, type: :uuid,  null: false,
        polymorphic: { null: false, default: '',  limit: 200 }
      t.references :reason,         type: :uuid,  null: true,
        polymorphic: { null: true,  default: nil, limit: 200 }

      t.decimal :quantity, null: false, default: 0.0, precision: 10, scale: 6

      t.text :description
      t.text :instruction

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_inventory_item_variances, :inventory_item_id

  end

end
