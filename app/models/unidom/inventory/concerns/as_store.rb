module Unidom::Inventory::Concerns::AsStore

  extend ActiveSupport::Concern

  included do |includer|

    has_many :grouped_inventory_items,    class_name: 'Unidom::Inventory::GroupedInventoryItem',    foreign_key: :store_id
    has_many :serialized_inventory_items, class_name: 'Unidom::Inventory::SerializedInventoryItem', foreign_key: :store_id

  end

  module ClassMethods
  end

end
