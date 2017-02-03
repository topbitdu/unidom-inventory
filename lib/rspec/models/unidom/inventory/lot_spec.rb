describe Unidom::Inventory::Lot, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      identification_number: '123456789012',
      quantity:              120.000000
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
