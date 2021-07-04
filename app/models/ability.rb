class Ability
  include CanCan::Ability
  def initialize(user)
    binding pry
    if user.seller?
      can :manage, :all
    end
  end
end
