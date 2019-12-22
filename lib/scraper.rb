require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    scraped_student = []
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    students = doc.css(".student-card")
    the_student = Hash.new
    students.each do |each_student|
      the_student[:name] = each_student.css("h4.student-name").text
      the_student[:location] = each_student.css(".student-location").text
      the_student[:profile_url] = "./fixtures/student-site/#{each_student.css("a").attribute("href").value}"
      scraped_student << {:name => the_student[:name], :location => the_student[:location], :profile_url => the_student[:profile_url]}
    end
    scraped_student
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

