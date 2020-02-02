require 'rails_helper'

RSpec.describe ThreadList, type: :model do
  it "タイトルと本文は必須であること" do
    thread_list = ThreadList.new()
    thread_list.valid?
    expect(thread_list.errors[:title]).to include('を入力してください')
    expect(thread_list.errors[:body]).to include('を入力してください')
  end

  it "タイトルは50文字以内でであること 本文は1000文字以内であること" do
    thread_list = ThreadList.new(
      title: 'a' * 51,
      body: 'a' * 1001
      )
    thread_list.valid?
    expect(thread_list.errors[:title]).to include('は50文字以内で入力してください')
    expect(thread_list.errors[:body]).to include('は1000文字以内で入力してください')
  end
end
