class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all

    if user.admin? :admin
      can :manage, :all
    else
      can :manage, Inventory, user_id: user.id
      can :manage, Food
      can :manage, RecipeFood
      can :manage, InventoryFood, user_id: user.id
      can :create, Recipe
      can :destroy, Recipe, user_id: user.id
      can :read, :all
    end
  end
end
