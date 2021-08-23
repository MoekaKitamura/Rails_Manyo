FactoryBot.define do
  factory :task do
    task_name { "MyString" }
    to_do { "MyString" }
    deadline { "2021-08-23" }
    status { "MyString" }
    priority { "MyString" }
  end
end
