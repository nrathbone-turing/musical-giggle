class Library

  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = [[]]
  end

  def add_author(new_author)
    @authors << new_author
    @books.concat(new_author.books)
  end

  def publication_time_frame(author)
    publication_years = author.books.map { |book| book.publication_year }
    
    {:start => publication_years.min,
    :end => publication_years.max
    }
  end

  def checkout(book)

    if @books.include?(book) == false
      return false
    elsif @checked_out_books.include?(book) == true
      return false
    else
      @checked_out_books << book
      return true
    end
  end

  def checked_out_books
    return @checked_out_books
  end

  def return(book)

  end


end