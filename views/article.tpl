
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
		  	height: 300px;
		  }
		  
		  .arow {
		  	padding-top: 30px;
		  	
		  	}
		  
		  .fixed {
		  	height: 250px;
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
          <a class="brand" href="/?pID={{pID}}">NEWS SOXREADER</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li><a href="/?pID={{pID}}">Home</a></li>
              <li class="active"><a href="#about">Articles</a></li>
              <li><a href="#contact">Contact</a></li>
              
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
			
	
			<div class="row">
				
				<div class="offset1 span7">
							<h2>{{ article['headline'] }}</h2>
		
		 					{{!article['body']}}			
				
				</div>
				
				<div class="span2" style="text-align: center">
					<div class="well">Share this with some of your friends</div>
					<br/>
					
					<a class="btn btn-info" onclick="this.setAttribute('class','btn btn-success disabled')"><i class="icon-user"></i> Joe</a>
					<br/>
					<br/>
					<a class="btn btn-info" onclick="this.setAttribute('class','btn btn-success disabled')"><i class="icon-user"></i> Mary</a>
					<br/>
					<br/>
					<a class="btn btn-info" onclick="this.setAttribute('class','btn btn-success disabled')"><i class="icon-user"></i> Frank</a>
					<br/>
					<br/>
					<a class="btn btn-info" onclick="this.setAttribute('class','btn btn-success disabled')"><i class="icon-user"></i> Raymond</a>

				</div>

			</div>
		
		</div>

		<script>
		( function() {
		
			var aidx = "{{ article['aidx'] }}";
			var articles = JSON.parse(localStorage.getItem("{{ pID }}"));
			
			
			if (articles.read.indexOf(aidx) == -1) {
				articles.read.push(aidx);
				localStorage.setItem("{{ pID }}", JSON.stringify(articles));
			}
		
		}).call('this');

		</script>

	</body>
</html>