class ResumesController < ApplicationController

  def index
    @users = User.where.not(document_file_name: nil)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def upload
    @user = User.find(current_user.id)
    if @user.update_attributes(user_params)
      redirect_to edit_path, notice: "Document Uploaded."
    else
      redirect_to edit_path, alert: "Please upload the correct file type."
    end
  end

  def info
    @user = User.find(current_user.id)
    if @user.update_attributes(user_params)
      redirect_to edit_path, notice: "Info Updated."
    end
  end

  private

  def user_params
    params.require(:user).permit(:major, :year, :document)
  end

end
