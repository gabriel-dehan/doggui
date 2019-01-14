require 'open-uri'
require 'nokogiri'
require 'byebug'

url = 'https://www.chiens-de-france.com/etalons/'
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
index = html_doc.search("form .acc-1 .acc-select option").map { |n| n.text }.index('Selectionner une race')
puts html_doc.search("form .acc-1 .acc-select option").map { |n| n.text }.drop(index + 1)
