class ThreadList < ApplicationRecord
    has_many :category, dependent: :destroy
    has_many :category_name, through: :category
    accepts_nested_attributes_for :category
    has_many :response, dependent: :destroy

    validates :title, presence: true, length: { maximum: 100 }
    validates :body, presence: true, length: { maximum: 1000 }

    before_create :generate_token

    def generate_token
      self.uid = loop do
        random_token = SecureRandom.uuid
        break random_token unless self.class.exists?(id: random_token)
      end
    end
end
