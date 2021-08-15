class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
  end

  def delete_user_image
    @user_image = ActiveStorage::Attachment.find_by(id: current_user.image.id)
    @user_image.purge_later
    redirect_back(fallback_location: root_path)
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end
end
