require 'spec_helper'
require 'prof_pic'

describe ProfPic do

  describe '::fb' do

    it 'generates a fb url with default settings' do
      expect(described_class.fb('123')).to eq('https://graph.facebook.com/123/picture?type=square')
    end

    it 'takes width' do
      expect(described_class.fb('123', width: 100)).to eq(
        'https://graph.facebook.com/123/picture?type=square&width=100')
    end
    it 'takes height' do
      expect(described_class.fb('123', height: 211)).to eq(
        'https://graph.facebook.com/123/picture?type=square&height=211')
    end

    it 'takes type' do
      expect(described_class.fb('1234', type: 'large')).to eq(
        "https://graph.facebook.com/1234/picture?type=large")
    end

    it 'takes https' do
      expect(described_class.fb('765', https: false)).to eq(
        'http://graph.facebook.com/765/picture?type=square')
    end
    
  end

  describe '::gravatar' do
    let(:email) { " MyEmailAddress@example.com " }
    let(:hash) { '0bc83cb571cd1c50ba6f3e8a78ef1346' }

    it 'generates a gravatar image url with default settings' do
      expect(described_class.gravatar(email)).to eq(
        "https://secure.gravatar.com/avatar/#{hash}?")
    end

    it 'takes a size' do
      expect(described_class.gravatar(email, size: 100)).to eq(
        "https://secure.gravatar.com/avatar/#{hash}?s=100")
    end

    it 'takes https' do
      expect(described_class.gravatar(email, https: false)).to eq(
        "http://www.gravatar.com/avatar/#{hash}?")
    end

    it 'takes a default' do
      expect(described_class.gravatar(email, default: 'identicon')).to eq(
        "https://secure.gravatar.com/avatar/#{hash}?d=identicon")
    end
  end
  
end
