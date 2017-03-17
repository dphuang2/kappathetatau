class ResumesController < ApplicationController
  require 'zip'
  rescue_from ActionController::ParameterMissing, :with => :no_file_attached

  def index
    @users = User.where.not(document_file_name: nil)
    authorize User ## UserPolicy::index?
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

  def download
    @users = User.where.not(document_file_name: nil)
    redirect_to @users.first.document.url(:original, false)
    zipfile_name = "Resumes.zip"
    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      @users.each do |u|
        puts u.document_file_name
        puts u.document.url(:original, false)
        zipfile.add(u.document_file_name, "/public"+u.document.url(:original, false))
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:major, :year, :document)
  end

  def no_file_attached
    redirect_to edit_path, alert: "No file was attached."
  end

end
