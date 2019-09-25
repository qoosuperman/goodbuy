$(function () {

  var countPrice = function () {
    var productMoney = $("#tab-demo .products .product input[type=radio]:checked").val();
    var total = Number(productMoney) || 0;
    $("#tab-demo .options .option input[type=checkbox]:checked").each(function () {
      var optMoney = (Number(this.value) || 0);
      total = total + optMoney;
    });
    $('.total-price').text(`${total}元`);

  };

  $("input").on("click", countPrice);



  function showItem(e) {
    e.preventDefault()
    var product = $("#tab-demo .products .product input[type=radio]:checked").parent(".product:eq(0)").text()

    let options = $("#tab-demo .options .option input[type=checkbox]:checked").parent(".option").text()

    var total = $('.total-price').text()

    let tpl = `
      <div class="media-body pb-3 lh-125 border-bottom border-gray">
        <strong class="text-gray-dark">品名：${product}</strong>
        <span class="d-block">選項：${options}</span>
        <span class="d-block">價格：${total}</span>
        <input type="hidden" name="item[product]" value="1" />
        <input type="hidden" name="item[options]" value="1,3" />
      </div>
    `
    $("#order-item").append(tpl)
    $('input').prop('checked', false)
  }
  $("#buy").click(showItem)



})
