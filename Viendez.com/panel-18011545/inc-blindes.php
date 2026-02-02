<?php
session_start();
error_reporting(0);

$comp = intval($_GET['comp']); // get value
$sou = intval($_GET['sou']); // get value
$_SESSION["cptblinde"]=$comp;
echo $_SESSION["cptblinde"];
echo "</BR>";
echo $sou;
$source="https://poker31.org/panel/voir-activite.php?uid=";
?>
<script type="text/javascript">window.location.replace("<?php echo $source.$sou; ?>")</script>

