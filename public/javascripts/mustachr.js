$(function() {
	var loved = false;
	$("#love").love();
});

jQuery.fn.love = function() {
	love = false;
	this.hover(
		function(){ love = true;$(this).pulsate('12px', '10px'); },
		function(){ love = false;$(this).css({ 'font-size': '10px' }); }
	);
}

jQuery.fn.pulsate = function(big, small) {
	this.css({ 'font-size': small });
	if(love) {
		setTimeout("$('#" + this.attr('id') + "').css({ 'font-size': '" + big + "'  })", 500);
		setTimeout("$('#" + this.attr('id') + "').pulsate('" + big + "', '" + small + "')", 800);
	}
}

// tacks the given format onto the given URL, i.e.
//   formatify('http://www.example.com/pages?page=mypage', 'json') => 'http://www.example.com/pages.json?page=mypage'
function formatify(url, format) {
  return url.replace(/^([^\?#]*)(.*)$/, "$1." + format + "$2");
}
