<?php
session_start();
$_SESSION["estimfin"] = '0';
error_reporting(0);
include_once('include/config.php');

if ($_SESSION["estimfin"] == '0') { ?> 
    <script type="text/javascript">
        let nIntervId2;
        function compteure() { if (!nIntervId2) { nIntervId2 = setInterval(decomptee, 1000);}}
        function decomptee() { var xmlhttp=new XMLHttpRequest(); xmlhttp.open("GET","horloge-estim.php",false); xmlhttp.send(null);                     
            if (xmlhttp.responseText == 0) {stopcompteure();compteure()} else {document.getElementById("horloge-estim").innerHTML=xmlhttp.responseText;}}
        function stopcompteure() { clearInterval(nIntervId2); nIntervId2 = null; }
        stopcompteure();
        compteure();
    </script>
<?php ; }
?> 