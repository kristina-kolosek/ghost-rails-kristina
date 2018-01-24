class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!, only: [:index]

  def index
    @users = User.all
  end

  def show
    @profile = Profile.where(slug: params[:slug]).take
  end
end
