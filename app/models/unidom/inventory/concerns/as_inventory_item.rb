module Unidom::Inventory::Concerns::AsInventoryItem

  extend ActiveSupport::Concern

  included do |includer|

    belongs_to :stored, polymorphic: true
    belongs_to :store,  polymorphic: true
    belongs_to :lot,    class_name:  'Unidom::Inventory::Lot'

    has_many :pick_items, class_name: 'Unidom::Inventory::PickItem',              as: :inventory_item
    has_many :variances,  class_name: 'Unidom::Inventory::InventoryItemVariance', as: :inventory_item

    def is_adjusted!(quantity: nil, due_to: nil, at: Time.now, description: nil, instruction: nil)
      if respond_to? :quantity
        increment! :quantity, quantity
      else
        if quantity.nil?
          quantity = -1
          soft_destroy
        else
          raise ArgumentError.new('The quantity should be nil when Inventory Item Variance is adjusted.')
        end
      end
      variances.create! inventory_item: self, reason: due_to, quantity: quantity, description: description, instruction: instruction, opened_at: at
    end

  end

  module ClassMethods
  end

end
