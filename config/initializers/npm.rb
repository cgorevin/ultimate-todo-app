# frozen_string_literal: true

# run `npm install` on startup
system 'npm install' if Rails.env.development? || Rails.env.test?
