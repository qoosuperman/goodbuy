$(function () {

  var countPrice = function () {
    var productMoney = $("input:radio:checked").val();
    var total = Number(productMoney) || 0;
    $("#tab-demo .options .option input[type=checkbox]:checked").each(function () {
      var optMoney = (Number(this.value) || 0);
      total = total + optMoney;
    });
    $('.total-price').text(`${total}元`);
  };

  $("input").on("click", countPrice);

});