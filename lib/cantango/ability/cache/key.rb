module CanTango::Ability::Cache
  class Key
    sweetload :UserKey, :PermissionsKey, :RolesKey, :Compare

    include CanTango::Ability:Cache::Keys::Compare

    attr_reader :user, :subject, :user_key, :permissions_key, :roles_key, :keys

    def initialize user, subject = nil, options = {}
      @user = user
      @subject = subject || user
      configure_keys
    end

    class << self
      def create_for ability
        self.new ability.user, ability.subject
      end

      def configure_keys
        @keys = options[:keys] if options[:keys] # allow override of keys to be used

        create_user_key user, options if key? :user
        create_permissions_key subject, options if key? :permisssions
        create_roles_key subject, options if key? :roles
      end        

      def create_user_key user
        @user_key = CanTango::AbilityCache::Keys::UserKey.new user
      end

      def create_permissions_key subject
        @permissions_key = CanTango::AbilityCache::Keys::PermissionsKey.new subject
      end

      def create_roles_key subject
        @roles_key = CanTango::AbilityCache::Keys::RolesKey.new subject
      end
    end

    def to_s
      "key hash: #{value}"
    end
  end
end
