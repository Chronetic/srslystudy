require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
  end

  test "should get index" do
    get cards_url
    assert_response :success
  end

  test "should get new" do
    get new_card_url
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post cards_url, params: { card: { answer: @card.answer, cardtype: @card.cardtype, data: @card.data, deck_id: @card.deck_id, kunreading: @card.kunreading, meaning: @card.meaning, meaningmem: @card.meaningmem, onreading: @card.onreading, reading: @card.reading, readingmem: @card.readingmem, srslevel: @card.srslevel, syn: @card.syn, tos: @card.tos } }
    end

    assert_redirected_to card_url(Card.last)
  end

  test "should show card" do
    get card_url(@card)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_url(@card)
    assert_response :success
  end

  test "should update card" do
    patch card_url(@card), params: { card: { answer: @card.answer, cardtype: @card.cardtype, data: @card.data, deck_id: @card.deck_id, kunreading: @card.kunreading, meaning: @card.meaning, meaningmem: @card.meaningmem, onreading: @card.onreading, reading: @card.reading, readingmem: @card.readingmem, srslevel: @card.srslevel, syn: @card.syn, tos: @card.tos } }
    assert_redirected_to card_url(@card)
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete card_url(@card)
    end

    assert_redirected_to cards_url
  end
end
