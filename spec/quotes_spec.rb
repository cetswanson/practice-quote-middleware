require "spec_helper"

describe Quote do
  let(:quote_app){Quote.new}

  it "quote should return a string" do
    expect(quote_app.pick_random_line("rickygervais.txt")).to be_a String
  end
end