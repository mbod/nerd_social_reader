import json
import sys
import random


flist = open('data/%s' % sys.argv[1]).read()

data = json.loads(flist)

weak = [n for n in data['nodes'] if n['strength'] in [2,3]]
medium = [n for n in data['nodes'] if n['strength'] in [4,5]]
strong = [n for n in data['nodes'] if n['strength'] in [6,7]]

print len(weak), 'weak ties'
print len(medium), 'medium ties'
print len(strong), 'strong ties'


weak_friends =[{'id': n['id'], 'name': n['name']} for n in random.sample(weak,6)]
medium_friends =[{'id': n['id'], 'name': n['name']} for n in random.sample(medium,6)]
strong_friends =[{'id': n['id'], 'name': n['name']} for n in random.sample(strong,6)]


# get all other friends into list

sampled_ids = [w['id'] for w in weak_friends] + [m['id'] for m in medium_friends] + [s['id'] for s in strong_friends]

print sampled_ids

friends = []

for f in data['nodes']:
	if f['id'] in sampled_ids:
		continue

	friends.append([f['id'],f['name']])


arts = ["ax453", "bu153", "ps982", "axo12", "cat1", "cat2"] 

fstruct = {}

for i,art in enumerate(arts):
	
	flist = [(weak_friends[i]['id'], weak_friends[i]['name']), (medium_friends[i]['id'], medium_friends[i]['name']), (strong_friends[i]['id'], strong_friends[i]['name'])] 

	fstruct[art] = { 'friends': flist }

fstruct['other'] = friends
fstruct['pID']=sys.argv[1].replace('.txt','').upper()

print fstruct	

out = open('rdata/%s' % sys.argv[1],'w')
out.write(json.dumps(fstruct))
out.close()



