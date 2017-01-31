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

  end

end
