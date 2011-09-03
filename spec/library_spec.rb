# run just this spec via: rspec spec/library_spec.rb --format nested

require 'spec_helper'

describe "Library Object" do

  before :all do
    lib_arr = [
      Book.new("Javascript tho good parts", "Douglas Crawford", :development),
      Book.new("Designing with web standards", "Jeffrey Zeldman", :design),
      Book.new("Don't Make Me Think", "Steve Krug", :development),
      Book.new("Javascript Patterns", "Stoya Stefanov", :development),
      Book.new("Responsive Web Design", "Ethan Marcotte", :design)
    ]

    File.open "books.yml", "w" do |f|
      f.write YAML::dump lib_arr
    end
  end

  before :each do
    @lib = Library.new "books.yml"
  end

  describe "#new" do
    context "with no parameters" do
      it "has no books" do
        lib = Library.new
        lib.should have(0).books # alternatively: lib.books.length.should == 0
      end
    end

    context "with a yaml file name parameter" do
      it "has five books" do
        @lib.should have(5).books
      end
    end
  end

  it "returns all the books in a given category" do
    @lib.get_books_in_category(:development).length.should == 3
  end

  it "accepts new books" do # this should only be testing one thing at a time
    @lib.add_book(Book.new("Designing for the Web", "Mark Boulton", :design))
    @lib.get_book("Designing for the Web").should be_an_instance_of Book
  end

  it "saves the library" do
    books = @lib.books.map { |book| book.title }  # returns an array of all titles of the books in the library
    @lib.save "our_new_library.yml"
    lib2 = Library.new "our_new_library.yml"
    books2 = lib2.books.map { |book| book.title }
    books.should eql books2
  end

end
