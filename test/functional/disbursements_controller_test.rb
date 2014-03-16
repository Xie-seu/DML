require 'test_helper'

class DisbursementsControllerTest < ActionController::TestCase
  setup do
    @disbursement = disbursements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disbursements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disbursement" do
    assert_difference('Disbursement.count') do
      post :create, disbursement: { currentPayment: @disbursement.currentPayment, disbursementInt: @disbursement.disbursementInt, disbursementRate: @disbursement.disbursementRate, flowType: @disbursement.flowType, grossPayAmount: @disbursement.grossPayAmount, nominalPayment: @disbursement.nominalPayment, paymentDate: @disbursement.paymentDate, postingControl: @disbursement.postingControl, repaymentType: @disbursement.repaymentType, text: @disbursement.text }
    end

    assert_redirected_to disbursement_path(assigns(:disbursement))
  end

  test "should show disbursement" do
    get :show, id: @disbursement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disbursement
    assert_response :success
  end

  test "should update disbursement" do
    put :update, id: @disbursement, disbursement: { currentPayment: @disbursement.currentPayment, disbursementInt: @disbursement.disbursementInt, disbursementRate: @disbursement.disbursementRate, flowType: @disbursement.flowType, grossPayAmount: @disbursement.grossPayAmount, nominalPayment: @disbursement.nominalPayment, paymentDate: @disbursement.paymentDate, postingControl: @disbursement.postingControl, repaymentType: @disbursement.repaymentType, text: @disbursement.text }
    assert_redirected_to disbursement_path(assigns(:disbursement))
  end

  test "should destroy disbursement" do
    assert_difference('Disbursement.count', -1) do
      delete :destroy, id: @disbursement
    end

    assert_redirected_to disbursements_path
  end
end
