require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    50.times do |n|
      n = User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "foobar",
        password_confirmation: "foobar"
      )
    end
    50.times do |n|
      n = Article.create(
        title: Faker::Lorem.words.join(' '),
        body: Faker::Lorem.sentences.join('. '),
        updated_at: Faker::Time.between(5.days.ago, Time.now)
        )
    end
    User.create(name: "james morris",
      email: "james@example.com",
      password: "foobar",
      password_confirmation: "foobar",
      admin: true
      )
  end
end
