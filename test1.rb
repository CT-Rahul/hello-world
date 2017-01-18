require 'mechanize'
require 'nokogiri'
require 'phantomjs'
class Court
	def execute
		agent = Mechanize.new
		page = agent.get("http://www.apat.ap.gov.in/cldownload_TAB.aspx")
		html = Nokogiri::HTML(page.content.to_s)
		#puts html
		#page.save('/home/kamlesh/Desktop/abc.html')
		#page = File.read("/home/kamlesh/Desktop/abc.html")
		#html = Nokogiri::HTML(page)
		html.css('table[@id="ctl00_ContentPlaceHolder1_GridView1"]/tr/td').each do |row|
			val = row.css('input').xpath('@onclick')
            puts val
			#abc = row.css('input/a')
			#form = agent.page.form_with(:name => "theform")
			#puts form

		end
	end
end
obj = Court.new
obj.execute
