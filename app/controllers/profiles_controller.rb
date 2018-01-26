class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize Profile
    @users = User.all
  end

  def edit
    @profile = Profile.where(slug: params[:slug]).take
    authorize @profile
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      @profile.user.update_attribute(:email, user_params[:user][:email])
      flash[:success] = "Profile was successfully updated"
      redirect_to edit_profile_path(slug: @profile.slug)
    else
      flash[:error] = "Profile could not be updated"
      render "edit"
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:full_name, :slug, :biography)
  end

  def user_params
    params.require(:profile).permit(user: [:email])
  end
end
