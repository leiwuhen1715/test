<?php
/**
 * 微信接口通讯实现类
 */
namespace api\user\service;
use think\Log;

class CreatImgService
{

    function createSharePng($gData,$codeName,$fileName = '',$type=0){
        //创建画布
        $im = imagecreatetruecolor(618, 900);

        //填充画布背景色
        $color = imagecolorallocate($im, 255, 255, 255);
        imagefill($im, 0, 0, $color);


        //字体文件
        $font_file = WEB_ROOT."static/font-awesome/fonts/msyh.ttf";
        $font_file_bold = WEB_ROOT."static/font-awesome/fonts/msyh_bold.ttf";

        $font_file_1 = WEB_ROOT."static/font-awesome/fonts/ARIAL.TTF";
        $font_file_bold_1 = WEB_ROOT."static/font-awesome/fonts/ARIALBD.TTF";

        $font_file_2 = WEB_ROOT."static/font-awesome/fonts/PINGFANGMEDIUM.TTF";

        //设定字体的颜色
        $font_color_1 = ImageColorAllocate ($im, 140, 140, 140);
        $font_color_2 = ImageColorAllocate ($im, 26, 26, 26);
        $font_color_3 = ImageColorAllocate ($im, 129, 129, 129);
        $font_color_4 = ImageColorAllocate ($im, 245, 65, 84);
        $font_color_5 = ImageColorAllocate ($im, 0, 0, 0);
        $font_color_red = ImageColorAllocate ($im, 217, 45, 32);
        $fang_bg_color = ImageColorAllocate ($im, 254, 216, 217);

        //商品图片
        list($g_w,$g_h) = getimagesize($gData['goods_img']);
        $goodImg = $this->createImageFromFile($gData['goods_img']);
        imagecopyresized($im, $goodImg, 0, 0, 0, 0, 618, 618, $g_w, $g_h);


        //二维码
        list($code_w,$code_h) = getimagesize($codeName);
        $codeImg = $this->createImageFromFile($codeName);
        imagecopyresized($im, $codeImg, 420, 700, 0, 0, 150, 150, $code_w, $code_h);

        //头像
        list($code_w,$code_h) = getimagesize($gData['avatar']);
        $heading = $this->createImageFromFile($gData['avatar']);
        imagecopyresized($im, $heading, 20, 800, 0, 0, 50, 50, $code_w, $code_h);

        imagettftext($im, 15,0, 85,815, $font_color_2 ,$font_file_2, '好友'.$gData['user_nickname']);
        imagettftext($im, 15,0, 85,845, $font_color_2 ,$font_file_2, '推荐您一个优质商品');


        //商品描述
        $theTitle = $this->cn_row_substr($gData['goods_name'],1,20);

        $height = 670;
        foreach ($theTitle as $key => $value) {
            if($key == 0){
                imagettftext($im, 21,0,100,$height,$font_color_5,$font_file_2, $value);
            }else{
                imagettftext($im, 21,0,10,$height,$font_color_5,$font_file_2, $value);
            }
            $height = $height+50;
        }
        if($type == 1){
            imagettftext($im, 20,0, 20,760, $font_color_4 ,$font_file_2, "活动价￥");
        }else{
            imagettftext($im, 20,0, 20,760, $font_color_4 ,$font_file_2, "零售价￥");
        }
        
        imagettftext($im, 30,0, 130,760, $font_color_4 ,$font_file_1, $gData["shop_price"]);
        //输出图片
        if($fileName){

            imagepng ($im,$fileName);
        }else{
            Header("Content-Type: image/png");
            imagepng ($im);
        }

        //释放空间
        imagedestroy($im);
        imagedestroy($goodImg);
        imagedestroy($codeImg);
    }

