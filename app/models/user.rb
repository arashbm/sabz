class User < ActiveRecord::Base
  has_many :products, foreign_key: :provider_id
  has_many :requests, foreign_key: :requester_id

  def can(action, thing)
    thing.send("authorized_to_#{action}?", self)
  end

  def admin?
    # true
    false
    # email.in? Rails.configuration.admin_emails
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name_with_institute
    "#{full_name} (#{institute})"
  end
end
