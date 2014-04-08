
shoppingModule = angular.module("shoppingApp", [])

shoppingModule.factory("Items",
    () ->
        items = {}
        items.query = () ->
            return [
                {title: 'Paint pots', quantity: 8, price: 3.95}
                {title: 'Polka dots', quantity: 17, price: 12.95}
                {title: 'Pebbles', quantity: 5, price: 6.95}
            ]

        return items
)

shoppingModule.controller("CartController",
    ($scope, Items) ->
        $scope.items = Items.query()

        $scope.bill = { discount: 0, subTotal: 0 }
        $scope.totalCart = 0
        $scope.debug = { calcCount: 0 }

        # Scope Functions
        # ---------------

        $scope.recalcTotals = () ->
            $scope.debug.calcCount++

            # total
            total = 0
            for item in $scope.items
                total += item.price * item.quantity

            # discount
            discount = 0
            if total >= 100
                discount = total * 0.1

            # subTotal
            subTotal = total - discount

            # bind
            $scope.totalCart = total
            $scope.bill.discount = discount
            $scope.bill.subTotal = subTotal
            

        # Events
        # ------

        $scope.remove = (index) ->
            $scope.items.splice(index, 1)
            $scope.recalcTotals()

        # Ready
        # -----
        $scope.recalcTotals()
)

