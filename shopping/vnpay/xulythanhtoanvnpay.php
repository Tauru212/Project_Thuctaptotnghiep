<?php
    // Bật báo cáo lỗi (trừ thông báo lỗi E_NOTICE và E_DEPRECATED)
    error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED);
    
    // Đặt múi giờ mặc định
    date_default_timezone_set('Asia/Ho_Chi_Minh');
    
    // Đường dẫn URL của VNPay
    $vnp_Url = "http://sandbox.vnpayment.vn/tryitnow/Home/CreateOrder";
    
    // Đường dẫn URL để trả về sau khi thanh toán
    $vnp_Returnurl = "https://localhost/vnpay_php/vnpay_return.php";
    
    // Mã Terminal của bạn (do VNPay cung cấp)
    $vnp_TmnCode = "W7EB9NZ8";
    
    // Secret key của bạn (do VNPay cung cấp)
    $vnp_HashSecret = "GVB49GJCKY6B2066NIQ1F8N27R7U1ZD9";    
    
    // Mã giao dịch (order_id) từ form POST
    $vnp_TxnRef = isset($_POST['order_id']) ? $_POST['order_id'] : ''; // Sử dụng isset để tránh lỗi nếu biến không tồn tại
    
    // Các biến khác (ví dụ)
    $vnp_OrderInfo = isset($_POST['order_desc']) ? $_POST['order_desc'] : '';
    $vnp_Amount = isset($_POST['amount']) ? $_POST['amount'] * 100 : 0; // Số tiền phải nhân với 100 (theo yêu cầu của VNPay)
    $vnp_Locale = isset($_POST['language']) ? $_POST['language'] : 'vn';
    $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];

    // Thêm các tham số vào URL
    $inputData = array(
        "vnp_Version" => "2.1.0",
        "vnp_TmnCode" => $vnp_TmnCode,
        "vnp_Amount" => $vnp_Amount,
        "vnp_Command" => "pay",
        "vnp_CreateDate" => date('YmdHis'),
        "vnp_CurrCode" => "VND",
        "vnp_IpAddr" => $vnp_IpAddr,
        "vnp_Locale" => $vnp_Locale,
        "vnp_OrderInfo" => $vnp_OrderInfo,
        "vnp_ReturnUrl" => $vnp_Returnurl,
        "vnp_TxnRef" => $vnp_TxnRef
    );

    ksort($inputData);
    $query = "";
    $i = 0;
    $hashdata = "";

    foreach ($inputData as $key => $value) {
        if ($i == 1) {
            $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
        } else {
            $hashdata .= urlencode($key) . "=" . urlencode($value);
            $i = 1;
        }
        $query .= urlencode($key) . "=" . urlencode($value) . '&';
    }

    $vnp_Url = $vnp_Url . "?" . $query;
    if (isset($vnp_HashSecret)) {
        $vnpSecureHash = hash_hmac('sha512', $hashdata, $vnp_HashSecret);
        $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
    }

    header('Location: ' . $vnp_Url);
    die();
?>


<!-- Ngân hàng: NCB
Số thẻ: 9704198526191432198
Tên chủ thẻ:NGUYEN VAN A
Ngày phát hành:07/15
Mật khẩu OTP:123456 -->