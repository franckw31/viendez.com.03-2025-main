<html>
<head>
        <script type = "application/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script type = "application/javascript" src="tim2.js"></script>
</head>
<body>
    <?php echo "coucou1"; ?>
    <?php include("tim2.php") ?>
    <?php echo "coucou2"; ?>
    <p timer> <?php echo $timeleft ?> secondes.</p>
</body>
</html>
