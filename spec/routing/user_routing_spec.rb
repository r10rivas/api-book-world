require "rails_helper"

RSpec.describe UsersController, type: :routing do
  it "#create" do
    expect(post: '/users').to route_to(
      format: 'json',
      controller: 'users',
      action: 'create'
    )
  end
end
