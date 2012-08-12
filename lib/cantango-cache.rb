require 'cantango-config'
require 'cantango/cache_ext'

module CanTango
  module Ability
    sweetload :Cache
  end

  module Configuration
    sweetload :Cache
  end

  sweetload :Cache
end