// flash notice 五秒後消失
$(function () {
  var flashSeconds = 5;

  function removeFlashMessages() {
    $('#flash-message').remove();
  }

  setTimeout(removeFlashMessages, flashSeconds * 1000);
  $(".fav").click(() => {
    $("#starNil").removeClass("star-nil");
    $("#starNil").addClass("star-full");
  })
})