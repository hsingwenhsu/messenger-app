require 'rails_helper'

RSpec.describe "event_messages/new", type: :view do
  before(:each) do
    assign(:event_message, EventMessage.new())
  end

  it "renders new event_message form" do
    render

    assert_select "form[action=?][method=?]", event_messages_path, "post" do
    end
  end
end
