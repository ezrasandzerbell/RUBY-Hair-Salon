require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('tests home page', {:type => :feature}) do
  it('visits home page and if/else loop delivers a user entry prompt') do
    visit ('/')
    expect(page).to have_content("Create your hair salon")
  end
end
