$(document).ready(function(){
    $('.order-item-status-change').change(function(){
        this.value
        var orderItemId = $(this.parentElement.parentElement).attr('order-item-id')
        $.ajax({
            url: '/order_items/' + orderItemId,
            type: 'PUT',
            dataType: 'script',
            data: {
              status: this.value,
            }
          });
    })
})