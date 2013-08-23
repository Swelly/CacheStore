CacheStore::Application.configure do

  config.cache_classes = false
  # Do not eager load code on boot.
  config.eager_load = false
  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  # Enable caching with redis now
  config.action_controller.perform_caching = true
  # Setting expiry
  config.cache_store = :redis_store, 'redis://localhost:6379/0/cache', { expires_in: 90.minutes }

  config.action_dispatch.rack_cache = {
    metastore:   'redis://localhost:6379/1/metastore',
    entitystore: 'redis://localhost:6379/1/entitystore'
}

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
end
