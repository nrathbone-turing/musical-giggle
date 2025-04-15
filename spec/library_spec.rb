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

end




# pry(main)> charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
# #=> #<Author:0x00007fbeea2d78b8...>

# pry(main)> jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
# #=> #<Book:0x00007fbeeb3beca8...>

# pry(main)> professor = charlotte_bronte.write("The Professor", "1857")
# #=> #<Book:0x00007fbeea8efd90...>

# pry(main)> villette = charlotte_bronte.write("Villette", "1853")
# #=> #<Book:0x00007fbeea24fbe8...>

# pry(main)> harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
# #=> #<Author:0x00007fbeea112730...>

# pry(main)> mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
# #=> #<Book:0x00007fbeeb1089f0...>

# pry(main)> dpl.add_author(charlotte_bronte)

# pry(main)> dpl.add_author(harper_lee)

# pry(main)> dpl.authors
# => [#<Author:0x00007fbeea2d78b8...>, #<Author:0x00007fbeea112730...>]

# pry(main)> dpl.books
# => [#<Book:0x00007fbeeb3beca8...>, #<Book:0x00007fbeea8efd90...>, #<Book:0x00007fbeea24fbe8...>, #<Book:0x00007fbeeb1089f0...>]
