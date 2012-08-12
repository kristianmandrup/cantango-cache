module CanTango
  class Configuration
    class Cache
      sweetload :Storage

      def compile state
        raise "Must be set to :on or :off" if ![:on, :off].include? state
        @compile = state
      end

      def compile?
        @compile ||= :on
        @compile == :on
      end

      # yield a store configuration object
      def store options = {}, &block
        @store ||= store_clazz.new
        @store.adapter_class ||= default_adapter_class
        @store.default_options = options
        yield @store if block_given?
        @store
      end

      def default_adapter_class
        CanTango::Cache::Store::SessionAdapter
      end

      def store_clazz
        ns::Storage
      end
    end
  end
end


