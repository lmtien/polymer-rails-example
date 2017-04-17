Polymer
  is: "shop-order-item"

  properties:
    totalSales:
      type: Number
      notify: true

  _addTotalSales: (price) ->
    @totalSales = @totalSales + price
    return price