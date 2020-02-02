class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :responses, dependent: :destroy

  validates :username, presence: true, length: { maximum: 10 }

  before_create :generate_token

  def generate_token
    self.uid = loop do
      random_token = SecureRandom.uuid
      break random_token unless self.class.exists?(id: random_token)
    end

    self.authority = 2
  end

end
