class ResumesController < ApplicationController

  def index
    @users = User.where.not(image_file_name: nil)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def upload
    @user = User.find(current_user.id)
    if @user.update_attributes(user_params)
      redirect_to upload_path
      flash[:success] = "Image Uploaded"
    end
  end

  private

    def user_params
      params.require(:user).permit(:image)
    end

end
