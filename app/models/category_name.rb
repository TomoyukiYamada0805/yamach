class CategoryName < ApplicationRecord
    has_many :category, dependent: :destroy
    has_many :thread_list, through: :category

    validates :name, presence: true, length: { maximum: 100 }

    before_create :generate_token

    def generate_token
      self.uid = loop do
        random_token = SecureRandom.uuid
        break random_token unless self.class.exists?(id: random_token)
      end
    end
end
