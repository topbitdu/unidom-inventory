require 'rspec/models/unidom/inventory/concerns/as_inventory_item_shared_examples'

describe Unidom::Inventory::SerializedInventoryItem, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      stored_id:     SecureRandom.uuid,
      stored_type:   'Unidom::Inventory::Stored::Mock',
      store_id:      SecureRandom.uuid,
      store_type:    'Unidom::Inventory::Store::Mock',
      lot_id:        SecureRandom.uuid,
      serial_number: '123456789012'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates text', model_attributes, :serial_number,
      length: 2..described_class.columns_hash['serial_number'].limit

    it_behaves_like 'Unidom::Inventory::Concerns::AsInventoryItem', model_attributes

  end

end
