feature 'add bookmark' do

  scenario 'add new bookmark to the bookmark page' do
    visit("/bookmarks")
    fill_in 'new_bookmark', with: "http://www.bing.com"
    click_on("submit")
    expect(page).to have_content("http://www.bing.com")
  end

end
