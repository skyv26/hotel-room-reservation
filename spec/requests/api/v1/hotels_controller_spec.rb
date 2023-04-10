require 'rails_helper'

RSpec.describe 'Api::V1::HotelsControllers', type: :request do
  describe 'GET /index' do
    before do
      Hotel.create(name: 'Grand Hotel', address: '123 Main St, Anytown USA')
      Hotel.create(name: 'Plaza Hotel', address: '456 Central Ave, Anytown USA')
    end

    it 'returns a list of hotels' do
      get api_v1_hotels_path
      expect(response).to have_http_status(200)
      expect(response.content_type).to include('application/json')
      expect(response.body).to include('Grand Hotel', 'Plaza Hotel')
    end
  end

  describe 'GET /hotels/:id' do
    let(:hotel) { Hotel.create(name: 'Grand Hotel', address: '123 Main St, Anytown USA') }

    it 'returns a hotel' do
      get api_v1_hotel_path(hotel.id)
      expect(response).to have_http_status(200)
      expect(response.content_type).to include('application/json')
      expect(response.body).to include('Grand Hotel', '123 Main St, Anytown USA')
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:hotel_params) { { name: 'Test Hotel', address: '123 Test St, Testtown USA' } }
      it 'creates a new hotel' do
        expect do
          post api_v1_hotels_path, params: { hotel: hotel_params }
        end.to change { Hotel.count }.from(0).to(1)
        expect(response).to have_http_status(200)
        expect(response.content_type).to include('application/json')
        expect(response.body).to include('Successfully added the Hotel')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_hotel_params) { { name: '', address: '' } }

      it 'does not create a new hotel' do
        expect do
          post api_v1_hotels_path, params: { hotel: invalid_hotel_params }
        end.not_to(change { Hotel.count })
        expect(response).to have_http_status(406)
        expect(response.content_type).to include('application/json')
        expect(response.body).to include("'name' or 'address' field is required !")
      end
    end
  end

  # describe "PATCH /update/:id" do
  #   let!(:hotel) { Hotel.create(name: "Grand Hotel", address: "123 Main St, Anytown USA") }

  #   it "updates an existing hotel with valid parameters" do
  #     patch api_v1_hotel_path(hotel.id), params: { name: "Updated Hotel Name" }
  #     expect(response).to have_http_status(200)
  #     expect(response.content_type).to include("application/json")
  #     expect(hotel.reload.name).to eq("Updated Hotel Name")
  #   end

  #   # it "does not update an existing hotel with invalid parameters" do
  #   #   patch api_v1_hotel_path(hotel.id), params: { name: "" }
  #   #   expect(response).to have_http_status(422)
  #   #   expect(response.content_type).to include("application/json")
  #   #   expect(hotel.reload.name).not_to eq("")
  #   # end

  #   # it "returns a 404 error when trying to update a non-existent hotel" do
  #   #   patch api_v1_hotel_path(123), params: { name: "Updated Hotel Name" }
  #   #   expect(response).to have_http_status(404)
  #   # end
  # end
end
