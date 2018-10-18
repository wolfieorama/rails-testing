FactoryGirl.define do
    factory :album, aliases: [:popular_album] do
        title Faker::Book.title
    end
end