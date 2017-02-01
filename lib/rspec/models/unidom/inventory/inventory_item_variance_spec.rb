describe Unidom::Inventory::InventoryItemVariance, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      inventory_item_id:   SecureRandom.uuid,
      inventory_item_type: 'Unidom::Inventory::InventoryItem::Mock',
      reason_id:           SecureRandom.uuid,
      reason_type:         'Unidom::Inventory::Reason::Mock',
      quantity:            120.000000
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
