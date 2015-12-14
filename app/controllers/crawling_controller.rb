require 'open-uri'
require 'nokogiri'

class CrawlingController < ApplicationController
  def index
    @doc = Nokogiri::HTML(open("http://www.snuco.com/html/restaurant/restaurant_menu1.asp"))
    @doc = @doc.xpath('//td')
    @start = false
    @type = 0 # 0 은 아침, 1은 점심, 2는 저녁
    @data = false
    @menu
  end
 
end
