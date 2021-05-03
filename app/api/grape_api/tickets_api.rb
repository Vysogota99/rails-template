class GrapeApi
  class TicketsApi < Grape::API
    format :json

    namespace :tickets do
      
      get do
        present {}
      end

      post do
        base_prices = params[:base_prices]
        tickets = params[:tickets]

        tickets.map do |ticket| 
          ticket[:base_price] = base_prices[ticket[:category].to_s]
          ticket[:uuid] = SecureRandom.uuid.gsub("-", "").hex
        end

        pp tickets[0]
        begin
          Ticket.create(tickets)
        rescue Exception => e
          puts e.message
        end
    
      end
    end
  end
end