require 'rails_helper'

RSpec.describe "privates/edit", type: :view do
  before(:each) do
    @private = assign(:private, Private.create!())
  end

  it "renders the edit private form" do
    render

    assert_select "form[action=?][method=?]", private_path(@private), "post" do
    end
  end
end
