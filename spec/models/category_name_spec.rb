require 'rails_helper'

RSpec.describe CategoryName, type: :model do
  it "カテゴリ名は30文字以内であること" do
    category_name = CategoryName.new(name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
    category_name.valid?
    expect(category_name.errors[:name]).to include('は30文字以内で入力してください')
  end

  it "同一のカテゴリ名は登録できないこと" do
    category_name = CategoryName.create(
      name: '同一名テスト'
    )

    category_name = CategoryName.new(
      name: '同一名テスト'
    )

    category_name.valid?
    expect(category_name.errors[:name]).to include('はすでに存在します')
  end
end
