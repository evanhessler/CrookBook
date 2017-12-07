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
		generatePDF($(document).find('table').parent()[0]);
	});

	$('#generate-details-report-button').click(function() {
		result = $('<div></div>');
		$('.panel').clone().each(function() {
			$(this).find('.panel-heading').each(function() {
				$(this).remove();
			});

			$(this).find('p').each(function() {
				var val = $(`<h3>` + $(this).text() + `</h3>`);
				$(this).after(val);
				$(this).remove();
			});

			$(this).find('input').each(function() {
				var val = $(`<p>` + $(this).val() + `</p>`);
				$(this).after(val);
				$(this).remove();
			});

			$(this).find('h3').each(function() {
				var index = $(this).index();
				var data = `<b><p>` + $(this).text() + ` :</b> ` + $($(this).parent().siblings()[0]).find(`p:eq(` + index + `)`).text() + `</p>`;
				result.append(data);
			})
		});
		generatePDF(result.html());
	})

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

	// Changes 'Evidence Destroyed' options on details page on load
    //
    // if ($('#evidence_destroyed_input').text() == 'True') {
	// 	$('#evidence_destroyed_input').after('<option value="False">False</option>');
	// } else {
	// 	$('#evidence_destroyed_input').after('<option value="True">True</option>');
	// }

	$('#suspect-edit').click(function() {
		$(document).find('#suspect-input').children('input').each(function() {
			$(this).attr("readonly", false);
		});
		$(document).find('#suspect-input').children('select').each(function() {
			$(this).attr("disabled", false);
		});
	});
	$('#victim-edit').click(function() {
		$(document).find('#victim-input').children('input').each(function() {
			$(this).attr("readonly", false);
		});
		$(document).find('#victim-input').children('select').each(function() {
			$(this).attr("disabled", false);
		});
	});

	var homepageTableUnfiltered = $('#database').html();

	$('#search-button').click(function() {
		$('#database').html(homepageTableUnfiltered);
		var val = $('#search-val').val().toUpperCase();
		if (val != '') {
			$('#database tbody tr').each(function() {
				if ($(this).text().toUpperCase().indexOf(val) == -1) {
					$(this).remove();
				}
			});
		}
	})
});

// If we wait for the DOM to load, theres a delay in highlighting the anchors
const highlightNavAnchor = function() {
	if (window.location.pathname == '/advancedSearch/') {
		$('#adv-search-nav').css("color", "white");
	} else if (window.location.pathname == '/add/') {
		$('#add-entry-nav').css("color", "white");
	} else if (window.location.pathname == '/') {
		$('#home-nav').css("color", "white");
	}
};

highlightNavAnchor();
