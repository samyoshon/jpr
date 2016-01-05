
$(document).ready(function(){
	$('.jobs-list-header').click(function(){
		var idContainer = this.id;
		$('.jobs-list-container-' + idContainer).toggleClass("container-active");
		$('#jobs-list-hidden-' + idContainer).slideToggle("fast");
	});

	$('.edit-collapse').click(function(){
		$('.edit-collapse-hidden').hide();
		var idContainer = this.id;
		$('#collapse-' + idContainer).show();
	});
});

//Added 'Page:Load' because Turbolinks screws up JS when using link_to

$(document).on('page:load',function(){
	$('.jobs-list-header').click(function(){
		var idContainer = this.id;
		$('.jobs-list-container-' + idContainer).toggleClass("container-active");
		$('#jobs-list-hidden-' + idContainer).slideToggle("fast");
	});

	$('.edit-collapse').click(function(){
		$('.edit-collapse-hidden').hide();
		var idContainer = this.id;
		$('#collapse-' + idContainer).show();
	});
});