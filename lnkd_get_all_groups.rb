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
  
# form = a.page.form_with(:name=>'postModuleForm')    #these three lines of code can help you update your linkedin status
# form['postText'] = 'Test by Script' 				  #this text is where you put what you want to share
# form.submit(form.button_with(:value=>'Share'))

mygroups_page = a.click(my_page.link_with(:text => /Groups/))

# puts mygroups_page.images
mygroups_page.links_with(:class => 'media-asset').each do |link|
	puts link.href
end

end