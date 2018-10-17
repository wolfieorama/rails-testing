FactoryGirl.define do        
    factory :user do
        name 'John'
        sequence(:email, 10) { |n| "user#{n}@gmail.com"}
    end
end 