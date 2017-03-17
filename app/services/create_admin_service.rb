class CreateAdminService
  def create_admin
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
      user.password = Rails.application.secrets.admin_password
      user.password_confirmation = Rails.application.secrets.admin_password
      user.name = Rails.application.secrets.admin_name
      user.admin!
    end
  end
  def create_employer
    user = User.find_or_create_by!(email: Rails.application.secrets.employer_email) do |user|
      user.password = Rails.application.secrets.employer_password
      user.password_confirmation = Rails.application.secrets.employer_password
      user.name = Rails.application.secrets.employer_name
      user.employer!
    end
  end
end
