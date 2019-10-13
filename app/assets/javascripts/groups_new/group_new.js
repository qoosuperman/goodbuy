$(function(){
  var $li = $('ul.tab-title li');
  $($li. eq(0) .addClass('active').find('a').attr('href')).siblings('.tab-inner').hide();
  
  $li.click(function(e){
    e.preventDefault();
    $($(this).find('a'). attr ('href')).show().siblings ('.tab-inner').hide();
    $(this).addClass('active'). siblings ('.active').removeClass('active');
  });

  $('.photo-upload-phone').change(function() {
    var i = $(this).prev('label').clone();
    var file = $('.photo-upload-phone')[0].files[0].name;
    $(this).prev('label').text(file);
  });

  $('.photo-upload-pc').change(function() {
    var i = $(this).prev('label').clone();
    var file = $('.photo-upload-pc')[0].files[0].name;
    $(this).prev('label').text(file);
  });

});