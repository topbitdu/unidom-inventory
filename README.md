# Unidom Inventory 库存领域模型引擎

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
Unidom::Inventory::SerializedInventoryItem.valid_at.alive.first
Unidom::Inventory::GroupedInventoryItem.valid_at.alive.first
```



## Include the Concerns
```ruby
include Unidom::Inventory::AsInventoryItem
```

### As Inventory Item concern
The As Inventory Item concern do the following tasks for the includer automatically: 
1. Define the belongs_to :stored macro as: ``belongs_to :stored, polymorphic: true``
2. Define the belongs_to :store macro as: ``belongs_to :store, polymorphic: true``

### As Store concern
The As Store concern do the following tasks for the includer automatically: 
1. Define the has_many :grouped_inventory_items macro as: ``has_many :grouped_inventory_items, class_name: 'Unidom::Inventory::GroupedInventoryItem', foreign_key: :store_id``
2. Define the has_many :serialized_inventory_items macro as: ``has_many :serialized_inventory_items, class_name: 'Unidom::Inventory::SerializedInventoryItem', foreign_key: :store_id``

### As Stored concern
The As Stored concern do the following tasks for the includer automatically: 
1. Define the has_many :grouped_inventory_items macro as: ``has_many :grouped_inventory_items, class_name: 'Unidom::Inventory::GroupedInventoryItem', foreign_key: :stored_id``
2. Define the has_many :serialized_inventory_items macro as: ``has_many :serialized_inventory_items, class_name: 'Unidom::Inventory::SerializedInventoryItem', foreign_key: :stored_id``
