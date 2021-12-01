require 'rails_helper'

RSpec.describe "privates/show", type: :view do
  before(:each) do
    @private = assign(:private, Private.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
