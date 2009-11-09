# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ilmo2_session',
  :secret      => 'b3d9964fa56fa2379d7c61fe8ee67ff698a731433a155bf55d4cb1834dca3e83bd44d894ff8442f27014b71a4ef5977f0c45bf4e6da46156c76dbb3d592639d7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
