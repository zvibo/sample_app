require 'spec_helper'

describe "Static pages" do
  
  subject { page }
  # expect(page).to ==> should
  # expect(page).not_to ==> should_not
  
  describe "Home page" do
    before { visit root_path }
    
    it { should have_content('Sample App') }    
    it { should have_title(full_title('')) }
    it { should_not have_title("| Home") }
  end

  describe "Help page" do
    before { visit help_path }
    
    it { should have_content('Help') }    
    it { should have_title(full_title('Help')) }
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

end
