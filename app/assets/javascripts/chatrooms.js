var h = new Object();
var refresh_map = false;
// Start Collaboration
var cid = document.test.cid.value; 
var users = new Object();
command = "users."+ document.test.uid.value+"='"+ "Online" + "'";
eval(command);

MyWebSocket = new ShareServer({
		uid:  document.test.uid.value,
		crypto: document.test.crypto.value,
		// SocketURL: 'ws://5073.yworld.com:15073/websocket/',
		contact_callback: function(uid_array,status){
			message = uid_array+' '+status;
			html =  '<div class="alert alert-info fade in alert-message"><button type="button" class="close" data-dismiss="alert">&times;</button>' + message + '</div>';
			// html =  html + "" + message + ;
			$('#alert-box').html(html);
			$(".alert-message").delay(1000).fadeOut("slow", function () { $(this).remove(); });

      if(!(uid_array.toString()=="")){
  			for (var i=0;i<uid_array.length;i++)
  			{ 
  				command = "users."+uid_array[i]+"='"+ status + "'";
  				eval(command);
  			}

        user_list_html = "";
        for (user in users)
        {
          user_list_html = user_list_html + "<li> " +  user + ": " + users[user] + "</li>";
        } 
        $("#user_list ul").html(user_list_html);
      }

			
		}
});


var param={
	CollaborationID: cid,
	id_callback: function(id){document.test.cid.value=id;},
	Message_Callback: function(m,u){

		try{
			message = JSON.parse(m);
			switch(message[0]["type"])
			{
				case "chat":
				  // execute code block 1
				  chat = '<strong>' + u  +':</strong>  ' + message[0]["data"] + "</br>";
				  $('#chat_area').append(chat); 
				  break;
				case "location":
				  // execute code block 2
          if(users[u] == "Online"){
  				  h[u] = message[0]["data"];
  				  if(refresh_map == true){
  				  	refreshMap();	
  				  }
          }
				  break;
				default:
				  
			}
		}catch(err){

		}
		
	},
	// Start: document.test.C_S.value,Finish:document.test.C_F.value,
	// Permissions:document.test.permit.value,
	participant_callback: function(obj){
		alert('hello');
		for(var count=0;count<obj.lenth;count++){
			// alert('UID: '+obj[count].uid+' Permission: '+obj[count].Permission);
			alert(obj);
			// user = obj[count].uid + '</br>'
			// $('#side_bar').append(user);
		}
	}
};

if(document.test.cid.value.length==0){
	param.CollaborationID=null;
}

MyWebSocket.Register(param);

function refreshMap(){
  refresh_map = true;
  loc_array = [];
  for (x in h)
  {
  	//txt = txt + h[x];
  	//console.log(x)
  	loc_array.push(h[x]);
  }	
  initialize(loc_array, "mapholder");
}


$(document).ready(function() {
	$("#refresh_map").click(function(){
		refreshMap();		
	})

	getLocation();
    setTimeout(function (){
    	refreshMap();
    	
    }, 1000); // how long do you want the delay to be? 

	$("#hangup").click(function(){
		MyWebSocket.Disconnect();
	});

   $('#csend').click(function(){
   		message = JSON.stringify([{"type": "chat", "data": document.test.cmsg.value}]);
   		MyWebSocket.Sender(document.test.cid.value, message);
   })

    
});



var x=document.getElementById("coordinates");
function getLocation()
{	
	if (navigator.geolocation)
	{
	navigator.geolocation.watchPosition(showPosition);
	}
	else{x.innerHTML="Geolocation is not supported by this browser.";}

}
function showPosition(position)
{
  var uid = document.test.uid.value;

  var lat_old = parseFloat($('#lat').attr('value'));
  var lng_old = parseFloat($('#lng').attr('value'));

  var lat_new = position.coords.latitude;
  var lng_new = position.coords.longitude;

  var latlng_new = new google.maps.LatLng( lat_new, lng_new );
  var latlng_old =  new google.maps.LatLng( lat_old , lng_old );
  $('#lat').attr('value', lat_new);
  $('#lng').attr('value', lng_new);
  if (google.maps.geometry.spherical.computeDistanceBetween(latlng_new, latlng_old) > 1) {
   	data = [uid, lat_new, lng_new, 4, uid]
	message = JSON.stringify([{"type": "location", "data": data}]);
	MyWebSocket.Sender(document.test.cid.value, message);	
  }

 //    data = [uid, lat_new, lng_new, 4]
	// message = JSON.stringify([{"type": "location", "data": data}]);
	// MyWebSocket.Sender(document.test.cid.value, message);

}

function initialize(landmarks, map_id) {
  center = get_center(landmarks)
  var myOptions = {
    // zoom: 15,
    center: new google.maps.LatLng(center[0], center[1]),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById(map_id),
                                myOptions);
  setMarkers(map, landmarks);

  // map: an instance of google.maps.Map object
  // latlng: an array of google.maps.LatLng objects
  var latlngbounds = new google.maps.LatLngBounds( );
  for ( var i = 0; i < landmarks.length; i++ ) {
    latlng = new google.maps.LatLng( landmarks[i][1],landmarks[i][2] )
    latlngbounds.extend(latlng);
  }
  map.fitBounds( latlngbounds );
}



function get_center(landmarks){
  length = landmarks.length;
  sum_lat = 0;
  sum_lng = 0;
  for (i=0; i<length; i++)
  {
    sum_lat = sum_lat + landmarks[i][1];
    sum_lng = sum_lng + landmarks[i][2];
  }
  return [sum_lat/length, sum_lng/length];
}

function setMarkers(map, locations) {
  // Add markers to the map

  // Marker sizes are expressed as a Size of X,Y
  // where the origin of the image (0,0) is located
  // in the top left of the image.

  // Origins, anchor positions and coordinates of the marker
  // increase in the X direction to the right and in
  // the Y direction down.
  var image = new google.maps.MarkerImage('/beachflag.png',
      // This marker is 20 pixels wide by 32 pixels tall.
      new google.maps.Size(20, 32),
      // The origin for this image is 0,0.
      new google.maps.Point(0,0),
      // The anchor for this image is the base of the flagpole at 0,32.
      new google.maps.Point(0, 32));
  var shadow = new google.maps.MarkerImage('/beachflag_shadow.png',
      // The shadow image is larger in the horizontal dimension
      // while the position and offset are the same as for the main image.
      new google.maps.Size(37, 32),
      new google.maps.Point(0,0),
      new google.maps.Point(0, 32));
      // Shapes define the clickable region of the icon.
      // The type defines an HTML &lt;area&gt; element 'poly' which
      // traces out a polygon as a series of X,Y points. The final
      // coordinate closes the poly by connecting to the first
      // coordinate.
  var shape = {
      coord: [1, 1, 1, 20, 18, 20, 18 , 1],
      type: 'poly'
  };
  for (var i = 0; i < locations.length; i++) {
    var beach = locations[i];
    var myLatLng = new google.maps.LatLng(beach[1], beach[2]);
    var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        shadow: shadow,
        icon: image,
        shape: shape,
        title: beach[0],
        zIndex: beach[3]
    });
    marker.setTitle((beach[4]));
    google.maps.event.addListener(marker, 'click', function(){
      window.location = beach[5];
    });
  }
}
