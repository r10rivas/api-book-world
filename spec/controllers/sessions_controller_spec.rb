require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#create' do
    let(:user) { create(:user, password: '123456')}

    context 'When successful' do
      before do
        post(:create, format: 'json', params: {
          user: {
            email: user.email,
            password: '123456'
          }
        })
      end

      context 'Response status (ok)' do
        subject { response }

        it { is_expected.to have_http_status(:ok) }
      end

      context 'Data in response (email, token, expiration)' do
        subject { response_payload }

        it { is_expected.to include(:email, :token, :expiration) }
      end
    end

    context 'When it fails due to bad parameters' do
      before do
        post(:create, format: 'json', params: {
          user: {
            email: user.email,
            password: ''
          }
        })
      end

      context 'Response status (bad request)' do
        subject { response }
        it { is_expected.to have_http_status(:bad_request)}
      end

      context 'Response with validation errors' do
        subject { response_payload }
        it { is_expected.to include(:errors) }
      end
    end
  end
end
