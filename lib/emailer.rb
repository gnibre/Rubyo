
require 'net/smtp'


class Emailer
	SMTPHOST = 'smtp.gmail.com'
	SMTPPORT = 587
	DOMAIN = 'gmail.com'
	FROM = "voxel.tester1@gmail.com"
	TO = ["gnibre@gmail.com","gnibre2@gmail.com","yi.wu.1986@gmail.com"]  # prod
	# TO = ["gnibre@gmail.com","gnibre2@gmail.com"]  # test

	Message_1 = "
	HELLO YI:
	"

	Message_2 = "
	G.L.

	L.Y.

	King's regard

	***** Dont reply to this email, it's sent from my test account. ***** 

	"

	SAMPLE_MESSAGE = Message_1+Message_2

SAMPLE_BODY = <<EOF
From: #{FROM}
To: #{TO}
Subject: subj

sample text message! 

best,

EOF


	def self.send_daily_stock_email(filename, subj="daily stock report" , msg="")
		fn = "yiyiyiyiyi_02-25-2016_05am.html"

		text_msg =  Message_1+msg+"\n"+Message_2

		body = self.gen_email_body(subj, text_msg, filename)

		puts "xxxx final body : #{body}"

		self.send_email(body)
	end


	def self.send_email(mailtext=SAMPLE_BODY, to=TO, from=FROM)
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


	def self.gen_email_body(subj, text_msg, filename)


		puts " xxxxxxxx file anme :  #{filename}"

		marker = "YISTOCKEMAILATTACHMENTMARKER"
		unless filename.nil?
			# Read a file and encode it into base64 format
			filecontent = File.read("./dailyHtml/"+filename)
			encodedcontent = [filecontent].pack("m")   # base64
		end

		puts " -------- get file :   #{filecontent}"
		puts " -------- get file :   #{encodedcontent}"


#Content-Type: multipart/mixed; name=\"#{filename}\"

part1 =<<EOF
From: #{FROM}
To: #{TO}
Subject: #{subj}
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=#{marker}
--#{marker}
EOF


part2 =<<EOF
Content-Type: text/plain
Content-Transfer-Encoding:8bit

#{text_msg}
--#{marker}
EOF


part3 =<<EOF
Content-Type: text/html; charset="utf-8"; name=\"#{filename}\"
Content-Transfer-Encoding:base64
Content-Disposition: attachment; filename="#{filename}"

#{encodedcontent}
--#{marker}--
EOF

body = part1 + part2 + part3
	return body
	end

end

