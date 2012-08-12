require 'spec_helper'

class MyAbilityCache
end

describe CanTango::Executor::PermitType
  context 'with cache' do
    subject { CanTango::Executor::PermitType }

    # set up cache_key alias
    describe '.cache_key' do
      its(:cache_key) { should == subject.permit_type }
    end

    describe '.ability_cache_clazz' do
      its(:ability_cache_clazz) { should == CanTango::Ability::Cache }
    end

    describe '.cache' do
      its(:cache) { should be_a CanTango::Ability::Cache }
    end    

    context 'change ability class to MyAbilityCache' do
      before do
        subject.ability_cache_clazz = MyAbilityCache
      end

      describe '.ability_cache_clazz = ' do
        its(:ability_cache_clazz) { should == MyAbilityCache }
      end    

      describe '.cache' do
        its(:cache) { should be_a MyAbilityCache }
      end
    end
  end
end