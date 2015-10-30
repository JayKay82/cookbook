class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # guest user (not logged in)
    raise(CanCan::AccessDenied) unless user

    if user.admin?
      can :manage, :all
    else
      # Recipes
      can :create, Recipe
      can :read, Recipe do |recipe|
        recipe.private == false || recipe.user_id == user.id
      end
      can [:update, :destroy], Recipe, user_id: user.id

      # Users
      can :read, User
    end
  end
end
