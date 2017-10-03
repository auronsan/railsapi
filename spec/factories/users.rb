FactoryGirl.define do
        factory :user do
            username { Faker::StarWars.character}
            email { Faker::Internet.email}
            created_by { Faker::Number.number(10)}
        end
    end
    