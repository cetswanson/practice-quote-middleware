require "spec_helper"

describe Quote do
  let(:quote_app){Quote.new}

  it "quote should return a string" do
    expect(quote_app.pick_random_line("rickygervais.txt")).to be_a String
  end

  def read_file( file_name )
    File.read( file_name )
  end
end