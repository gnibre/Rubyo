
require 'net/smtp'

SMTPHOST = 'smtp.gmail.com'
SMTPPORT = 587
DOMAIN = 'gmail.com'
FROM = "voxel.tester1@gmail.com"

def send_email from, to, mailtext
	puts " do send_email"
	# begin 
		# OpenSSL::SSL::VERIFY_NONE
	  # Net::SMTP.enable_tls()
	  
	  smtp = Net::SMTP.new(SMTPHOST,SMTPPORT)
	  # Net::SMTP.enable_starttls
	  smtp.enable_starttls
	  # smtp.enable_ssl
	  # smtp.enable_tls(OpenSSL::SSL::VERIFY_NONE)
	  smtp.start(DOMAIN, FROM, 'coolvmtester', :plain) do |s|
	  	puts " send_email;  started. do send."
	  	s.set_debug_output $stderr
	    s.send_message mailtext, from, to
	  end
	# rescue => e
	#   raise "Exception occured: #{e} "
	#   exit -1
	# end 
end




# ===================================== MAIN 
# TO = "yi.wu.1986@gmail.com"
TO = ["gnibre@gmail.com","gnibre2@gmail.com","yi.wu.1986@gmail.com"]

Message = "
HELLO YI:

Auto send email program developing, for now it only sents plain email like this, nothing else.
Other features will be done soon I guess.

btw, today's data don't look really good. 
maybe use shall sell them high and buy low at the end of the day.
GL

***** Dont reply to this email, it's sent from my test account. ***** 
eh, well, you never ever repliedy my email, nvm

"

BODY = <<EOF
From: #{FROM}
To: #{TO}
Subject: daily finance report to dear yi.

#{Message}

EOF

puts " body?  #{BODY}"


send_email(FROM,TO,BODY)
