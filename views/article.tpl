
<!DOCTYPE html>
<html>
	<head>
		<title>University of Michigan - BlueReader&#0153;</title>
		
		<meta charset="utf-8"/>
		
		<link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="../css/bootstrap-responsive.css" rel="stylesheet">			
		
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
		  	
		  .brand {
		  	background-color: #9090ff;
		  	color: black;
		  	}
		  
		  
		  .friend {
		  	display: both;
		  	min-width: 50%;
		  	margin-bottom: 12px;
		  	
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
         
          
          %if sect:
          	<a class="brand" href="/socread/?pID={{pID}}&sect={{sect}}">
          %else:
          	<a class="brand" href="/socread/?pID={{pID}}">
          %end
                   	BlueReader&#0153;</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li>
              %if sect:
              	<a href="/socread/?pID={{pID}}&sect={{sect}}">
              %else:
              	<a href="/socread/?pID={{pID}}">
              %end
              	Home</a></li>
              <li class="active"><a href="#about">Articles</a></li>
              <li><a href="#contact">Contact</a></li>
              
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

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	
		
		<div class="container">
			
	
			<div class="row">
				
				<div class="offset1 span7">
							<h2>{{ article['headline'] }}</h2>
		
		 					{{!article['body']}}			
				
				</div>
				
				<div class="span3" style="text-align: center">
					<div class="well">Share this with some of your friends</div>
					
					%for fshare in friends:
						<a class="btn btn-info friend" onclick="f.share(this,'{{ fshare[0] }}')"><i class="icon-user"></i> {{ fshare[1] }}</a>
					%end
					
					
					<br/>
					
						<div class="well">
						Search for other friends:
						  <input type="text" class="span2 search-query" id="search" name="search"
							         data-provide="typeahead" data-items="4" />
						  <button onclick="f.addName($('#search').val())" title="Share"><i class="icon-share" ></i></button>
						</div>

						<script>  
						  var names = {{![f[1].encode(errors='ignore') for f in fnames]}};
						  var namesID = {{![f[0].encode(errors='ignore') for f in fnames]}};
						  
						  $('#search').typeahead({
							    minLength: 1,
							    source: names
						 });
						</script>

						<div id="shareList">
						</div>

				</div>

				

			</div>
		
		</div>

		<script>
		var f = ( function() {
		
			var aidx = "{{ article['aidx'] }}";
			var articles = JSON.parse(localStorage.getItem("{{ pID }}"));
			
			
			if (articles.read.indexOf(aidx) == -1) {
				articles.read.push(aidx);
				localStorage.setItem("{{ pID }}", JSON.stringify(articles));
			}
			
			function addName(name) {
			
				if (names.indexOf(name)!=-1) {
					var html ='<a class="btn btn-success disabled friend"><i class="icon-user"></i>' + name + '</a>';
					
					$('#shareList').prepend(html);
					
					var nidx = names.indexOf(name);
					
					// use nidx to get id of share
					

					data = {'pID': '{{ pID }}',
						    'aidx': aidx,
						    'type': 'search',
						    'friendID': namesID[nidx] };
					
					$.post('/logShare', JSON.stringify(data),
						function(data) {
							//$('#completion #code').empty().append(data);
							console.log(data);
					});
					
					
					names.splice(nidx,1);
					namesID.splice(nidx,1);
					
					$('#search').val('');
					
				}
			}
			
			function share(elem, nameID) {
				elem.setAttribute('class','btn btn-success disabled friend');
				
				data = {'pID': '{{ pID }}',
						    'aidx': aidx,
						    'type': 'share',
						    'friendID': nameID };
					
					$.post('/logShare', JSON.stringify(data),
						function(data) {
							//$('#completion #code').empty().append(data);
							console.log(data);
					});
				
			}
			
			return {
				addName: addName,
				share: share
			}
		}).call('this');

		</script>

	</body>
</html>
