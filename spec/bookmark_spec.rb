require 'bookmark'

describe Bookmark do

  describe "#all" do

    it "should display all my bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")


      bookmarks = Bookmark.all

      p bookmarks
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end

  describe '#add' do
    it 'adds new bookmark to the bookmark database' do
      Bookmark.add("http://www.bing.com")
      expect(Bookmark.all).to include("http://www.bing.com")
    end
  end

end
