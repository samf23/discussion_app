require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
    @after_bar_title = "Discussion"
    @discussion = discussions(:validDiscussion)
    @comment = comments(:validComment)
  end

  test "new action success" do
    get new_comment_path(@discussion)
    assert_response :success
    assert_select "h1", "New comment"
    assert_select 'form' do
      assert_select 'textarea'
      assert_select 'input[type=hidden]'
      assert_select 'input[type=hidden]'
      assert_select 'input[type=submit]'
    end
  end

  test "create action success" do
    post comments_path(@comment), params: { comment: { comment: 'Rails is awesome!', user_id: '1', discussion_id: '1' } }
    assert_response :redirect
  end

  test "create action failure" do
    post comments_path(@comment), params: { comment: { comment: nil, user_id: '1', discussion_id: '1' } }
    assert_response :redirect
    assert_not_empty flash[:errors]
  end

  test "the edit action success" do
    get edit_comment_path(@comment)
    assert_response :success
    assert_select "h1", "Edit comment"
    assert_select 'form' do
      assert_select 'textarea'
      assert_select 'input[type=submit]'
    end
  end

  test "the update action success" do
    patch comment_path(@comment), params: { comment: { comment: 'Rails is awesome!' } }
    assert_response :redirect
  end

  test "the update action failure" do
    patch comment_path(@comment), params: { comment: { comment: nil } }
    assert_response :redirect
    assert_not_empty flash[:errors]
  end

  test "the destroy action success" do
    delete comment_path(@comment)
    assert_response :redirect
  end

end
