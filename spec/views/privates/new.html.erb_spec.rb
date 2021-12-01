require 'rails_helper'

RSpec.describe "privates/new", type: :view do
  before(:each) do
    assign(:private, Private.new())
  end

  it "renders new private form" do
    render

    assert_select "form[action=?][method=?]", privates_path, "post" do
    end
  end
end
