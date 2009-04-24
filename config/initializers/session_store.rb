# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mustachr_session',
  :secret      => '182aab682422c84691d0d8757d32cb5d53cfd50698c5757e321991ebc371b817d0f85b3708227bb0332112e3fdd1478782e391cbfde22985d0c4c3e869fb420f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
