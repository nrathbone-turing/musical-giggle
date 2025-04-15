class Library

  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
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
      # puts "This book is not available at this library. Please contact the front desk for assistance."
      return false
    elsif @checked_out_books.include?(book)
      # puts "This book has already been checked out. Please contact the front desk for assistance."
      return false
    else
      @checked_out_books << book
      # puts "You have successfully checked out #{book.title}. It will need to be returned or extended in the next 14 days to avoid a fee."
      return true
    end
  end

  def checked_out_books
    return @checked_out_books
  end

  def return(book)
    if @checked_out_books.include?(book)
      @checked_out_books.delete(book)
      # puts "#{book.title} is no longer checked out and has been returned successfully." 
    else
      # puts "You cannot return a book that has not been checked out. Please contact the front desk for assistance."
    end
  end


end