class Request < ActiveRecord::Base
  belongs_to :requester, class_name: User
  belongs_to :category

  validates :state, inclusion: { in: Rails.configuration.request_states }
  validates :last_state, inclusion: { in: Rails.configuration.product_states }
  validates :name, presence: true
  validates :quantity, presence: true

  before_validation :set_default_state

  default_scope order('updated_at DESC')

  def set_default_state
    self.state ||= Rails.configuration.request_default_state
    self.last_state ||= Rails.configuration.request_default_state
  end

  def soft_destroy
    update(state: 'deleted', last_state: state) unless state == 'deleted'
  end

  def recycle
    update(state: last_state)
  end
end
