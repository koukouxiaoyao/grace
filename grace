<?php 
/**
 * 通过 phpGrace 内置的命令行工具可以快速的创建分组、 模型文件，使用方法详见下面的说明。
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

//PHP cli 模式 在php中命令行附加的参数将会以数组的形式存储在变量$argv中，另一个变量$argc中则保存了变量$argv中参数的个数
   
 //获取参数
$arr1 = $argv[1]; 
$name = $argv[2]; 
//实例化
$controller = new create; 
//创 建 分组 : php grace cg 分组名称 
if($arr1 == 'cg'){  
     $controller->creatDir($name);
}elseif ($arr1 == 'cm') {
    //创 建 模型 : php grace cm 模型名称
    $controller->createModel($name);
}else{
    fwrite(STDOUT,"Success! 命令行已经准备好，可以开始创建对应目录或者文件");
}
 
class create  { 
    /** 创 建 分组 : php grace cg 分组名称 */
    public function creatDir($name = nul)
    {
        if($name == null){echo "失败：分组名称未填写" ;exit();}
        if(is_dir($name)){echo "分组".$name."已经存在!" ;exit();} 
        //创建外层目录
        mkdir($name, 0777, true); 
        //创建 index.php
        $this->graceCreateAppIndexPhp($name);
        //创建 伪静态
        $this->graceCreateAppHtaccess($name);
          
        $app = $name.'/app';
        $views = $app.'/views';
        $lang = $app.'/lang';
        $controller = $app.'/controllers';
        //创建app文件夹
        mkdir( $app , 0777, true);
        //创建控制器 
        mkdir( $controller  , 0777, true); 
        $this->graceCreateAppIndexHtml($controller);
        $this->graceCreateAppIndexController($controller);
        //创建视图
        mkdir( $views , 0777, true);
        $this->graceCreateAppIndexHtml($views); 
        $this->graceCreateAppIndexView($views);
        //创建语言包
        mkdir( $lang  , 0777, true);
        $this->graceCreateAppIndexHtml($lang); 
        $this->graceCreateAppLang($lang);

        //创建app目录下的router.php
        $this->graceCreateAppRouter($app);
        //创建app目录下的config.php
        $this->graceCreateAppConfig($app);
        //创建app目录下的index.html
        $this->graceCreateAppIndexHtml($app);
        echo "Success ！分组 已经创建成功，可以浏览器直接访问 网址/分组名称 这样访问";
    } 

    //创 建 模型 : php grace cm 模型名称 
    public function createModel($name = nul){ 
        if($name == null){echo "失败：分组名称未填写" ;exit();}
        $model = $name;
        $name = 'phpGrace/models/'.$name.'.php'; 
        if(is_file($name)){ echo "模型 {$model} 已经存在!" ;exit();}
        $str =<<<A
        <?php
        /*
         * 模型
         */
        namespace phpGrace\models;
        class {$model} extends \graceModel{
        
        }
        A;
        file_put_contents($name, $str); 
        echo " SUCCESS ! 模型: {$model} 已创建成功，路径：{$name} ，开始使用吧!";
    }

    //创建初始化 
    public function graceCreateAppIndexHtml($dir){
        file_put_contents($dir.'/index.html', '<html></html>'); 
    }

    //创建分组下的index.php
    public function graceCreateAppIndexPhp($dir){
        file_put_contents($dir.'/index.php',"<?php
    //入口文件
    define('PG_DEBUG'     , false); // 开启调试模式
    define('PG_SHOWERROR' , true); // 开启运行报错
    define('PG_VIEW_TYPE', 'dir');
    include '../phpGrace/phpGrace.php';
    ");
    }

    //创建分组下的.htaccess 
    public function graceCreateAppHtaccess($dir)
    {
        //伪静态文件
	file_put_contents($dir.'/.htaccess', '<IfModule mod_rewrite.c>
    RewriteEngine on
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^(.*)$ ./index.php?pathInfo=$1 [QSA,PT,L]
    </IfModule>');
    }

    //创建分组下的路由文件 router.php
    public function graceCreateAppRouter($dir)
    {
        //路由文件
        file_put_contents($dir.'/router.php', '<?php return array();?>');
    }

    public function graceCreateAppConfig($dir)
    {
        //路由文件
        file_put_contents($dir.'/config.php', '<?php return array();?>');
    }

    public function graceCreateAppIndexController($dir){
        $str = '<?php
    class indexController extends grace{
        
        //__init 函数会在控制器被创建时自动运行用于初始化工作，如果您要使用它，请按照以下格式编写代码即可：
        /*
        public function __init(){
            parent::__init();
            //your code ......
        }
        */
        public function index(){
            //系统会自动调用视图 index_index.php
        }
        
    }';
        file_put_contents($dir.'/index.php', $str);
    }

    public function graceCreateAppLang($dir){
        $str = "<?php
    return array(
        'APP_NAME'     => 'phpGrace',
    );";
        file_put_contents($dir.'/zh.php', $str);
    }

    public function graceCreateAppIndexView($dir){
        $str = '<?php if(!defined(\'PG_VERSION\')){exit;}?>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>welcome to phpGrace</title>
    </head>
    <body>
        <div style="font-size:22px; line-height:1.8em; font-family:微软雅黑; padding:100px;">
            <span style="font-size:60px; font-family:微软雅黑;">(: </span><br />
            Welcome to phpGrace ! 
        </div>
    </body>
    </html>';
        //创建index.php时候已经定义为 目录格式，所以就只创建目录格式的了
        mkdir($dir.'/index', 0777, true);
        file_put_contents($dir.'/index/index.php', $str);
        
    }
}