module CanTango::Ability::Cache
  module Keys
    class PermissionsKey
      attr_reader :subject

      def initialize subject
        @subject = subject
      end

      def cache_key
        return permissions_hash if cache_key? && has_permissions?
        permissions if cache_key?
      end

      def cache_key?
        permissions? && permission_cache_on?
      end

      protected

      def modes
        engine(:permit).modes
      end

      def permissions_hash
        subject.send(:permissions_hash)
      end

      def permissions
        subject.send(:permissions)
      end

      def permission_cache_on?
        modes.include?(:cache) && engine(:permission).on?
      end

      def permissions_hash?
        subject.respond_to?(:permissions_hash)
      end

      def permissions?
        subject.respond_to?(:permissions)
      end
    end
  end
end
