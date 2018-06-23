<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/23
 * Time: 0:16
 */

namespace app\admin\controller;


class Tools extends BaseAdmin
{

    public function region(){

        $parent_id = input('param.parent_id',0);
        if($parent_id == 0){
            $parent = array('region_id'=>0,'region_name'=>"中国省份地区",'level'=>0);
        }else{
            $parent = db('region')
                ->where("region_id" ,$parent_id)
                ->find();
        }
        $names = $this->getParentRegionList($parent_id);
        if(count($names) > 0){
            $names = array_reverse($names);
            $parent_path = implode($names, '>');
        }
        $region = db('region')
            ->where("parent_id" , $parent_id)
            ->select();

        $this->assign('parent',$parent);
        $this->assign('parent_path',$parent_path);
        $this->assign('region',$region);
        return $this->fetch();
    }

    public function regionHandle(){
        $data = input('post.');
        $id = input('param.id');
        $referurl =  isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : url("admin/tools/region");
        if(empty($id)){
            $data['level'] = $data['level']+1;
            if(empty($data['region_name'])){
                $this->error("请填写地区名称", $referurl);
            }else{
                $res = db('region')
                    ->where(["parent_id" => $data['parent_id'], "region_name" => $data['region_name']])
                    ->find();
                if(empty($res)){
                    db('region')->cache(true)->insert($data);
                    $this->success("操作成功", $referurl);
                }else{
                    $this->error("该区域下已有该地区,请不要重复添加", $referurl);
                }
            }
        }else{
            db('region')
                ->where("region_id=".$id." or parent_id=".$id)
                ->cache(true)
                ->delete();
            $this->success("操作成功", $referurl);
        }
    }

    /**
     * 寻找Region_id的父级字段, $column可自己指定
     * @param $parent_id
     * @return array
     */
    function getParentRegionList($parent_id){
        $names = array();
        $region =  db('region')
            ->where('region_id',$parent_id)
            ->find();
        array_push($names,$region['region_name']);
        if($region['parent_id'] != 0){
            $nregion = $this->getParentRegionList($region['parent_id']);
            if(!empty($nregion)){
                $names = array_merge($names, $nregion);
            }
        }
        return $names;
    }
}