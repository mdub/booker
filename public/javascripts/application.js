// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {

	var ckeditorConfig = {
		toolbar: 
		[
			['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink'],
			['UIColor']
		]
	};

  $(window).load(function() {
    $('textarea.editor').ckeditor(ckeditorConfig);
  });

});
