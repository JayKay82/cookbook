class UsersController < ApplicationController
  load_and_authorize_resource

  def show
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def all_recipes
    @recipes ||= user.recipes.recent_all
  end

  def restricted_recipes
    @recipes ||= user.recipes.recent_restricted
  end

  helper_method :user, :all_recipes, :restricted_recipes
end
