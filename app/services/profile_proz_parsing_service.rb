require 'nokogiri'
require 'open-uri'

module ProfileProzParsingService
  class << self
    def create(link)
      doc = Nokogiri::HTML.parse(open(link))

      full_name = doc.css('table table table table font').first.content.strip.split(' ')
      list = doc.css('table table table table div')
      list2 = doc.css('table table table table div div div span')

      target_language = []
      list2.each do |s|
        target_language << s.content.split(' ').first
      end

      last_name = full_name[0]
      first_name = full_name[1]
      country = list[12].content.split('Local time').first.strip.split(' ').last
      native_language = list[14].content.strip.split(' ').last
      target_language = target_language.uniq
      source = 'www.proz.com/profile'
      source_link = link

      Profile.create!(last_name: last_name,
                      first_name: first_name,
                      country: country,
                      source: source,
                      source_link: source_link,
                      native_language: native_language,
                      target_language: target_language)
    end
  end
end
