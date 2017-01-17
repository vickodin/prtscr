require 'prtscr/version'
require 'base64'

# Main Module
module Prtscr
  def self.get(data)
    # TODO: Move default values to initializer
    d = {
      version: 'v2',
      width: '1280',
      height: '1024',
      scale: '500',
      format: 'jpg',
      timestamp: Time.now.to_i,
      scheme: 'https:/',
      host: 'prtscr.ru'
    }.merge(data)

    if d[:version] == 'v1'
      d[:url] = URI.encode_www_form_component(d[:url])
      d[:sign] = Digest::MD5.hexdigest([d[:width], d[:height], d[:scale], d[:format], d[:timestamp], d[:key], d[:url], d[:secret]].join(''))
      d[:size] = [d[:width], d[:height]].join('x')
      return [d[:scheme], d[:host], d[:version], d[:size], d[:scale], d[:format], d[:timestamp], d[:key], d[:sign], d[:url]].join('/')
    elsif d[:version] == 'v2'
      d[:url] = Base64.urlsafe_encode64(d[:url])
      d[:sign] = Digest::MD5.hexdigest([d[:width], d[:height], d[:scale], d[:timestamp], d[:key], d[:url], d[:format], d[:secret]].join(''))
      d[:size] = [d[:width], d[:height]].join('x')
      return [[d[:scheme], d[:host], d[:version], d[:size], d[:scale], d[:timestamp], d[:key], d[:sign], d[:url]].join('/'), d[:format]].join('.')
    end
  end
end
