require 'set'





def fmtset(s) 
	o = ""
	s.each { |item|
		o = o+item+", "
	}
	puts " fmt output: "
	puts o
end

def merges(s,line)
	l1 = line.split(", ")

	l1.each{ |l|
		if s.include?l
			puts " / exist   #{l} "
		else
			s.add(l)
			puts "  adding new !!!!!!!!!! ============>   #{l} "
		end
	}

end


slib1 = "com.android.future.usb.accessory, com.android.location.provider, com.android.media.remotedisplay, com.android.mediadrm.signer, com.google.android.camera.experimental2015, com.google.android.dialer.support, com.google.android.gms, com.google.android.maps, com.google.android.media.effects, com.google.widevine.software.drm, com.qualcomm.qcrilhook, com.quicinc.cneapiclient, javax.obex, org.apache.http.legacy"
slib2 = "android.test.runner, com.android.future.usb.accessory, com.android.location.provider, com.android.nfc_extras, com.google.android.maps, com.google.android.media.effects, com.google.widevine.software.drm, javax.obex"
slib3 = "android.test.runner, com.android.future.usb.accessory, com.android.location.provider, com.android.nfc_extras, com.google.android.maps, com.google.android.media.effects, com.google.widevine.software.drm, javax.obex"
slib4 = "com.android.future.usb.accessory, com.android.location.provider, com.android.media.remotedisplay, com.android.mediadrm.signer, com.google.android.camera.experimental2015, com.google.android.dialer.support, com.google.android.gms, com.google.android.maps, com.google.android.media.effects, com.google.widevine.software.drm, com.qualcomm.qcrilhook, com.quicinc.cneapiclient, javax.obex, org.apache.http.legacy, com.android.future.usb.accessory, com.android.location.provider, com.android.media.remotedisplay, com.android.mediadrm.signer, com.google.android.camera2, com.google.android.dialer.support, com.google.android.maps, com.google.android.media.effects, com.google.widevine.software.drm, javax.obex, org.simalliance.openmobileapi"

s  = Set.new
merges(s,slib1)
merges(s,slib2)
merges(s,slib3)
merges(s,slib4)

puts " s lenght: #{s.length}"
fmtset(s)
system_lib_merge_res = "com.android.future.usb.accessory, com.android.location.provider, com.android.media.remotedisplay, com.android.mediadrm.signer, com.google.android.camera.experimental2015, com.google.android.dialer.support, com.google.android.gms, com.google.android.maps, com.google.android.media.effects, com.google.widevine.software.drm, com.qualcomm.qcrilhook, com.quicinc.cneapiclient, javax.obex, org.apache.http.legacy, android.test.runner, com.android.nfc_extras, com.google.android.camera2, org.simalliance.openmobileapi"


exit

puts " go merge system feature"


#system feature
# throw this into irb, get a whole string
sf_n6manual = "android.hardware.bluetooth, android.hardware.camera, \
				android.hardware.camera.autofocus, android.hardware.camera.flash, android.hardware.camera.level.full, \
				android.hardware.camera.front, android.hardware.faketouch, android.hardware.location, \
				android.hardware.location.gps, android.hardware.location.network, \
				android.hardware.microphone, android.hardware.nfc, android.hardware.nfc.hce, android.hardware.screen.landscape, \
				android.hardware.screen.portrait, android.hardware.sensor.accelerometer, \
				android.hardware.sensor.barometer, android.hardware.sensor.compass, \
				android.hardware.sensor.gyroscope, android.hardware.sensor.light, \
				android.hardware.sensor.proximity, android.hardware.telephony, android.hardware.touchscreen, \
				android.hardware.sensor.hifi_sensors, android.hardware.telephony.gsm, android.hardware.telephony.cdma, \
				android.hardware.touchscreen.multitouch, android.hardware.touchscreen.multitouch.distinct, \
				android.hardware.touchscreen.multitouch.jazzhand, android.hardware.usb.accessory, \
				android.hardware.usb.host, android.hardware.wifi, android.hardware.wifi.direct, \
				android.software.live_wallpaper, android.software.sip, android.software.sip.voip, \
				com.cyanogenmod.android, com.cyanogenmod.nfc.enhanced, android.hardware.fingerprint, \
				com.google.android.feature.GOOGLE_BUILD, com.nxp.mifare, com.tmobile.software.themes, \
				android.software.midi, android.software.webview, android.hardware.ethernet, \
				android.hardware.audio.output, android.software.app_widgets, android.software.connectionservice, \
				android.software.voice_recognizers, android.software.backup, android.software.home_screen, \
				android.software.input_methods, android.software.print, android.software.device_admin, \
				android.software.midi, android.software.managed_users, android.hardware.camera.capability.manual_post_processing, \
				android.hardware.camera.capability.manual_sensor, android.hardware.camera.capability.raw, \
				android.hardware.sensor.stepcounter"

