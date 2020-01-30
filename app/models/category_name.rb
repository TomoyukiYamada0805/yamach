class CategoryName < ApplicationRecord
    has_many :category
    has_many :thread_list, through: :category
end
