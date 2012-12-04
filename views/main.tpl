<!DOCTYPE html>
<html>
	<head>
		<title>NERD Social Reader</title>
		
		<meta charset="utf-8"/>
		
		<link href="/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="/css/bootstrap-responsive.css" rel="stylesheet">		
		
		<style type="text/css">
		  body {
			padding-top: 60px;
			padding-bottom: 40px;
		  }
		  
		  .abox {
		  	border: 1px solid black;
		  	padding: 10px;
		  	
		  }
		  
		  .arow {
		  	padding-top: 30px;
		  	
		  	}
		  
		  .fixed {
		  	height: 200px;
		  	}
		  
		  .read {
		  	color: #a0a0a0;
		    background-color: #f0f0f0;
		  }	
		  
		  
    	</style>
		
		
	</head>
	<body>


    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">NEWS SOXREADER</a>
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
        </div>
      </div>
    </div>

		
		<div class="container">
			
			<div class="alert alert-success">
			There <span id="numToRead"></span> new articles for you to read!
			</div>
	
	
		
			<div class="row arow">
				<div id="{{ article[0]['id'] }}" class="span5 offset1 abox">
					<div class="fixed">
						<h2>{{ article[0]['headline'] }}</h2>
						
						<p>{{ article[0]['subhead'] }}</p>
					</div>
					<a href="article/{{ article[0]['id'] }}?pID={{pID}}" class="btn btn-primary">Read more...</a>
				</div>
				
				<div id="{{ article[1]['id'] }}" class="span5 abox">
					<div class="fixed">
						<h2>{{ article[1]['headline'] }}</h2>
						
						<p>{{ article[1]['subhead'] }}</p>
					</div>
					<a href="article/{{ article[1]['id'] }}?pID={{pID}}" class="btn btn-primary ">Read more...</a>
				</div>
			</div>
			
			<div class="row arow">

				<div id="{{ article[2]['id'] }}" class="span5 offset1 abox">
					<div class="fixed">
						<h2>{{ article[2]['headline'] }}</h2>
						
						<p>{{ article[2]['subhead'] }}</p>
					</div>
					<a href="article/{{ article[2]['id'] }}?pID={{pID}}" class="btn btn-primary">Read more...</a>
				</div>
				
				<div id="{{ article[3]['id'] }}" class="span5 abox">
					<div class="fixed">
						<h2>{{ article[3]['headline'] }}</h2>
						
						<p>{{ article[3]['subhead'] }}</p>
					</div>
					<a href="article/{{ article[3]['id'] }}?pID={{pID}}" class="btn btn-primary ">Read more...</a>
				</div>

			</div>
			
		</div>
		
 		<script src="http://code.jquery.com/jquery-latest.js"></script>
		
		<script>
		
			( function() {
			
				var log = localStorage['{{ pID }}'];
			
				if (log==undefined) {
					localStorage.setItem('{{ pID }}',JSON.stringify({"read": []}));
				}
				
				var articles = JSON.parse(localStorage.getItem('{{ pID }}'));
				
				console.log(articles);
				
				toRead=4;
				
				for (var aidx in articles.read) {
					var article = articles.read[aidx];
					$('#'+article).addClass('read');
					$('#'+article+' a').addClass('disabled');
					$('#'+article+' a').attr('href','#');
					toRead--;
				}
			
				if (toRead > 1) {
					$('#numToRead').html('are ' + toRead);
				} else if (toRead == 0) {
					$('#numToRead').parent().html('Thanks for reading all 4 articles!')
				} else {
					$('#numToRead').html('is ' + toRead);
				}
							
			}).call('this');
			
		</script>
	

	</body>
</html>