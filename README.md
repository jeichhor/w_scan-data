# scanning data for dvb-t in DE Dresden

@see http://wirbel.htpc-forum.de/w_scan/index2.html

```
# cmd scan
w_scan -ft -cDE -X | sed 's/(.*)//' > channels.conf

# play dvb using vlc and offer streaming via http
cvlc dvb-t:// :dvb-frequency=594000000 :program=515 :dvb-bandwidth=8 :sout='#standard{access=http,mux=ts,url=localhost:8080}'

# play iptv (telekom entertain) and save to file
# @see http://grinch.itg-em.de/entertain/faq/allgemein/multicastadressliste/

cvlc --run-time=10 --play-and-exit --sout='~/foo.ts' rtp://@239.35.10.58:10000

# enqeue vlc records using atd
# @see https://blog.sourcefabric.org/en/news/blog/2077/

```
