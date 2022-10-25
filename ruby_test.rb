require 'net/https'
require 'nokogiri'
require 'date'
require 'timeout'

def get_html_page(uri)
  Timeout::timeout(200) do
    page = Net::HTTP.get(uri)
    return page # => String
  end
end

def get_data(document)

  data = {
    :title => '',
    :date => '',
    :location => '',
    :article => ''
  }

  data[:title] = document.css('h2.newsie-titler').text
  data[:data] = DateTime.parse(document.css('div.topnewstext b').text).to_date.to_s
  data[:location] = document.css('div.topnewstext b').text.strip.chomp.match(/[a-zA-Z]+/).to_s
  data[:article] = document.css('div.bodycopy').text.strip.chomp

  return data # => Hash
end


uri = URI('https://agriculture.house.gov/news/documentsingle.aspx?DocumentID=2106')

document = Nokogiri::HTML(get_html_page(uri))
get_data(document)
