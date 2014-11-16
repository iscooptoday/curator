require 'test_helper'

class LinkAttachmentsControllerTest < ActionController::TestCase
  setup do
    @link_attachment = link_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:link_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create link_attachment" do
    assert_difference('LinkAttachment.count') do
      post :create, link_attachment: { avatar: @link_attachment.avatar, link_id: @link_attachment.link_id }
    end

    assert_redirected_to link_attachment_path(assigns(:link_attachment))
  end

  test "should show link_attachment" do
    get :show, id: @link_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @link_attachment
    assert_response :success
  end

  test "should update link_attachment" do
    patch :update, id: @link_attachment, link_attachment: { avatar: @link_attachment.avatar, link_id: @link_attachment.link_id }
    assert_redirected_to link_attachment_path(assigns(:link_attachment))
  end

  test "should destroy link_attachment" do
    assert_difference('LinkAttachment.count', -1) do
      delete :destroy, id: @link_attachment
    end

    assert_redirected_to link_attachments_path
  end
end
