(function(window, $, undefined) {
	'use strict';

	function loadVideo() {
		var $container = $(this);
		$container.addClass('playing');

		var $placeholder = $container.find('.player-placeholder');
		$placeholder.attr('id', 'video'+Math.floor(Math.random()*10000));

		new window.YT.Player($placeholder.attr('id'), {
			videoId: $placeholder.attr('data-video-id'),
			playerVars: {
				autoplay: 1
			}
		});

		return false; //stop prop and prev def
	}

	function init() {
		// only load youtube API if it's required
		if ($(".video-container").length || $(".video-header").length){
			// Load the Youtube IFrame Player API code asynchronously.
			var tag = document.createElement('script');
			tag.src = 'https://www.youtube.com/player_api';
			var firstScriptTag = document.getElementsByTagName('script')[0];
			firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

			// bind
			$('.content-block').on('click', '.video-container', loadVideo);
			$('.container').on('click', '.video-header', loadVideo);
		}

		// add jquery external selector
		$.expr[':'].external = function(obj){
			return !obj.href.match(/^mailto\:/)
				&& (obj.hostname != location.hostname)
				&& !obj.href.match(/^javascript\:/)
				&& !obj.href.match(/^$/)
		};
		// add target blank to external links in primary content
		$(".primary-content a:external").attr("target", "_blank");

		$(".week").on("click", "div.cal-1", function(){
			var date = $(this).attr("data-attr-date");
			var url = "/calendar/" + date;

			if (url !== window.location.pathname){
				$(".today").removeClass("today");
				$(this).addClass('today');
				// scroll first so it looks smoother :)
				$('html, body').animate({
					scrollTop: 0 // not: $(".page-header").eq(0).offset().top because of floating navbar
				}, 300);
				// load events
				$.get(url, function(output){
					window.history.pushState({}, "", url);
					$(".page-header").html(output);
				});
			}
		});
	}

	$(init);
}(window, jQuery));

var isValidDeck = function(deckJSON){
	return true;
}