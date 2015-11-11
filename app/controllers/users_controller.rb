class UsersController < ApplicationController

  before_action :find_user

  def show
  end

  def theme_name
    @user.color_theme.style_file_name
  end

  private
  def find_user
    @user = User.find(params[:id])
  end


end
