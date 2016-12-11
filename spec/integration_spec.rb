require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('tests home page', {:type => :feature}) do
  it('visits home page and if-else loop delivers a user entry prompt') do
    visit ('/')
    expect(page).to have_content("You have not entered a stylist yet. Please do so in the form below")
  end
end

describe('tests stylist form input and successful implementation of if/then statements', {:type => :feature}) do
  it('visits home page, fills out form, and tests for stylist name appended') do
    visit ('/')
    fill_in("stylist_name", :with => "Edward Scissorhands")
    click_button("Register new stylist")
    expect(page).to have_content("Edward Scissorhands")
  end

  it('tests for presence of client stylist name appended') do
    visit ('/')
    fill_in("stylist_name", :with => "Edward Scissorhands")
    click_button("Register new stylist")
    click_link("Edward Scissorhands")
    expect(page).to have_content("You have not entered a client yet.")
  end

  it('tests for successfully appending client name') do
    visit ('/')
    fill_in("stylist_name", :with => "Edward Scissorhands")
    click_button("Register new stylist")
    click_link("Edward Scissorhands")
    fill_in("client_name", :with => "Abigail")
    click_button("Register new client")
    expect(page).to have_content("Abigail")
  end

  describe('deletes target stylist from index list', {:type => :feature}) do
    it('visits home page, fills out form, and tests for stylist name appended') do
      visit ('/')
      fill_in("stylist_name", :with => "Edward Scissorhands")
      click_button("Register new stylist")
      expect(page).to have_content("Edward Scissorhands")
      click_button("delete stylist")
      expect(page).to have_content("Register new stylist")
    end
  end

  describe('updates target stylist from index list', {:type => :feature}) do
    it('visits home page, fills out form, and tests for stylist name appended') do
      visit ('/')
      fill_in("stylist_name", :with => "Edward Scissorhands")
      click_button("Register new stylist")
      expect(page).to have_content("Edward Scissorhands")
      click_link("update stylist")
      expect(page).to have_content("Enter a new name")
    end
  end
end