	public function mergeImage($gData,$images,$qrcode){
		
		
		
		list($width, $height,$imtype)     = getimagesize($images);//获取图片信息
		list($qrwidth, $qrheight,$qrtype) = getimagesize($qrcode);
	
		//1. 绘制图像资源（创建一个画布）375 667
		$thumb      = imagecreatetruecolor($width,$height);

		$color      = imagecolorallocate($thumb,0,0,0);//分配一个白色

		imagefill($thumb,0,0,$color);// 从画布左上角开始填充白色
		// imagecolortransparent($thumb ,$color);//将画布颜色置为透明

		//海报图片
		switch ($imtype){
			case 1:
				$source         = imagecreatefromgif($images);
				break;
			case 2:
				$source         = imagecreatefromjpeg($images);
				break;
			case 3:
				$source         = imagecreatefrompng($images);
				break;
		}

		//小图片
		switch ($qrtype){
			case 1:
				$qr_source      = imagecreatefromgif($qrcode);
				break;
			case 2:
				$qr_source      = imagecreatefromjpeg($qrcode);
				break;
			case 3:
				$qr_source      = imagecreatefrompng($qrcode);
				break;
		}
		
		$font_file_2 = WEB_ROOT."static/font-awesome/fonts/PINGFANGMEDIUM.TTF";
		$font_color_1 = ImageColorAllocate ($thumb, 250, 250, 250);
		
		//目标资源，源资源，目标x坐标 目标y坐标，源x坐标，源y坐标，目标宽度，目标高度，源宽度，源高度
		$images_sampled    = imagecopyresampled($thumb, $source, 0, 0, 0, 0, $width, $height, $width, $height);
		
		//头像
        // list($code_w,$code_h) = getimagesize(cmf_get_image_url($gData['a_user']['avatar']));
        // $heading = $this->createImageFromFile(cmf_get_image_url($gData['a_user']['avatar']));
        
        // imagecopyresized($thumb, $heading, 50, ($height-100), 0, 0, 80, 80, $code_w, $code_h);
        // imagettftext($thumb, 16,0, 150,($height-170), $font_color_1 ,$font_file_2, $gData['a_user']['user_nickname']);
        
		//目标资源，源资源，目标x坐标 目标y坐标，源x坐标，源y坐标，目标宽度，目标高度，源宽度，源高度
		$qrcode_sampled    = imagecopyresampled($thumb, $qr_source, ($width-400), ($height-350), 0, 0, 200, 200, $qrwidth, $qrheight);

		$name               = md5($images).".jpg";
		$upload_root        = WEB_ROOT . '/upload/';
		$directory          = 'user/share/';
		
		if(!is_dir($upload_root.$directory)){
			mkdir($upload_root.$directory,0755,true);
		}

		$path               = $directory.$name;
		$res                = imagepng($thumb,$upload_root.$path,9);
		imagedestroy($thumb);
		return $path;
	}
    /**
     * 从图片文件创建Image资源
     * @param $file 图片文件，支持url
     * @return bool|resource    成功返回图片image资源，失败返回false
     */

    public function createImageFromFile($file){
        if(preg_match('/http(s)?:\/\//',$file)){
            $fileSuffix = $this->getNetworkImgType($file);
        }else{
            $fileSuffix = pathinfo($file, PATHINFO_EXTENSION);
        }
        // Log::write($file,'img');
        // Log::write($fileSuffix,'img');
        if(!$fileSuffix) return false;
        switch ($fileSuffix){
            case 'jpeg':
                $theImage = @imagecreatefromjpeg($file);
                break;
            case 'jpg':
                $theImage = @imagecreatefromjpeg($file);
                break;
            case 'png':
                $theImage = @imagecreatefrompng($file);
                break;
            case 'gif':
                $theImage = @imagecreatefromgif($file);
                break;
            default:
                $theImage = @imagecreatefromstring(file_get_contents($file));
                break;
        }
        return $theImage;
    }


    /**
     * 获取网络图片类型
     * @param $url  网络图片url,支持不带后缀名url
     * @return bool
     */

    public function getNetworkImgType($url){

        $ch = curl_init(); //初始化curl

        curl_setopt($ch, CURLOPT_URL, $url); //设置需要获取的URL

        curl_setopt($ch, CURLOPT_NOBODY, 1);

        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 3);//设置超时

