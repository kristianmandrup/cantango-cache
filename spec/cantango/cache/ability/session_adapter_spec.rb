require 'rspec'
require 'cantango'

describe CanTango::Cache::Ability::SessionAdapter do
  subject { CanTango::Cache::Ability::SessionAdapter.new :roles, :session => {} }
    its(:name)  { should == :roles}
    its(:store) { should_not be_nil}
    its(:store) { should be_a CanTango::Cache::Stores::HashStore }
end

