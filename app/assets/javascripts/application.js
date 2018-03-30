// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require lib/jquery.min
//= require rails-ujs
//= require turbolinks
//= require lib/moment.min
//= require fullcalendar.min
//= require locale/ja
//= require jquery-tablesorter
//= require_tree .

$(function() {
  $('.flash').fadeOut(3000);

});

function dropdownfunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

window.onclick = function(event) {
  if (!event.target.matches('.arrow-down')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for(i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}

$(document).ready(function(){

	//Check to see if the window is top if not then display button
	$(window).scroll(function(){
		if ($(this).scrollTop() > 500) {
			$('?').fadeIn();
		} else {
			$('?').fadeOut();
		}
	});

	//Click event to scroll to top
	$('.add').click(function(){
		$('html, body').animate({scrollTop : 0},800);
		return false;
	});

});

/////////////////////
// Side Navigation //
/////////////////////
/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
function openNav() {
    document.getElementById("SideNav").style.width = "32%";
    document.getElementById("topbar").style.width = "0";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
function closeNav() {
    document.getElementById("SideNav").style.width = "0";
    document.getElementById("topbar").style.width = "32%";
}
$(document).click(function(event) {
  // event.targetをjQueryオブジェクトに変換する
  // closest()を使って自分から先祖要素までinnerクラスがある要素を選択する
  if(!$(event.target).closest('.sidenav').length) {

  }
});
///////////
// Modal //
///////////
$(document).click(function(event) {
  // event.targetをjQueryオブジェクトに変換する
  // closest()を使って自分から先祖要素までinnerクラスがある要素を選択する
  if(!$(event.target).closest('.modal-content').length) {
    document.getElementById('id05').style.display='none';
  }
});

$(document).click(function(event) {
  // event.targetをjQueryオブジェクトに変換する
  // closest()を使って自分から先祖要素までinnerクラスがある要素を選択する
  if(!$(event.target).closest('.modal-content').length) {
    document.getElementById('id02').style.display='none';
  }
});
