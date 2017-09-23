FactoryGirl.define do
  factory :user do
    factory :user_valid do
      email    'clementine@popsicle.com'
      username 'Heavy Trader'
      password 'popsicles'
    end

    factory :user_no_username do
      email    'clementine@popsicle.com'
      password 'popsicles'
    end

    factory :user_no_email do
      username 'Heavy Trader'
      password 'popsicles'
    end

    factory :user_no_password do
      email    'clementine@popsicle.com'
      username 'Heavy Trader'
    end
  end
end
