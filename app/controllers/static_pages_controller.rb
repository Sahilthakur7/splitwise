class StaticPagesController < ApplicationController
  def home
      @person = { name: current_user.name,
                  avatar: current_user.avatar.url(:medium),
                  username: current_user.username
      }
  end
end
