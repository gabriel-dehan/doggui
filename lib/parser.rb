require 'open-uri'
require 'nokogiri'
require 'byebug'

class Parser

  def initialize
    @url = 'https://www.chiens-de-france.com/etalons/'
  end

  def save_dogs
    html_file = open(@url).read
    html_doc = Nokogiri::HTML(html_file)
    index = html_doc.search("form .acc-1 .acc-select option").map { |n| n.text }.index('Selectionner une race')
    dogs =  html_doc.search("form .acc-1 .acc-select option").map { |n| n.text }.drop(index + 1)
    dogs.each do |dog_name|
      Breed.create(name: dog_name)
    end
  end
end
