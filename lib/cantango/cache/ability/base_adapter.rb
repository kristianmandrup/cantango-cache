module CanTango
  module Cache
    module Ability
      # basic functionality for Caching a CanTango ability in a store
      class BaseAdapter
        attr_reader :name, :options, :store

        # name of store and options to initialize it with!
        def initialize name, options = {}
          @name, @options = [name, options]
          configure_options
          configure_store options[:store_class]
        end

        def self.configure_options
          options.each_pair do |name, value|
            var = :"@#{name}"
            self.instance_variable_set(var, value)
          end
        end

        # configure the store used, fx Moneta or Hash store
        def self.configure_store store_clazz
          @store = (store_clazz || default_store_class).instance
          @store.configure_with options
        end

        def default_store_class
          raise NotImplementedError
        end

        def load key
          raise NotImplementedError
        end

        def save key, rules
          raise NotImplementedError
        end
      end
    end
  end
end