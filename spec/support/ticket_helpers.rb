module TicketHelpers
  def create_valid_ticket
    # Using a valid ticket as base
		valid_ticket = build(:ticket)

		ticket                        = Hash.new
		ticket[:ticket]               = Hash.new
		ticket[:ticket][:title]       = valid_ticket.title
		ticket[:ticket][:category]    = valid_ticket.category
		ticket[:ticket][:description] = valid_ticket.description
		ticket
  end

  def create_invalid_ticket
    # Using an invalid ticket as base
		invalid_ticket = build(:ticket, :title => "")

		ticket                        = Hash.new
		ticket[:ticket]               = Hash.new
		ticket[:ticket][:title]       = invalid_ticket.title
		ticket[:ticket][:category]    = invalid_ticket.category
		ticket[:ticket][:description] = invalid_ticket.description
		ticket
  end
end