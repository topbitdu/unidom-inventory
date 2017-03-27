require 'rspec/models/unidom/inventory/concerns/as_inventory_item_shared_examples'

describe Unidom::Inventory::GroupedInventoryItem, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      stored_id:   SecureRandom.uuid,
      stored_type: 'Unidom::Inventory::Stored::Mock',
      store_id:    SecureRandom.uuid,
      store_type:  'Unidom::Inventory::Store::Mock',
      lot_id:      SecureRandom.uuid,
      quantity:    120.000000
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates numericality', model_attributes, :quantity,
      range: 0..1_000_000_000, minimum_inclusive: true, maximum_inclusive: true

    it_behaves_like 'Unidom::Inventory::Concerns::AsInventoryItem', model_attributes

  end

end
