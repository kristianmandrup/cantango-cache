require 'moneta'
require 'active_support/inflector'

module CanTango
  module Cache
    class MonetaAdapter < BaseAdapter
      # for a YamlStore, the name is the name of the yml file
      def initialize name, options = {}
        super
      end

      def self.default_store_class
        CanTango::Cache::Store::MonetaAdapter
      end

      def load key
        store.load! key
      end

      def save key, rules
        store.save! key, rules
      end

      def invalidate! key
        store.delete key
      end
    end
  end
end