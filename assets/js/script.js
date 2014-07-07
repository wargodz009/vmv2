$(document).ready(function(){
	//remove button to set returned
	$("a.crud-action[href='#']").remove();
	$('a.confirm').click(function(e){
		e.preventDefault();
		var question = ($(this).prop('rel')?$(this).prop('rel'):'are you sure?');
		if(confirm(question)){
			window.location.assign($(this).prop('href'));
		}
	});
});