sf_n6manual = "android.hardware.bluetooth, android.hardware.camera, android.hardware.camera.autofocus, android.hardware.camera.flash, android.hardware.camera.level.full, android.hardware.camera.front, android.hardware.faketouch, android.hardware.location, android.hardware.location.gps, android.hardware.location.network, android.hardware.microphone, android.hardware.nfc, android.hardware.nfc.hce, android.hardware.screen.landscape, android.hardware.screen.portrait, android.hardware.sensor.accelerometer, android.hardware.sensor.barometer, android.hardware.sensor.compass, android.hardware.sensor.gyroscope, android.hardware.sensor.light, android.hardware.sensor.proximity, android.hardware.telephony, android.hardware.touchscreen, android.hardware.sensor.hifi_sensors, android.hardware.telephony.gsm, android.hardware.telephony.cdma, android.hardware.touchscreen.multitouch, android.hardware.touchscreen.multitouch.distinct, android.hardware.touchscreen.multitouch.jazzhand, android.hardware.usb.accessory, android.hardware.usb.host, android.hardware.wifi, android.hardware.wifi.direct, android.software.live_wallpaper, android.software.sip, android.software.sip.voip, com.cyanogenmod.android, com.cyanogenmod.nfc.enhanced, android.hardware.fingerprint, com.google.android.feature.GOOGLE_BUILD, com.nxp.mifare, com.tmobile.software.themes, android.software.midi, android.software.webview, android.hardware.ethernet, android.hardware.audio.output, android.software.app_widgets, android.software.connectionservice, android.software.voice_recognizers, android.software.backup, android.software.home_screen, android.software.input_methods, android.software.print, android.software.device_admin, android.software.midi, android.software.managed_users, android.hardware.camera.capability.manual_post_processing, android.hardware.camera.capability.manual_sensor, android.hardware.camera.capability.raw, android.hardware.sensor.stepcounter"

sf_n5 = "android.hardware.bluetooth, android.hardware.camera, android.hardware.camera.autofocus, android.hardware.camera.flash, android.hardware.camera.front, android.hardware.faketouch, android.hardware.location, android.hardware.location.gps, android.hardware.location.network, android.hardware.microphone, android.hardware.nfc, android.hardware.screen.landscape, android.hardware.screen.portrait, android.hardware.sensor.accelerometer, android.hardware.sensor.barometer, android.hardware.sensor.compass, android.hardware.sensor.gyroscope, android.hardware.sensor.light, android.hardware.sensor.proximity, android.hardware.telephony, android.hardware.telephony.gsm, android.hardware.touchscreen, android.hardware.touchscreen.multitouch, android.hardware.touchscreen.multitouch.distinct, android.hardware.touchscreen.multitouch.jazzhand, android.hardware.usb.accessory, android.hardware.usb.host, android.hardware.wifi, android.hardware.wifi.direct, android.software.live_wallpaper, android.software.sip, android.software.sip.voip, com.cyanogenmod.android, com.cyanogenmod.nfc.enhanced, com.google.android.feature.GOOGLE_BUILD, com.nxp.mifare, com.tmobile.software.themes"

