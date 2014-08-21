# app/models/ability.rb
class Ability
  include CanCan::Ability
 
  def initialize(user)
    if !user.blank? && user.is_admin?
      can :manage, Restaurant
      can :manage, :admin_restaurants
      can :manage, Menu
      can :manage, :admin_menus
      can :manage, MenuItem
      can :manage, :admin_menu_items
      can :manage, MenuCategory
      can :manage, :admin_menu_categories
      can :manage, Newsletter
      can :manage, :admin_newsletters
    end
  end
 
end