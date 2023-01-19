<?php
session_start();
require 'connection.php';
$conn = Connect();
if(!isset($_SESSION['login_customer'])){
header("location: index.php"); //Redirecting to mystore Page
}
if(isset($_SESSION['login_manager'])){
    header("location: manager.php"); //Redirecting to mystore Page
}
if(isset($_SESSION['login_admin'])){
header("location: admin.php"); //Redirecting to mystore Page
}
?>

<?php
    $gtotal = 0;
    foreach($_SESSION["cart"] as $keys => $values) {
        $total = ($values["quantity"] * $values["price"]);
        $gtotal = $gtotal + $total;
    }
    $item = $_SESSION["cart"][0];
    $S_ID = $item["S_ID"];
    $username = $_SESSION["login_customer"];
    $order_date = date('Y-m-d');
    $order_status = "PLACED";
    $delivery_address = $_GET["address"];
    $query = "INSERT INTO orders (total_price, order_date, order_status, delivery_address, username, S_ID) 
            VALUES ('" . $gtotal . "','" .  $order_date . "','" . $order_status . "','" . $delivery_address . "','" . $username . "','" . $S_ID . "')";

    $success = $conn->query($query);

    $ordeS_ID = $conn->insert_id;
    foreach($_SESSION["cart"] as $keys => $values) {
        $F_ID = $values["product_ID"];
        $quantity = $values["quantity"];
        $query = "INSERT INTO order_item (ordeS_ID, product_ID, quantity) 
                VALUES ('". $ordeS_ID ."','" . $F_ID . "','" . $quantity . "')";

        $success = $conn->query($query); 
    }
    
    $payment_date = date('Y-m-d');
    $amount = $gtotal;
    $query = "INSERT INTO payment (amount, payment_date, ordeS_ID) VALUES ('". $amount . "','" . $payment_date . "','" . $ordeS_ID ."')";

    $success = $conn->query($query);

    unset($_SESSION["cart"]);

    echo '<script>window.location="payment_successfull.php?orderid='. $ordeS_ID .'"</script>';
?>