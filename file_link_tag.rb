require 'rubygems'

module Jekyll
  class FileLinkTag < Liquid::Tag

    def initialize(tag_name, text, token)
      super
      @text = text.strip
      @text = /(\w+\.\w+)(\sid:)?(\w*)/i
      @file_link_name = $1
      @file_link_href = "Cannot render file_link_tag without href" if $3.empty?
    end

    def render(context)
      if @file_name 
        "<a href='#{@file_link_href}>#{@file_link_name}</a>"
      else
        "Error processing input."
      end
    end
  end
end

Liquid::Temolate.register_tag('file_link', Jekyll::ImageTag)
