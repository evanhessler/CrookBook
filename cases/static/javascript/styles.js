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

	var addAnotherBlock = $('.add-another-block').html()

	$(".add-another-button").click(function() {
		$(this).parent().parent().find('.add-another-block').append('<div class="col-xs-12 divider"></div>' + addAnotherBlock);
	});

	$('#generate-report-button').click(function() {
		generatePDF($(document).find('table'));
	});

	// Attributes in detail-entry made editable
	$('#case-edit').click(function() {
		$(document).find('#case-input').children('input').each(function() {
			$(this).attr("readonly", false);
		});
		$(document).find('#case-input').children('select').each(function() {
			$(this).attr("disabled", false);
		});
	});

	$('#binder-edit').click(function() {
		$(document).find('#binder-input').children('input').each(function() {
			$(this).attr("readonly", false);
		});
		$(document).find('#binder-input').children('select').each(function() {
			$(this).attr("disabled", false);
		});
	});

	$('#district-edit').click(function() {
		$(document).find('#district-input').children('input').each(function() {
			$(this).attr("readonly", false);
		});
		$(document).find('#district-input').children('select').each(function() {
			$(this).attr("disabled", false);
		});
	});

	$('#crime-edit').click(function() {
		$(document).find('#crime-input').children('input').each(function() {
			$(this).attr("readonly", false);
		});
		$(document).find('#crime-input').children('select').each(function() {
			$(this).attr("disabled", false);
		});
	});
});

// If we wait for the DOM to load, theres a delay in highlighting the anchors
const highlightNavAnchor = function() {
	if (window.location.pathname == '/advancedSearch/') {
		$('#adv-search-nav').css("color", "white");
	} else if (window.location.pathname == '/add/') {
		$('#add-entry-nav').css("color", "white");
	}
};

highlightNavAnchor();
