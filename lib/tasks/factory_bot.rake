# frozen_string_literal: true

namespace :factory_bot do
  desc 'Verify that all FactoryBot factories are valid'
  task lint: :environment do
    if Rails.env.test?
      DatabaseCleaner.cleaning do
        FactoryBot.lint
        puts '>>>> Linting complete!'
      end
    else
      system("bundle exec rake factory_bot:lint RAILS_ENV='test'")
      fail if $?.exitstatus.nonzero?
    end
  end
end
