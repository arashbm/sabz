class Product < ActiveRecord::Base
  belongs_to :provider, class_name: User
  belongs_to :category

  validates :state, inclusion: { in: Rails.configuration.product_states }
  validates :last_state, inclusion: { in: Rails.configuration.product_states }
  validates :name, presence: true
  validates :sku, presence: true

  before_validation :set_default_state

  default_scope -> { order('updated_at DESC') }

  def set_default_state
    self.state ||= Rails.configuration.product_default_state
    self.last_state ||= Rails.configuration.product_default_state
  end

  def soft_destroy
    update(state: 'deleted', last_state: state) if state.in? ['accepted', 'pending']
  end

  def expire
    update(state: 'expired', last_state: state) if state.in? ['accepted', 'pending']
  end

  def recycle
    update(state: last_state)
  end

  def approve
    update(state: 'accepted')
  end
end
