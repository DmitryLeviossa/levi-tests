$(document).ready(function() {
	$(document).on('click', '.public-page-url-btn', function (e) {
		const notice = $('#notice');
		let timeoutId;

		if (navigator.clipboard) {
			navigator.clipboard.writeText(e.target.dataset['link'])
				.then(function() {
					notice.text('Successufully copied link to clipboard');
				})
				.catch(function() {
					notice.text('Couldn\'t copy link to clipboard');
				})
				.finally(function() {
					clearTimeout(timeoutId);
					timeoutId = setTimeout(function() {
						notice.text('')
					}, 3000)
				});
		}
	});
});