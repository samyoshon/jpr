class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :jobs

  has_attached_file :logo, styles: { 
      medium: "300x300>", 
      thumb: "100x100>" 
    }

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  def to_param
	"#{id} #{name}".parameterize
  end
end

