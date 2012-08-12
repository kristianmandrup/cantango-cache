require 'spec_helper'

describe CanTango::Configuration::Cache
  subject { clazz }
  let(:clazz) { CanTango::Configuration::Cache }

  describe '.compile and compile?' do
    specify { subject.compile(:on).compile?.should be_true }
    specify { subject.compile(:off).compile?.should be_false }

    expect { subject.compile(:unknown).to raise_error }
  end

  describe '.store' do
    specify { subject.store.should be_a CanTango::Configuration::Cache::Storage }

    it 'should allow configuration of caching' do
      subject.store :type => :memory do |cache|
        cache.adapter_class = CanTango::Cache::Store::MonetaAdapter
        cache.options = {:host => 'localhost'}
      end
    end
  end

  describe '.store_clazz' do
    specify { subject.store_clazz.should == CanTango::Configuration::Cache::Store }
  end
end