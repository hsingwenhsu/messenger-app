require 'rails_helper'

RSpec.describe "private_messages/new", type: :view do
  before(:each) do
    assign(:private_message, PrivateMessage.new())
  end

  it "renders new private_message form" do
    render

    assert_select "form[action=?][method=?]", private_messages_path, "post" do
    end
  end
end
