require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)

  end
  
  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached succesfully' do
      expect(page.status_code).to eq(200)
    end
    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end
    it 'has a list of posts' do
      #post1 = FactoryGirl.build_stubbed(:post)   FUCK THIS SHIT!
      #post2 = FactoryGirl.build_stubbed(:second_post)      AND THIS!
      post3 = Post.create(date: Date.today, rationale: "FucktoryGirl", user_id: @user.id)
      post3 = Post.create(date: Date.yesterday, rationale: "Sucks", user_id: @user.id)
      visit posts_path
      expect(page).to have_content(/Fucktory|Sucks/)
    end
  end
  
  describe 'creation' do
    before do

      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end
    
    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some extra hours"
      click_on "Save"
      expect(page).to have_content("Some extra hours")
    end
    it 'will hava a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User_Association"
      click_on "Save" 
      expect(User.last.posts.last.rationale).to eq("User_Association")
    end
  end
  
  describe 'edit' do
    before do
      @post = Post.create(date: Date.yesterday, rationale: "Sucks", user_id: @user.id)
    end
    
    it 'can be reached by clickin edit on index page' do
      visit posts_path
      click_link("edit_#{@post.id}")
      expect(page.status_code).to eq(200)
    end
    it 'can be edited' do
      visit edit_post_path(@post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "edited content"
      click_on "Save"
      expect(page).to have_content("edited content")
    end
  end
  
end