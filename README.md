# Cantango cache

The CanTango caching gem is designed to enable caching functionality for CanTango.

To use it simply add it to your gemfile:

`gem 'cantango-cache'`

And then configure which cache and storage implementations you want to use and respective cache/storage options.

```ruby

CanTango.config.cache do |cache|
  cache.type :session
  cache.store do |store|
    store.type :memory
    # ...
  end
end
```

See specs for more info on how to configure.

## Cache adapters

The Cache system is based on Adapters that each subclass the BaseAdapter that defined the Adapter API. A cache can be configured with a storage module.

The current Cache Adapter implementations are:

* Moneta
* Session

The Session should be able to store the Ability in-memory or in any Session store that implements the Rails Session API, typically any key-value compatible data store.

## Store 

A Store has the responsibility of storing an ability as a Hash in a data storage and later re-loading the hash as an Ability.

The current Store implementations are:

* Hash
* Moneta

Moneta is a wrapper for various key-value compatible data stores.

## Status

This gem is still under development and more specs are needed. The initial structure is mostly in place. The objective is to more strictly follow the Single Responsivility pattern and in general a more OO approach to make it easier to test and extend functionality and reduce coupling etc.

## Contributing to cantango-cache
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2011 Kristian Mandrup. See LICENSE.txt for
further details.

