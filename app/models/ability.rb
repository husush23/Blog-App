class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    if user.admin?
      can :manage, :all # Admins can manage all resources
    else
      # Abilities for posts
      can :read, Post # Regular users can read posts
      can :create, Post if user.persisted? # Logged-in users can create posts
      can :update, Post, author_id: user.id # Users can update their own posts
      can :destroy, Post, author_id: user.id # Users can delete their own posts

      # Abilities for comments
      can :create, Comment if user.persisted? # Logged-in users can create comments
      can :destroy, Comment, author_id: user.id # Users can delete their own comments
    end
  end
end
