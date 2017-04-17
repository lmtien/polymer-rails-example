Polymer
  is: "shop-order-adding"

  properties:
    orders:
      type: Array
      notify: true
    totalSales:
      type: Number
      notify: true
    productPrice:
      type: Number
      value: 0
      observer: '_calTotalPrice'
    quantity:
      type: Number
      value: 1
      observer: '_calTotalPrice'

  generateProductList: ->
    categories = {}
    @menuItems.forEach( (item) ->
      products = new Array
      if categories.hasOwnProperty item.product.category.name
        products = categories[item.product.category.name]

      products.push item
      categories[item.product.category.name] = products
    )
    productList = []
    Object.keys(categories).forEach( (key) ->
      productList.push '<optgroup label="' + key + '">'
      productNames = new Set
      categories[key].forEach( (item) ->
        if !productNames.has item.product.name
          productNames.add item.product.name
          productList.push '<option value="' + item.product.id + '">' + item.product.name + '</option>'
      )
      productList.push '</optgroup>'
    )
    @.$.product.innerHTML = productList.join('')
    @.$.product.selectedIndex = -1
    return

  productChanged: (e) ->
    productId = e.target.value
    sizeList = []
    @menuItems.forEach( (item) ->
      if `item.product.id == productId`
        sizeNames = new Set
        if !sizeNames.has item.product_size.name
          sizeNames.add item.product_size.name
          sizeList.push '<option value="' + item.product_size.id + '">' + item.product_size.name + '</option>'
    )
    @.$.productSize.innerHTML = sizeList.join('')
    @.$.productSize.selectedIndex = -1
    @productPrice = 0
    return

  sizeChanged: (e) ->
    productId = @.$.product[@.$.product.selectedIndex].value
    productSizeId = e.target.value
    itemPrice = 0
    menuId = 0
    @menuItems.forEach( (item) ->
      if `item.product.id == productId` && `item.product_size.id == productSizeId`
        itemPrice = item.price
        menuId = item.id
        return
    )
    @productPrice = itemPrice
    @menuId = menuId
    return

  submitOrder: ->
    if @totalPrice <= 0
      alert 'Please choose a product and its size.'
      return

    @.$.AddOrder.body =
      'authenticity_token': AUTH_TOKEN
      'order':
        'shop_menu_id': @menuId
        'quantity': @quantity
        'price': @totalPrice

    @.$.AddOrder.generateRequest()
    return

  handleAddOrderResponse: (e) ->
    if e.detail.__data__.response
      @.unshift 'orders', e.detail.__data__.response[0]
      @totalSales = 0
    return

  handleAddOrderError: (e) ->
    alert e.detail.error.message
    return

  _calTotalPrice: ->
    @totalPrice = (@productPrice * @quantity).toFixed 2