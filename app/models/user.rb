class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  # has_many :favorites, dependent: :destroy
  # has_many :favorite_pictures, through: :favorites, source: :picture
  validates :user_name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, 
                    length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  before_update :check_admin_exist_for_update
  before_destroy :check_admin_exist_for_destroy

  private
  def check_admin_exist_for_update
    admins = User.all.where(admin: true)
    #入力されたadminがfalse(adimin権限をなくそうとしている) , 変更されようとしてるuserが今のadminの場合(つまり最後の1人)
    if admins.count == 1 && self.admin == false && self.admin == User.find_by(admin: true)
      errors.add(:base, "管理者がいなくなってしまいます！！")
      throw(:abort)
    end 
  end
  def check_admin_exist_for_destroy
    admins = User.all.where(admin: true)
    throw(:abort) if admins.count == 1 && self.admin == User.find_by(admin: true)
    # if admins.count == 1
    #   errors.add(:base, "管理者がいなくなってしまいます！！")
    #   throw(:abort)
    # end 
  end
end
