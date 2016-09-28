# Grouped Inventory Item 是分组库存项。

class Unidom::Inventory::GroupedInventoryItem < ActiveRecord::Base

  self.table_name = 'unidom_grouped_inventory_items'

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Inventory::Concerns::AsInventoryItem

  validates :quantity, presence: true, numericality: true

end
