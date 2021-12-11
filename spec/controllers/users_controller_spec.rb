require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#create' do
    let(:user) { build(:user, password: '123456') }

    context 'When successful' do
      before do
        post(:create, format: 'json', params: {
          user: {
            email: user.email,
            password: '123456'
          }
        })
      end

      context 'Response status (created)' do
        subject { response }

        it { is_expected.to have_http_status(:created) }
      end

      context 'Data in response (email)' do
        subject { response_payload }

        it { is_expected.to include(:email) }
      end
    end

    let(:bad_user) { { email: 'test',password: '1234' } }

    context 'When it fails due to bad parameters' do
      before do
        post(:create, format: :json, params: { user: bad_user })
      end

      context 'Response status (bad request)' do
        subject { response }

        it { is_expected.to have_http_status(:bad_request) }
      end

      context 'Response with validation errors' do
        subject { response_payload }

        it { is_expected.to include(:errors)}
      end
    end
  end
end
