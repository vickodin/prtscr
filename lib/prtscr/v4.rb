# frozen_string_literal: true

module Prtscr
  # Version 4:
  module V4
    def v4(data)
      "https://prtscr.ru/v4/screenshot.#{data[:format]}?#{v4_query(data)}"
    end

    def v4_sign(data)
      puts data.reject { |key, _| [:version, :secret, :timestamp, :scheme, :host].include?(key) }.sort.to_h.map { |_k, v| v }.push(data[:secret]).join
      ::Digest::MD5.hexdigest(data.reject { |key, _| [:secret, :version, :timestamp, :scheme, :host].include?(key) }.sort.to_h.map { |_k, v| v }.push(data[:secret]).join)
    end

    def v4_query(data)
      ::URI.encode_www_form(
        {
          url:    data[:url],
          width:  data[:width],
          height: data[:height],
          scale:  data[:scale],
          full:   data[:full],
          delay:  data[:delay],
          key:    data[:key],
          sign:   v4_sign(data),
        }.compact
      )
    end
  end
end
