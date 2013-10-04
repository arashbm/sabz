class User < ActiveRecord::Base
  has_many :products, foreign_key: :provider_id
  has_many :requests, foreign_key: :requester_id

  def can(action, thing)
    thing.send("authorized_to_#{action}?", self)
  end

  def admin?
    email.in? Rails.configuration.admin_emails
  end

  def authorized_to_edit?(user)
    user.id == id || user.admin?
  end
end
