class CreateUnidomPickLists < ActiveRecord::Migration

  def change

    create_table :unidom_pick_lists, id: :uuid do |t|

      t.text :description
      t.text :instruction

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

  end

end
