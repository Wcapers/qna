require 'rails_helper'

  feature 'Guest can can browse the list of questions', %q{
    Guest can browse the list of questions
     to find what interests him
  } do
    given!(:questions) { create_list(:question, 5) }

    describe 'Authenticated user' do
      given(:user) { create(:user) }

      background { sign_in(user) }

      scenario 'can see questions' do
        visit questions_path
        expect(page).to have_content(I18n.t('questions.header'))
        questions.each do |question|
          expect(page).to have_content(question.title)
          expect(page).to have_content(question.body)
        end
      end
    end

    describe 'Unauthenticated user' do
      scenario 'can see questions' do
        visit questions_path
        expect(page).to have_content(I18n.t('questions.header'))
        questions.each do |question|
          expect(page).to have_content(question.title)
          expect(page).to have_content(question.body)
        end
      end
    end
  end
