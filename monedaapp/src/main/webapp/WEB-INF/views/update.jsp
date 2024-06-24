<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Actualizar Moneda</title>
    <link rel="stylesheet" href="/css/styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#actualizarMoneda").submit(function(event) {
                event.preventDefault(); // Evita el comportamiento predeterminado del formulario
                var formData = $(this).serializeArray();
                var numCia = $('#numCia').val(); // Asume que numCia es el identificador único de la moneda a actualizar
                $.ajax({
                    url: '/api/monedas/' + numCia, // Endpoint para actualizar moneda
                    type: 'PUT',
                    data: formData,
                    success: function(response) {
                        alert('Moneda actualizada exitosamente');
                        window.location.href = '/'; // Redirige a la página principal después de actualizar la moneda
                    },
                    error: function(xhr, status, error) {
                        alert('Error al actualizar la moneda: ' + error);
                    }
                });
            });
        });
    </script>
</head>
<body>
<h2>Actualizar Moneda</h2>
<form id="actualizarMoneda">
    <input type="hidden" id="numCia" name="numCia" placeholder="Número CIA" required><br><br>

    <label for="claveMoneda">Clave Moneda:</label>
    <input type="text" id="claveMoneda" name="claveMoneda" required><br><br>

    <label for="descripcion">Descripción:</label>
    <input type="text" id="descripcion" name="descripcion" required><br><br>

    <label for="simbolo">Símbolo:</label>
    <input type="text" id="simbolo" name="simbolo" required><br><br>

    <label for="abreviacion">Abreviación:</label>
    <input type="text" id="abreviacion" name="abreviacion" required><br><br>

    <label for="monedaCorriente">Moneda Corriente:</label>
    <input type="checkbox" id="monedaCorriente" name="monedaCorriente"><br><br>

    <button type="submit">Actualizar</button>
</form>/
</body>
</html>
