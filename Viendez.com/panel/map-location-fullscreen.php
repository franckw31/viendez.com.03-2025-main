<?php
session_start();
include('include/config.php');

$user_id = $_SESSION['id'];
$q = mysqli_query($con, "SELECT latitude, longitude FROM membres WHERE `id-membre` = '$user_id'");
$r = mysqli_fetch_array($q);

$lat = ($r && $r['latitude']) ? $r['latitude'] : 43.608325;
$lng = ($r && $r['longitude']) ? $r['longitude'] :  1.479574;

if (isset($_GET['lat']) && isset($_GET['lng'])) {
    $lat = floatval($_GET['lat']);
    $lng = floatval($_GET['lng']);
    $zoom = 14;
} else {
    $zoom = 9.6;
}
?>
<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carte Plein Écran</title>
    <link href="https://api.tiles.mapbox.com/mapbox-gl-js/v2.14.1/mapbox-gl.css" rel="stylesheet" />
    <style>
        html, body {
            margin: 0;
            padding: 0;
            width: 100vw;
            height: 100vh;
            overflow: hidden;
        }
        #map {
            position: absolute;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
        }
    </style>
</head>
<body>
    <div id="map"></div>
    <script src="https://api.tiles.mapbox.com/mapbox-gl-js/v2.14.1/mapbox-gl.js"></script>
    <script>
        mapboxgl.accessToken = 'pk.eyJ1IjoiZnJhbmNrdzMxIiwiYSI6ImNsbmJqemU5cjA0MDYya3RkczNrMHdqb2wifQ.6NLEMz-lShL80j9QuGW9cA';
        var map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v11',
            center: [<?php echo $lat; ?>, <?php echo $lng; ?>],
            zoom: <?php echo $zoom; ?>,
            attributionControl: false
        });
        const geolocate = new mapboxgl.GeolocateControl({
            fitBoundsOptions: {maxZoom: 15},
            positionOptions: { enableHighAccuracy: true },
            trackUserLocation: true,
            showUserHeading: true
        });
        map.addControl(geolocate, 'top-right');
        map.addControl(new mapboxgl.FullscreenControl(), 'top-right');
        map.on('load', function() {
            geolocate.trigger();
        });
        map.on('fullscreenchange', function() {
            geolocate.trigger();
        });
        <?php if (isset($_GET['lat']) && isset($_GET['lng'])): ?>
        new mapboxgl.Marker({ color: '#FF0000' })
            .setLngLat([<?php echo $lat; ?>, <?php echo $lng; ?>])
            .addTo(map);
        <?php endif; ?>
    </script>
</body>
</html>
