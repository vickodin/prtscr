# frozen_string_literal: true

RSpec.describe Prtscr do
  it 'has a version number' do
    expect(Prtscr::VERSION).not_to be nil
  end

  context 'when v1' do
    let :v1 do
      {
        version: 'v1',
        url: 'https://google.com/',
        timestamp: 1_484_087_593,
        width: 1280,
        height: 1024,
        scale: 250,
        key: 'YOUR_KEY_HERE',
        secret: 'YOUR_SECRET_HERE',
        format: 'png'
      }
    end

    it 'has correct sign' do
      result    = described_class.get(v1)
      standard  = 'https://prtscr.ru/v1/1280x1024/250/png/1484087593/YOUR_KEY_HERE/7dee8157ceca2c470388e37bc2c17288/https%3A%2F%2Fgoogle.com%2F'

      expect(result).to eq(standard)
    end
  end

  context 'when v2' do
    let :v2 do
      {
        version: 'v2',
        url: 'https://google.com/',
        timestamp: 1_484_087_593,
        width: 1280,
        height: 1024,
        scale: 250,
        key: 'YOUR_KEY_HERE',
        secret: 'YOUR_SECRET_HERE',
        format: 'png'
      }
    end

    it 'has correct sign' do
      result    = described_class.get(v2)
      standard  = 'https://prtscr.ru/v2/1280x1024/250/1484087593/YOUR_KEY_HERE/9edccf7a4c9e92a581f6987803f50ab9/aHR0cHM6Ly9nb29nbGUuY29tLw==.png'

      expect(result).to eq(standard)
    end
  end

  context 'when v3' do
    let :v3 do
      {
        version: 'v3',
        url: 'https://google.com/',
        width: 1280,
        height: 1024,
        scale: 250,
        key: 'YOUR_KEY_HERE',
        secret: 'YOUR_SECRET_HERE',
        format: 'png'
      }
    end

    it 'has correct sign' do
      result   = described_class.get(v3)
      standard = 'https://prtscr.ru/v3/screenshot.png?url=https%3A%2F%2Fgoogle.com%2F&key=YOUR_KEY_HERE&sign=0d216ae8bdbdf44d925d5b12aac5319b&width=1280&height=1024&scale=250'

      expect(result).to eq(standard)
    end
  end
end
