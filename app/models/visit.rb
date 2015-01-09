class Visit < ActiveRecord::Base
  ahoy_visit
  scope :stranger, -> { where('user_id is null') }
  scope :has_user, -> { where('user_id is not null') }

  #4小时内访问看做当前在线
  scope :online, -> { where(created_at: (Time.now - 4.hour) .. Time.now) }
end
