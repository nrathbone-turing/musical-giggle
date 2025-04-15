class Author

  attr_reader :first_name, :last_name, :name, :books

  def initialize(author)
    @first_name = author[:first_name]
    @last_name = author[:last_name]
    @name = "#{@first_name} #{@last_name}"
    @books = []
  end

  def write(title, publication_date)
    new_book = Book.new({
      :author_first_name => @first_name,
      :author_last_name => @last_name,
      :title => title,
      :publication_date => publication_date
    })
    # had to add the shovel here to get it working, want to discuss why later though
    @books << new_book
    new_book
    
  end

end