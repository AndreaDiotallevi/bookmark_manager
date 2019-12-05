feature 'add bookmark' do

  scenario 'add new bookmark to the bookmark page' do
    visit("/bookmarks")
    fill_in 'url', with: "http://www.bing.com"
    fill_in 'title', with: "Bing search engine"
    click_on("submit")

    expect(page).to have_link('Bing search engine', href: "http://www.bing.com")
  end

end
