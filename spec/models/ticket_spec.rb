require 'rails_helper'

RSpec.describe Ticket, type: :model do
  
	before(:each) do
	end	

  it "should be valid with title, category and description" do
    ticket = build(:ticket)
    expect(ticket).to be_valid
  end

  it "should be invalid without title" do
    ticket = build(:ticket, :title => "")
    expect(ticket).not_to be_valid
  end

  it "should be invalid without category" do
    ticket = build(:ticket, :category => "")
    expect(ticket).not_to be_valid
  end

  it "should be invalid without description" do
    ticket = build(:ticket, :description => "")
    expect(ticket).not_to be_valid
  end

end
