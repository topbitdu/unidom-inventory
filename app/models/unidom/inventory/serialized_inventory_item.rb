# Serialized Inventory Item 是序列化库存项。
class Unidom::Inventory::SerializedInventoryItem < ActiveRecord::Base

  self.table_name = 'unidom_serialized_inventory_items'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :stored, polymorphic: true
  belongs_to :store,  polymorphic: true

  validates :serial_number, presence: true, length: { in: 2..columns_hash['serial_number'].limit }

end
