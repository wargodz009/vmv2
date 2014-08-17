$(document).ready(function(){
	$("a.crud-action[href='#']").remove();
	$("a.open_new_popup").click(function(e){
		e.preventDefault();
		window.open($(this).attr('href'),null,"height=535,width=880,status=no,toolbar=no,menubar=no,location=no");
	});
	$("div.item_holder").dbclick(function(e){
		e.preventDefault();
		$(this).html('');
	});
	$('a.confirm').click(function(e){
		e.preventDefault();
		var question = ($(this).prop('rel')?$(this).prop('rel'):'are you sure?');
		if(confirm(question)){
			window.location.assign($(this).prop('href'));
		}
	});
});