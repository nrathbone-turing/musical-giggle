require 'rspec'
require 'pry'
require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do

  before(:each) do
    @dpl = Library.new("Denver Public Library")
  end

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


end