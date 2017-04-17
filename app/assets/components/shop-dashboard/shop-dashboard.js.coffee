Polymer
  is: "shop-dashboard"

  properties:
    totalSales:
      type: Number
      value: 0
    orders:
      type: Array
      value: []

  groupNone: (e) ->
    return

  _fixTwoDigit: (number) ->
    return number.toFixed 2