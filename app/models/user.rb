class User < ApplicationRecord
  enum role: [:employer, :brother, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :brother
  end

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
