module CanTango::Ability::Cache
  module Keys
    module Compare
      def same? session
        raise "No session available" if !session
        session[:cache_key] && (value == session[:cache_key].value)
      end

      def value
        raise "No key could be generated for User:#{user.inspect} and Subject:#{subject} - key field: #{user_key_field}" if hash_values.empty?
        @value ||= values.hash
      end

      def keys
        @keys ||= %w{user permissions roles}
      end

      def key? name
        keys.map(&:to_sym).include? name.to_sym
      end

      protected

      def values
        @values ||= keys.select {|key| send("#{key}_key").value }
      end      
    end
  end
end
