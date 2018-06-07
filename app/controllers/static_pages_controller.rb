class StaticPagesController < ApplicationController
  def home
      @person = { name: current_user.name,
                  avatar: current_user.avatar.url(:medium)
      }
  end
end
