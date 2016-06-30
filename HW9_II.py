# Original code found at 
# http://coreygoldberg.blogspot.com/2011/09/python-stock-quotes-from-google-finance.html
# Lines 18 were edited by me

# Great find of code!  Note how they stripped off the // part and the redundant [ ] wrapper.

import json
import pprint
import urllib2


def get_stock_quote(ticker_symbol):   
    url = 'http://finance.google.com/finance/info?q=%s' % ticker_symbol
    lines = urllib2.urlopen(url).read().splitlines()
    return json.loads(''.join([x for x in lines if x not in ('// [', ']')]))


if __name__ == '__main__':
    quote = get_stock_quote('GOOG')
    print 'Stock: %s, Time: %s, Price: %s' % quote['t','ltt','l_cur']
