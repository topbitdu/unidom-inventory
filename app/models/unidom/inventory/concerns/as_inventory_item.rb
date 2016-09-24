module Unidom::Inventory::Concerns::AsInventoryItem

  extend ActiveSupport::Concern

  included do |includer|

    belongs_to :stored, polymorphic: true
    belongs_to :store,  polymorphic: true

  end

  module ClassMethods
  end

end
