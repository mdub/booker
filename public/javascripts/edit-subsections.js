$(document).ready(function() {

  $(".subsections li a").after(" <span class='edit'>edit</span>");

  $(".subsections li .edit").live("click", function() {
    link = $(this).prev();
    link.attr("contentEditable", true);
    link.focus();
  });

});
