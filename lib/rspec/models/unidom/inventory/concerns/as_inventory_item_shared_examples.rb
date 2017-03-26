shared_examples 'Unidom::Inventory::Concerns::AsInventoryItem' do |model_attributes|

  context do

    lot_attributes = {
      identification_number: '123456789012',
      quantity:              120.000000
    }

    it_behaves_like 'belongs_to', model_attributes, :lot, Unidom::Inventory::Lot, lot_attributes

  end

end
