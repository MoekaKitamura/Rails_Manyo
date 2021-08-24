FactoryBot.define do
  factory :task do
    # 作成するテストデータの名前を「task」とします
    # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
    task_name { "1個目のタスク" }
    to_do { "テスト" }
    deadline { "2021-10-25" }
    status { "未着手" }
    priority { "高" }
  end

  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    task_name { "2個目のタスク" }
    to_do { "テスト2" }
    deadline { "2021-10-30" }
    status { "未着手" }
    priority { "中" }
  end

end
