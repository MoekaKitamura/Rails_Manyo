class Lavel < ApplicationRecord
  has_many :lavelings, dependent: :destroy
  has_many :laveling_tasks, throuth: :laveling, source: :task
end
