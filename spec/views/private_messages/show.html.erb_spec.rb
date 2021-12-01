require 'rails_helper'

RSpec.describe "private_messages/show", type: :view do
  before(:each) do
    @private_message = assign(:private_message, PrivateMessage.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
