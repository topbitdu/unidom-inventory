describe Unidom::Inventory::ItemIssuing, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      inventory_item_id:   SecureRandom.uuid,
      inventory_item_type: 'Unidom::Inventory::InventoryItem::Mock',
      target_item_id:      SecureRandom.uuid,
      target_item_type:    'Unidom::Inventory::TargetItem::Mock',
      pick_item_id:        SecureRandom.uuid,
      quantity:            120.000000
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
