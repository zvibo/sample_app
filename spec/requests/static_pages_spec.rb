require 'spec_helper'

describe "Static pages" do
  
  subject { page }
  # expect(page).to ==> should
  # expect(page).not_to ==> should_not
  
  shared_examples_for "all static pages" do
    it { should have_selector('h1',text: heading) }    
    it { should have_title(full_title(page_title)) }
  end
  
  
  
  describe "Home page" do
    before { visit root_path }
    let(:heading) {'Sample App'}
    let(:page_title) {''}
    
    it_should_behave_like "all static pages"
    it { should_not have_title("| Home") }
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading) {'Help'}
    let(:page_title) {'Help'}
    
    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    
    it { should have_content('About Us') }
    it { should have_title("About Us") }
  end

  # old-skool style rspec for giggles
  describe "Contact page" do
    
    let(:base_title) { "Ruby on Rails Tutorial Sample App" }
    
    it "should have the content 'Contact Us'" do
      visit contact_path
      expect(page).to have_content('Contact Us')
    end

    it "should have the title 'Contact Us'" do
      visit contact_path
      expect(page).to have_title("#{base_title} | Contact Us")
    end
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    should have_title(full_title('About Us'))

    click_link "Help"
    should have_title(full_title('Help'))

    click_link "Contact"
    should have_title(full_title('Contact Us'))
    
    click_link "Home"
    click_link "Sign up now!"
    should have_title(full_title('Sign up'))

    click_link "sample app"
    should have_title(full_title(''))
  end
  

end