sf_n6 = "android.hardware.audio.low_latency, android.hardware.audio.output, android.hardware.audio.pro, android.hardware.bluetooth, android.hardware.bluetooth_le, android.hardware.camera, android.hardware.camera.autofocus, android.hardware.camera.capability.manual_post_processing, android.hardware.camera.capability.manual_sensor, android.hardware.camera.capability.raw, android.hardware.camera.flash, android.hardware.camera.front, android.hardware.camera.level.full, android.hardware.ethernet, android.hardware.faketouch, android.hardware.fingerprint, android.hardware.location, android.hardware.location.gps, android.hardware.location.network, android.hardware.nfc, android.hardware.nfc.hce, android.hardware.screen.landscape, android.hardware.screen.portrait, android.hardware.sensor.accelerometer, android.hardware.sensor.barometer, android.hardware.sensor.compass, android.hardware.sensor.gyroscope, android.hardware.sensor.hifi_sensors, android.hardware.sensor.light, android.hardware.sensor.proximity, android.hardware.sensor.stepcounter, android.hardware.sensor.stepdetector, android.hardware.telephony, android.hardware.telephony.cdma, android.hardware.telephony.gsm, android.hardware.touchscreen, android.hardware.touchscreen.multitouch, android.hardware.touchscreen.multitouch.distinct, android.hardware.touchscreen.multitouch.jazzhand, android.hardware.usb.accessory, android.hardware.usb.host, android.hardware.wifi, android.hardware.wifi.direct, android.software.app_widgets, android.software.backup, android.software.connectionservice, android.software.device_admin, android.software.home_screen, android.software.input_methods, android.software.live_wallpaper, android.software.managed_users, android.software.midi, android.software.print, android.software.sip, android.software.sip.voip, android.software.voice_recognizers, android.software.webview, com.google.android.feature.EXCHANGE_6_2, com.google.android.feature.GOOGLE_BUILD, com.google.android.feature.GOOGLE_EXPERIENCE, com.nxp.mifare"

sf_motorn6_plus = "android.hardware.audio.low_latency, android.hardware.audio.output, android.hardware.audio.pro, android.hardware.bluetooth, android.hardware.bluetooth_le, android.hardware.camera, android.hardware.camera.autofocus, android.hardware.camera.capability.manual_post_processing, android.hardware.camera.capability.manual_sensor, android.hardware.camera.capability.raw, android.hardware.camera.flash, android.hardware.camera.front, android.hardware.camera.level.full, android.hardware.ethernet, android.hardware.faketouch, android.hardware.fingerprint, android.hardware.location, android.hardware.location.gps, android.hardware.location.network, android.hardware.nfc, android.hardware.nfc.hce, android.hardware.screen.landscape, android.hardware.screen.portrait, android.hardware.sensor.accelerometer, android.hardware.sensor.barometer, android.hardware.sensor.compass, android.hardware.sensor.gyroscope, android.hardware.sensor.hifi_sensors, android.hardware.sensor.light, android.hardware.sensor.proximity, android.hardware.sensor.stepcounter, android.hardware.sensor.stepdetector, android.hardware.telephony, android.hardware.telephony.cdma, android.hardware.telephony.gsm, android.hardware.touchscreen, android.hardware.touchscreen.multitouch, android.hardware.touchscreen.multitouch.distinct, android.hardware.touchscreen.multitouch.jazzhand, android.hardware.usb.accessory, android.hardware.usb.host, android.hardware.wifi, android.hardware.wifi.direct, android.software.app_widgets, android.software.backup, android.software.connectionservice, android.software.device_admin, android.software.home_screen, android.software.input_methods, android.software.live_wallpaper, android.software.managed_users, android.software.midi, android.software.print, android.software.sip, android.software.sip.voip, android.software.voice_recognizers, android.software.webview, com.google.android.feature.EXCHANGE_6_2, com.google.android.feature.GOOGLE_BUILD, com.google.android.feature.GOOGLE_EXPERIENCE, com.nxp.mifare, android.hardware.audio.low_latency, android.hardware.audio.output, android.hardware.bluetooth, android.hardware.bluetooth_le, android.hardware.camera, android.hardware.camera.autofocus, android.hardware.camera.flash, android.hardware.camera.front, android.hardware.ethernet, android.hardware.faketouch, android.hardware.location, android.hardware.location.gps, android.hardware.location.network, android.hardware.nfc, android.hardware.nfc.hce, android.hardware.screen.landscape, android.hardware.screen.portrait, android.hardware.sensor.accelerometer, android.hardware.sensor.barometer, android.hardware.sensor.compass, android.hardware.sensor.gyroscope, android.hardware.sensor.light, android.hardware.sensor.proximity, android.hardware.sensor.stepcounter, android.hardware.sensor.stepdetector, android.hardware.telephony, android.hardware.telephony.cdma, android.hardware.telephony.gsm, android.hardware.touchscreen, android.hardware.touchscreen.multitouch, android.hardware.touchscreen.multitouch.distinct, android.hardware.touchscreen.multitouch.jazzhand, android.hardware.usb.accessory, android.hardware.usb.host, android.hardware.wifi, android.hardware.wifi.direct, android.software.app_widgets, android.software.backup, android.software.connectionservice, android.software.device_admin, android.software.home_screen, android.software.input_methods, android.software.live_wallpaper, android.software.managed_users, android.software.print, android.software.sip, android.software.sip.voip, android.software.voice_recognizers, android.software.webview, com.google.android.feature.EXCHANGE_6_2, com.google.android.feature.GOOGLE_BUILD, com.google.android.feature.GOOGLE_EXPERIENCE, com.motorola.triggerenroll.ap_v1, com.motorola.triggerenroll.dsp_v1"

