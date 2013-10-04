class Request < ActiveRecord::Base
  belongs_to :requester, class_name: User

  def authorized_to_edit?(user)
    requester == user || user.admin?
  end
end
