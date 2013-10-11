class Ability
  include CanCan::Ability

  def initialize(user)

    # every one
    can :read, Product, state: 'accepted' 
    can :read, Request, state: 'accepted' 

    if user.blank?
      # not logged in
    elsif user.admin?
      can :manage, :all
    else
      can :manage, Product, provider_id: user.id
      can :manage, Request, requester_id: user.id
    end
  end
end
