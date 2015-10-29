class UsersController < ApplicationController
  def show
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def recipes
    @recipes ||= user.recipes.recent
  end

  helper_method :user, :recipes
end
