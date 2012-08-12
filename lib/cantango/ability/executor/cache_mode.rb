module CanTango
  class Ability
    module Executor
      class CachedMode < Base
        include CanTango::Ability::Helper::Cache

        # FIX! no reason for double cache check!
        def cached?
          @rules = cached_rules if cached_rules? && caching_on?
        end

       def cache
          @cache ||= cache_class.new self, :cache_key => cache_key, :key_method_names => key_method_names
        end

        protected

        def start_execute
          debug "Executing cached ability"
        end

        def end_execute
          cache_rules! if caching_on?
          debug "DONE"
        end
      end
    end
  end
end