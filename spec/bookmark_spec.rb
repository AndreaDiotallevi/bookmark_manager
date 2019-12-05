require 'bookmark'

describe Bookmark do

  describe "#all" do

    it "should display all my bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers academy');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.destroyallsoftware.com', 'Destroy software');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google homepage');")


      bookmarks = Bookmark.all

      p bookmarks
      expect(bookmarks[0].url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#add' do
    it 'adds new bookmark to the bookmark database' do
      bookmark = Bookmark.add(url: "http://www.bing.com", title: "Bing search engine").first
      expect(bookmark['url']).to eq "http://www.bing.com"
      expect(bookmark['title']).to eq "Bing search engine"
    end
  end

end