s  = Set.new

#puts sf_n6manual


puts " merge  sfn6 #{ sf_n6.length}"
merges(s, sf_n6)


puts " merge  sfn5  #{ sf_n5.length}"
merges(s, sf_n5)

puts " merge  n6manual  #{ sf_n6manual.length}"
merges(s, sf_n6manual)


puts " merge  sf_motorn6_plus  #{ sf_motorn6_plus.length}"
merges(s, sf_motorn6_plus)



puts " s lenght: #{s.length}"
fmtset(s)

# result:   com.tmobile.software.themes?
merged_res_sys_feature = "android.hardware.bluetooth, android.hardware.camera, android.hardware.camera.autofocus, android.hardware.camera.flash, android.hardware.camera.level.full, android.hardware.camera.front, android.hardware.faketouch, android.hardware.location, android.hardware.location.gps, android.hardware.location.network, android.hardware.microphone, android.hardware.nfc, android.hardware.nfc.hce, android.hardware.screen.landscape, android.hardware.screen.portrait, android.hardware.sensor.accelerometer, android.hardware.sensor.barometer, android.hardware.sensor.compass, android.hardware.sensor.gyroscope, android.hardware.sensor.light, android.hardware.sensor.proximity, android.hardware.telephony, android.hardware.touchscreen, android.hardware.sensor.hifi_sensors, android.hardware.telephony.gsm, android.hardware.telephony.cdma, android.hardware.touchscreen.multitouch, android.hardware.touchscreen.multitouch.distinct, android.hardware.touchscreen.multitouch.jazzhand, android.hardware.usb.accessory, android.hardware.usb.host, android.hardware.wifi, android.hardware.wifi.direct, android.software.live_wallpaper, android.software.sip, android.software.sip.voip, com.cyanogenmod.android, com.cyanogenmod.nfc.enhanced, android.hardware.fingerprint, com.google.android.feature.GOOGLE_BUILD, com.nxp.mifare, com.tmobile.software.themes, android.software.midi, android.software.webview, android.hardware.ethernet, android.hardware.audio.output, android.software.app_widgets, android.software.connectionservice, android.software.voice_recognizers, android.software.backup, android.software.home_screen, android.software.input_methods, android.software.print, android.software.device_admin, android.software.managed_users, android.hardware.camera.capability.manual_post_processing, android.hardware.camera.capability.manual_sensor, android.hardware.camera.capability.raw, android.hardware.sensor.stepcounter, android.hardware.audio.low_latency, android.hardware.audio.pro, android.hardware.bluetooth_le, android.hardware.sensor.stepdetector, com.google.android.feature.EXCHANGE_6_2, com.google.android.feature.GOOGLE_EXPERIENCE"








