require 'rails_helper'

RSpec.describe Ticket, type: :model do
  
	before(:each) do
	end	

  it "should be valid with title, category and description" do
    ticket = build(:ticket)
    expect(ticket).to be_valid
  end
end
