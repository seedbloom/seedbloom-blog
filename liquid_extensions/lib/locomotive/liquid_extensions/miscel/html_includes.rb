require 'httparty'

module Locomotive
  module LiquidExtensions
    module Miscel

      class HtmlIncludes < Solid::Tag

        # register the tag
        tag_name :header

        def display(options = {}, &block)
          url = options[:url]

          response = HTTParty.get(url)
          puts response
          response
        end
      end
    end
  end
end
