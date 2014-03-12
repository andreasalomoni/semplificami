require 'test_helper'

class OutboxesControllerTest < ActionController::TestCase
  setup do
    @outbox = outboxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outboxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outbox" do
    assert_difference('Outbox.count') do
      post :create, outbox: { allegato: @outbox.allegato, data_invio: @outbox.data_invio, data_stato: @outbox.data_stato, destinatario: @outbox.destinatario, messaggio: @outbox.messaggio, oggetto: @outbox.oggetto, risposta: @outbox.risposta, stato: @outbox.stato }
    end

    assert_redirected_to outbox_path(assigns(:outbox))
  end

  test "should show outbox" do
    get :show, id: @outbox
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outbox
    assert_response :success
  end

  test "should update outbox" do
    patch :update, id: @outbox, outbox: { allegato: @outbox.allegato, data_invio: @outbox.data_invio, data_stato: @outbox.data_stato, destinatario: @outbox.destinatario, messaggio: @outbox.messaggio, oggetto: @outbox.oggetto, risposta: @outbox.risposta, stato: @outbox.stato }
    assert_redirected_to outbox_path(assigns(:outbox))
  end

  test "should destroy outbox" do
    assert_difference('Outbox.count', -1) do
      delete :destroy, id: @outbox
    end

    assert_redirected_to outboxes_path
  end
end
