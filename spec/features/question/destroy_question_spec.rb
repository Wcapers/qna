require 'rails_helper'

feature 'User can destroy question', %q{
  In order to remove question from community
  As a authenticated user
  I'd like to be able to destroy question
} do
  describe 'Authenticated user' do
    given(:user) { create(:user) }

    background { sign_in(user) }

    context 'own question' do
      given!(:question) { create(:question, user: user) }

      scenario 'successful destroy' do
        visit questions_path
        save_and_open_page
        click_on I18n.t('questions.destroy_button')

        expect(page).to have_content(I18n.t('questions.destroy.successful_destroy'))
        expect(page).to_not have_content(question.title)
      end
    end

    context "someone else's question" do
      given(:another_user) { create(:user) }
      given!(:question) { create(:question, user: another_user) }

      scenario 'failure destroy' do
        visit questions_path

        expect(page).to_not have_link(I18n.t('questions.destroy_button'))
      end
    end
  end

  describe 'Unauthenticated user' do
    given(:user) { create(:user) }
    given!(:question) { create(:question, user: user) }

    scenario 'failure destroy' do
      visit questions_path

      expect(page).to_not have_link(I18n.t('questions.destroy_button'))
    end
  end
end
