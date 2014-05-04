class FxRates < ActiveRecord::Base
  attr_accessible :currency, :rate, :value_date

  #validations
  validates :value_date, presence: true
  validates :currency, presence: true, uniqueness: {scope: :value_date}
  validates :rate, presence: true, numericality: true

  #callbacks


  #scopes
  scope :all_in_order, -> { order('value_date DESC, currency ASC')}
  scope :for_ccy, lambda{ |ccy| where(currency: ccy)}
  scope :since, lambda {|a_date| where('value_date >= ?', a_date)}

  #class methods
  def self.latest_date
    FxRates.order(value_date: :desc).first.try(:value_date) || Date.new(2014, 1, 1)
  end

  def self.list_of_currencies
    FxRates.all.map(&:currency).uniq.sort
  end

end
