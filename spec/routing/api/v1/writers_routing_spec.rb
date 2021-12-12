require "rails_helper"

RSpec.describe Api::V1::WritersController, type: :routing do
  it "#index" do
    expect(get: 'api/v1/writers').to route_to(
      format: 'json',
      controller: 'api/v1/writers',
      action: 'index'
    )
  end
end
