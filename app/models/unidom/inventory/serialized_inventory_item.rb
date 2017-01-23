##
# Serialized Inventory Item 是序列化库存项。

class Unidom::Inventory::SerializedInventoryItem < Unidom::Inventory::ApplicationRecord

  self.table_name = 'unidom_serialized_inventory_items'

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Inventory::Concerns::AsInventoryItem

  validates :serial_number, presence: true, length: { in: 2..columns_hash['serial_number'].limit }

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Inventory::SerializedInventoryItem'
