class RatesController < ApplicationController
  include HTTParty

  def index
    @fx_rates = FxRates.all_in_order
  end

  def create
    latest = FxRates.latest_date || Date.new(2014, 1, 1)
    unless latest > 2.days.ago.to_date
      get_more_data(latest)
      flash[:success] = "rates successfully updated."
    end
    redirect_to rates_url
  end

  private

  def get_more_data(latest_date)
    (latest_date..Time.now.to_date).to_a.each do |this_date|
      their_response = HTTParty.get("https://openexchangerates.org/api/historical/#{this_date.strftime('%Y-%m-%d')}.json?app_id=6334fc4be1884035840275ade9f84c9a")
      if their_response['rates']
        their_response['rates'].each do |ccy_name, the_rate|
          FxRates.create(
           value_date: this_date,
           rate:       the_rate,
           currency:   ccy_name
          )
        end
      end
    end
  end
end