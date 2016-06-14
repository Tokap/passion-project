$(document).ready(function() {
	$("#navbar").on('click', 'li', function(){
		$('.active').removeClass("active");
		$(this).addClass("active");
	});
});
