class CreateUnidomLots < ActiveRecord::Migration

  def change

    create_table :unidom_lots, id: :uuid do |t|

      t.string  :identification_number, null: false, default: '', limit: 200
      t.decimal :quantity,              null: false, default: 0.0, precision: 12, scale: 2

      t.text :description
      t.text :instruction

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_lots, :identification_number

  end

end
