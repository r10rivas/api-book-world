class Api::V1::WritersController < ApplicationController
  def index
    @writers = Writer.all
  end
end
