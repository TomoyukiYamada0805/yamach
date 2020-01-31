class Category < ApplicationRecord
    belongs_to :thread_list
    belongs_to :category_name

    #登録するカテゴリIDにひもづくカテゴリが存在するか。 登録する値を改ざんされていないか。
    validate :category_exists?

    def category_exists?
        unless CategoryName.exists?(id: category_name_id)
            errors.add(:category_name_id)
        end
    end
end
