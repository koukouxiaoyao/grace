## phpGrace  2.0.2
phpGrace - 轻快的实力派！<br />
老版本手册及官网 : <br />
[http://www.phpGrace.com](http://www.phpGrace.com/ "www.phpGrace.com")<br /> 

新版本手册：[https://www.phpGrace.com](https://www.phpGrace.com/ "www.phpGrace.com")<br /> 

##grace 的css 和 js cdn引用
~~~
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/koukouxiaoyao/phpgraces/grace.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/gh/koukouxiaoyao/phpgraces/grace.js"></script>
~~~

## phpGrace - 工具库
打造最全的工具库，只为更快、更好的开发 ^_^<br />
工具库地址 :<br />
[http://www.phpgrace.com/tools](http://www.phpgrace.com/tools "http://www.phpgrace.com/tools")<br /><br />
## 框架目录结构 
~~~
|_ admin // 应用后台分组, 用于实现后台管理 [ 只是建议，可自行命名 ]
|_ api // 应用接口分组，用于实现 api 接口 [ 只是建议，可自行命名 ]
|_ app //项目核心文件夹 [ 只是建议，可自行命名 ]
    |_ controllors // 控制器文件夹
    |_ views // 视图文件夹
    |_ lang // 语言包
    |_ config.php // 项目配置文件
    |_ router.php // 路由配置文件
|_ phpGrace // 框架核心文件夹 
    |_ caches // 缓存类文件夹
    |_ configs // 自定义配置文件目录
    |_ fonts // 框架字体文件夹
    |_ models // 全局模型文件夹
    |_ templates // 框架模板
    |_ tools // 框架工具包
    |_ config.php // 全局配置文件
    |_ phpGrace.php //框架核心文件
|_ .htaccess //apache 伪静态文件
|_ index.php //入口文件对应 app 目录

2. 分组说明
/admin 及 /api 目录演示了框架分组，phpGrace 创建分组是非常简单的，您只需要新建一个分组文件夹，在文件夹下创建 index.php，并编写以下代码 : 

<?php
define('PG_SESSION_START' , true);
define('PG_VIEW_TYPE'     , 'dir');
define('PG_DEBUG'         , false);
define('PG_SHOWERROR'     , true);
include '../phpGrace/phpGrace.php';复制
 运行分组路径后框架会自动初始化话分组所需的控制器、配置、伪静态、视图、语音包等基础文件，创建完成后您就可以在其基础上继续开发。
~~~

## 自定义更新日志
 
### 2021年10月7号 [增加命令行]
~~~
phpGrace  2.0.2
[增加命令行 -- 注意在项目根目录下使用下面的命令 ☆☆☆☆☆☆☆☆]
/**
 * 通过 phpGrace 内置的命令行工具可以快速的创建分组、控制器、模型文件，使用方法详见下面的说明。
 * 
 * 使用前提
 * 1 php 已添加至环境变量
 * php 环境变量设置教程 :
 *      widows : https://jingyan.baidu.com/article/37bce2beb6e2681002f3a20c.html
 *      macOs : https://blog.csdn.net/yunxixiao/article/details/117032913
 * 2 使用终端
 *      您可以通过各类终端工具使用 grace 命令，更推荐您在编辑器内置终端内使用 grace 命令。
 * 
 * 命令说明
 * // 注意在项目根目录下使用下面的命令
 * 默 认 命令 : php grace
 * 创 建 分组 : php grace cg 分组名称 
 * 创 建 模型 : php grace cm 模型名称 
 * 通过上面的命令，您就可以快速的实现 命令方式 创建分组、 模型文件。
 */
~~~


### 本框架支持使用 Composer
 Composer 使用流程  
1 安装 Composer
~~~
安装教程 : https://pkg.phpcomposer.com/#how-to-install-composer
~~~
2 Composer 镜像设置
~~~
使用阿里云composer镜像为国内composer加速，阿里云composer镜像与 Packagist 官方实时同步，推荐使用最新的 Composer 版本。 
命令 : 
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

取消配置还原到默认的地址 : 
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
~~~
3 框架内使用 composer
~~~
3.1 打开 cmd 或者 ios 命令；
3.2 cd 切换到 /项目目录/phpGrace/  
3.2 执行 composer 命令 : 
composer require ******

比如：（composer  QrCode 用来生成二维码 忽略php版本）
composer require endroid/qr-code  --ignore-platform-reqs
~~~
4 使用 composer 下载的工具类 （参考）
~~~
<?php
// 4.1 页面引用 composer 对应的 autolaod.php ( 实现类库自动加载 )；
require_once PG_IN.'vendor'.PG_DS.'autoload.php';
//4.2 实例化工具类，并使用，如 :
$phpWord = new \PhpOffice\PhpWord\PhpWord();
~~~ 
### 2021年10月9号
~~~
[修护]修护了一些小bug
[更新]自定义缓存类 使用参考 https://phpgrace.com/doc/index/78-3400-28.html?code=3415 
[添加] 
PHPgrace/config.php里面缓存配置项添加了 缓存变量名进行md5 加密 
'name2md5' => false  // 为 true 时会将缓存变量名进行md5 加密
[添加]分类树类
~~~
### 2021年10月6号[修护] 
~~~
[修护] 修护部分文件夹直接访问爆出目录问题 (目录文件夹内添加默认访问空index.html文件)
~~~
### 2021年10月5号
~~~
 [更新]版本 2.0.0 
【新增】PG_404  常量， PG_404	默认 true【开启】，false 【关闭】	是否开启404页面展示
 参数介绍： https://www.phpgrace.com/doc/index/56-3100-28.html?code=3125

【新增】模块配置 ，某个具体模块的配置数据，比如 文章模块 : 每页展示数量、文章状态等，作用于某个具体模块；
 调用介绍：https://www.phpgrace.com/doc/index/63-3100-28.html?code=3130  查看3. 模块配置
【增加】网站模块下的配置项，如果将配置项写入网站配置文件(制作网站设置信息方便使用)
~~~ 
### 2021年4月25日
~~~
停更新及下载通知

phpGrace 自 2021年4月25日停止更新及开源，为了已使用用户能够继续使用框架，我们保留官网及手册。
框架并无致命 BUG，停更核心原因是无法控制框架使用者会不会使用框架做”违法”的坏事。
感谢大家的一路相伴，也谢谢大家的谅解 ~


注意事项

01 如果您是一直使用框架的老用户可以继续使用 phpGrace 框架，手册保留；
02 不得传播框架源码，一旦出现法律问题，传播者自负；
~~~

### 2020年12月4日 
~~~
01.[备注] 规则验证,一个字段多个规则 array([规则1],[规则2],[规则3])
~~~

### 2020年11月17日
~~~
01.[优化] trace 显示调用异常情况，直接通过DEBUG来开启或者关闭
02.[修复] phpgrace.php 核心框架里面的代码注释错误情况
03.[修复] graceFunctions.php 错误调试开关无效的问题 
04.[修复] u()函数 在没定义后缀名时候，网址最后以/结尾 比较丑的模式
05.[备注] 核心框架 phpgrace.php中的 define('PG_INDEX_FILE_NAME' , 'index.php');这个定义不要动，不然会显示网址错误的
~~~ 
### 2020-07-23
~~~
01. [添加] 自定义缓存类文件支持，提升缓存的复用能力;
02. [修复] memcache 形式的缓存类，优先调用 memcached 类;
~~~
### 2020-07-20
~~~
01. [优化] 优化框架核心文件结构，将常用函数封装到 graceFunctions.php;
02. [添加] 框架注释全面优化，阅读源码更友好;
03. [添加] 新增追踪信息，展示运行信息、文件信息、sql 语句三个模块，对开发更友好;
04. [优化] 错误及异常处理机制;
05. [优化] 更新全局配置文件创建规则，以便于之后的框架可以实现无缝升级;
~~~
### 2020-07-15
~~~
01. [优化] 框架核心文件结构，将常用函数封装到 graceFunctions.php;
02. [添加] 框架注释全面优化，阅读源码更友好;
03. [添加] 新增追踪信息，展示运行信息、文件信息、sql 语句三个模块，对开发更友好;
04. [优化] 错误及异常处理机制;
05. [优化] 更新全局配置文件创建规则，以便于之后的框架可以实现无缝升级;
~~~