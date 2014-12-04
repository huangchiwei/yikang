function prevTimers() {
	return allTimers().slice( 0,$('#pagers a.selected').index());
}
function allTimers() {
	return $('#pagers a span');
}

$(function() {
	$('#carousels').carouFredSel({
		items: 1,
		auto: {
			pauseOnHover: 'resume',
			progress: {
				bar: '#pagers a:first span'
			}
		},
		scroll: {
			fx: 'crossfade',
			duration:300,
			timeoutDuration:5000,
			onAfter: function() {
				allTimers().stop().width( 0 );
				prevTimers().width( 160 );
				$(this).trigger('configuration',[ 'auto.progress.bar','#pagers a.selected span']);
			}
		},
		pagination: {
			container: '#pagers',
			anchorBuilder: false
		}
	});
});
