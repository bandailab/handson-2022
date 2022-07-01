FactoryBot.define do
  factory :user do
    name {"Test User"}
    email {"test@example.com"}
    password {"password"}

    grade {"M1"}
    research_theme {"research_theme"}
    introduction {"introduction"}
  end
end
