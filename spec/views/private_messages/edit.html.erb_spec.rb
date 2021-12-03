require 'rails_helper'

RSpec.describe "private_messages/edit", type: :view do
  before(:each) do
    @private_message = assign(:private_message, PrivateMessage.create!())
  end

  it "renders the edit private_message form" do
    render

    assert_select "form[action=?][method=?]", private_message_path(@private_message), "post" do
    end
  end
end
