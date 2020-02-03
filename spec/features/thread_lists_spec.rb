require 'rails_helper'

RSpec.feature "ThreadLists", type: :feature do
  scenario "スレッド一覧遷移" do
    visit thread_lists_path
    expect(page).to have_content "ちゃんねる"
  end

  scenario "スレッド詳細遷移" do
    visit thread_lists_path

    find('.thread_container__thread_item')
    expect(page).to have_content "ちゃんねる"
  end
end
