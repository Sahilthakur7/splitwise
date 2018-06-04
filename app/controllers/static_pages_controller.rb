class StaticPagesController < ApplicationController
  def home
      @person = { name: current_user.name}
  end
end
