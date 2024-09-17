<?php 
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['login'])==0)
    {   
header('location:login.php');
}
	// if(isset($_GET['vnp_Amount'])){

	// 	$vnp_Amount = $_GET['vnp_Amount'];
	// 	$vnp_BankCode = $_GET['vnp_BankCode'];
	// 	$vnp_BankTranNo = $_GET['vnp_BankTranNo'];
	// 	$vnp_OrderInfo = $_GET['vnp_OrderInfo'];
	// 	$vnp_PayDate = $_GET['vnp_PayDate'];
	// 	$vnp_TmnCode = $_GET['vnp_TmnCode'];
	// 	$vnp_TransactionNo = $_GET['vnp_TransactionNo'];
	// 	$vnp_CardType = $_GET['vnp_CardType'];
	// 	$code_cart = $_SESSION['code_cart'];
		
		//insert database vnpay
		// $insert_vnpay = "INSERT INTO tbl_vnpay(vnp_amount,code_cart,vnp_bankcode,vnp_banktranno,vnp_cardtype,vnp_orderinfo,vnp_paydate,vnp_tmncode,vnp_transactionno) VALUE('".$vnp_Amount."','".$code_cart."','".$vnp_BankCode."','".$vnp_BankTranNo."','".$vnp_CardType."','".$vnp_OrderInfo."','".$vnp_PayDate."','".$vnp_TmnCode."','".$vnp_TransactionNo."')";
		// $cart_query = mysqli_query($mysqli,$insert_vnpay);
		
	// 	if($cart_query){
	// 		//insert gio hàng
	// 		echo '<h3>Giao dịch thanh toán bằng VNPAY thành công</h3>';
	// 		echo '<p>Vui lòng vào trang <a target="_blank" href="index.php?quanly=lichsudonhang">lịch sử đơn hàng</a> để xem chi tiết đơn hàng của bạn</p>';
	// 	}else{
	// 		echo 'Giao dịch VNPAY thất bại';
	// 	}
	// }
    
    if(isset($_GET['partnerCode'])){
		$id_khachhang = $_SESSION['id_khachhang'];
		$code_order = rand(0,9999);
		$partnerCode = $_GET['partnerCode'];
		$orderId = $_GET['orderId'];
		$amount = $_GET['amount'];
		$orderInfo = $_GET['orderInfo'];
		$orderType = $_GET['orderType'];
		$transId = $_GET['transId'];
		$payType = $_GET['payType'];
		$cart_payment = 'momo';

		//lay id thong tin van chuyen
		$sql_get_vanchuyen = mysqli_query($mysqli,"SELECT * FROM orders WHERE id='$id_khachhang' LIMIT 1");
		$row_get_vanchuyen = mysqli_fetch_array($sql_get_vanchuyen);
		$id_shipping = $row_get_vanchuyen['id_shipping'];

		//insert database momo
		$insert_momo = "INSERT INTO momo(partner_code,order_id,amount,order_info,order_type,trans_id,pay_type,code_cart) 
                        VALUE('".$partnerCode."','".$orderId."','".$amount."','".$orderInfo."','".$orderType."','".$transId."','".$payType."','".$code_order."')";
		$cart_query = mysqli_query($mysqli,$insert_momo);
		
		if($cart_query){
			$insert_cart = "INSERT INTO tbl_cart(id_khachhang,code_cart,cart_status,cart_date,cart_payment,cart_shipping) VALUE('".$id_khachhang."','".$code_order."',1,'".$now."','".$cart_payment."','".$id_shipping."')";
			$cart_query = mysqli_query($mysqli,$insert_cart);
			//insert gio hàng
			//them don hàng chi tiet
			foreach($_SESSION['cart'] as $key => $value){
				$id_sanpham = $value['id'];
				$soluong = $value['soluong'];
				$insert_order_details = "INSERT INTO tbl_cart_details(id_sanpham,code_cart,soluongmua) VALUE('".$id_sanpham."','".$code_order."','".$soluong."')";
				mysqli_query($mysqli,$insert_order_details);
			}
			echo '<h3>Giao dịch thanh toán bằng MOMO thành công</h3>';
			echo '<p>Vui lòng vào trang <a target="_blank" href="order-history.php">lịch sử đơn hàng</a> để xem chi tiết đơn hàng của bạn</p>';
		}else{
			echo 'Giao dịch MOMO thất bại';
		}

	
    // else{
	// 	if(isset($_GET['thanhtoan'])=='paypal'){
	// 		$code_order = rand(0,9999);
	// 		$cart_payment = 'paypal';
	// 		$id_khachhang = $_SESSION['id_khachhang'];
	// 		//lay id thong tin van chuyen
	// 		$sql_get_vanchuyen = mysqli_query($mysqli,"SELECT * FROM tbl_shipping WHERE id_dangky='$id_khachhang' LIMIT 1");
	// 		$row_get_vanchuyen = mysqli_fetch_array($sql_get_vanchuyen);
	// 		$id_shipping = $row_get_vanchuyen['id_shipping'];
	// 		//insert vào đơn hàng
	// 		$insert_cart = "INSERT INTO tbl_cart(id_khachhang,code_cart,cart_status,cart_date,cart_payment,cart_shipping) VALUE('".$id_khachhang."','".$code_order."',1,'".$now."','".$cart_payment."','".$id_shipping."')";

	// 		$cart_query = mysqli_query($mysqli,$insert_cart);
	// 		//them don hàng chi tiet
	// 		foreach($_SESSION['cart'] as $key => $value){
	// 				$id_sanpham = $value['id'];
	// 				$soluong = $value['soluong'];
	// 				$insert_order_details = "INSERT INTO tbl_cart_details(id_sanpham,code_cart,soluongmua) VALUE('".$id_sanpham."','".$code_order."','".$soluong."')";
	// 				mysqli_query($mysqli,$insert_order_details);
	// 		}
	// 		if($cart_query){
	// 			//insert gio hàng
	// 			echo '<h3>Giao dịch thanh toán bằng Paypal thành công</h3>';
	// 			echo '<p>Vui lòng vào trang <a target="_blank" href="index.php?quanly=lichsudonhang">lịch sử đơn hàng</a> để xem chi tiết đơn hàng của bạn</p>';
	// 		}else{
	// 			echo 'Giao dịch PAYPAL thất bại';
	// 		}	
		
	// 	}
		
	// }

?>

<!DOCTYPE html> 
<html lang="en">
	<head>
		<!-- Meta -->
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">
	    <meta name="keywords" content="MediaCenter, Template, eCommerce">
	    <meta name="robots" content="all">

	    <title>Cảm ơn</title>
	    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
	    <link rel="stylesheet" href="assets/css/main.css">
	    <link rel="stylesheet" href="assets/css/green.css">
	    <link rel="stylesheet" href="assets/css/owl.carousel.css">
		<link rel="stylesheet" href="assets/css/owl.transitions.css">
		<!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
		<link href="assets/css/lightbox.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/animate.min.css">
		<link rel="stylesheet" href="assets/css/rateit.css">
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

		<!-- Demo Purpose Only. Should be removed in production -->
		<link rel="stylesheet" href="assets/css/config.css">

		<link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
		<link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
		<link href="assets/css/red.css" rel="alternate stylesheet" title="Red color">
		<link href="assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
		<link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		<link rel="shortcut icon" href="assets/images/favicon.ico">
	<script language="javascript" type="text/javascript">
var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
 if(popUpWin)
{
if(!popUpWin.closed) popUpWin.close();
}
popUpWin = open(URLStr,'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width='+600+',height='+600+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}

</script>

	</head>
    <body class="cnt-home">
	
		
	
		<!-- ============================================== HEADER ============================================== -->
<header class="header-style-1">
<?php include('includes/top-header.php');?>
<?php include('includes/main-header.php');?>
<?php include('includes/menu-bar.php');?>
</header>
<!-- ============================================== HEADER : END ============================================== -->
<div class="breadcrumb">
	<div class="container">
		<div class="breadcrumb-inner">
			<ul class="list-inline list-unstyled">
				<li><a href="#">Trang Chủ</a></li>
				<li class='active'> Giỏ hàng GymShopper</li>
			</ul>
		</div><!-- /.breadcrumb-inner -->
	</div><!-- /.container -->
</div><!-- /.breadcrumb -->


<p>Cám ơn bạn đã mua hàng ,chúng tôi sẽ liên hệ bạn trong thời gian sớm nhất</p>

<!-- ============================================== BRANDS CAROUSEL : END ============================================== -->	</div><!-- /.container -->
</div><!-- /.body-content -->
<?php include('includes/footer.php');?>

	<script src="assets/js/jquery-1.11.1.min.js"></script>
	
	<script src="assets/js/bootstrap.min.js"></script>
	
	<script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	
	<script src="assets/js/echo.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
	<script src="assets/js/bootstrap-slider.min.js"></script>
    <script src="assets/js/jquery.rateit.min.js"></script>
    <script type="text/javascript" src="assets/js/lightbox.min.js"></script>
    <script src="assets/js/bootstrap-select.min.js"></script>
    <script src="assets/js/wow.min.js"></script>
	<script src="assets/js/scripts.js"></script>

	<!-- For demo purposes – can be removed on production -->
	
	<script src="switchstylesheet/switchstylesheet.js"></script>
	
	<script>
		$(document).ready(function(){ 
			$(".changecolor").switchstylesheet( { seperator:"color"} );
			$('.show-theme-options').click(function(){
				$(this).parent().toggleClass('open');
				return false;
			});
		});

		$(window).bind("load", function() {
		   $('.show-theme-options').delay(2000).trigger('click');
		});
	</script>
	<!-- For demo purposes – can be removed on production : End -->
</body>
</html>
<?php } ?>