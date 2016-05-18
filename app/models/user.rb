class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :confirmable, :omniauthable

  validates :nome, presence: true, length: {maximum: 50}

  has_one :photographer, dependent: :destroy
  has_many :reservations
  has_one :search, dependent: :destroy

  geocoded_by :indirizzo
  after_validation :geocode, if: :indirizzo_changed?

  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 5.megabytes

  def self.from_omniauth(auth)
  	user = User.where(email: auth.info.email).first

  	if user
  		return user
  	else
  		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.nome = auth.info.name
  			user.provider = auth.provider
  			user.uid = auth.uid
  			user.email = auth.info.email
  			user.image = "http://graph.facebook.com/#{auth.uid}/picture?type=large"
  			user.password = Devise.friendly_token[0,20]
  		end
  	end
  end
end
