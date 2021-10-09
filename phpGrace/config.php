<?php
/**
 * phpGrace 全局配置文件
 * @link      http://www.phpGrace.com
 * @copyright Copyright (c) 2010-2020 phpGrace.com
 * @license   http://www.phpGrace.com/license
 * @package   phpGrace
 * @author    haijun liu mail:5213606@qq.com
 * @version   1.2.0
 */
return array(
	//数据库配置
	'db'                 => array(
		'databaseType'   =>    'mysql',     // 数据库类型
    	'host'           =>    '127.0.0.1', // 数据库主机地址
    	'port'           =>    '3306',      // 数据库端口
		'user'           =>    'root',      // 数据库账户
		'pwd'            =>    'root',      // 数据库密码 
		'dbname'         =>    'test',      // 数据库名称
		'charset'        =>    'utf8',      // 字符集
		'pre'            =>    't_'           // 数据表统一前缀
	),
	// 缓存类型
	'allowCacheType'     => array('file', 'memcache', 'redis'),
	// 缓存设置
	'cache'             => array(
		'type'          => 'file',
		'host'          => '127.0.0.1', // 主机地址 [ 'memcache', 'redis' 需要设置 ]
		'password'      => '', 			// 对应各类服务的密码, 为空代表不需要密码
		'port'          => '6379', 		// 对应服务的端口
		'pre'           => 'grace_',	// 缓存变量前缀
		'name2md5'      => false        // 为 true 时会将缓存变量名进行md5 加密
	)
);