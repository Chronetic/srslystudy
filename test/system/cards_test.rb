require "application_system_test_case"

class CardsTest < ApplicationSystemTestCase
  setup do
    @card = cards(:one)
  end

  test "visiting the index" do
    visit cards_url
    assert_selector "h1", text: "Cards"
  end

  test "creating a Card" do
    visit cards_url
    click_on "New Card"

    fill_in "Answer", with: @card.answer
    fill_in "Cardtype", with: @card.cardtype
    fill_in "Data", with: @card.data
    fill_in "Deck", with: @card.deck_id
    fill_in "Kunreading", with: @card.kunreading
    fill_in "Meaning", with: @card.meaning
    fill_in "Meaningmem", with: @card.meaningmem
    fill_in "Onreading", with: @card.onreading
    fill_in "Reading", with: @card.reading
    fill_in "Readingmem", with: @card.readingmem
    fill_in "Srslevel", with: @card.srslevel
    fill_in "Syn", with: @card.syn
    fill_in "Tos", with: @card.tos
    click_on "Create Card"

    assert_text "Card was successfully created"
    click_on "Back"
  end

  test "updating a Card" do
    visit cards_url
    click_on "Edit", match: :first

    fill_in "Answer", with: @card.answer
    fill_in "Cardtype", with: @card.cardtype
    fill_in "Data", with: @card.data
    fill_in "Deck", with: @card.deck_id
    fill_in "Kunreading", with: @card.kunreading
    fill_in "Meaning", with: @card.meaning
    fill_in "Meaningmem", with: @card.meaningmem
    fill_in "Onreading", with: @card.onreading
    fill_in "Reading", with: @card.reading
    fill_in "Readingmem", with: @card.readingmem
    fill_in "Srslevel", with: @card.srslevel
    fill_in "Syn", with: @card.syn
    fill_in "Tos", with: @card.tos
    click_on "Update Card"

    assert_text "Card was successfully updated"
    click_on "Back"
  end

  test "destroying a Card" do
    visit cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Card was successfully destroyed"
  end
end
