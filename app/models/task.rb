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
  
end
