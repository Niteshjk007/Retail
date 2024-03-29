<?php
session_start();

require 'connection.php';
$conn = Connect();
if(!isset($_SESSION['login_customer'])){
header("location: index.php"); //Redirecting to mystore Page
}
if(isset($_SESSION['login_manager'])){
    header("location: index.php"); //Redirecting to mystore Page
}
if(isset($_SESSION['login_admin'])){
    header("location: index.php"); //Redirecting to mystore Page
}
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JK Stores</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        #dialogMsg {
            text-align: center;
            color: white;
        }
    </style>
  </head>
  <body>
    <div class="modal fade" id="signupDialog" tabindex="-1" role="dialog" onclick="func()">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <h3>
        <div  id="dialogMsg" class="modal-body bg-primary">
        </div>
        </h3>
        <div class="modal-footer">
            <a type="button" href="customer.php" class="btn btn-primary">Close</a>
        </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

<?php
    $ordeS_ID = $_GET["orderid"];
    $rating = $_POST["rating"];
    $description = $_POST["description"];

    $query = "insert into review (rating, description, ordeS_ID) values(".$rating.",'".$description."',".$ordeS_ID.")";
    $success = $conn->query($query); 

    $rating_query = 'select * from review where review.ordeS_ID in (select orders.ordeS_ID from orders where orders.S_ID = (select orders.S_ID from orders where ordeS_ID = '.$ordeS_ID.'))';
    $rating_result = mysqli_query($conn,$rating_query);
    $trating = 0;
    $cnt = 0;
    while($rating_row = mysqli_fetch_assoc($rating_result)) {
        $trating = $trating + $rating_row["rating"];
        $cnt = $cnt + 1;
    }
    echo $trating;
    echo $cnt;
    $final_rating = ($trating / $cnt);

    $update_rating = 'update store set store.rating = '.$final_rating.' where store.S_ID in (select orders.S_ID from orders where orders.ordeS_ID = '.$ordeS_ID.')';
    $success = $conn->query($update_rating);

    $msg="Review Added Succesfully";
    echo   '<script>
                    $(document).ready(function() {
                        $("#dialogMsg").text("'. $msg .'");
                        $("#signupDialog").modal();
                    });
                </script>';

    
?>

    <script>
        function func() {
            window.location="customer.php";
        }
    </script>

</body>
</html>