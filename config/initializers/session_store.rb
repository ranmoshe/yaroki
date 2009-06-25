# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_yaroki_session',
  :secret      => 'f59ae07344cdc1e835fb8796b298464986d7080fde8a544700788c074caa64aa0569c42b680f351843943597ac03f02bb56a6a51f421cfa87f0286a541a5118a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store