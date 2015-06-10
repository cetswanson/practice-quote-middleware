require "spec_helper"

describe Quote do
  let(:quote_app){Quote.new}

  it "quote should return a string" do
    expect(quote_app.pick_random_line("rickygervais.txt")).to be_a String
  end

  it "quote should return a quote from txt file" do
    full_file = read_file("./fixtures/rickygervais.txt")
    test_quote = quote_app.pick_random_line("rickygervais.txt")
    expect((full_file).include?(test_quote)).to be true
  end

  def read_file( file_name )
    File.read( file_name )
  end
end