class Api::V1::WritersController < ApplicationController
  def index
    @writers = Writer.all
  end

  def show
    @writer = Writer.find_by(id: params[:id])
  end
end
