module Unidom::Inventory::Concerns::AsStored

  extend ActiveSupport::Concern

  included do |includer|

    has_many :grouped_inventory_items,    class_name: 'Unidom::Inventory::GroupedInventoryItem',    foreign_key: :stored_id
    has_many :serialized_inventory_items, class_name: 'Unidom::Inventory::SerializedInventoryItem', foreign_key: :stored_id

  end

  module ClassMethods
  end

end
