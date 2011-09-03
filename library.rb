require 'yaml'

class Library

  attr_accessor :books

  def initialize(lib_file = false)
    @lib_file = lib_file
    @books = @lib_file ? YAML::load(File.read(@lib_file)) : []
  end

  def get_books_in_category
    @books.select do |book|
      book.category == category
    end
  end

end
