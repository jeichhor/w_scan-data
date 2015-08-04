# scanning data for dvb-t in DE Dresden

@see http://wirbel.htpc-forum.de/w_scan/index2.html

w_scan -ft -cDE -X | sed 's/(.*)//' > channels.conf
