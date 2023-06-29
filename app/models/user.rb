class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :editor], multiple: false)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  validates_presence_of :name

  has_many :comments, dependent: :destroy
  has_many :recipes, dependent: :destroy
  mount_uploader :profile, ProfileUploader
  has_many :authorizations
  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end

  class << self
    def from_omniauth(auth, current_user)
      # check for existing authorization
      # Find or create Authorization with: provider, uid, token and secret
      authorization =
        Authorization.where(
          provider: auth.provider,
          uid: auth.uid.to_s,
          token: auth.credentials.token,
          secret: auth.credentials.secret,
        ).first_or_initialize

      if authorization.user.blank?
        member =
          (
            if current_user.nil?
              Member.where("email = ?", auth["info"]["email"]).first
            else
              current_user
            end
          )

        # save user related data in user table
        if member.blank?
          User.new(
            email: auth.info.email,
            password: Devise.friendly_token[0, 10],
            name: auth.info.name,
            profile: auth.info.image,
          )
        end

        # store authorization related data in authorization table
        authorization.username = auth.info.nickname
        authorization.user_id = user.id
        authorization.save!
      end
      authorization.user
    end
  end
end
