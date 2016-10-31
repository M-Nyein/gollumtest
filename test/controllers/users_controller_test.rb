require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "should get show" do
    # get users_show_url
    # assert_response :success
    before(:each) do
      @user = FactoryGirl.create :user
      get :show, id: @user.id
    end

    it "returns the information about a reporter on a hash" do
      user_response = json_response[:user]
      expect(user_response[:email]).to eql @user.email
    end

    it { should respond_with 200 }
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

end
