require 'rails_helper'

RSpec.feature "Tops", type: :feature do
  scenario "トップページ遷移" do
    visit root_path
    expect(page).to have_content "ちゃんねる"
  end

  scenario "検索" do
    ThreadList.create(title: 'test_thread', body: 'test', user_id: 1)
    visit root_path
    fill_in 'q_title_or_body_or_response_comment_cont', with: 'first'
    click_button "検索"

    expect(page).to have_content "ちゃんねる"
  end
end
