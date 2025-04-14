<!DOCTYPE html>
<html>
<head>
    <title>Nuevo Pedido</title>
    <style>
        body {
            font-family: Arial, sans-serif; /* Fuente del texto */
            font-size: 14px; /* Tamaño de fuente */
        }
        table {
            border-collapse: collapse; /* Colapsa los bordes de las celdas */
            width: 100%; /* Ancho de la tabla al 100% */
        }
        th, td {
            border: 1px solid #ddd; /* Borde de las celdas */
            padding: 8px; /* Espaciado interno de las celdas */
            text-align: left; /* Alineación del texto a la izquierda */
        }
        th {
            background-color: #f2f2f2; /* Color de fondo para las celdas de encabezado */
        }
    </style>
</head>
<body>
    <p>Hola, se ha creado un nuevo pedido a nombre del vendedor {{ $data['customerOrderVendor'] }}.</p>

    Cliente: #{{ $data['customerOrderCustomerId'] }} - {{ $data['customerOrderCustomerName'] }}
    <br>
    Fecha del pedido: {{ $data['customerOrderDate'] }}

    <h3>Detalles del Pedido</h3>
    <table>
        <thead>
            <tr>
                <th>Producto</th>
                <th>Cantidad</th>
                <th>Precio</th>
            </tr>
        </thead>
        <tbody>
            @foreach($data['customerOrderDetails'] as $orderDetail)
                <tr>
                    <td>{{ $orderDetail['codigo'] }} - {{ $orderDetail['producto'] }}</td>
                    <td>{{ $orderDetail['cantidad'] }}</td>
                    <td>Q.{{ $orderDetail['precio_pedido'] }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    <h3>Total del Pedido: Q.{{ $data['customerOrderTotal'] }}</h3>

    <p>Observaciones: {{ ($data['customerOrderObservations']) ? $data['customerOrderObservations'] : 'Ninguna' }}</p>
    <br>
    
    <em>Este correo es solo informativo, por favor no lo responda.</em>
</body>
</html>
