import time
import os 
import sys 
import json



#os.chdir(os.path.dirname(__file__))

#sys.path.append('.')

import bottle 
from bottle import get, post, response,request, run, route, template, static_file

from xml.etree import ElementTree as ET

adom=ET.parse('articles.xml')



@route('/') 
def main():
	pID = request.query.pID
	if request.query.cnum:
		cnum = request.query.cnum
	else:
		cnum = ''


	article=[]
	
	for art in adom.findall('article'):
		art_children = art.getchildren()
		subhead = art_children[1].text
		subhead = subhead[0:subhead.find(' ',300)] + '...'
		adict = {'headline': art_children[0].text,
			 'subhead' : subhead,
			'id': art.get('id')}

		article.append(adict)


	return template('main', article=article, pID=pID)



@route('/article/<aid>')
def article(aid):

	print aid

	pID = request.query.pID
	art=adom.find('article[@id="%s"]' % aid)

	body=[]	
	for p in art[1:]:
		body.append("<p>%s</p>" % p.text)
	adict = {'headline': art[0].text,
		 'body': '\n'.join(body),
		 'aidx': aid }


	return template('article', article=adict, pID=pID)


@route('/<task>/<filename:re:[^/]*\.(js|css|jpg|png|gif)>')
def static(task,filename):
	return static_file(filename, root=task)





#application = bottle.default_app()

run(port=1234)
