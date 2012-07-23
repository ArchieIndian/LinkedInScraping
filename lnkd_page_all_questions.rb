
require 'rubygems'
require 'mechanize'
require 'open-uri'

a = Mechanize.new { |agent|
  # LinkedIn probably refreshes after login
  agent.follow_meta_refresh = true
}

a.get('http://linkedin.com/') do |home_page|
	my_page = home_page.form_with(:name => 'login') do |form|
    form.session_key  = 'mitra.arkid@gmail.com'   #put you email ID
    form.session_password = 'Npoint0@'  #put your password here
  end.submit

mygroups_page = a.click(my_page.link_with(:text => /Groups/))

#puts mygroups_page.links

link_to_analyse = a.click(mygroups_page.link_with(:text => 'Semantic Web'))

link_to_test = link_to_analyse.search('inline-pagination a')

puts link_to_test

# link_to_analyse.search(".user-contributed .groups a").each do |item|

# 	puts item['href']

#  end

end