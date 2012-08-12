shared_examples_for "a read/write Moneta cache" do
  types = {
    "String" => ["key", "key2"],
    "Object" => [{:foo => :bar}, {:bar => :baz}]
  }

  types.each do |type, (key, key2)|
    it "reads from keys that are #{type}s like a Hash" do
      @cache[key].should == nil
    end
  end
end
