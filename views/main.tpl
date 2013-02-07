<!DOCTYPE html>
<html>
	<head>
		<title>University of Michigan - BlueReader&#0153;</title>
		
		<meta charset="utf-8"/>
		
		<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="css/bootstrap-responsive.css" rel="stylesheet">		
		
		<!--
			technology 1
			health 2
			science 3
		-->
		
		
		<style type="text/css">
		  body {
			padding-top: 60px;
			padding-bottom: 40px;
		  }
		  
		  #acontainer, #scontainer {
		  	position: relative;
		  	}
		  	
		  #scontainer, #categories, #complete {
		  	display: none;
		  	}
		  

		  
		  .abox {
		  	background-color: #ffffff;
		  	border: 1px solid black;
		  	padding: 10px;
		  	
		  	position: absolute;

		  	width: 600px;
		  	
		  }
		  
		  .a1, .a-1 {
		  	top: 10px;
		  	left: 10px;
		  	z-index: 4;
		  	}	
		  	
		  .a2, .a0 {
		  	top: 30px;
		  	left: 30px;
		  	z-index: 3;
		  	}	
		  	
		  .a3{
		  	top: 50px;
		  	left: 50px;
		  	z-index: 2;
		  }	
		  	
		  .a4 {
		  	top: 70px;
		  	left: 70px;
		  	z-index: 1;
		  }	
		  
		  
		  .arow {
		  	padding-top: 30px;
		  	
		  	}
		  
		  .fixed {
		  	height: 200px;
		  	}
		  
		  .read {
		  	color: #a0a0a0;
		    background-color: #d9edf7;
		  }	
		  
		  .brand {
		  	background-color: #9090ff;
		  	color: black;
		  	}
		  
		  .ralign {
		  	text-align: right;
		  	}
		  	
		  #intro h3 {
		  	text-align: center;
		  	}
		  	
		  #intro {
		  	display: none;
		  	}
		  	
		  .top50 {
		  	margin-top: 50px;
		  }
		  
		  .alert {
		  	font-size: 16px;
		  	font-weight: bold;
		  	text-align: center;
		  	}
		  	
		  .cat-label {
		  	text-align: center;
		  	font-size: 20px;
		  	height: 100px;
		  	width: 200px;
		  	padding-top: 40px;
		  }
		  
    	</style>
		
		
	</head>
	<body>


    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          
          <a class="brand" href="#">BlueReader&#0153;</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#about">About</a></li>

              
            </ul>
            <form class="navbar-form pull-right">
              <input class="span2" type="text" placeholder="Email">
              <input class="span2" type="password" placeholder="Password">
              <button type="submit" class="btn">Sign in</button>
            </form>
          </div><!--/.nav-collapse -->
          </a>
        </div>
      </div>
    </div>
    
    

	<!-- INSTRUCTIONS -->
	
	<div id="intro" class="row-fluid">
			<div class="span6 offset3">
				<h3>
					Welcome to the University of Michigan <br/>
					Social <i>BlueReader&#0153;</i> [Alpha Version 0.3].
				</h3>
			
				<div class="ralign top50">			
					<p>Today, you will be trying out a new way to read news and share articles with your friends.</p> 
					
					<p>First, you will get the chance to read the most popular articles today on the social reader. 
					   Second, you will get a chance to choose a section that most interests you to read a few more articles that are relevant to you. After you read each article, you will be able to share it with any of your friends in your network.</p> 
					
					<p>So have fun, share with your friends, and we look forward to hearing your feedback!</p>
					
					<p>-<i>BlueReader Team</i></p>
					<br/>
					<br/>
					<a class="btn btn-info" href="?pID={{ pID }}">Start test...</a>
				</div>
			</div>
	</div>    
    


		
		<div id="main" class="container">
			
			<div id="mbar" class="alert alert-info">
			MOST POPULAR ARTICLES TODAY: 
			There <span id="numToRead"></span> new article<span id="plural">s</span> for you to read!
			</div>
	
	
		
			<div class="row-fluid arow">
				%if sarticle==0:
				<div id="acontainer" class="span10 offset2">
				
					<div id="{{ article[0]['id'] }}" class="abox">
						<div class="fixed">
							<h2>{{ article[0]['headline'] }}</h2>
							
							<p>{{ article[0]['subhead'] }}</p>
						</div>
						<a href="article/{{ article[0]['id'] }}?pID={{pID}}" class="btn btn-primary">Read more...</a>
					</div>
					
					<div id="{{ article[1]['id'] }}" class="abox">
						<div class="fixed">
							<h2>{{ article[1]['headline'] }}</h2>
							
							<p>{{ article[1]['subhead'] }}</p>
						</div>
						<a href="article/{{ article[1]['id'] }}?pID={{pID}}" class="btn btn-primary ">Read more...</a>
					</div>
	
	
					<div id="{{ article[2]['id'] }}" class="abox">
						<div class="fixed">
							<h2>{{ article[2]['headline'] }}</h2>
							
							<p>{{ article[2]['subhead'] }}</p>
						</div>
						<a href="article/{{ article[2]['id'] }}?pID={{pID}}" class="btn btn-primary">Read more...</a>
					</div>
					
					<div id="{{ article[3]['id'] }}" class="abox">
						<div class="fixed">
							<h2>{{ article[3]['headline'] }}</h2>
							
							<p>{{ article[3]['subhead'] }}</p>
						</div>
						<a href="article/{{ article[3]['id'] }}?pID={{pID}}" class="btn btn-primary ">Read more...</a>
					</div>

				</div>

			</div>
			
			%else:
			<div id="acontainer" class="span10 offset2">
				
					<div id="{{ sarticle[0]['id'] }}" class="abox">
						<div class="fixed">
							<h2>{{ sarticle[0]['headline'] }}</h2>
							
							<p>{{ sarticle[0]['subhead'] }}</p>
						</div>
						<a href="article/{{ sarticle[0]['id'] }}?pID={{pID}}&sect={{sect}}" class="btn btn-primary">Read more...</a>
					</div>
					
					<div id="{{ sarticle[1]['id'] }}" class="abox">
						<div class="fixed">
							<h2>{{ sarticle[1]['headline'] }}</h2>
							
							<p>{{ sarticle[1]['subhead'] }}</p>
						</div>
						<a href="article/{{ sarticle[1]['id'] }}?pID={{pID}}&sect={{sect}}" class="btn btn-primary ">Read more...</a>
					</div>
			</div>
			%end
			
		</div>
		
		<!--
			technology 1
			health 2
			science 3
		-->
		<div id="categories" class="row-fluid">
			<div class="span3 offset2">
				<a class="btn btn-danger cat-label" href="?pID={{ pID }}&sect=2" onclick="f.setSection(2)">HEALTH</a>
			</div>
			<div class="span3">
				<a class="btn btn-danger cat-label" href="?pID={{ pID }}&sect=1" onclick="f.setSection(1)">TECHNOLOGY</a>
			</div>
			<div class="span3">
				<a class="btn btn-danger cat-label" href="?pID={{ pID }}&sect=3" onclick="f.setSection(3)">SCIENCE</a>
			</div>
		</div>
		
		<div id="complete" class="row-fluid">
			<div class="span5 offset3">
			<h3>Thank you for testing the BlueReader&#0153;</h3>
			
			<h4>Please <a href="http://umichlsa.qualtrics.com/SE/?SID=SV_23lJ3jVsBI40389&pID={{pID}}&sect={{sect}}">click this link</a> to complete some final questions
				about your experience using the reader.</h4>
			
			</div>
		</div>
		
		
 		<script src="http://code.jquery.com/jquery-latest.js"></script>
		
		<script>
			
		
			var f = ( function() {
			
				var sect = {{ sect }};
				var category = ['TECHNOLOGY','HEALTH','SCIENCE'];
			
			
				//shuffles list in-place
				function shuffle(list) {
					var i, j, t;
					for (i = 1; i < list.length; i++) {
						j = Math.floor(Math.random()*(1+i));  // choose j in [0..i]
							if (j != i) {
							t = list[i];                  // swap list[i] and list[j]
								list[i] = list[j];
								list[j] = t;
							}
					}
					return list;
				}
				
				function setSection(snum) {
					var articles = JSON.parse(localStorage.getItem('{{ pID }}'));
					articles.sect = snum;
					localStorage.setItem('{{ pID }}',JSON.stringify(articles))
				}
				
				
				// --- HANDLE PAGES ---
				var log = localStorage['{{ pID }}'];
			
				if (log==undefined) {
					localStorage.setItem('{{ pID }}',JSON.stringify({"read": []}));
					$('#intro').css('display','block');
					$('#main').css('display','none');
					return;
				} 
					
				
				var arts = $('#acontainer').children();
				
				var articles = JSON.parse(localStorage.getItem('{{ pID }}'));
				
				console.log(articles);
				
				toRead=4;
				
				for (var aidx in articles.read) {
					var article = articles.read[aidx];
					$('#'+article).addClass('read a'+toRead);
					$('#'+article+' a').addClass('disabled');
					$('#'+article+' a').attr('href','#');
					toRead--;
				}
				
				var aclass=1;
				for (var aidx=0; aidx<arts.length; aidx++) {
					if (arts[aidx].getAttribute('class').indexOf('read')==-1) {
						console.log(arts[aidx].getAttribute('class'));
						arts[aidx].setAttribute('class','abox a'+aclass);
						aclass++;
					}
				}				
				
			
				if (toRead > 1) {
					$('#numToRead').html('are ' + toRead);
				} else if (toRead == 0) {
					if (articles.hasOwnProperty('sect')) {
						$('#numToRead').parent().html('Today&apos;s top ' + category[sect-1] + ' articles');
					} else {
						$('#mbar').html('Thanks for reading all 4 articles!');
						$('#acontainer').fadeOut(2000, function() {
							
							$('#mbar').html("Now please select your favorite category");
							$('#mbar').addClass('alert-block');
							$('#categories').css('display', 'block');
						});
					}
					
				} else if (toRead==-2) {
						$('#mbar').html('Thanks for reading the 2 ' + category[sect-1] + ' articles!');
						$('#acontainer').fadeOut(2000, function() {
							$('#mbar').css('display','none');
							$('#complete').css('display','block');
						});
				} else {
					if (articles.hasOwnProperty('sect')) {
						toRead=toRead+2;
					}
					$('#numToRead').html('is ' + toRead);
					if (toRead==1) {
						$('#plural').css('display','none');
					}
				}
				
				
				return {
					setSection: setSection	
				
				}
				
				}).call('this');
			
		</script>
	

	</body>
</html>
