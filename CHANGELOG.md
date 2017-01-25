# Unidom Inventory Change Log 库存领域模型引擎变更日志

## v0.1
1. Serialized Inventory Item model & migration (20020901000000)
2. Grouped Inventory Item model & migration (20020902000000)

## v0.2
1. As Inventory Item concern
2. Improved the Grouped Inventory Item model to include the As Inventory Item concern
3. Improved the Serialized Inventory Item model to include the As Inventory Item concern

## v0.3
1. As Store concern
2. As Stored concern

## v0.4
1. Lot model & migration (20020911000000)
2. Improved the As Inventory Item concern to add the optional ``belongs_to :lot`` macro

## v0.5
1. Item Issuing model & migration (20020923000000)
2. Pick List model & migration (20020921000000)
3. Pick Item model & migration (20020921000000)
4. Improved the As Inventory Item concern to add the ``has_many :pick_items, class_name: 'Unidom::Inventory::PickItem', as: :inventory_item`` macro

## v0.6
1. Inventory Item Variance model & migration (20020903000000)
2. Improved the As Inventory Item concern to add the ``has_many :variances,  class_name: 'Unidom::Inventory::InventoryItemVariance', as: :inventory_item`` macro

## v0.7
1. Improved the Inventory Item Variance model to add the .``adjust!`` method
2. Improved the As Inventory Item concern to add the #``is_adjusted!`` method

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
