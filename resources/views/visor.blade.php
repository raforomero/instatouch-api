<!DOCTYPE html>
<html>
<head>
    <title>MASTER - INSTATOUCH SAC</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <style>#map { height: 100vh; width: 100%; }</style>
</head>
<body>
    <div id="map"></div>
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    <script>
        var map = L.map('map').setView([-12.0464, -77.0428], 13);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);
        L.marker([-12.0464, -77.0428]).addTo(map).bindPopup('INSTATOUCH: Esperando NODO...');
    </script>
</body>
</html>
