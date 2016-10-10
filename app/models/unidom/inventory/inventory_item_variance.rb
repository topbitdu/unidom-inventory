# Inventory Item Variance 是库存项变化。
# #inventory_item 是被调整的库存项。
# #reason 是调整的原因。
# #quantity 是调整数量，正数表示库存增加，负数表示库存减少。

class Unidom::Inventory::InventoryItemVariance < ActiveRecord::Base

  self.table_name = 'unidom_inventory_item_variances'

  include Unidom::Common::Concerns::ModelExtension

  validates :quantity, presence: true, numericality: true

  belongs_to :inventory_item, polymorphic: true
  belongs_to :reason,         polymorphic: true

  scope :inventory_item_is, ->(inventory_item) { where inventory_item: inventory_item }
  scope :caused_by,         ->(reason)         { where reason:         reason         }

end
