$(document).ready(function () {
	var navSelected = $('#case-info-button');

	$('#case-info-button').click(function() {
		navSelected.removeClass('nav-selected');
		$(this).addClass('nav-selected');
		navSelected = $(this);
		$('.block-selected').each(function() {
			$(this).removeClass('block-selected');
		});
		$('#case-info-entry').addClass('block-selected');
  	});

	$('#binder-info-button').click(function() {
		navSelected.removeClass('nav-selected');
		$(this).addClass('nav-selected');
		navSelected = $(this);
		$('.block-selected').each(function() {
			$(this).removeClass('block-selected');
		});
		$('#binder-info-entry').addClass('block-selected');
	});

	$('#district-info-button').click(function() {
		navSelected.removeClass('nav-selected');
		$(this).addClass('nav-selected');
		navSelected = $(this);
		$('.block-selected').each(function() {
			$(this).removeClass('block-selected');
		});
		$('#district-info-entry').addClass('block-selected');
	});

	$('#victims-info-button').click(function() {
		navSelected.removeClass('nav-selected');
		$(this).addClass('nav-selected');
		navSelected = $(this);
		$('.block-selected').each(function() {
			$(this).removeClass('block-selected');
		});
		$('#victims-info-entry').addClass('block-selected');
	});

	$('#suspects-info-button').click(function() {
		console.log('inside binder click');
		navSelected.removeClass('nav-selected');
		$(this).addClass('nav-selected');
		navSelected = $(this);
		$('.block-selected').each(function() {
			$(this).removeClass('block-selected');
		});
		$('#suspects-info-entry').addClass('block-selected');
	});

	$('#crime-info-button').click(function() {
		navSelected.removeClass('nav-selected');
		$(this).addClass('nav-selected');
		navSelected = $(this);
		$('.block-selected').each(function() {
			$(this).removeClass('block-selected');
		});
		$('#crime-info-entry').addClass('block-selected');
	});
});
