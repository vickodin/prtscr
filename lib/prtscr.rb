# frozen_string_literal: true

require 'prtscr/version'
require 'digest'
require 'base64'

require 'prtscr/v1'
require 'prtscr/v2'
require 'prtscr/v3'
# Main module

module Prtscr
  extend Prtscr::V1
  extend Prtscr::V2
  extend Prtscr::V3

  class Error < StandardError; end

  def self.get(params)
    # TODO: Move default values to initializer
    data = {
      version: 'v3', width: '1280', height: '1024', scale: '500',
      format: 'jpg', timestamp: Time.now.to_i, scheme: 'https:/', host: 'prtscr.ru'
    }.merge(params)

    case data[:version]
    when 'v1' then v1(data)
    when 'v2' then v2(data)
    when 'v3' then v3(data)
    end
  end
end
