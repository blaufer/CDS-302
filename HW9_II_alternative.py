import urllib
import json

url = "http://finance.google.com/finance/info?client=ig&q=NASDAQ:GOOG"
response = urllib.urlopen(url)
f = response.read()
data = json.loads(f[4:])

print 'Stock: %s, Time: %s, Time: %s' % (data[0]['t'], data[0]['ltt'], data[0]['l_cur'])