# Unidom Inventory 库存领域模型引擎

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/unidom-inventory/frames)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

[![Gem Version](https://badge.fury.io/rb/unidom-inventory.svg)](https://badge.fury.io/rb/unidom-inventory)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/unidom-inventory.svg)](https://gemnasium.com/github.com/topbitdu/unidom-inventory)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Inventory domain model engine includes the Serialized Inventory Item, the Grouped Inventory Item, the Lot, and the Inventory Item Variance models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。库存领域模型引擎包括序列化库存项、分组库存项、批量和库存项变化的模型。



## Recent Update

Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.



## Usage in Gemfile

```ruby
gem 'unidom-inventory'
```



## Run the Database Migration

```shell
rake db:migrate
```
The migration versions start with 200209.



## Call the Model

```ruby
lot = Unidom::Inventory::Lot.create! identification_number: '20040312', description: '1 more thing', instruction: 'Please note...'

serialized_inventory_item = Unidom::Inventory::SerializedInventoryItem.create! store: shop, stored: product, lot: lot, serial_number: '19840101'
grouped_inventory_item = Unidom::Inventory::GroupedInventoryItem.create! store: shop, stored: product, lot: lot, quantity: 100
# The lot is optional for the serialized inventory item or the grouped inventory item.

lot.grouped_inventory_items.create! store: @shop, stored: @product, quantity: 100
lot.serialized_inventory_items.create! store: @shop, stored: @product, serial_number: '19840101'

pick_list    = Unidom::Inventory::PickList.create!
pick_item    = pick_list.items.create! inventory_item: grouped_inventory_item, quantity: 100
item_issuing = Unidom::Inventory::ItemIssuing.create! pick_item: pick_item, inventory_item: grouped_inventory_item, target_item: nil
# target_item could be nil or any model like: shipment item or order item

Unidom::Inventory::InventoryItemVariance.adjust! @inventory_item, quantity: 1, due_to: nil, at: Time.now, description: nil, instruction: nil
# or the following source code do the exact same thing.
grouped_inventory_item.is_adjusted! 10, due_to: nil, at: Time.now, description: nil, instruction: nil
```



## Include the Concerns

```ruby
include Unidom::Inventory::Concerns::AsInventoryItem
include Unidom::Inventory::Concerns::AsStore
include Unidom::Inventory::Concerns::AsStored
```

### As Inventory Item concern

The As Inventory Item concern do the following tasks for the includer automatically:

1. Define the belongs_to :stored macro as: ``belongs_to :stored, polymorphic: true``

2. Define the belongs_to :store macro as: ``belongs_to :store, polymorphic: true``

3. Define the belongs_to :lot macro as: ``belongs_to :lot, class_name: 'Unidom::Inventory::Lot'``

4. Define the has_many :pick_items macro as: ``has_many :pick_items, class_name: 'Unidom::Inventory::PickItem', as: :inventory_item``

5. Define the has_many :variances macro as: ``has_many :variances, class_name: 'Unidom::Inventory::InventoryItemVariance', as: :inventory_item``

6. Define the #is_adjusted! method as: ``is_adjusted!(quantity, due_to: nil, at: Time.now, description: nil, instruction: nil)``

### As Store concern

The As Store concern do the following tasks for the includer automatically:

1. Define the has_many :grouped_inventory_items macro as: ``has_many :grouped_inventory_items, class_name: 'Unidom::Inventory::GroupedInventoryItem', foreign_key: :store_id``

2. Define the has_many :serialized_inventory_items macro as: ``has_many :serialized_inventory_items, class_name: 'Unidom::Inventory::SerializedInventoryItem', foreign_key: :store_id``

### As Stored concern

The As Stored concern do the following tasks for the includer automatically:

1. Define the has_many :grouped_inventory_items macro as: ``has_many :grouped_inventory_items, class_name: 'Unidom::Inventory::GroupedInventoryItem', foreign_key: :stored_id``

2. Define the has_many :serialized_inventory_items macro as: ``has_many :serialized_inventory_items, class_name: 'Unidom::Inventory::SerializedInventoryItem', foreign_key: :stored_id``



## Disable the Model & Migration

If you only need the app components other than models, the migrations should be neglected, and the models should not be loaded.
```ruby
# config/initializers/unidom.rb
Unidom::Common.configure do |options|

  options[:neglected_namespaces] = %w{
    Unidom::Inventory
  }

end
```



## RSpec examples

### RSpec example manifest (run automatically)

```ruby
# spec/models/unidom_spec.rb
require 'unidom/inventory/models_rspec'

# spec/types/unidom_spec.rb
require 'unidom/inventory/types_rspec'

# spec/validators/unidom_spec.rb
require 'unidom/inventory/validators_rspec'
```

### RSpec shared examples (to be integrated)

```ruby
# lib/unidom.rb
Unidom::Party::Shop.class_eval do

  include Unidom::Inventory::Concerns::AsStore

end

Unidom::Product::Product.class_eval do

  include Unidom::Inventory::Concerns::AsStored

end


# The Unidom::Inventory::GroupedInventoryItem model & the Unidom::Inventory::SerializedInventoryItem model already include the Unidom::Inventory::Concerns::AsInventoryItem concern
# app/models/your_inventory_item.rb
class YourInventoryItem < ApplicationRecord

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Inventory::Concerns::AsInventoryItem

end

# spec/support/unidom_rspec_shared_examples.rb
require 'unidom/inventory/rspec_shared_examples'

# spec/models/unidom/party/shop_spec.rb
describe Unidom::Party::Shop, type: :model do

  it_behaves_like 'Unidom::Inventory::Concerns::AsStore', model_attributes

end

# spec/models/unidom/product/product_spec.rb
describe Unidom::Product::Product, type: :model do

  it_behaves_like 'Unidom::Inventory::Concerns::AsStored', model_attributes

end

# spec/models/your_inventory_item_spec.rb
describe YourInventoryItem, type: :model do

  context do

    model_attribtues = {
      your_attribute: 'your value'
    }

    it_behaves_like 'Unidom::Inventory::Concerns::AsInventoryItem', model_attribtues

  end

end
```
