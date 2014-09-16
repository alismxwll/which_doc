$(function () {
  $('.edit_answer input[type=radio]').click(function () {
    $(this).parent('form').submit();
  });
});
