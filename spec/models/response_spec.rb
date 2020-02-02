require 'rails_helper'

RSpec.describe Response, type: :model do
  it "コメントは1000文字以内であること" do
    response = Response.new(comment: 'a' * 1001)
    response.valid?
    expect(response.errors[:comment]).to include('は1000文字以内で入力してください')
  end
end
