require "prtscr/version"

module Prtscr

  def self.get(data)
    d = {
      version: 'v1',
      width: '1280',
      height: '1024',
      scale: '500',
      format: 'jpg',
      timestamp: Time.now.to_i,
      scheme: 'https:/',
      host: 'prtscr.ru'
    }.merge(data)

    d[:url] = URI.encode_www_form_component(d[:url])
    d[:sign] = Digest::MD5.hexdigest([d[:width], d[:height], d[:scale], d[:format], d[:timestamp], d[:key], d[:url], d[:secret]].join(''))
    d[:size] = [d[:width], d[:height]].join('x')
    [d[:scheme], d[:host], d[:version], d[:size], d[:scale], d[:format], d[:timestamp], d[:key], d[:sign], d[:url]].join('/')
  end

end
