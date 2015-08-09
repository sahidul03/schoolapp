class UsersController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    # raise Student.order("RAND()").first(2).inspect
    render layout: 'user_layout'
  end




end
