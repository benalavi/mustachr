$(function() {
	var loved = false;
	$("#love").love();
});

jQuery.fn.love = function() {
	this.hover(
		function(){ loved = true;pulsate(); },
		function(){ loved = false;$(this).css({ 'font-size': '10px' }); }
	);
}

function pulsate() {
	if(loved) {
		$('#love').css({ 'font-size': '12px' });
		setTimeout("$('#love').css({ 'font-size': '10px' })", 500);
		setTimeout('pulsate()', 800);
	}
}

// tacks the given format onto the given URL, i.e.
//   formatify('http://www.example.com/pages?page=mypage', 'json') => 'http://www.example.com/pages.json?page=mypage'
function formatify(url, format) {
  return url.replace(/^([^\?#]*)(.*)$/, "$1." + format + "$2");
}
