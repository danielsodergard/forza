FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Just some text"
    user
  end
  
  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Just some text from yesterday"
    user
  end
end