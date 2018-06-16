//			var sc = $('#seat-map');

			function getSeatsBySection(sectionId) {
				$.ajax({
					url: "/seat/"+sectionId,
					contentType: "application/json",
					success: function(msg){
						
						$('#seatBox').empty();

						for (var i = 0; i < msg.length; i++) {
							
							var newCheckbox = document.createElement("input");
							newCheckbox.type = "checkbox";
							newCheckbox.name = "testt";
							newCheckbox.disabled = !msg[i].available;
							newCheckbox.value = msg[i].id;//document.getElementById("checkboxName").value;
//							newCheckbox.htmlFor = msg[i].name;
//							document.getElementById("seatBox").appendChild(newCheckbox);
							
							var label = document.createElement('div');
						    label.className = "checkbox-container";
						    label.appendChild(newCheckbox);
						    label.appendChild(document.createTextNode(msg[i].name));

						    document.getElementById("seatBox").appendChild(label);
//						    document.getElementById("seatBox").appendChild(newCheckbox);
							
							/*if (!msg[i].available) {
								sc.get([ msg[i].name ]).status('unavailable');
							} else {
								sc.get([ msg[i].name ]).status('available');
							}*/
						}
					}
				});
			};
/*			function getSeatsBySection(sectionId) {
				selectedSection = sectionId;
				firstSeatLabel = 1;
				$.ajax({
				     url: "/seat/"+sectionId,
				     contentType: "application/json",
				     success: function(msg){
//				       $("#results").html(msg);
				    	 previousSeats = availableSeats;
				    	 if(availableSeats != null) {
				    		 disablePrevSeats(availableSeats);
				    	 }
				    	 availableSeats = msg;
				    	 if(sectionId == 1) {
				    		 
				    		 $("#seat-map-2").addClass("disabledbutton");
				    		 $("#seat-map").removeClass("disabledbutton");
//				    		 document.getElementById("#seat-map-2").disabled = true;
//				    		 document.getElementById("#seat-map").disabled = false;
				    		 prepareChart(sectionId, availableSeats);
				    	 } else {
//				    		 document.getElementById("#seat-map-2").disabled = false;
//				    		 document.getElementById("#seat-map").disabled = true;
				    		 $("#seat-map").addClass("disabledbutton");
				    		 $("#seat-map-2").removeClass("disabledbutton");
				    		 prepareChartFor2(sectionId, availableSeats);
				    	 }
				    	 for (var i = 0; i < msg.length; i++) {
									if(!msg[i].available) {
										sc.get([msg[i].name]).status('unavailable');
									} else {
										sc.get([msg[i].name]).status('available');
									}
							}
				     }
				   });
			};
*/			
/*			function disablePrevSeats(availableSeats) {

		    	 for (var i = 0; i < availableSeats.length; i++) {
		    		 if(availableSeats[i] != 'undefined') {
		    			 if(document.getElementById(availableSeats[i].name) != null) {
		    				 document.getElementById(availableSeats[i].name).remove();
		    			 }
		    		 }
					}
			}

*/