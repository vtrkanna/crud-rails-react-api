# frozen_string_literal: true

# FactoryBot support
FactoryBot.define do
  stages_array = ["All", "Norming", "Forming", "Performing"]
  conditions_array = ["Always", "Rare", "Medium"]

  factory :random_question, class: Question do
    factory :question do
      title { Faker::Lorem.question }
      pri { Faker::Number.between(1, 9) }
      teaming_stages { stages_array.sample}
      conditions { conditions_array.sample }
    end
  end
end
