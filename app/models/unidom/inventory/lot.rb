# Lot 是批量。

class Unidom::Inventory::Lot < ActiveRecord::Base

  self.table_name = 'unidom_lots'

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Inventory::Concerns::AsInventoryItem

  validates :quantity,              presence: true, numericality: true
  validates :identification_number, presence: true, length: { in: 2..columns_hash['identification_number'].limit }

  has_many :grouped_inventory_items,    class_name: 'Unidom::Inventory::GroupedInventoryItem'
  has_many :serialized_inventory_items, class_name: 'Unidom::Inventory::SerializedInventoryItem'

end
