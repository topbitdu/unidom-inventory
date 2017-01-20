##
# Item Issuing 是条目出库。
# #pick_item 是出库项。
# #inventory_item 是库存项，可以由 #pick_item 导出。
# #target_item 是目标项，比如： ShipmentItem 、 OrderItem 等。

class Unidom::Inventory::ItemIssuing < Unidom::Inventory::ApplicationRecord

  self.table_name = 'unidom_item_issuings'

  include Unidom::Common::Concerns::ModelExtension

  validates :quantity, presence: true, numericality: true

  belongs_to :pick_item,      class_name:  'Unidom::Inventory::PickItem'
  belongs_to :inventory_item, polymorphic: true
  belongs_to :target_item,    polymorphic: true

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Inventory::ItemIssuing'
