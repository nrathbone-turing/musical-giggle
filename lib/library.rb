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

  def publication_time_frame(author)

  end

  def checkout(book)

  end

  def checked_out_books

  end

  def return(book)

  end


end