require 'rails_helper'

RSpec.describe "privates/index", type: :view do
  before(:each) do
    assign(:privates, [
      Private.create!(),
      Private.create!()
    ])
  end

  it "renders a list of privates" do
    render
  end
end
