<?php
/**
 * 系统 api 接口入口文件
 * @link      http://www.phpGrace.com
 * @copyright Copyright (c) 2010-2020 phpGrace.com
 * @license   http://www.phpGrace.com/license
 * @package   phpGrace
 * @author    haijun liu mail:5213606@qq.com
 * @version   1.2.0
 */
define('PG_DEBUG'       , TRUE ); // 开启调试模式
define('PG_SHOWERROR'   , TRUE ); // 开启运行报错
define('PG_AUTO_DISPLAY', FALSE); // api 接口不需要视图, 关闭框架视图加载
include '../phpGrace/phpGrace.php';