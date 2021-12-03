require 'rails_helper'

RSpec.describe "event_messages/index", type: :view do
  before(:each) do
    assign(:event_messages, [
      EventMessage.create!(),
      EventMessage.create!()
    ])
  end

  it "renders a list of event_messages" do
    render
  end
end
