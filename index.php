<?php
/**
 * 系统前端入口文件 
 */
define('PG_DEBUG'     , false); // 开启调试模式
define('PG_SHOWERROR' , TRUE ); // 开启运行报错
define('PG_VIEW_TYPE' , 'dir'); // 模板路径模式 [ 目录模式 ]
define('PG_404'       , TRUE ); // 默认开启404错误页面 这样展示比较友好
include 'phpGrace/phpGrace.php';