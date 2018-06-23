<?php

/**
 * 管理员操作记录
 * @param $log_info string 记录信息
 */
function saveAdminLog($log_info){
    $add['log_time'] = time();
    $add['admin_id'] = session('ADMIN.admin_id');
    $add['log_info'] = $log_info;
    $add['login_ip'] = request()->ip();
    $add['attempt_url'] = request()->baseUrl() ;
    db('admin_log')->insert($add);
}

function getMenuArr(){
    $menuArr = include_once APP_PATH.'admin/conf/menu.php';
    $act_list = session('act_list');
    if($act_list != 'all' && !empty($act_list)){
        $privilege = db('system_menu')
            ->field('privilege')
            ->where('menu_id', ['in', $act_list])
            ->cache(true);

        $role_privilege = '';
        foreach ($privilege as $val){
            $role_privilege .= $val.',';
        }
        foreach($menuArr as $k=>$val){
            foreach ($val['child'] as $j=>$v){
                foreach ($v['child'] as $s=>$son){
                    if(strpos($role_privilege,$son['op'].'@'.$son['act']) === false){
                        unset($menuArr[$k]['child'][$j]['child'][$s]);//过滤菜单
                    }
                }
            }
        }
        foreach ($menuArr as $mk=>$mr){
            foreach ($mr['child'] as $nk=>$nrr){
                if(empty($nrr['child'])){
                    unset($menuArr[$mk]['child'][$nk]);
                }
            }
        }
    }

    return $menuArr;
}