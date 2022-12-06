
   	
   	function responseProc(result) {
   		var A = result;
   		// alert(A);
   		// 객관식 
   		if(A=="gaek"){
	   		$("#display").html("<div class='buttons'>"
	   							+"<input type='radio' name='radio' readonly><input type='text' name='buttons'> <input type='button' class='btnAdd' value='Add'><br>"
	   							+"</div>"
	   							)// #display end
		   		$('.btnAdd').click (function () {
		   			$('.buttons').append (
		   						'<input type="radio" name="radio" readonly><input type="text" name="txt"><input type="button" class="btnRemove" value="Remove"><br>'
		   						); // end append	
		   			$('.btnRemove').on('click', function () { 
			              $(this).prev().remove (); // remove the textbox
			              $(this).prev().remove (); // remove the textbox
			              $(this).next ().remove (); // remove the <br>
			              $(this).remove (); // remove the button
			         			 }); // btnRemove end
		   		}) // btnAdd.click end
	   	// 주관식 
   		} else if (A=="ju") {
   			$("#display").html("<div class='buttons'>"
								+"<input type='text' name='ju' readonly>"
								+"</div>"
								)// #display end
			
		// 체크박스 
   		}if(A=="check"){
	   		$("#display").html("<div class='buttons'>"
	   							+"<input type='checkbox' name='check'readonly><input type='text' name='buttons'> <input type='button' class='btnAdd' value='Add'><br>"
	   							+"</div>"
	   							)// #display end
	  	 		$('.btnAdd').click (function () {
	   				$('.buttons').append (
	   							'<input type="checkbox" name="txt"readonly><input type="text" name="txt"><input type="button" class="btnRemove" value="Remove"><br>'
	   							); // end append	
	   			$('.btnRemove').on('click', function () { 
		              $(this).prev().remove (); // remove the textbox
		              $(this).prev().remove (); // remove the textbox
		              $(this).next ().remove (); // remove the <br>
		              $(this).remove (); // remove the button
		        	  }); // btnRemove end
	   			}) // btnAdd.click end		
			
		// 시간 
   		} else if (A=="time") {
   			$("#display").html("<div class='buttons'>"
								+"<input type='time' name='time' readonly>"
								+"</div>"
   								)// #display end 		
   		// 날짜
   		} else if (A=="date") {			
   			$("#display").html("<div class='buttons'>"
								+"<input type='date' name='date' readonly>"
								+"</div>"   		
   								)// #display end
   		}// if end
   	}// responseProc() end
   	