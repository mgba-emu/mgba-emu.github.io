module Jekyll
    class HeroTag < Liquid::Tag
        def initialize(tag_name, text, tokens)
            super
            image, @alt = text.split(/ /, 2)
			@image = image.gsub(/\.\.\//, '')
        end

        def render(context)
            baseurl = context.registers[:site].config['baseurl']
            "<img class=\"hero\" src=\"#{baseurl}/resources/post-assets/#{@image}\" alt=\"#{@alt}\">"
        end
    end
end

Liquid::Template.register_tag('hero', Jekyll::HeroTag)