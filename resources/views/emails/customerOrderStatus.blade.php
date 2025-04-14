<!DOCTYPE html>
<html>
<head>
    <title>Actualización de Pedido</title>
    <style>
        body {
            font-family: Arial, sans-serif; /* Fuente del texto */
            font-size: 14px; /* Tamaño de fuente */
        }
    </style>
</head>
<body>
    <p>
        El pedido <b>#{{ $data['customerOrderId'] }}</b> 
        cambio su estado a <b>{{ $data['customerOrderStatus'] }}</b>, 
        por <b>{{ $data['customerOrderUpdatedBy'] }}</b>.
    </p>

    Cliente: #{{ $data['customerOrderCustomerId'] }} - {{ $data['customerOrderCustomerName'] }}
    <br>
    Fecha del pedido: {{ $data['customerOrderDate'] }}
    <br>
    <br>

    <em>Este correo es solo informativo, por favor no lo responda.</em>
</body>
</html>
