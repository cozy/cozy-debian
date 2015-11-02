#!/usr/bin/env python
import os
import sys
import json
import urllib2

LOGIN_FILENAME = "/etc/cozy/couchdb.login"


def get_admin():
    '''
    Return the actual admin
    '''
    if os.path.isfile(LOGIN_FILENAME):
        with open(LOGIN_FILENAME, 'r') as f:
            old_login, old_password = f.read().splitlines()[:2]
            return old_login, old_password
    else:
        return None, None


def encodeUserData(user, password):
    '''
    Return the actual admin
    '''
    return "Basic " + (user + ":" + password).encode("base64").rstrip()


def get_cozy_param(param):
    '''
    Return the actual admin
    '''
    try:
        (COZY_USER, COZY_PASS) = get_admin()
        url = 'http://127.0.0.1:5984/cozy/_design/cozyinstance/_view/all'
        req = urllib2.Request(url)
        req.add_header('Accept', 'application/json')
        req.add_header("Content-type", "application/x-www-form-urlencoded")
        req.add_header('Authorization', encodeUserData(COZY_USER, COZY_PASS))
        res = urllib2.urlopen(req)
        data = json.load(res)
        rows = data['rows']
        if len(rows) == 0:
            return None
        else:
            return rows[0].get('value', {}).get(param, None)
    except:
        return None


if __name__ == '__main__':
    if len(sys.argv) != 2:
        script_name = sys.argv[0]
        print 'Call me with:'
        print '{} domain'.format(script_name)
        print '{} background'.format(script_name)
    else:
        print get_cozy_param(sys.argv[1])
