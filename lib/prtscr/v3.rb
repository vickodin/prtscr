# frozen_string_literal: true

module Prtscr
  # Version 2:
  module V3
    def v3(data)
      "https://prtscr.ru/v3/screenshot.#{data[:format]}?#{v3_query(data)}"
    end

    def v3_sign(data)
      ::Digest::MD5.hexdigest(
        [
          data[:url], data[:format], data[:key], data[:width],
          data[:height], data[:scale], data[:secret]
        ].map(&:to_s).join
      )
    end

    def v3_query(data)
      ::URI.encode_www_form(
        {
          url: data[:url],
          key: data[:key],
          sign: v3_sign(data),
          width: data[:width],
          height: data[:height],
          scale: data[:scale]
        }.compact
      )
    end
  end
end
