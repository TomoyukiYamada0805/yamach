require 'rails_helper'

RSpec.describe User, type: :model do
  it "ユーザー名が必須であること" do
    user = User.new()
    user.valid?
    expect(user.errors[:username]).to include('が入力されていません。')
  end
end
