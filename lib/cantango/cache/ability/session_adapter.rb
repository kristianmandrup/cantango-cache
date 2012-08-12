module CanTango
  module Cache
    module Adapter
      class Session < Base
        attr_accessor :session
        attr_reader   :key

        # will be called with :session => session (pointing to user session)
        def initialize name, options = {}
          super # will set all instance vars using options hash

          raise "SessionCache must be initialized with a :session option" if !session
          session[cache_key] = @cache
        end

        def self.default_store_class
          CanTango::Cache::Store::HashAdapter
        end

        def store
          session[cache_key]
        end

        def cache_key
          @cache_key ||= :rules_cache
        end

        def load key
          raise "no key" if key.nil?
          store.load! key
        end

        def save key, rules
          raise "no key" if key.nil?
          store.save!(key, rules)
        end

        def invalidate! key
          raise "no key" if key.nil?
          store.delete(key)
        end
      end
    end
  end
end