module Unidom::Inventory::Concerns::AsInventoryItem

  extend ActiveSupport::Concern

  included do |includer|

    belongs_to :stored, polymorphic: true
    belongs_to :store,  polymorphic: true
    belongs_to :lot,    class_name:  'Unidom::Inventory::Lot'

    has_many :pick_items, class_name: 'Unidom::Inventory::PickItem', as: :inventory_item

  end

  module ClassMethods
  end

end
