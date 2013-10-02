(function() {
	$(document).ready(function() {
	  $('body').addClass('js');
	  var $menu = $('#top-menu'),
		$menulink = $('.menu-link');

	$menulink.click(function() {
	  $menulink.toggleClass('active');
	  $menu.toggleClass('top-menu-active');
	  
	  return false;
	});});

})();