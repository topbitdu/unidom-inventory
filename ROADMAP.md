# Unidom Inventory Roadmap 库存领域模型引擎路线图

## v0.1
1. Serialized Inventory Item model & migration (20020901000000)
2. Grouped Inventory Item model & migration (20020902000000)

## v0.2
1. As Inventory Item concern
2. Improve the Grouped Inventory Item model to include the As Inventory Item concern
3. Improve the Serialized Inventory Item model to include the As Inventory Item concern

## v0.3
1. As Store concern
2. As Stored concern

## v0.4
1. Lot model & migration (20020911000000)
2. Improve the As Inventory Item concern to add the optional ``belongs_to :lot`` macro

## v0.5
1. Item Issuing model & migration (20020923000000)
2. Pick List model & migration (20020921000000)
3. Pick Item model & migration (20020921000000)
4. Improve the As Inventory Item concern to add the ``has_many :pick_items, class_name: 'Unidom::Inventory::PickItem', as: :inventory_item`` macro

## v0.6
1. Inventory Item Variance model & migration (20020903000000)
2. Improve the As Inventory Item concern to add the ``has_many :variances, class_name: 'Unidom::Inventory::InventoryItemVariance', as: :inventory_item`` macro

## v0.7
1. Improve the Inventory Item Variance model to add the .``adjust!`` method
2. Improve the As Inventory Item concern to add the #``is_adjusted!`` method

## v0.7.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v0.7.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v0.7.3
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1

## v0.7.4
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improve the Engine class to include the Engine Extension concern

## v0.7.5
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improve the models to support the namespace neglecting

## v0.8
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v1.0
1. Improve the Grouped Inventory Item migration for the #``quantity`` column
2. Improve the Inventory Item Variance migration for the #``quantity`` column
3. Improve the Lot migration for the #``quantity`` column
4. Improve the Pick Item migration for the #``quantity`` column
5. Improve the Item Issuing migration for the #quantity column

## v1.0.1
1. Improve the Grouped Inventory Item model for the validations on the #quantity attribute
2. Improve the Inventory Item Variance model for the validations on the #quantity attribute
3. Improve the Grouped Inventory Item spec for the validations on the #quantity attribute
4. Improve the Inventory Item Variance spec for the validations on the #quantity attribute
5. Improve the Serialized Inventory Item spec for the validations on the #serial_number attribute

## v1.0.2
1. Improve the Grouped Inventory Item model for the validations on the #quantity attribute
2. Improve the Grouped Inventory Item spec for the validations on the #quantity attribute
3. Improve the Serialized Inventory Item spec for the validations on the #serial_number attribute

## v1.0.3
1. As Inventory Item shared examples
2. Improve the Grouped Inventory Item spec for the As Inventory Item concern
3. Improve the Serialized Inventory Item spec for the As Inventory Item concern
4. RSpec shared examples manifest

## v1.0.4
1. As Store shared examples
2. Improve the RSpec shared examples manifest to require the As Store shared examples

## v1.0.5
1. As Stored shared examples
2. Improve the RSpec shared examples manifest to require the As Stored shared examples
