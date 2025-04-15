require 'rspec'
require 'pry'
require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do

  before(:each) do
    @dpl = Library.new("Denver Public Library")
  end

  describe '#initialize' do

    it 'exists' do
      expect(@dpl).to be_a(Library)
    end

    it 'has a name of Denver Public Library' do
      expect(@dpl.name).to eq("Denver Public Library")
    end
  
    it 'starts with no books' do
      expect(@dpl.books).to eq([])
    end
  
    it 'starts with no authors' do
      expect(@dpl.authors).to eq([])
    end
  end

  describe '#add_author' do

    it 'can receieve author information and books they have written'do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
     
      @dpl.add_author(charlotte_bronte)
      @dpl.add_author(harper_lee)

      expect(@dpl.authors).to eq([charlotte_bronte, harper_lee])
    end

    it 'can add books written by those authors into an array of book objects' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
    
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    
      @dpl.add_author(charlotte_bronte)
      @dpl.add_author(harper_lee)
    
      expect(@dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
    end
  end

  describe '#publication_time_frame' do

    before(:each) do
      @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
      @professor = @charlotte_bronte.write("The Professor", "1857")
      @villette = @charlotte_bronte.write("Villette", "1853")
    
      @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
    end

    it 'returns a key/value pair for the earliest publication year of an authors books' do
      expected_output = @dpl.publication_time_frame(@charlotte_bronte)
      expect(expected_output[:start]).to eq("1847")

      expected_output = @dpl.publication_time_frame(@harper_lee)
      expect(expected_output[:start]).to eq("1960")

    end

    it 'returns a key/value pair for the latest publication year of an authors books' do
      expected_output = @dpl.publication_time_frame(@charlotte_bronte)
      expect(expected_output[:end]).to eq("1857")

      expected_output = @dpl.publication_time_frame(@harper_lee)
      expect(expected_output[:end]).to eq("1960")
    end

    it 'returns a hash with both of the key/value pairs which points to the first and last publication years for an author' do
      expect(@dpl.publication_time_frame(@charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
      expect(@dpl.publication_time_frame(@harper_lee)).to eq({:start=>"1960", :end=>"1960"})
    end
  end

  describe 'checkout books logic' do

    before(:each) do 
      @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
      @professor = @charlotte_bronte.write("The Professor", "1857")
      @villette = @charlotte_bronte.write("Villette", "1853")
    
      @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    end

    it 'can checkout a book if it exists and is not already checked out' do
      @dpl.add_author(@charlotte_bronte)
      book = @jane_eyre
    
      expect(@dpl.checkout(book)).to eq(true)
      expect(@dpl.checked_out_books).to include(book)
    end
    
    it 'cannot checkout a book that does not exist in the library' do
      missing_book = Book.new({author_first_name: "Megan", author_last_name: "McMahon", title: "All Roads Lead to Nowhere", publication_date: "2024"})
      expect(@dpl.checkout(missing_book)).to eq(false)
    end
    
    it 'cannot checkout a book that is already checked out' do
      @dpl.add_author(@charlotte_bronte)
      book = @jane_eyre
      @dpl.checkout(book)
    
      expect(@dpl.checkout(@jane_eyre)).to eq(false)
    end
    


  end

end