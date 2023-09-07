class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      # Abilities for posts
      can :read, Post # Regular users can read posts
      can :create, Post if user.persisted?
      can :update, Post, author_id: user.id
      can :destroy, Post, author_id: user.id

      # Abilities for comments
      can :create, Comment if user.persisted?
      can :destroy, Comment, author_id: user.id
    end
  end
end
