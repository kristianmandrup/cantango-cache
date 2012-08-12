module CanTango
  class Ability
    module Helper
      module Cache
        include CanTango::Helpers::RoleMethods

        delegate :cache_rules!, :cached_rules, :cached_rules?, :to => :cache

        def cache options = {}
          @cache ||= cache_class.new self, options
        end

        def cache_class
          CanTango::Ability::Cached
        end        
      end
    end
  end
end
