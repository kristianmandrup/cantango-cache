require 'spec_helper'

describe CanTango::Ability::Cache::Reader do
  let (:session) do
    {}
  end

  let(:user) { User.new 'kris', 'kris@gmail.com' }

  let(:ability) { CanTango::Ability.new user, :session => session }

  let(:cache) { CanTango::Ability::Cache.new ability }

  subject do
    CanTango::Ability::Cache::Reader.new cache
  end

  specify { subject.should be_a CanTango::Ability::Cache::Reader }

  describe 'prepared rules' do
    before do
      $b = [:a,:b,:c]
      @rules = [ CanCan::Rule.new(true, :read, :all, nil, {}) ]

      subject.expects(:loaded_rules).returns(@rules)
    end

    specify do
      subject.prepared_rules.should == @rules
    end
  end
end

