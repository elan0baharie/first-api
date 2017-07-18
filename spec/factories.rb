FactoryGirl.define do
  factory :comment do
    
  end
  factory(:quote) do
    author { Faker::Book.unique.author }
    content { Faker::ChuckNorris.unique.fact }
  end
end
