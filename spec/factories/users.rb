FactoryGirl.define do
    

    factory :user do
        email { Faker::Internet.email}
        password_digest { '123'}
       
        created_by { Faker::Number.number(10)}
    end
    end
    