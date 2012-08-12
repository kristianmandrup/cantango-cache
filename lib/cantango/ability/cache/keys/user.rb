module CanTango::Ability::Cache
  module Keys
    class UserKey
      attr_reader :user

      def initialize user
        @user = user
      end

      def user_key
        # raise "#{user.class} must have a method ##{user_key_field}. You can configure this with CanTango.config#user.unique_key_field" if !user.respond_to?(user_key_field)
        user.send(user_key_field) if user.respond_to? user_key_field
      end

      def user_key_field
        CanTango.config.user.unique_key_field || :email
      end
    end
  end
end
