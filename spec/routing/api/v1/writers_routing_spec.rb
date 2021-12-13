require "rails_helper"

RSpec.describe Api::V1::WritersController, type: :routing do
  it "#index" do
    expect(get: 'api/v1/writers').to route_to(
      format: 'json',
      controller: 'api/v1/writers',
      action: 'index'
    )
  end

  it "#create" do
    expect(post: 'api/v1/writers').to route_to(
      format: 'json',
      controller: 'api/v1/writers',
      action: 'create',
    )
  end

  it "#show" do
    expect(get: 'api/v1/writers/1').to route_to(
      format: 'json',
      controller: 'api/v1/writers',
      action: 'show',
      id: '1'
    )
  end

  it '#update' do
    expect(put: 'api/v1/writers/1').to route_to(
      format: 'json',
      controller: 'api/v1/writers',
      action: 'update',
      id: '1'
    )
  end
end
