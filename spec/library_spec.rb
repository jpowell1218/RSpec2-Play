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
end
