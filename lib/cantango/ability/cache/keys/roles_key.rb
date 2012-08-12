module CanTango::Ability::Cache
  module Keys
    class RolesKey
      attr_reader :subject

      def initialize subject, options = {}
        @subject = subject
        @method_names = options[:methods] if options[:methods]
      end

      def method_names
        @method_names ||= [:roles_list, :role_groups_list]
      end

      def value
        hash_values.empty? ? nil : hash_values.hash
      end

      def hash_values
        @hash_values ||= method_names.inject([]) do |result, meth_name|
          result << subject.send(meth_name) if use_in_hash? meth_name
          result
        end
      end

      def meth_map
        {:roles_list => :role, :role_groups_list => :role_group }
      end

      def use_in_hash? meth_name
        subject.respond_to?(meth_name) && CanTango.config.permits.enabled_types.include?(meth_map[meth_name])
      end
    end
  end
end
