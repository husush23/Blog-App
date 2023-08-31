class ApplicationController < ActionController::Base
  puts "ApplicationController is being loaded!"
    def current_user
      User.first
    end
  end