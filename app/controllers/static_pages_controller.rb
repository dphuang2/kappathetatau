class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to '/resumes'
    else
      redirect_to '/users/sign_in'
    end
  end
end
