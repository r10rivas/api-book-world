class Api::V1::BooksController < ApplicationController
  def index
    @books = Book.all.includes(:editorial, :writers, :genres)
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render :show, status: :created
    else
      render json: { errors: @book.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :publication_date, :editorial_id, writer_ids: [], genre_ids: [])
  end
end
