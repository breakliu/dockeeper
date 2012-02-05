require 'test_helper'

class SchoolYearsControllerTest < ActionController::TestCase
  setup do
    @school_year = school_years(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_years)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_year" do
    assert_difference('SchoolYear.count') do
      post :create, school_year: @school_year.attributes
    end

    assert_redirected_to school_year_path(assigns(:school_year))
  end

  test "should show school_year" do
    get :show, id: @school_year
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school_year
    assert_response :success
  end

  test "should update school_year" do
    put :update, id: @school_year, school_year: @school_year.attributes
    assert_redirected_to school_year_path(assigns(:school_year))
  end

  test "should destroy school_year" do
    assert_difference('SchoolYear.count', -1) do
      delete :destroy, id: @school_year
    end

    assert_redirected_to school_years_path
  end
end
