class ThreadList < ApplicationRecord
    has_many :category, dependent: :destroy
    has_many :category_name, through: :category
    accepts_nested_attributes_for :category
    has_many :response, dependent: :destroy
    belongs_to :user

    validates :title, presence: true, length: { maximum: 50 }
    validates :body, presence: true, length: { maximum: 200 }

    before_create :generate_token

    def generate_token
      self.uid = loop do
        random_token = SecureRandom.uuid
        break random_token unless self.class.exists?(id: random_token)
      end
    end
end
