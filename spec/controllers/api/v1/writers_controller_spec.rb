require 'rails_helper'

RSpec.describe Api::V1::WritersController, type: :controller do
  describe '#index' do
    let(:user) { create(:user) }
    let(:token) { JsonWebToken.encode(user_id: user.id) }
    let(:headers) { { Authorization: token } }
    let(:writers) { create_list(:writer, 10) }
    let(:genres) { create_list(:genre, 10) }
    let!(:books) { create_list(:book, 10, writers: writers.sample(3), genres: genres.sample(2))}

    context 'When successful' do
      before do
        request.headers.merge!(headers)

        get(:index, format: 'json')
      end

      context 'Response status (ok)' do
        subject { response }

        it { is_expected.to have_http_status(:ok) }
      end

      context 'Data in response (writers collection)' do
        subject { response_payload }

        it { is_expected.to include(:writers) }
      end

      context 'Data in response writer (books)' do
        subject { response_payload[:writers] }

        it { is_expected.to all(include(:id, :first_name, :last_name, :date_birth, :country, :books)) }
        it { is_expected.to all( include(books: be_an(Array)) ) }
      end
    end

    context 'When it fails by token' do
      before do
        get(:index, format: 'json')
      end

      context 'Status reponse no authorize' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end

  describe '#show' do
    let(:user) { create(:user) }
    let(:token) { JsonWebToken.encode(user_id: user.id) }
    let(:headers) { { Authorization: token } }
    let(:writer) { create(:writer) }
    let(:genres) { create_list(:genre, 10) }
    let!(:books) { create_list(:book, 10, writers: [writer], genres: genres.sample(2)) }

    context 'When successful' do
      before do
        request.headers.merge! headers

        get(:show, format: 'json', params: { id: writer.id })
      end

      context 'Response status ok' do
        subject { response }

        it { is_expected.to have_http_status(:ok) }
      end

      context 'Data in response (writer)' do
        subject { response_payload }

        it { is_expected.to include(:id, :first_name, :last_name, :date_birth, :country, :books) }
      end

      context 'Data in response of book (books)' do
        subject { response_payload[:books] }

        it { is_expected.to all(include(:title, :publication_date)) }
      end
    end

    context 'When it fails by token' do
      before do
        get(:show, format: 'json', params: { id: writer.id } )
      end

      context 'Status reponse no authorize' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
