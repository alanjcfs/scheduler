# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Scheduler::Application.config.secret_key_base = 'fa86f35359257dfb5fe1277fba1d2a174365b1156cca23b97a9495c40b23b730f4b914954c9c428152430fa46ee6ade9ad58e1e1370f83b9602c3b0022a73e6d'
