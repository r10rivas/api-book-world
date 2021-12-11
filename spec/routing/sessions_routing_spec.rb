require "rails_helper"

RSpec.describe SessionsController, type: :routing do
  it "#create" do
    expect(post: '/sessions').to route_to(
      format: 'json',
      controller: 'sessions',
      action: 'create'
    )
  end
end
