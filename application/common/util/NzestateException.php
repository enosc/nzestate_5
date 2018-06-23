<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/15
 * Time: 23:14
 */

namespace app\common\util;

use think\Exception;

/**
 * Class 异常类
 * @package app\common\util
 */
class NzestateException extends Exception
{

    private $errorArr = [];
    //重定义构造器使第一个参数message变为必须被指定的属性
    public function __construct($message, $code=0 ,$errorArr){
        //可以在这里定义一些自己的代码
        //建议同时调用parent::construct()来检查所有的变量是否已被赋值
        $this->errorArr = $errorArr;
        parent::__construct($message, $code);
    }
    //重写父类中继承过来的方法，自定义字符串输出的样式
    public function __toString(){
        return __CLASS__.":[".$this->code."]:".$this->message."<br>";
    }
    //为这个异常自定义一个处理方法
    public function customFunction(){
        echo "按自定义的方法处理出现的这个类型的异常";
    }

    public function getErrorArr()
    {
        return $this->errorArr;
    }
}