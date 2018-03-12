require 'test_helper'

class SClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @s_class = s_classes(:one)
  end

  test "should get index" do
    get s_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_s_class_url
    assert_response :success
  end

  test "should create s_class" do
    assert_difference('SClass.count') do
      post s_classes_url, params: { s_class: { class_name: @s_class.class_name, grade_id: @s_class.grade_id, teacher_id: @s_class.teacher_id, year: @s_class.year } }
    end

    assert_redirected_to s_class_url(SClass.last)
  end

  test "should show s_class" do
    get s_class_url(@s_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_s_class_url(@s_class)
    assert_response :success
  end

  test "should update s_class" do
    patch s_class_url(@s_class), params: { s_class: { class_name: @s_class.class_name, grade_id: @s_class.grade_id, teacher_id: @s_class.teacher_id, year: @s_class.year } }
    assert_redirected_to s_class_url(@s_class)
  end

  test "should destroy s_class" do
    assert_difference('SClass.count', -1) do
      delete s_class_url(@s_class)
    end

    assert_redirected_to s_classes_url
  end
end
