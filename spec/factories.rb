FactoryGirl.define do
  factory(:quote) do
    author { Faker::Book.unique.author }
    content { Faker::ChuckNorris.unique.fact }
  end
end
