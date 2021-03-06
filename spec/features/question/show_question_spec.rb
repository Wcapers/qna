require 'rails_helper'

feature 'User can browse question', %q{
  Guest can browse the question
   to find what interests him
} do
  given!(:question) { create(:question) }

  describe 'Authenticated user' do
    given(:user) { create(:user) }

    background { sign_in(user) }

    scenario 'can see question' do
      visit question_path(question)

      expect(page).to have_content(question.title)
      expect(page).to have_content(question.body)
    end
  end

  describe 'Unauthenticated user' do
    scenario 'can see question' do
      visit question_path(question)

      expect(page).to have_content(question.title)
      expect(page).to have_content(question.body)
    end
  end
end
