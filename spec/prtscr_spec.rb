require "spec_helper"

describe Prtscr do
  it "has a version number" do
    expect(Prtscr::VERSION).not_to be nil
  end

  it "has correct sign" do
    timestamp = '1484087593'
    url = Prtscr.get(url: 'https://google.com/', timestamp: 1484087593, width: 1280, height: 1024, scale: 250, key: 'YOUR_KEY_HERE', secret: 'YOUR_SECRET_HERE', format: 'png')
    final = 'https://prtscr.ru/v1/1280x1024/250/png/1484087593/YOUR_KEY_HERE/7dee8157ceca2c470388e37bc2c17288/https%3A%2F%2Fgoogle.com%2F'
    expect(url).to eq(final)
  end
end