        curl_setopt($ch, CURLOPT_TIMEOUT, 3);

        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); //支持https

        curl_exec($ch);//执行curl会话

        $http_code = curl_getinfo($ch);//获取curl连接资源句柄信息

        curl_close($ch);//关闭资源连接
        if ($http_code['http_code'] == 200) {
            $theImgType = explode('/',$http_code['content_type']);
            if($theImgType[0] == 'image'){
                return $theImgType[1];
            }else{
                return false;
            }
        }else{
            return false;
        }
    }


    /**
     * 分行连续截取字符串
     * @param $str  需要截取的字符串,UTF-8
     * @param int $row  截取的行数
     * @param int $number   每行截取的字数，中文长度
     * @param bool $suffix  最后行是否添加‘...’后缀
     * @return array    返回数组共$row个元素，下标1到$row
     */

    public function cn_row_substr($str,$row = 1,$number = 10,$suffix = true){
        $result = array();
        for ($r=1;$r<=$row;$r++){
            $result[$r] = '';
        }

        $str = trim($str);
        if(!$str) return $result;
        $theStrlen = strlen($str);

        //每行实际字节长度
        $oneRowNum = $number * 3;
        for($r=1;$r<=$row;$r++){
            if($r == $row and $theStrlen > $r * $oneRowNum and $suffix){
                $result[$r] = $this->mg_cn_substr($str,$oneRowNum-6,($r-1)* $oneRowNum).'...';
            }else{
                $result[$r] = $this->mg_cn_substr($str,$oneRowNum,($r-1)* $oneRowNum);
            }
            if($theStrlen < $r * $oneRowNum) break;
        }
        return $result;
    }



    /**
     * 按字节截取utf-8字符串
     * 识别汉字全角符号，全角中文3个字节，半角英文1个字节
     * @param $str  需要切取的字符串
     * @param $len  截取长度[字节]
     * @param int $start    截取开始位置，默认0
     * @return string
     */

    public function mg_cn_substr($str,$len,$start = 0){
        $q_str = '';
        $q_strlen = ($start + $len)>strlen($str) ? strlen($str) : ($start + $len);

        //如果start不为起始位置，若起始位置为乱码就按照UTF-8编码获取新start
        if($start and json_encode(substr($str,$start,1)) === false){
            for($a=0;$a<3;$a++){
                $new_start = $start + $a;
                $m_str = substr($str,$new_start,3);
                if(json_encode($m_str) !== false) {
                    $start = $new_start;
                    break;
                }
            }
        }

        //切取内容
        for($i=$start;$i<$q_strlen;$i++){
            //ord()函数取得substr()的第一个字符的ASCII码，如果大于0xa0的话则是中文字符
            if(ord(substr($str,$i,1))>0xa0){
                $q_str .= substr($str,$i,3);
                $i+=2;
            }else{
                $q_str .= substr($str,$i,1);
            }
        }
        return $q_str;
    }

    /**
     * 方图转圆形
     * @param string $original_path 图片地址
     * @param string $destFolder 保存的图片路径
     * @return string
     */
    private function roundImg($original_path = '', $destFolder = './')
    {
        //获取参数
        $types = array(1 => "gif", 2 => "jpeg", 3 => "png");//图片类型
        list($width1, $height1, $type1) = getimagesize($original_path);

        $createBgImg1 = "imagecreatefrom" . $types[$type1];
        $viceImage = $createBgImg1($original_path);//1:读取文件对象

        $w = imagesx($viceImage);//读取副图文件的宽高
        $h = imagesy($viceImage);

        if (!file_exists($destFolder)) {
            mkdir($destFolder, 0777, true);
        }

        $dest_path = $destFolder . uniqid() . '.png';
        $src = imagecreatefromstring(file_get_contents($original_path));
        $newpic = imagecreatetruecolor($w, $h);
        imagealphablending($newpic, false);
        $transparent = imagecolorallocatealpha($newpic, 255, 255, 255, 127);
        $r = $w / 2;
        for ($x = 0; $x < $w; $x++) {
            for ($y = 0; $y < $h; $y++) {
                $c = imagecolorat($src, $x, $y);
                $_x = $x - $w / 2;
                $_y = $y - $h / 2;
                if ((($_x * $_x) + ($_y * $_y)) < ($r * $r)) {
                    imagesetpixel($newpic, $x, $y, $c);
                } else {
                    imagesetpixel($newpic, $x, $y, $transparent);
                }
            }
        }

        imagesavealpha($newpic, true);
        imagepng($newpic, $dest_path);
        imagedestroy($newpic);
        imagedestroy($src);
        imagedestroy($viceImage);
        return $dest_path;
    }

    /**
     * 将图片四直角处理成圆角
     *
     * @param $src_img 目标图片
     * @param $width 宽
     * @param $height 高
     * @param int $radius 圆角半径
     * @return resource
     */
    private function radiusImg($src_img, $width,$height, $radius = 17) {
        $w  = &$width;
        $h  = &$height;
        $img = imagecreatetruecolor($w, $h);//创建底图
        //这一句一定要有
        imagesavealpha($img, true);//设置是否保存透明图像资源

        //拾取一个完全透明的颜色,最后一个参数127为全透明
        $bg = imagecolorallocatealpha($img, 255, 255, 255, 127);
        imagefill($img, 0, 0, $bg);

        $r = $radius; //圆角半径
        for ($x = 0; $x < $w; $x++) {
            for ($y = 0; $y < $h; $y++) {
                $rgbColor = imagecolorat($src_img, $x, $y);
                if (($x >= $radius && $x <= ($w - $radius)) || ($y >= $radius && $y <= ($h - $radius))) {
                    //不在四角的范围内,直接画
                    imagesetpixel($img, $x, $y, $rgbColor);
                } else {
                    //在四角的范围内选择画
                    //上左
                    $y_x = $r; //圆心X坐标
                    $y_y = $r; //圆心Y坐标
                    if (((($x - $y_x) * ($x - $y_x) + ($y - $y_y) * ($y - $y_y)) <= ($r * $r))) {
                        imagesetpixel($img, $x, $y, $rgbColor);
                    }
                    //上右
                    $y_x = $w - $r; //圆心X坐标
                    $y_y = $r; //圆心Y坐标
                    if (((($x - $y_x) * ($x - $y_x) + ($y - $y_y) * ($y - $y_y)) <= ($r * $r))) {
                        imagesetpixel($img, $x, $y, $rgbColor);
                    }
                    //下左
                    $y_x = $r; //圆心X坐标
                    $y_y = $h - $r; //圆心Y坐标
                    if (((($x - $y_x) * ($x - $y_x) + ($y - $y_y) * ($y - $y_y)) <= ($r * $r))) {
                        imagesetpixel($img, $x, $y, $rgbColor);
                    }
                    //下右
                    $y_x = $w - $r; //圆心X坐标
                    $y_y = $h - $r; //圆心Y坐标
                    if (((($x - $y_x) * ($x - $y_x) + ($y - $y_y) * ($y - $y_y)) <= ($r * $r))) {
                        imagesetpixel($img, $x, $y, $rgbColor);
                    }
                }
            }
        }

        return $img;
    }

}
