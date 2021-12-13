require "rails_helper"

RSpec.describe Api::V1::BooksController, type: :routing do
  it "#index" do
    expect(get: 'api/v1/books').to route_to(
      format: 'json',
      controller: 'api/v1/books',
      action: 'index'
    )
  end

  it "#show" do
    expect(get: 'api/v1/books/1').to route_to(
      format: 'json',
      controller: 'api/v1/books',
      action: 'show',
      id: '1'
    )
  end
end
