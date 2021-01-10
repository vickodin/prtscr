# frozen_string_literal: true

module Prtscr
  # Version 2:
  module V2
    def v2(data)
      [
        [
          data[:scheme], data[:host], data[:version], v2_size(data), data[:scale],
          data[:timestamp], data[:key], v2_sign(data), v2_url(data[:url])
        ].join('/'), data[:format]
      ].join('.')
    end

    def v2_sign(data)
      ::Digest::MD5.hexdigest(
        [
          data[:width], data[:height], data[:scale], data[:timestamp], data[:key],
          v2_url(data[:url]), data[:format], data[:secret]
        ].join('')
      )
    end

    def v2_size(data)
      [data[:width], data[:height]].join('x')
    end

    def v2_url(url)
      Base64.urlsafe_encode64(url)
    end
  end
end
