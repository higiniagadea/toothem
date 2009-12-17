# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_toothem_session',
  :secret      => '059bf04c0b4b2e9b3a780ce8548e216bc90f3803f090a14dcb041921486a896b891817bfd5b51451f3d00b77a484a2bb3de376f1eaa61f20f8b53f7a7bcf3a25'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
