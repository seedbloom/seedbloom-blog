require 'httparty'

module Locomotive
  module LiquidExtensions
    module Miscel

      class HeaderInclude < Solid::Tag
        # register the tag
        tag_name :header

        def display(options = {}, &block)
          url = options[:url] || ENV['DEFAULT_HEADER_URL'] || 'http://seedbloom:4001/sb-common/sb-nav'
          # TODO Add cache support
          HTTParty.get(url)
        end
      end

      class FooterInclude < Solid::Tag
        # register the tag
        tag_name :footer

        def display(options = {}, &block)
          url = options[:url] || ENV['DEFAULT_FOOTER_URL'] || 'http://seedbloom:4001/sb-common/sb-footer'
          begin
            # TODO Add cache support
            HTTParty.get(url)
          rescue
            # Return empty body if request fails
            return
          end
        end
      end

      class CommonInclude < Solid::Tag

        # register the tag
        tag_name :common_include

        def display(options = {}, &block)
          type = options[:type]
          case type
            when 'text/css'
              url = options[:url] || ENV['DEFAULT_CSS_URL'] || 'http://seedbloom:4001/css/sb-common.css'
              "<link href=\"#{url}\" media=screen rel=stylesheet type=text/css />"
            when 'text/javascript'
              url = options[:url] || ENV['DEFAULT_JS_URL'] || 'http://seedbloom:4001/js/sb-common.js'
              "<script src=\"#{url}\" type=text/javascript></script>"
            else
              raise 'Invalid mime type'
          end
        end
      end
    end
  end
end
