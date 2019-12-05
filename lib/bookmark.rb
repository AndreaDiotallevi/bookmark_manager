require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize( title:, url:)
    # @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end
    result = connection.exec( "SELECT * FROM bookmarks;" )
    
    result.map do |bookmark|
      Bookmark.new(title: bookmark['title'], url: bookmark['url'])
    end

  end

  def self.add(title:, url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end
    connection.exec( "insert into bookmarks(title, url) values('#{title}', '#{url}') returning id, title, url;" )
  end

end 
