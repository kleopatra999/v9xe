require 'spec_helper'

describe "things/show" do
  before(:each) do
    @thing = assign(:thing, stub_model(Thing))
  end

  it "renders attributes in <p>" do
    render
  end
end
