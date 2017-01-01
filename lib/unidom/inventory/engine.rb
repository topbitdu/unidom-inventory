module Unidom
  module Inventory

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace ::Unidom::Inventory

      enable_initializer enum_enabled: false, migration_enabled: true

    end

  end
end
