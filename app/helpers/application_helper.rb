module ApplicationHelper

 def get_navigation(choice)
  token1, token2, token3, token4 = ""
  
  case choice
      when "home"
        token1 = "class=\"active\""
	    when "browse"
	       token2 = "class=\"active\""
      when "login"
        token3 = "class=\"active\""
      when "register"
        token4 = "class=\"active\""
      end
  html = <<HTML
  <div id="navigation">
    <ul>
      <li><a href="#{root_path}" #{token1}><span>home</span></a></li>
      <li><a href="#{categories_path}" #{token2}><span>browse</span></a></li>
      
HTML

image = image_tag "facebook_icon.png", :style => "position: relative; top: 2px;"
unless user_signed_in?
    html2 = <<HTML
      <li><a href="#{user_omniauth_authorize_path(:facebook)}" #{token3}><span style="width:80px;">#{image}<div style="position:relative; bottom:32px; left: 45px;">Login</div></span></a></li>
HTML
            
html += html2
else
      html3 = <<HTML
        <li><a href="#{logout_path}" #{token3}><span>Logout</span></a></li>
              </ul>
HTML

html += html3
    end

html.html_safe

end

def url_escape(string)
string.gsub(/([^ a-zA-Z0-9_.-]+)/n) do
'%' + $1.unpack('H2' * $1.size).join('%').upcase
end.tr(' ', '+')
end

def url_unescape(string)
string.tr('+', ' ').gsub(/((?:%[0-9a-fA-F]{2})+)/n) do
[$1.delete('%')].pack('H*')
end
end

def get_location(ip)
command = "http://www.geoiptool.com/en/?IP=#{ip}"
cheese = system("curl #{command} | grep \"City\"")
return cheese.to_s
end


end
