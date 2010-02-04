// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

CKEDITOR.addStylesSet('LP', [

  // Inline Styles
  { name: 'POI', element: 'span', attributes: { 'class' : 'poi' }, styles: { 'color' : 'green' }}

]);

$(function() {

  var ckeditorConfig = {

    resize_minWidth: 600,
    resize_minHeight: 350,
    height: 400,
    
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
    ],
    
    stylesCombo_stylesSet: 'LP'
    
  };

  $(window).load(function() {
    $('textarea.editor').each(function() {
      CKEDITOR.replace(this, ckeditorConfig);
    });
  });

});
