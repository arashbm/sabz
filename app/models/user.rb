class User < ActiveRecord::Base
  has_many :products, foreign_key: :provider_id
  has_many :requests, foreign_key: :requester_id
  has_many :sent_messages, foreign_key: :from_id
  has_many :received_messages, foreign_key: :to_id

  def can(action, thing)
    thing.send("authorized_to_#{action}?", self)
  end

  def admin?
    true
    # email.in? Rails.configuration.admin_emails
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name_with_institute
    "#{full_name} (#{institute})"
  end
end
