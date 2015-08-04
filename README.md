# scanning data for dvb-t in DE Dresden

@see http://wirbel.htpc-forum.de/w_scan/index2.html

`
# cmd scan
w_scan -ft -cDE -X | sed 's/(.*)//' > channels.conf

# play dvb using vlc and offer streaming via http
cvlc dvb-t:// :dvb-frequency=594000000 :program=515 :dvb-bandwidth=8 :sout='#standard{access=http,mux=ts,url=localhost:8080}'

`
