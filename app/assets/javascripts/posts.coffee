already = false
$(document).on "ready page:change", ->
  $("#post_body").keyup ->
    AnalizePostBody($("#post_body").val()) if !already

AnalizePostBody = (body) ->
  youtube_key = body.match /www.youtube.com.watch.v=(\w{11})/
  if youtube_key != null
  	$("#post_media_url").val(youtube_key[1])
  	InsertYoutube($("#media-insert"), youtube_key[1])
  	already = true 
  else
    #Check regex has problems with larg urls
  	url = body.match /\b(([\w-]+:\/\/?|www[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|\/)))/
  	$("#post_media_url").val(url[1])
  	InsertLink($("#media-insert"), url[1])
  	already = true 
  		
  	
InsertLink = (container, url_link) ->
  container.html "<a href='"+url_link+"''>"+url_link+"</a>"

  

InsertYoutube = (container, youtube_key) ->
  container.html "<embed width= '320' height='190' src = 'http://www.youtube.com/v/" + youtube_key + "'>"


#https://www.youtube.com/watch?v=o67XXwVrts4