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

    serial_number_max_length = described_class.columns_hash['serial_number'].limit

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :serial_number,
      {                      } => 0,
      { serial_number: nil   } => 2,
      { serial_number: ''    } => 2,
      { serial_number: '1'   } => 1,
      { serial_number: '11'  } => 0,
      { serial_number: '111' } => 0,
      { serial_number: 'A'   } => 1,
      { serial_number: 'AA'  } => 0,
      { serial_number: 'AAA' } => 0,
      { serial_number: '1'*(serial_number_max_length-1) } => 0,
      { serial_number: '1'*serial_number_max_length     } => 0,
      { serial_number: '1'*(serial_number_max_length+1) } => 1,
      { serial_number: 'A'*(serial_number_max_length-1) } => 0,
      { serial_number: 'A'*serial_number_max_length     } => 0,
      { serial_number: 'A'*(serial_number_max_length+1) } => 1

  end

end
