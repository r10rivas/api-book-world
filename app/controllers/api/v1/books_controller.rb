class Api::V1::BooksController < ApplicationController
  def index
    @books = Book.all.includes(:editorial, :writers, :genres)
  end

  def show
    @book = Book.find_by(id: params[:id])
  end
end
