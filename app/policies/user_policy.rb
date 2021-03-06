class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def edit?
    !@current_user.employer?
  end

  def index?
    @current_user.admin? || @current_user.employer? || @current_user.brother? 
  end

  def show?
    @user
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    return false if @current_user == @user
    @current_user.admin?
  end

end
