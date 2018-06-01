class StaticPagesController < ApplicationController
  def home
      @person = { name: 'Wayne'}
  end
end
