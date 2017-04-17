Polymer
  is: "shop-order"

  properties:
    totalSales:
      type: Number
      notify: true
    orders:
      type: Array
      notify: true

  handleOrdersResponse: (e) ->
    @orders.reverse()
    return