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
2. Improved the As Inventory Item concern to add the optional ``belongs_to :lot`` association

## v0.5
1. Item Issuing model & migration (20020923000000)
2. Pick List model & migration (20020921000000)
3. Pick Item model & migration
4. Improved the As Inventory Item concern to add the #pick_items association

## v0.6
1. Inventory Item Variance model & migration
2. Improve the As Inventory Item concern to add the #variances association

## v0.7
1. Improve the Inventory Item Variance model to add the .adjust! method
2. Improve the As Inventory Item concern to add the #is_adjusted! method

## v0.7.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v0.7.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7
