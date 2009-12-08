# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_booker-t_session',
  :secret      => '524e9ebb9aef8853b2a42232ded9a54c2c7702d42be929820295a6a63281f7982e6e25627215cc3b1a03c8f9e09b147b7d4016551329f391ff2270ebeef8e0b1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
