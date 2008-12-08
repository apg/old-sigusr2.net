#!/usr/bin/env python

import urllib

def get_infocon():
    r = urllib.urlopen("http://isc.sans.org/infocon.txt")
    content = r.read()
    r.close()
    if len(content.strip()):
        return content.strip()
    return None

def generate_today(infocon):
    content = """/* generated based on http://isc.sans.org/infocon.html hourly */
#header h1 a {
background-color: %s;
}"""
        
    colors = {'green': '#88DD00', 
              'yellow': '#FFFF00', 
              'red': '#FF1A00',
              'orange': '#FFB200'}
    
    return content % colors.get(infocon, '#88DD00')

if __name__ == '__main__':
    infocon = get_infocon()
    print generate_today(infocon)
