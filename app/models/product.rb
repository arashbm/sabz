class Product < ActiveRecord::Base
  belongs_to :provider, class_name: User

  def authorized_to_edit?(user)
    provider == user || user.admin?
  end
end
