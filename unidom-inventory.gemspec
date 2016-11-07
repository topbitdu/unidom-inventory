$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'unidom/inventory/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'unidom-inventory'
  spec.version     = Unidom::Inventory::VERSION
  spec.authors     = [ 'Topbit Du' ]
  spec.email       = [ 'topbit.du@gmail.com' ]
  spec.homepage    = 'https://github.com/topbitdu/unidom-inventory'
  spec.summary     = 'Unidom Inventory Domain Model Engine 库存领域模型引擎'
  spec.description = 'Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Inventory domain model engine includes the Serialized Inventory Item, the Grouped Inventory Item, the Lot, and the Inventory Item Variance models. Unidom (统一领域对象模型)是一系列的领域模型引擎。库存领域模型引擎包括序列化库存项、分组库存项、批量和库存项变化的模型。'
  spec.license     = 'MIT'

  spec.files         = Dir[ '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md' ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = [ 'lib' ]

  spec.add_dependency 'unidom-common', '>= 1.7'

end
