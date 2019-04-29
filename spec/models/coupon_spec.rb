require 'rails_helper'

describe Cupon do
  before(:each) do
    @cupon = Cupon.create!(cupon_code: "FREESTUFF", store: "Chipotle")
  end

  it 'can be created' do
    expect(@cupon).to be_valid
  end
end
