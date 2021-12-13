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

  describe '#create' do
    let(:user) { create(:user) }
    let(:country) { create(:country) }
    let(:writer) { build(:writer, country_id: country.id) }
    let(:token) { JsonWebToken.encode(user_id: user.id) }
    let(:headers) { { Authorization: token } }

    context 'When successful' do
      before do
        request.headers.merge!(headers)

        post(:create, format: 'json', params: {
          writer: writer.as_json(except: %i[id created_at updated_at])
        })
      end

      context 'Response status created' do
        subject { response }

        it { is_expected.to have_http_status(:created) }
      end

      context 'Data in response (writer)' do
        subject { response_payload }

        it { is_expected.to include(:id, :first_name, :last_name, :date_birth, :country) }
      end
    end

    context 'When it fails by token' do
      before do
        post(:create, format: 'json', params: { writer: writer })
      end

      context 'Status reponse no authorize' do
        subject { response }

        it { is_expected.to have_http_status(:unauthorized) }
      end
    end

    let(:bad_writer) { { first_name: '',
                        last_name: '',
                        date_birth: '',
                        country_id: nil  } }

    context 'When it fails due to bad parameters' do
      before do
        request.headers.merge!(headers)

        post(:create, format: 'json', params: { writer: bad_writer })
      end

      context 'Response with status bad request' do
        subject { response }
        it { is_expected.to have_http_status(:bad_request) }
      end

      context 'Response with key errors' do
        subject { response_payload }
        it { is_expected.to include(:errors) }
      end

      context 'Response with all errors occurred' do
        subject { response_payload[:errors] }

        it { is_expected.to have_attributes(size: 4) }
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

  describe '#update' do
    let(:user) { create(:user) }
    let(:token) { JsonWebToken.encode(user_id: user.id) }
    let(:headers) { { Authorization: token } }
    let(:writer) { create(:writer) }
    let(:genres) { create_list(:genre, 10) }
    let!(:books) { create_list(:book, 10, writers: [writer], genres: genres.sample(2)) }

    context 'When successful' do
      before do
        request.headers.merge!(headers)

        put(:update, format: 'json', params: { id: writer.id, writer: { first_name: 'José' } })
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
        post(:create, format: 'json', params: { writer: writer })
      end

      context 'Status reponse no authorize' do
        subject { response }

        it { is_expected.to have_http_status(:unauthorized) }
      end
    end

    let(:bad_writer) { { first_name: '',
                        last_name: '',
                        date_birth: '',
                        country_id: nil  } }

    context 'When it fails due to bad parameters' do
      before do
        request.headers.merge!(headers)

        post(:create, format: 'json', params: { writer: bad_writer })
      end

      context 'Response with status bad request' do
        subject { response }

        it { is_expected.to have_http_status(:bad_request) }
      end

      context 'Response with key errors' do
        subject { response_payload }

        it { is_expected.to include(:errors) }
      end

      context 'Response with all errors occurred' do
        subject { response_payload[:errors] }

        it { is_expected.to have_attributes(size: 4) }
      end
    end
  end
end
