<?php
namespace app\core;
use AlibabaCloud\Client\AlibabaCloud;
use AlibabaCloud\Client\Exception\ClientException;
use AlibabaCloud\Client\Exception\ServerException;
class Sms{
    public $db;
    public function __construct()
    {
        $this->db = new \dbModel();
    }

    public function smscode($tel,$code){
        $config = $this->db->field("*")->table("bw_config_sms_yu")->find();
        AlibabaCloud::accessKeyClient($config['region_id'],$config['sms_key'])
            ->regionId($config['region_id'])
            ->asDefaultClient();
        try {
            $result = AlibabaCloud::rpc()
                ->product('Dysmsapi')
                // ->scheme('https') // https | http
                ->version('2017-05-25')
                ->action('SendSms')
                ->method('POST')
                ->host('dysmsapi.aliyuncs.com')
                ->options([
                    'query' => [
                        'RegionId' => $config['region_id'],
                        'PhoneNumbers' => $tel,
                        'SignName' => $config['sms_name'],
                        'TemplateCode' => $config['sms_id'],
                        'TemplateParam' => json_encode(["code"=>$code]),
                    ],
                ])
                ->request();
            return $result->toArray();
        } catch (ClientException $e) {
            echo $e->getErrorMessage() . PHP_EOL;
        } catch (ServerException $e) {
            echo $e->getErrorMessage() . PHP_EOL;
        }
    }
}