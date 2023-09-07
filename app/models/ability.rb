# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    
    # Define the ability to delete a post if it is the user's post or if the user is an admin.
    can :delete, Post, author_id: user.id
    can :delete, Post if user.admin?

    # Define the ability to delete a comment if it is the user's comment or if the user is an admin.
    can :delete, Comment, author_id: user.id
    can :delete, Comment if user.admin?
    
    # Allow all users to read resources (posts, comments, etc.).
    can :read, :all
  end
end
