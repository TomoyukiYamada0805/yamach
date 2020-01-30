class Category < ApplicationRecord
    belongs_to :thread_list
    belongs_to :category_name
end
