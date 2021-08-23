class Task < ApplicationRecord
  validates :task_name, presence: true
  validates :to_do, presence: true
  # validate :not_before_today

  # def not_before_today
  #   errors.add(:deadline, '本日以降で入力してください') if deadline.nil? || deadline < Date.today
  # end

  # validates :status, inclusion: { in:["未着手","着手","完了"]}
  # validates :priority, inclusion: { in:["高","中","低"]}
end
