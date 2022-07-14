FactoryBot.define do
  factory :user do
    name {"Test User"}
    email {"test@example.com"}
    password {"password"}

    grade_id {0}
    research_theme {"research_theme"}
    introduction {"introduction"}
  end
end
