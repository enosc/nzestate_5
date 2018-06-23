<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/22
 * Time: 0:31
 */

namespace app\admin\controller;
/**
 * Class 上传
 * @package app\admin\controller
 */

class Upload extends BaseAdmin
{
    public function upload(){
        $func = input('func');
        $path = input('path','temp');
        $image_upload_limit_size = config('image_upload_limit_size');
        $fileType = input('fileType','Images');  //上传文件类型，视频，图片
        if($fileType == 'Flash'){
            $upload = url('admin/Ueditor/videoUp',array('savepath'=>$path,'pictitle'=>'banner','dir'=>'video'));
            $type = 'mp4,3gp,flv,avi,wmv';
        }else{
            $upload = url('admin/Ueditor/imageUp',array('savepath'=>$path,'pictitle'=>'banner','dir'=>'images'));
            $type = 'jpg,png,gif,jpeg';
        }
        $info = array(
            'num'=> input('num/d'),
            'fileType'=> $fileType,
            'title' => '',
            'upload' =>$upload,
            'fileList'=>url('admin/upload/fileList',array('path'=>$path)),
            'size' => $image_upload_limit_size/(1024 * 1024).'M',
            'type' =>$type,
            'input' => input('input'),
            'func' => empty($func) ? 'undefined' : $func,
        );
        $this->assign('info',$info);
        return $this->fetch();
    }

    /**
     * 删除上传的图片,视频
     */
    public function delupload(){
        $action = input('action','del');
        $filename= input('filename');
        $filename= empty($filename) ? input('url') : $filename;
        $filename= str_replace('../','',$filename);
        $filename= trim($filename,'.');
        $filename= trim($filename,'/');
        if($action=='del' && !empty($filename) && file_exists($filename)){
            $filetype = strtolower(strstr($filename,'.'));
            $phpfile = strtolower(strstr($filename,'.php'));  //排除PHP文件
            $erasable_type = config('erasable_type');  //可删除文件
            if(!in_array($filetype,$erasable_type) || $phpfile){
                exit;
            }
            if(unlink($filename)){
                $this->deleteWechatImage(input('url'));
                echo 1;
            }else{
                echo 0;
            }
            exit;
        }
    }

    public function deleteWechatImage($file_path)
    {
        $logic = new \app\common\logic\WxLogic;
        $logic->deleteImage($file_path);
    }

    public function fileList()
    {
        /* 判断类型 */
        $type = input('type','Images');
        switch ($type){
            /* 列出图片 */
            case 'Images' : $allowFiles = 'png|jpg|jpeg|gif|bmp';break;

            case 'Flash' : $allowFiles = 'flash|swf';break;

            /* 列出文件 */
            default : $allowFiles = '.+';
        }

        $path = UPLOAD_PATH.input('path','temp');
        //echo file_exists($path);echo $path;echo '--';echo $allowFiles;echo '--';echo $key;exit;
        $listSize = 100000;

        $key = empty($_GET['key']) ? '' : $_GET['key'];

        /* 获取参数 */
        $size = isset($_GET['size']) ? htmlspecialchars($_GET['size']) : $listSize;
        $start = isset($_GET['start']) ? htmlspecialchars($_GET['start']) : 0;
        $end = $start + $size;

        /* 获取文件列表 */
        $files = $this->getfiles($path, $allowFiles, $key);
        if (!count($files)) {
            echo json_encode(array(
                "state" => "没有相关文件",
                "list" => array(),
                "start" => $start,
                "total" => count($files)
            ));
            exit;
        }

        /* 获取指定范围的列表 */
        $len = count($files);
        for ($i = min($end, $len) - 1, $list = array(); $i < $len && $i >= 0 && $i >= $start; $i--){
            $list[] = $files[$i];
        }

        /* 返回数据 */
        $result = json_encode(array(
            "state" => "SUCCESS",
            "list" => $list,
            "start" => $start,
            "total" => count($files)
        ));

        echo $result;
    }

    /**
     * 遍历获取目录下的指定类型的文件
     * @param $path
     * @param array $files
     * @return array
     */
    private function getfiles($path, $allowFiles, $key, &$files = array()){
        if (!is_dir($path)) return null;
        if(substr($path, strlen($path) - 1) != '/') $path .= '/';
        $handle = opendir($path);
        while (false !== ($file = readdir($handle))) {
            if ($file != '.' && $file != '..') {
                $path2 = $path . $file;
                if (is_dir($path2)) {
                    $this->getfiles($path2, $allowFiles, $key, $files);
                } else {
                    if (preg_match("/\.(".$allowFiles.")$/i", $file) && preg_match("/.*". $key .".*/i", $file)) {
                        $files[] = array(
                            'url'=> '/'.$path2,
                            'name'=> $file,
                            'mtime'=> filemtime($path2)
                        );
                    }
                }
            }
        }
        return $files;
    }

}