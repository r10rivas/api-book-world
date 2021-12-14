class Api::V1::WritersController < ApplicationController
  def index
    @writers = Writer.all
  end

  def create
    @writer = Writer.new(writer_params)

    if @writer.save
      render :show, status: :created
    else
      render json: { errors: @writer.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @writer = Writer.find_by(id: params[:id])
  end

  def update
    @writer = Writer.find_by(id: params[:id])

    if @writer.update(writer_params)
      render :show, status: :ok
    else
      render json: { errors: @writer.errors.full_messages }, status: :bad_request
    end
  end

  private

  def writer_params
    params.require(:writer).permit(:first_name, :last_name, :date_birth, :country_id)
  end
end
