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

    it_behaves_like 'validates', model_attributes, :quantity,
      {                              } => 0,
      { quantity: nil                } => 2,
      { quantity: ''                 } => 2,
      { quantity: '1'                } => 0,
      { quantity: 1                  } => 0,
      { quantity: 'A'                } => 1,
      { quantity: '1.23'             } => 0,
      { quantity: 1.23               } => 0,
      { quantity: '-0.01'            } => 1,
      { quantity: -0.01              } => 1,
      { quantity: '0'                } => 0,
      { quantity: 0                  } => 0,
      { quantity: '0.01'             } => 0,
      { quantity: 0.01               } => 0,
      { quantity: '999_999_999.99'   } => 0,
      { quantity: 999_999_999.99     } => 0,
      { quantity: '1_000_000_000'    } => 1,
      { quantity: 1_000_000_000      } => 1,
      { quantity: '1_000_000_000.01' } => 1,
      { quantity: 1_000_000_000.01   } => 1

  end

end
