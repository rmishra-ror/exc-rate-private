require 'rails_helper'

RSpec.describe CurrencyExchangeRate, type: :model do
  it { should validate_presence_of(:base_currency) }
  it { should validate_presence_of(:target_currency) }
  it { should validate_presence_of(:rate) }
  it { should validate_presence_of(:date) }

  it 'exists_for_date? should return true if specified date record is exists' do
    FactoryBot.create(:currency_exchange_rate, date: '2010-01-01'.to_date)
    expect(CurrencyExchangeRate.exists_for_date?('2010-01-01'.to_date)).to be_truthy
  end

  it 'exists_for_date? should return false if specified date record is not exists' do
    expect(CurrencyExchangeRate.exists_for_date?('1900-01-01'.to_date)).to be_falsey
  end
end