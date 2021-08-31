FactoryBot.define do
  factory :task do
    # 作成するテストデータの名前を「task」とします
    # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
    task_name { "1個目のタスク" }
    to_do { "テスト1" }
    deadline { "2021-10-25" }
    status { "未着手" }
    priority { "高" }
    # association :user
  end

  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    task_name { "2個目のタスク" }
    to_do { "テスト2" }
    deadline { "2021-10-10" }
    status { "完了" }
    priority { "中" }
    # association :user #タスクを作るたびにuserを生成してしまうので、uniqueでこける
  end

  # factory :thierd_task, class: Task do
  #   task_name { "3個目のタスク" }
  #   to_do { "テスト3" }
  #   deadline { "2021-10-30" }
  #   status { "完了" }
  #   priority { "低" }
  # end

end
