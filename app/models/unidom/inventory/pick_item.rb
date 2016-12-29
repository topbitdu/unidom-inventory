##
# Pick Item 是出库单项。

class Unidom::Inventory::PickItem < Unidom::Inventory::ApplicationRecord

  self.table_name = 'unidom_pick_items'

  include Unidom::Common::Concerns::ModelExtension

  validates :quantity, presence: true, numericality: true

  belongs_to :pick_list,      class_name:  'Unidom::Inventory::PickList'
  belongs_to :inventory_item, polymorphic: true

end
