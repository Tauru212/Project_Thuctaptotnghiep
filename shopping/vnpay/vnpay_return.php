<?php
    // Bật báo cáo lỗi (trừ thông báo lỗi E_NOTICE và E_DEPRECATED)
    error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED);
    
    // Đặt múi giờ mặc định
    date_default_timezone_set('Asia/Ho_Chi_Minh');
    
    $vnp_HashSecret = "GVB49GJCKY6B2066NIQ1F8N27R7U1ZD9"; // Secret key của bạn (do VNPay cung cấp)
    
    $inputData = array();
    foreach ($_GET as $key => $value) {
        if (substr($key, 0, 4) == "vnp_") {
            $inputData[$key] = $value;
        }
    }
    
    $vnp_SecureHash = $_GET['vnp_SecureHash'];
    unset($inputData['vnp_SecureHash']);
    ksort($inputData);
    $hashData = "";
    foreach ($inputData as $key => $value) {
        $hashData .= urlencode($key) . '=' . urlencode($value) . '&';
    }
    $hashData = rtrim($hashData, '&');
    
    $secureHash = hash_hmac('sha512', $hashData, $vnp_HashSecret);
    if ($secureHash == $vnp_SecureHash) {
        if ($_GET['vnp_ResponseCode'] == '00') {
            echo "Giao dịch thành công";
        } else {
            echo "Giao dịch không thành công";
        }
    } else {
        echo "Chữ ký không hợp lệ";
    }

    
?>


