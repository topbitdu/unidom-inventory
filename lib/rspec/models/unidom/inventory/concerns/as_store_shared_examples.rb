shared_examples 'Unidom::Inventory::Concerns::AsStore' do |model_attributes|

  before :each do
  end

  after :each do
  end

  context do

    grouped_inventory_item_1_attributes = {
      stored_id:   SecureRandom.uuid,
      stored_type: 'Unidom::Inventory::Stored::Mock',
      lot_id:      SecureRandom.uuid,
      quantity:    10.00
    }

    grouped_inventory_item_2_attributes = {
      stored_id:   SecureRandom.uuid,
      stored_type: 'Unidom::Inventory::Stored::Mock',
      lot_id:      SecureRandom.uuid,
      quantity:    20.00
    }

    it_behaves_like 'has_many', model_attributes, :grouped_inventory_items, Unidom::Inventory::GroupedInventoryItem, [ grouped_inventory_item_1_attributes, grouped_inventory_item_2_attributes ]

    serialized_inventory_item_1_attributes = {
      stored_id:     SecureRandom.uuid,
      stored_type:   'Unidom::Inventory::Stored::Mock',
      lot_id:        SecureRandom.uuid,
      serial_number: SecureRandom.hex(16)
    }

    serialized_inventory_item_2_attributes = {
      stored_id:     SecureRandom.uuid,
      stored_type:   'Unidom::Inventory::Stored::Mock',
      lot_id:        SecureRandom.uuid,
      serial_number: SecureRandom.hex(16)
    }

    it_behaves_like 'has_many', model_attributes, :serialized_inventory_items, Unidom::Inventory::SerializedInventoryItem, [ serialized_inventory_item_1_attributes, serialized_inventory_item_2_attributes ]

  end

end
