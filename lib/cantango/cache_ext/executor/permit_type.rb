module CanTango
  module Executor
    class PermitType < Base
      attr_writer :ability_cache_clazz

      alias_method :cache_key, :permit_type

      def cache
        @cache ||= ability_cache_clazz.new self, cache_options
      end

      def cache_options
        {:cache_key => cache_key, :key_method_names => key_method_names}
      end

      def ability_cache_clazz
        @ability_cache_clazz ||= CanTango::Ability::Cache
      end
    end
  end
end