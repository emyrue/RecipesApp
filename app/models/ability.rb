# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all

    if user.admin? :admin
      can :manage, :all
    else
      can :manage, Inventory, user_id: user.id
      can :manage, Food, user_id: user.id
      can :manage, Recipe, user_id: user.id
      can :read, :all
      can :add, Food
      can :add, Recipe
      can :add, Inventory
    end
  end
end
