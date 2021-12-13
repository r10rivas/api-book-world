require "rails_helper"

RSpec.describe Api::V1::BooksController, type: :routing do
  it "#index" do
    expect(get: 'api/v1/books').to route_to(
      format: 'json',
      controller: 'api/v1/books',
      action: 'index'
    )
  end
end
