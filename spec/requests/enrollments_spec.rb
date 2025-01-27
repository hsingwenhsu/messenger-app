 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/enrollments", type: :request do
  
  # Enrollment. As you add validations to Enrollment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {:admin_id => 1, :room_id => 1}
  }

  let(:invalid_attributes) {
    {:admin_id => 1000, :room_id => 1}
  }

  before(:all) do
    room = Room.create!
    Capybara.default_host = 'localhost:3000'
    default_url_options[:host] = 'localhost:3000'
    email_length = rand(20...50)
    email = (0...email_length).map { ('a'..'z').to_a[rand(26)] }.join+'@columbia.edu'
    admin = Admin.create!(:uid => "111101028321895", :email => email, :full_name => 'Test')
    login_as(admin, :scope => :admin)
    current_admin = admin
  end

  describe "GET /index" do
    it "renders a successful response" do
      Enrollment.create! valid_attributes
      get enrollments_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      enrollment = Enrollment.create! valid_attributes
      get enrollment_url(enrollment)
      expect(response).to be_successful
    end
  end

  # describe "GET /new" do
  #   it "renders a successful response" do
  #     get new_enrollment_url
  #     expect(response).to be_successful
  #   end
  # end

  describe "GET /edit" do
    it "render a successful response" do
      enrollment = Enrollment.create! valid_attributes
      get edit_enrollment_url(enrollment)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Enrollment" do
        expect {
          post enrollments_url, params: { enrollment: valid_attributes }
        }.to change(Enrollment, :count).by(1)
      end

      # it "redirects to the created enrollment" do
      #   puts enrollments_url
      #   post enrollments_url, params: { enrollment: valid_attributes }
      #   expect(response).to redirect_to(enrollment_url(Enrollment.last))
      # end
    end

    # context "with invalid parameters" do
    #   it "does not create a new Enrollment" do
    #     expect {
    #       post enrollments_url, params: { enrollment: invalid_attributes }
    #     }.to change(Enrollment, :count).by(0)
    #   end

    #   it "renders a successful response (i.e. to display the 'new' template)" do
    #     post enrollments_url, params: { enrollment: invalid_attributes }
    #     expect(response).to be_successful
    #   end
    # end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {:admin_id => 1000, :room_id => 1}
      }

      it "updates the requested enrollment" do
        enrollment = Enrollment.create! valid_attributes
        patch enrollment_url(enrollment), params: { enrollment: new_attributes }
        enrollment.reload
        # expect(response).to redirect_to(enrollment_url(enrollment))
      end

      # it "redirects to the enrollment" do
      #   enrollment = Enrollment.create! valid_attributes
      #   patch enrollment_url(enrollment), params: { enrollment: new_attributes }
      #   enrollment.reload
      #   expect(response).to redirect_to(enrollment_url(enrollment))
      # end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        enrollment = Enrollment.create! valid_attributes
        patch enrollment_url(enrollment), params: { enrollment: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested enrollment" do
      enrollment = Enrollment.create! valid_attributes
      expect {
        delete enrollment_url(enrollment)
      }.to change(Enrollment, :count).by(-1)
    end

    # it "redirects to the enrollments list" do
    #   enrollment = Enrollment.create! valid_attributes
    #   delete enrollment_url(enrollment)
    #   expect(response).to redirect_to(enrollments_url)
    # end
  end
end
