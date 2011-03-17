# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_al_financeiro_session',
  :secret      => 'd00aa5b4e70ecc38b5a1de02f684b4e59565cd7edcc66c5e74d273d99982c597adf2dd84c591e028331f1cbc5a188b3b213b4749a5350a06e7a3cc63fe29116b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
