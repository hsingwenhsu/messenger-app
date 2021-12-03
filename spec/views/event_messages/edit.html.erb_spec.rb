require 'rails_helper'

RSpec.describe "event_messages/edit", type: :view do
  before(:each) do
    @event_message = assign(:event_message, EventMessage.create!())
  end

  it "renders the edit event_message form" do
    render

    assert_select "form[action=?][method=?]", event_message_path(@event_message), "post" do
    end
  end
end
