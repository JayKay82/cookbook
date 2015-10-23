class WelcomeController < ApplicationController
  def index
  end

  private

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  helper_method :resource_name, :resource, :devise_mapping
end
