require 'rspec'
require 'pry'
require './lib/book'

RSpec.describe Book do

  before(:each) do
    @book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
  end

  it 'exists' do
    expect(@book).to be_an_instance_of(Book)
  end

  it 'has a title of "To Kill a Mockingbird"' do
    expect(@book.title).to eq("To Kill a Mockingbird")
  end

  it 'has an author of "Harper Lee"' do
    expect(@book.author).to eq("Harper Lee")
  end

  it 'has a publication year of 1960' do
    expect(@book.publication_year).to eq("1960")
  end
end