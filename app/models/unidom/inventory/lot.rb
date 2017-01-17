##
# Lot 是批量。

class Unidom::Inventory::Lot < Unidom::Inventory::ApplicationRecord

  self.table_name = 'unidom_lots'

  include Unidom::Common::Concerns::ModelExtension

  validates :quantity,              presence: true, numericality: true
  validates :identification_number, presence: true, length: { in: 2..columns_hash['identification_number'].limit }

  has_many :grouped_inventory_items,    class_name: 'Unidom::Inventory::GroupedInventoryItem'
  has_many :serialized_inventory_items, class_name: 'Unidom::Inventory::SerializedInventoryItem'

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Inventory::Lot'
