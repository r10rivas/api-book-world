require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do
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

      context 'Data in response (books collection)' do
        subject { response_payload }

        it { is_expected.to include(:books) }
      end

      context 'Data in response book (writers)' do
        subject { response_payload[:books] }

        it { is_expected.to all(include(:id, :title, :publication_date, :editorial, :genres, :writers)) }
        it { is_expected.to all( include(writers: be_an(Array)) ) }
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
    let(:writers) { create_list(:writer, 10) }
    let(:genres) { create_list(:genre, 10) }
    let(:book) { create(:book, writers: writers.sample(3), genres: genres.sample(2)) }

    context 'When successful' do
      before do
        request.headers.merge!(headers)

        get(:show, format: 'json', params: { id: book.id })
      end

      context 'Response status ok' do
        subject { response }

        it { is_expected.to have_http_status(:ok) }
      end

      context 'Data in response (book)' do
        subject { response_payload }

        it { is_expected.to include(:id, :title, :publication_date, :editorial, :writers) }
      end

      context 'Data in response of book (books)' do
        subject { response_payload[:writers] }

        it { is_expected.to all(include(:full_name, :country)) }
      end
    end

    context 'When it fails by token' do
      before do
        get(:show, format: 'json', params: { id: book.id } )
      end

      context 'Status reponse no authorize' do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
