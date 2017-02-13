require 'rails_helper'

RSpec.describe "Tickets", type: :request do
  
  describe "GET /tickets" do
    it "should return a 200" do
      get tickets_path
      expect(response).to have_http_status(200)
    end
  end


  describe "POST /tickets" do
  	let(:headers) do
  	  { "CONTENT_TYPE" => "application/json" }
  	end

    it "should return a 201 if sending a valid ticket" do 
      valid_ticket = create_valid_ticket
      post "/tickets", params: valid_ticket.to_json, headers: headers
      expect(response).to have_http_status(:created)
    end

    it "should respond with a valid ticket JSON" do
      valid_ticket = create_valid_ticket
      post "/tickets", params: valid_ticket.to_json, headers: headers
     
      #Should be able to form a new ticket from the response body
      @ticket = Ticket.new.from_json response.body
      expect(@ticket).to be_valid
    end

    it "should return a 422 if sending an invalid ticket" do
      invalid_ticket = create_invalid_ticket
      post "/tickets", params: invalid_ticket.to_json, headers: headers
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

end
