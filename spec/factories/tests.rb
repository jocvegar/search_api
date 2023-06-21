FactoryBot.define do
  factory :test do
    name {FFaker::Name.name }
    age { FFaker::Number.number }
  end
end
