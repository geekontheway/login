class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, allow_blank: true

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
