require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.create(email: "test@test.com", password: "secret", password_confirmation: "secret", first_name: "Medel", last_name: "Svensson")
    @post = Post.create(date: Date.today, rationale: "something here...", user_id: @user.id)
  end

  describe "Creation" do
    it 'can be created' do
      expect(@post).to be_valid
    end
    it 'cannot be created without a date and rationale' do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
  
  describe "Custom name method" do
    it 'has a full name with first and last name' do
      expect(@user.full_name).to eq("SVENSSON, MEDEL")
    end
    
  
  
  end
  
end
