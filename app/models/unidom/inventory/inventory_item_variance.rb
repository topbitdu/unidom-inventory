##
# Inventory Item Variance 是库存项变化。
# #inventory_item 是被调整的库存项。
# #reason 是调整的原因。
# #quantity 是调整数量，正数表示库存增加，负数表示库存减少。

class Unidom::Inventory::InventoryItemVariance < Unidom::Inventory::ApplicationRecord

  self.table_name = 'unidom_inventory_item_variances'

  include Unidom::Common::Concerns::ModelExtension

  validates :quantity, presence: true, numericality: true

  belongs_to :inventory_item, polymorphic: true
  belongs_to :reason,         polymorphic: true

  scope :inventory_item_is, ->(inventory_item) { where inventory_item: inventory_item }
  scope :caused_by,         ->(reason)         { where reason:         reason         }

  ##
  # 对库存项 inventory_item 进行调整。调整数量为 quantity ，缺省为 nil 。调整原因为 due_to 。调整时间为 at ，缺省为当前时间。
  # 另有适用于己方的备注信息 description 和适用于对方的备注信息 instruction 。
  # Unidom::Inventory::InventoryItemVariance.adjust! inventory_item, quantity: 3
  def self.adjust!(inventory_item, quantity: nil, due_to: nil, at: Time.now, description: nil, instruction: nil)
    if inventory_item.respond_to? :quantity
      inventory_item.increment! :quantity, quantity
    else
      if quantity.nil?
        quantity = -1
        inventory_item.soft_destroy
      else
        raise ArgumentError.new('The quantity should be -1 when Inventory Item Variance adjusts a Serialized Inventory Item.')
      end
    end
    create! inventory_item: inventory_item, reason: due_to, quantity: quantity, description: description, instruction: instruction, opened_at: at
  end

end
