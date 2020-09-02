require "application_system_test_case"

class FlashcardsTest < ApplicationSystemTestCase
  setup do
    @flashcard = flashcards(:one)
  end

  test "visiting the index" do
    visit flashcards_url
    assert_selector "h1", text: "Flashcards"
  end

  test "creating a Flashcard" do
    visit flashcards_url
    click_on "New Flashcard"

    fill_in "Cardtype", with: @flashcard.cardtype
    fill_in "Data", with: @flashcard.data
    fill_in "Kunreading", with: @flashcard.kunreading
    fill_in "Meaning", with: @flashcard.meaning
    fill_in "Meaningmem", with: @flashcard.meaningmem
    fill_in "Onreading", with: @flashcard.onreading
    fill_in "Reading", with: @flashcard.reading
    fill_in "Readingmem", with: @flashcard.readingmem
    fill_in "Srslevel", with: @flashcard.srslevel
    fill_in "Syn", with: @flashcard.syn
    fill_in "Tos", with: @flashcard.tos
    fill_in "User", with: @flashcard.user_id
    click_on "Create Flashcard"

    assert_text "Flashcard was successfully created"
    click_on "Back"
  end

  test "updating a Flashcard" do
    visit flashcards_url
    click_on "Edit", match: :first

    fill_in "Cardtype", with: @flashcard.cardtype
    fill_in "Data", with: @flashcard.data
    fill_in "Kunreading", with: @flashcard.kunreading
    fill_in "Meaning", with: @flashcard.meaning
    fill_in "Meaningmem", with: @flashcard.meaningmem
    fill_in "Onreading", with: @flashcard.onreading
    fill_in "Reading", with: @flashcard.reading
    fill_in "Readingmem", with: @flashcard.readingmem
    fill_in "Srslevel", with: @flashcard.srslevel
    fill_in "Syn", with: @flashcard.syn
    fill_in "Tos", with: @flashcard.tos
    fill_in "User", with: @flashcard.user_id
    click_on "Update Flashcard"

    assert_text "Flashcard was successfully updated"
    click_on "Back"
  end

  test "destroying a Flashcard" do
    visit flashcards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Flashcard was successfully destroyed"
  end
end
