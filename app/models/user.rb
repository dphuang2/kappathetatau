class User < ApplicationRecord

  MAJORS = ["Aerospace Engineering (AE)", "Agricultural Engineering (AgE)", "Bioengineering (BioE)", "Chemical and Biomolecular Engineering (ChBE)", "Civil and Environmental Engineering (CEE)", "Computer Engineering (CompE)", "Computer Science (CS)", "Electrical Engineering (EE)", "Engineering Mechanics (EM)", "Engineering Physics (EP)", "General Engineering (GE)", "Industrial Engineering (IE)", "Materials and Science Engineering (MatSE)", "Mechanical Engineering (ME)", "Nuclear, Plasma, and Radiological Engineering (NPRE)"]

  GRADUATION = [1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022]

  enum role: [:employer, :brother, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :brother
  end

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#", table: "50x50#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
