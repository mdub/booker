// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {

  var ckeditorConfig = {
    toolbar: [
      ['Save'],
      ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord'],
      ['SelectAll'],
      ['Undo', 'Redo'],
      ['Find', 'Replace'],
      ['ShowBlocks', 'Source'],
      ['Maximize'],
      ['About'],
      '/',
      ['Bold', 'Italic', 'Underline', '-', 'RemoveFormat'],
      ['Styles', 'Format'],
      ['Link'],
    ]
  };

  $(window).load(function() {
    $('textarea.editor').each(function() {
      CKEDITOR.replace(this, ckeditorConfig);
    });
  });

});
