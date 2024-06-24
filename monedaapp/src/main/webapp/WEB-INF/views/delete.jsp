<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Moneda</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#eliminarMoneda").submit(function(event) {
                event.preventDefault(); // Evita el comportamiento predeterminado del formulario
                var numCia = $('#numCia').val(); // Asume que numCia es el identificador único de la moneda a eliminar
                if (!confirm('¿Estás seguro de querer eliminar la moneda?')) {
                    return false;
                }
                $.ajax({
                    url: '/api/monedas/' + numCia, // Endpoint para eliminar moneda
                    type: 'DELETE',
                    success: function(response) {
                        alert('Moneda eliminada exitosamente');
                        window.location.href = '/'; // Redirige a la página principal después de eliminar la moneda
                    },
                    error: function(xhr, status, error) {
                        alert('Error al eliminar la moneda: ' + error);
                    }
                });
            });
        });
    </script>
</head>
<body>
<h2>Eliminar Moneda</h2>
<form id="eliminarMoneda">
    <input type="hidden" id="numCia" name="numCia" placeholder="Número CIA" required><br><br>
    <label for="numCia">Número CIA de la Moneda:</label>
    <input type="number" id="numCia" name="numCia" required><br><br>
    <button type="submit">Confirmar Eliminación</button>
</form>
</body>
</html>
