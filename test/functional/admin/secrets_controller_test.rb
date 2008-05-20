require 'test_helper'

class Admin::SecretsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_secrets)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_secret
    assert_difference('Admin::Secret.count') do
      post :create, :secret => { }
    end

    assert_redirected_to secret_path(assigns(:secret))
  end

  def test_should_show_secret
    get :show, :id => admin_secrets(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => admin_secrets(:one).id
    assert_response :success
  end

  def test_should_update_secret
    put :update, :id => admin_secrets(:one).id, :secret => { }
    assert_redirected_to secret_path(assigns(:secret))
  end

  def test_should_destroy_secret
    assert_difference('Admin::Secret.count', -1) do
      delete :destroy, :id => admin_secrets(:one).id
    end

    assert_redirected_to admin_secrets_path
  end
end
