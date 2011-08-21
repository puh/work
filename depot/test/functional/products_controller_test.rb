require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @update = {
        :title => 'Lorem Ipsum',
        :description => 'Wibbles are fun!',
        :image_url => 'lorem.jpg',
        :price => 19.95
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
    assert_select "#columns #side a", :minimum => 4
    assert_select 'h1', 'Listing products'
    assert_select "#product_list .list_line_odd", :minimum => 1
    assert_select "#product_list .list_line_even", :minimum => 1
    assert_select "#main a", 'New Product'
    assert_select ".list_actions" do |actions|
      actions.each do |action|
        assert_select action, "a", 3
      end
    end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: @update
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product.to_param
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product.to_param, product: @update
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product.to_param
    end

    assert_redirected_to products_path
  end
end
