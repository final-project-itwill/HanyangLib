// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

 $(document).ready(function(){ 
		getGraph2();
	});

  function getGraph2(){
 
	  let sode = document.getElementById("code").value;


	   // alert(code);
	  let iray = [];
	  let sray = [];
	  let rray = [];
	  $.ajax({
		  url:"/survey/pie",
		  type:"get",
		  data:{'c_code': sode},
		  success:function(data){
			  // console.log(data[0].pos_count);
			  // 그래프로 나타낼 자료 리스트에 담기
  			  for (let i = 0; i<data.length;i++){    	
			  iray.push(data[i].i_count);
			  sray.push(data[i].s_count);
			  rray.push(data[i].r_count);
			  } // 누적 신청서 만들고 싶습니다.
			  
				// alert(iray);
				// alert(sray);
				// alert(rray);

				// Pie Chart Example
				var ctx = document.getElementById("myPieChart");
				var myPieChart = new Chart(ctx, {
				  type: 'doughnut',
				  data: {
				    labels: ["신청대기", "가입거절", "회원인원"],
				    datasets: [{
				      data: [iray, sray, rray],
				      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
				      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
				      hoverBorderColor: "rgba(234, 236, 244, 1)",
				    }],
				  },
				  options: {
				    maintainAspectRatio: false,
				    tooltips: {
				      backgroundColor: "rgb(255,255,255)",
				      bodyFontColor: "#858796",
				      borderColor: '#dddfeb',
				      borderWidth: 1,
				      xPadding: 15,
				      yPadding: 15,
				      displayColors: false,
				      caretPadding: 10,
				    },
				    legend: {
				      display: false
				    },
				    cutoutPercentage: 80,
				  },
				});
				
 			}
    	  }) // ajax	  
 	     } // getGraph
