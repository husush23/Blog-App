# app/models/ability.rb

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    # Define abilities for different user roles
    if user.admin?
      can :manage, :all # Admins can manage all resources
    else
      can :read, Post # Regular users can read posts
      can :create, Post if user.persisted? # Logged-in users can create posts
      can :update, Post, user_id: user.id # Users can update their own posts
      can :destroy, Post, user_id: user.id # Users can delete their own posts
    end
  end
end
