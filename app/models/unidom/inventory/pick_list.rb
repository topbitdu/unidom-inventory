# Pick List 是出库单。

class Unidom::Inventory::PickList < ActiveRecord::Base

  self.table_name = 'unidom_pick_lists'

  include Unidom::Common::Concerns::ModelExtension

  has_many :items, class_name: 'Unidom::Inventory::PickItem' #, foreign_key: :pick_list_id

end
