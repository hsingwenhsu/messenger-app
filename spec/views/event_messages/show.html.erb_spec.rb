require 'rails_helper'

RSpec.describe "event_messages/show", type: :view do
  before(:each) do
    @event_message = assign(:event_message, EventMessage.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
