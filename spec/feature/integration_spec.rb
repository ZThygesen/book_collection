# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'j.k. rowling'
    fill_in "book[price]", with: 5.67
    fill_in "book[publishedDate]", with: Date.parse('10-11-2022')
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('j.k. rowling')
    expect(page).to have_content('5.67')
    expect(page).to have_content('2022-11-10')
  end

  scenario 'invalid title' do
    visit new_book_path
    fill_in "book[title]", with: nil
    fill_in "book[author]", with: 'j.k. rowling'
    fill_in "book[price]", with: 5.67
    fill_in "book[publishedDate]", with: Date.parse('10-11-2022')
    click_on 'Create Book'
    visit books_path
    expect(page).to_not have_content('harry potter')
  end 

  scenario 'invalid author' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: nil
    fill_in "book[price]", with: 5.67
    fill_in "book[publishedDate]", with: Date.parse('10-11-2022')
    click_on 'Create Book'
    visit books_path
    expect(page).to_not have_content('j.k. rowling')
  end 

  scenario 'invalid price' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'j.k. rowling'
    fill_in "book[price]", with: nil
    fill_in "book[publishedDate]", with: Date.parse('10-11-2022')
    click_on 'Create Book'
    visit books_path
    expect(page).to_not have_content('5.67')
  end 

  scenario 'invalid date' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'j.k. rowling'
    fill_in "book[price]", with: 5.67
    fill_in "book[publishedDate]", with: nil
    click_on 'Create Book'
    visit books_path
    expect(page).to_not have_content('2022-11-10')
  end 
end
