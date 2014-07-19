# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
DroidconPoland::Application.config.secret_token = ENV['SECRET_TOKEN'] || 'bdd6cdf7f95097b754a9ac3925b454b54b8e605eddf5bafa5d5cfe196391bd924e23a0c03cbe7a6739d6a5835194b20dfdb5a1044bb4e1acd82166047332b42e'
