FactoryBot.define do
  factory :user do
    nickname              {"まっちゃん"}
    email                 {Faker::Internet.free_email}
    password              {"000000"}
    password_confirmation {password}
    last_name             {"松本"}
    first_name            {"人志"}
    pseudonym_last_name   {"マツモト"}
    pseudonym_first_name  {"ヒトシ"}
    birthday              {"1963-9-8"}
  end
end