# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'harry potter', 
        author: 'j.k. rowling',
        price: 5.67,
        publishedDate: Date.parse('10-11-2022'))
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without price' do
    subject.price = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without date' do
    subject.publishedDate = nil
    expect(subject).not_to be_valid
  end

end
