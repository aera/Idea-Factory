FactoryGirl.define do
  factory :idea do
	sequence(:title) { |n| "#{Faker::Coffee.blend_name} #{n}" }
    description {Faker::Coffee.notes}
  end
end
