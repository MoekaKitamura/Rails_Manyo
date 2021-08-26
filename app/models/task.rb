class Task < ApplicationRecord
  validates :task_name, presence: true
  validates :to_do, presence: true
  # validate :not_before_today

  # def not_before_today
  #   errors.add(:deadline, 'は本日以降で入力してください') if deadline.nil? || deadline < Date.today
  # end

  # validates :status, inclusion: { in:["未着手","着手","完了"]}
  # validates :priority, inclusion: { in:["高","中","低"]}

  # スコープを設定する メソッド -> (引数) {実行して欲しいクエリ}
  scope :task_name, ->(keyword) { where("task_name LIKE ? ","%#{keyword}%")}
  scope :status, ->(keyword) { where(status: keyword)}

  # enumとは、１つのカラムに指定した複数個の定数を保存できる様にする為のモノ
  # viewの使いたいとこで Task.statuses.keys
  enum status: { 未着手: 0, 着手: 1, 完了: 2 }
  enum priority: { 高: 0, 中: 1, 低: 2 }
  
end
