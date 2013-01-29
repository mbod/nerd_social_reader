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



def getXML(xpath):
	article=[]
	for art in adom.findall(xpath):
		art_children = art.getchildren()
		subhead = art_children[1].text
		subhead = subhead[0:subhead.find(' ',700)] + '...'
		
		adict = {'headline': art_children[0].text,
			 'subhead' : subhead,
			'id': art.get('id')}

		article.append(adict)

	return article

@route('/') 
def main():
	pID = request.query.pID

	try:
		sect = int(request.query.sect)
	except:
		sect=0


	article=getXML('./article')
	
	if sect>0:
		sarticle=getXML('./section[@num="%i"]/article' % sect)
		return template('main', article=article, sarticle=sarticle, pID=pID, sect=sect)

	else:
		return template('main', article=article, sarticle=0, pID=pID, sect=sect)



@route('/article/<aid>')
def article(aid):

	try:
		sect = int(request.query.sect)
	except:
		sect=0

	pID = request.query.pID
	art=adom.find('.//article[@id="%s"]' % aid)

	body=[]	
	for p in art[1:]:
		body.append("<p>%s</p>" % p.text)
	adict = {'headline': art[0].text,
		 'body': '\n'.join(body),
		 'aidx': aid }


	return template('article', article=adict, pID=pID, sect=sect)


@route('/<task>/<filename:re:[^/]*\.(js|css|jpg|png|gif)>')
def static(task,filename):
	return static_file(filename, root=task)





#application = bottle.default_app()

run(port=1122)
