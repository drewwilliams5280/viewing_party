require 'rails_helper'
RSpec.describe Review do
  it 'exists' do
    attrs = {
    "author": "elshaarawy",
    "content": "very good movie 9.5/10 محمد الشعراوى"
    }
    review = Review.new(attrs)
    expect(review.author).to eq("elshaarawy")
    expect(review.content).to eq("very good movie 9.5/10 محمد الشعراوى")
  end
end
