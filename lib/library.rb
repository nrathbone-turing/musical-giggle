class Library

  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(new_author)
    @authors << new_author
    @books.concat(new_author.books)
  end
end