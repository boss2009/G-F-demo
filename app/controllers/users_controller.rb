class UsersController < ApplicationController
  
  # + Dec.26.2011
  before_filter :authenticate_user!
  
  def show
    @user = User.find(params[:id])
  end

end
