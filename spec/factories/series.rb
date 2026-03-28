FactoryBot.define do
  factory :serie do
    reps { 10 }
    mark { nil }

    trait :fallo do
      mark { "FALLO" }
    end

    trait :goma do
      mark { "GOMA" }
    end
  end
end
