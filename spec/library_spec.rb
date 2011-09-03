# stopped at 18:15

require 'spec_helper'

describe "Library Object" do

  before :all do
    lib_arr = [
      Book.net("Javascript tho good parts", "Douglas Crawford", :development),
      Book.net("Designing with web standards", "Jeffrey Zeldman", :design),
      Book.net("Don't Make Me Think", "Steve Krug", :development),
      Book.net("Javascript Patterns", "Stoya Stefanov", :development),
      Book.net("Responsive Web Design", "Ethan Marcotte", :design)
    ]
  end

  before :each do

  end
end
