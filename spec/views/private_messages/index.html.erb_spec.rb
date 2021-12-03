require 'rails_helper'

RSpec.describe "private_messages/index", type: :view do
  before(:each) do
    assign(:private_messages, [
      PrivateMessage.create!(),
      PrivateMessage.create!()
    ])
  end

  it "renders a list of private_messages" do
    render
  end
end
