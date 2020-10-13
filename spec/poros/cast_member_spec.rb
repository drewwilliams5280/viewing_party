require 'rails_helper'
RSpec.describe CastMember do
  it 'exists' do
    attrs =  {
    "character": "Andy Dufresne",
    "name": "Tim Robbins"
    }
    cast_member = CastMember.new(attrs)
    expect(cast_member.character).to eq("Andy Dufresne")
    expect(cast_member.name).to eq("Tim Robbins")
  end
end
