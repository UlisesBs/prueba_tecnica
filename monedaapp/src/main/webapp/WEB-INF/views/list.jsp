<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Listado de Monedas</title>
    <link rel="stylesheet" href="/css/styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $.ajax({
                url: '/api/monedas',
                type: 'GET',
                success: function(monedas) {
                    var monedaHtml = '';
                    monedas.forEach(function(m) {
                        monedaHtml += '<div><strong>' + m.claveMoneda + '</strong>: ' + m.descripcion + '</div>';
                    });
                    $('#monedas-list').html(monedaHtml);
                },
                error: function(xhr, status, error) {
                    alert('Error al cargar las monedas: ' + error);
                }
            });
        });
    </script>
</head>
<body>
<h2>Listado de Monedas</h2>
<div id="monedas-list"></div>
</body>
</html>
