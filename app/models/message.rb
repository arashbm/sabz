class Message < ActiveRecord::Base
  belongs_to :from, class_name: User
  belongs_to :to, class_name: User

  validates :from_id, presence: :true
  validates :to_id, presence: :true
end
