# frozen_string_literal: true

module Prtscr
  # Version 1:
  module V1
    def v1(data)
      [
        data[:scheme], data[:host],
        data[:version], v1_size(data), data[:scale], data[:format], data[:timestamp], data[:key],
        v1_sign(data), v1_url(data[:url])
      ].join('/')
    end

    def v1_sign(data)
      ::Digest::MD5.hexdigest(
        [
          data[:width], data[:height], data[:scale], data[:format], data[:timestamp],
          data[:key], v1_url(data[:url]), data[:secret]
        ].join('')
      )
    end

    def v1_size(data)
      [data[:width], data[:height]].join('x')
    end

    def v1_url(url)
      ::URI.encode_www_form_component(url)
    end
  end
end
