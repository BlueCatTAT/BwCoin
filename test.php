<?php
/**
 * Created by PhpStorm.
 * User: openice
 * Date: 2020/6/29
 * Time: 13:57
 */

$a = "alipay_sdk=alipay-sdk-php-easyalipay-20191227&app_id=2021001152698295&biz_content=%7B%22body%22%3A%22paybody%22%2C%22subject%22%3A%22pay%22%2C%22out_trade_no%22%3A%222020070198489952%22%2C%22timeout_express%22%3A%2230m%22%2C%22total_amount%22%3A0.01%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%2C%22extend_params%22%3A%7B%22u_id%22%3A%2264%22%2C%22pay_type%22%3A%22device%22%7D%7D&charset=UTF-8&format=json&method=alipay.trade.app.pay&notify_url=http%3A%2F%2F7.longbasz.cn%2Fapi%2Fpay%2Falipaynotifydevice&sign_type=RSA2&timestamp=2020-07-01+16%3A41%3A47&version=1.0&sign=mrBcyRzsQpP5QcYQ75Xn98%2FwVjiT0EE4u0aOhT2PkoiMe2yrNOJa48EGmljQo2NYqVnG9xHsPkqk7PPgVt%2FtWgnF%2Frtx8nWtwQNDUeRbHsgFb7ruA7SoqS6i%2BGIDYQHzV2Qay8Uk7vMOS172P9FYrmW3UEYyUdm5SuDtBCI3gJB269PAiyrO9kYB6pdrudL%2Fk8nZtSpi5pZNrV4xFyK1gwX6W%2BngnYKLKjKKecgU7203GFrlXRxtVZ%2F8A0XTn794loMeHt2l9kf3WP8a7%2BbBJrYyCaPxGtE%2Bv274BkOYu%2B1wYvtX%2F%2BfSbGLhGmzgyK2LHhgz%2B7EIuuD%2F%2BF4drkjmSQ%3D%3D";

$arr = json_decode($a,true);

var_dump($arr);