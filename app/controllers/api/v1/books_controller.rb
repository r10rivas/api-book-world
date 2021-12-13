class Api::V1::BooksController < ApplicationController
  def index
    @books = Book.all.includes(:editorial, :writers, :genres)
  end
end
