# Course-Q-A-System
1．设计内容及要求
1.1 课程答疑子系统基本要求
为提高教学效果，及时了解学生在课程教学中遇到的问题并做解答是重要的环节之一。
1.2 主要实现功能
(1)按课程分类。不同课程分别在不同的版块进行提问与答疑。
(2)学生提交问题。学生用3~4个关键字标识该问题的类别。然后提交该问题。
(3)任何学生或老师均可解答。问题提交者可给解答者打出评价分。从而增加答疑者的等级。
(4)老师可给提出优秀（一个漂亮）的问题的提问者打出优秀分。增加该提问的身份等级。
(5)设计一个算法，根据提问者的评价分（解答问题的能力）、优秀分（提出优秀问题的能力）、提出问题的数量、解答问题的数量，综合计算出一个向老师建议的该学生的综合能力分。该分可作为教师期末给出该学生在这门课程中的成绩之一。
(6)老师和学生的各项数据用图、表进行可视化。（创新点）
2．需求分析
（1）账号管理
添加、查询管理员账号，修改管理员密码。
（2）用户管理
支持学生、老师两类用户的注册、登录、修改个人资料。管理员可根据权限（学生、老师）、用户名、姓名或答疑等级查询并查看具体用户。
（3）课程管理
管理员可添加、查询、编辑或删除课程分类。
（4）问题管理
学生可提出或解答问题，可查询问题、解答。老师可解答，对学生解答可进 行评分。管理员可查询问题、解答、评分并查看详情或编辑。
（5）提问解答可视化
用表、图显示学生的提问次数、解答次数、评价分、优秀分及占比，显示老师的评价分和解答次数（限管理员可见）。
（6）系统管理
管理员可添加和查询友情链接、轮播图。
3．总体设计
3.1 程序总体结构

这是一张课程答疑子系统的架构图。整个系统分为三个主要部分：前端界面、后端集成和系统核心。
在前端界面部分，包含了注册界面、首页、问题答疑界面和权限登录界面。这些界面是用户直接交互的部分。
后端集成起到连接前端界面和数据库的作用，负责数据的输入和输出操作。
数据库则是整个系统的数据存储中心，负责存储和管理所有的数据，并通过数据输入和输出操作与后端集成进行交互。
系统核心是整个系统的关键部分，包括优秀打分、问题答疑和答疑跟踪可量化三个功能模块。这些模块利用数据库中的数据进行处理和操作。
通过这种架构设计，课程答疑子系统能够有效地实现用户界面的交互、数据的处理和存储，从而达到课程答疑的功能。
3.2 总体流程图

3.3 算法设计
前台登录功能：
功能描述：
接收前台用户输入的账号、密码、权限选择以及验证码等信息，与数据库中 “yonghu” 表的数据进行比对验证，若验证通过则将用户相关信息存入Session，然后跳转到index.jsp页面；若验证失败（账号密码错误或验证码错误等情况）则弹出相应错误提示框并跳回index.jsp页面。
核心代码：
if (ac.equals("login")) {   
    String username = request.getParameter("username");  // 获取前台填写得账号 
    String password = request.getParameter("pwd");   // 获取前台填写得密码  
    String utype = request.getParameter("cx");   // 判断页面上选择的权限  
    String pagerandom = request.getParameter("pagerandom") == null ? "" : request.getParameter("pagerandom");  // 获取填写得验证码 
    String random = (String) request.getSession().getAttribute("random");  
    if (!pagerandom.equals(random) && request.getParameter("a") != null) {  
        request.setAttribute("error", "验证码错误");  
        go("index.jsp", request, response);  
    } else {  
        String sql1 = "";  
        if (utype.equals("用户")) {  
            sql1 = "select * from yonghu where yonghuming='" + username + "' and mima='" + password + "' ";  
        }        
        Map map = dao.find(sql1);  // 查询数据库中得信息判断账号密码的正确性 
        if (!map.isEmpty()) {  
            Iterator iter = map.keySet().iterator();  // 获取数据循环  
            // 设置session  
            request.getSession().setAttribute("username", username);  
            request.getSession().setAttribute("login", utype);  
            request.getSession().setAttribute("cx", utype);  
            while (iter.hasNext()) {  
                // 这个循环设置用户得信息进session 中  
                String key = (String) iter.next();  
                String val = (String) map.get(key);  
                request.getSession().setAttribute(key, val);  
            }  
            // 跳转到index.jsp  
            gor("index.jsp", request, response);  
        } else {  
            request.setAttribute("error", "账号或密码错误");  
            go("index.jsp", request, response);  
        }  
    }  
}  
后台登录功能：
功能描述：
和前台登录类似，不过是针对后台管理员登录，接收管理员输入的账号、密码、权限选择以及验证码等信息，与数据库中 “admins” 表的数据进行比对验证，验证通过后将管理员相关信息存入Session并跳转到main.jsp页面，验证失败则弹出相应错误提示框并跳回login.jsp页面。
核心代码：
if (ac.equals("adminlogin")) {  
    String username = request.getParameter("username");  // 获取前台填写的账号  
    String password = request.getParameter("pwd");  // 获取前台填写的密码  
    String utype = request.getParameter("cx");   // 判断页面上选择的权限  
    // 获取填写得验证码  
    String pagerandom = request.getParameter("pagerandom") == null ? "" : request.getParameter("pagerandom");  
    // 获取生成验证码时保存在session 中得验证码，对比输入是否正确
    String random = (String) request.getSession().getAttribute("random");   
    if (!pagerandom.equals(random) && request.getParameter("a") != null) {  
        request.setAttribute("error", "验证码错误");  
        go("login.jsp", request, response);  
    } else {  
        String sql1 = "";  
  
        if (utype.equals("管理员")) {  
            sql1 = "select * from admins where username='" + username + "' and pwd='" + password + "' ";  
        }  
        // 查询数据库中得信息判断账号密码的正确性  
        Map map = dao.find(sql1);  
        if (!map.isEmpty()) {  
            // 获取数据循环  
            Iterator iter = map.keySet().iterator();  
            request.getSession().setAttribute("username", username);  
            request.getSession().setAttribute("cx", utype);  
            request.getSession().setAttribute("login", utype);  
            while (iter.hasNext()) {  
                String key = (String) iter.next();  
                String val = (String) map.get(key);  
                request.getSession().setAttribute(key, val);  
            }  
            gor("main.jsp", request, response);  
        } else {   
            request.setAttribute("error", "账号或密码错误");  
            go("login.jsp", request, response);  
        }  
    }  
}  
修改密码功能
功能描述：
根据当前登录用户（通过Session获取登录权限及用户名等信息）输入的原密码、新密码以及确认密码，先验证原密码是否正确（通过查询对应数据表），若原密码正确则更新密码为新密码，并弹出密码修改成功提示框跳回mod.jsp页面；若原密码错误则弹出原密码错误提示框跳回mod.jsp页面。
核心代码：
if (ac.equals("adminuppass")) {  
    // 获取前台填写得原密码  
    String olduserpass = request.getParameter("ymm");  
    // 获取前台填写得新密码  
    String userpass = request.getParameter("xmm1");  
    // 获取前台填写得确认密码  
    String copyuserpass = request.getParameter("xmm2");  
    //  println(Info.getUser(request).get("id").toString());  
    // 判断当前权限p  
    String cx = (String) request.getSession().getAttribute("login");  
    //String oldPassword = "";  
    // 获取当前登录用户的账号  
    String username = request.getSession().getAttribute("username").toString();  
    Map m = null;  
    String biao = "";  
    if (cx.equals("管理员")) {  
        biao = "admins";  
        m = Query.make(biao).where("username", username).where("pwd", olduserpass).find();  
        // dao.getmaps("username", (String) request.getSession().getAttribute("username"), "admins");  
    }  
    if (cx.equals("用户")) {  
        biao = "yonghu";  
        m = Query.make(biao).where("yonghuming", username).where("mima", olduserpass).find();  
        // dao.getmaps("yonghuming", (String) request.getSession().getAttribute("username"), "yonghu");  
    }  
  
    // 尝试登录一下原密码、如果为null  或 空map则提示原密码错误  
    if (m == null || m.isEmpty()) {  
        // 提示原密码错误  
        request.setAttribute("error", "原密码错误");  
        go("mod.jsp", request, response);  
    } else {  
        //String id = (String)user.get("id");  
        // 否则更新成新密码  
        String sql = "";  
        if (cx.equals("管理员")) {  
            sql = "UPDATE admins SET pwd='" + userpass + "' WHERE username='" + username + "'";  
        }  
        if (cx.equals("用户")) {  
            sql = "UPDATE yonghu SET mima='" + userpass + "' WHERE yonghuming='" + username + "'";  
        }  
  
        //执行更新密码  
        dao.commOper(sql);  
        //  提示密码修改成功  
        request.setAttribute("error", "密码修改成功");  
        go("mod.jsp", request, response);  
    }  
}  
3.4 数据结构设计
用户登录相关
用户登录信息：
username（字符串）：用户名，如“user123”。
password（字符串）：密码，示例“abc123”。
utype（字符串）：用户类型（“用户”“管理员”等）。
pagerandom（字符串）：验证码。
数据库操作相关
数据库连接配置：
database（字符串）：数据库名，像“jspm22710kcjxdyzxt”。
username（字符串）：登录用户名，如“root”。
pwd（字符串）：登录密码，“root”。
isMysql8（布尔）：是否为 MySQL 8.0 及以上版本。
数据库结果查询：
用HashMap（单条数据）或List<HashMap>（多条数据）存储，以列名作键，对应值为值，方便存、取数据。
分页数据：
count（长整型）：总行数。
page（整型）：当前页码。
pageCount（整型）：总页数。
firstRow（整型）：数据库查询起始行位置。
listRows（整型）：每页行数。
urlRule（字符串）：分页 URL 规则，含路径、参数等。
info（字符串）：分页展示 HTML 代码。
会话（Session）相关
用户会话信息：以键值对存于Session，如"username"存用户名，"login"存用户类型，其他表字段名存对应用户详细信息。
请求处理相关
请求参数获取：
name（字符串，方法参数）：要获取的参数名，如“page”。
def（对应类型的默认值，方法参数）：参数不存在或为空时返回的值，像获取整数参数默认值为 0。
内部用value（字符串数组）临时存获取的参数值，再按需转换返回合适类型值。
线程上下文相关：
servletContext（ServletContext类型）：应用上下文环境。
session（HttpSession类型）：当前会话对象。
request（HttpServletRequest类型）：当前请求对象。
response（HttpServletResponse类型）：响应对象。
cookies（Map<String, Cookie>类型）：Cookie信息。
文件上传相关:
url（字符串）：文件在服务器存储路径。
fileName（字符串）：服务器端生成的文件名。
state（字符串）：上传状态（如“SUCCESS”“TYPE”等）。
type（字符串）：文件类型扩展名。
originalName（字符串）：原始文件名。
size（长整型）：文件大小。
request（HttpServletRequest类型）：上传用的请求对象。
title（字符串）：文件标题（特定情况获取）。
errorInfo（HashMap<String, String>）：错误状态码及对应描述。

3.5 网络通信设计
通信协议与请求方式
采用HTTP协议进行网络通信，常用GET和POST请求方法。GET用于如分页查询等获取数据场景，POST多用于提交数据操作，像用户登录等。

客户端与服务器交互流程
用户登录：
客户端：用户在登录页填信息后，点击登录按钮发起POST请求发给服务器对应Servlet。
服务器端：接收请求，验证账号密码（与数据库交互），成功则存用户信息到Session并跳转对应页面，失败则返回错误提示并回退到登录页。
数据查询与分页：
客户端：访问分页页面时，依操作发带页码等参数的GET请求获取对应数据页。
服务器端：接收请求，获取参数后查数据库并处理分页，再返回含数据和分页代码的响应给客户端展示。
文件上传：
客户端：选文件填表单后发POST请求（enctype="multipart/form-data"）传文件及表单数据到服务器。
服务器端：判断请求，按规则处理文件，成功保存并记录信息，失败设对应错误状态并反馈给客户端。

数据传输格式与编码
请求参数格式：普通表单用application/x-www-form-urlencoded格式，文件上传用multipart/form-data格式。
响应数据格式：常见返回HTML页面内容或JSON格式数据（依场景）。
字符编码：服务器多处设为UTF-8编码，避免乱码，如在请求、响应及文件上传处理中设置。

会话管理与状态保持
基于HttpSession管理会话，登录成功存用户信息到Session实现跨页面状态保持，可设会话超时时间保证安全和资源管理。

错误处理与反馈机制
数据库、文件上传及其他操作遇异常时，各自按设定处理，像打印错误信息、回滚事务、返回对应错误提示给客户端，避免暴露复杂内部错误，提升体验。详细设计
4. 详细设计
4.1 [weroot]目录
模块名称.jsp      插入、更新、删除数据的处理文件
模块名称_list.jsp  后台查询数据和显示列表的
模块名称_add.jsp  后台添加数据页面
模块名称_updt.jsp  显示更新数据的页面
模块名称list.jsp    前台列表页面和_list 类似
模块名称add.jsp    前台添加页面  操作和显示 和 add.jsp 类似
模块名称detail.jsp  详情页面，显示所有的信息
4.2 创建外键索引语句
ALTER TABLE wentitiwen ADD FOREIGN KEY (fenlei) REFERENCES kechengfenlei(id) ON UPDATE CASCADE ON DELETE CASCADE;  
ALTER TABLE wentijieda ADD FOREIGN KEY (wentitiwenid) REFERENCES wentitiwen(id) ON UPDATE CASCADE ON DELETE CASCADE;  
ALTER TABLE wentijieda ADD FOREIGN KEY (fenlei) REFERENCES kechengfenlei(id) ON UPDATE CASCADE ON DELETE CASCADE;  
ALTER TABLE jiedapingfen ADD FOREIGN KEY (wentijiedaid) REFERENCES wentijieda(id) ON UPDATE CASCADE ON DELETE CASCADE;  
ALTER TABLE jiedapingfen ADD FOREIGN KEY (fenlei) REFERENCES kechengfenlei(id) ON UPDATE CASCADE ON DELETE CASCADE;  
ALTER TABLE youxiudafen ADD FOREIGN KEY (wentitiwenid) REFERENCES wentitiwen(id) ON UPDATE CASCADE ON DELETE CASCADE;  
ALTER TABLE youxiudafen ADD FOREIGN KEY (fenlei) REFERENCES kechengfenlei(id) ON UPDATE CASCADE ON DELETE CASCADE
4.3 [src目录]流程图
Control  登录、修改密码
Dao 数据库链接，和增删改查处理
DAO.DB 数据库sql 语句编译器
Util 工具类
Util.threadlocal  保存request  response  session 到当前线程中
Util.tld  jsp 页面标签扩展类

登录控制器流程图：














Dao操作流程图


4.4 数据库表设计
【管理员】模块,表名：admins 
序号	字段名	类型	长度	主键	描述
1	id	int		是	(主键)
2	username	varchar	50		帐号 
3	pwd	varchar	50		密码 
【用户】模块,表名：yonghu 
序号	字段名	类型	长度	主键	描述
1	id	int		是	(主键)
2	cx	varchar	50		权限 
3	yonghuming	varchar	50		用户名 
4	mima	varchar	50		密码 
5	xingming	varchar	50		姓名 
6	xingbie	varchar	10		性别 
7	shouji	varchar	50		手机 
8	pingjiafen	decimal(10, 2)			评价分 
9	youxiufen	varchar	50		优秀分 
10	jiedashu	varchar	50		解答数 
11	dayidengji	varchar	50		答疑等级 
12	tiwendengji	varchar	50		提问等级 
13	touxiang	varchar	255		头像 
【友情链接】模块,表名：youqinglianjie 
序号	字段名	类型	长度	主键	描述
1	id	int		是	(主键)
2	wangzhanmingcheng	varchar	50		网站名称 
3	wangzhi	varchar	50		网址 
【轮播图】模块,表名：lunbotu 
序号	字段名	类型	长度	主键	描述
1	id	int		是	(主键)
2	title	varchar	50		标题 
3	image	varchar	255		图片 
4	url	varchar	255		连接地址 
【课程分类】模块,表名：kechengfenlei 
序号	字段名	类型	长度	主键	描述
1	id	int		是	(主键)
2	fenleimingcheng	varchar	255		分类名称 
【问题提问】模块,表名：wentitiwen 
序号	字段名	类型	长度	主键	描述
1	id	int		是	(主键)
2	bianhao	varchar	50		编号 
3	biaoti	varchar	255		标题 
4	fenlei	int			分类 
5	fengmian	varchar	255		封面 
6	neirong	longtext			内容 
7	jiedashu	int			解答数 
8	tiwenren	varchar	64		提问人 
9	addtime	timestamp 			提问时间 
设置索引， 字段：fenlei ， 关联表【kechengfenlei】中的id 字段 
【问题解答】模块,表名：wentijieda 
序号	字段名	类型	长度	主键	描述
1	id	int		是	(主键)
2	wentitiwenid	int			问题提问id 
3	bianhao	varchar	50		编号 
4	biaoti	varchar	255		标题 
5	fenlei	int			分类 
6	tiwenren	varchar	64		提问人 
7	wentijieda	longtext			问题解答 
8	jiedaren	varchar	64		解答人 
9	tijiaozhepingfen	int			提交者评分 
10	addtime	timestamp 			解答时间 
设置索引， 字段：wentitiwenid ， 关联表【wentitiwen】中字段id 
设置索引， 字段：fenlei ， 关联表【kechengfenlei】中的id 字段 
【解答评分】模块,表名：jiedapingfen 
序号	字段名	类型	长度	主键	描述
1	id	int		是	(主键)
2	wentijiedaid	int			问题解答id 
3	bianhao	varchar	50		编号 
4	biaoti	varchar	255		标题 
5	fenlei	int			分类 
6	tiwenren	varchar	64		提问人 
7	wentijieda	varchar	255		问题解答 
8	jiedaren	varchar	64		解答人 
9	pingfen	int			评分 
设置索引， 字段：wentijiedaid ， 关联表【wentijieda】中字段id 
设置索引， 字段：fenlei ， 关联表【kechengfenlei】中的id 字段 
【优秀打分】模块,表名：youxiudafen 
序号	字段名	类型	长度	主键	描述
1	id	int		是	(主键)
2	wentitiwenid	int			问题提问id 
3	bianhao	varchar	50		编号 
4	biaoti	varchar	255		标题 
5	fenlei	int			分类 
6	tiwenren	varchar	64		提问人 
7	youxiupingfen	varchar	50		优秀评分 
8	shuoming	varchar	255		说明 
9	pingjialaoshi	varchar	64		评价老师 
10	addtime	timestamp 			评价时间 
设置索引， 字段：wentitiwenid ， 关联表【wentitiwen】中字段id 
设置索引， 字段：fenlei ， 关联表【kechengfenlei】中的id 字段 

5．运行环境
开发工具：eclipse或IDEA
Eclipse：这是一个开源的集成开发环境（IDE），深受 Java 开发者的喜爱。它提供了丰富的插件系统，能够满足不同项目类型的开发需求，例如 Java Web 开发、企业级应用开发等。
IDEA（IntelliJ IDEA）：这是一款功能强大的商业 IDE，在 Java 开发领域非常流行。它具有智能代码补全、代码分析和重构等高级功能，能够极大地提高开发效率。

服务器：Tomcat8.0及以上
Tomcat 是一个开源的 Servlet 容器，广泛用于运行 Java Web 应用程序。Tomcat 8.0 及以上版本提供了更好的性能和对最新 Java EE 规范的支持，例如对 Servlet 3.1 和 WebSocket 1.1 的支持。

数据库：MySQL5.5
MySQL 是一个流行的开源关系型数据库管理系统。MySQL 5.5 版本具有稳定性好、性能高的特点，并且支持多种存储引擎，如 InnoDB 和 MyISAM，适合用于开发各种类型的应用程序。

数据库工具：navicat 10
Navicat 是一款强大的数据库管理工具，支持多种数据库系统，包括 MySQL。Navicat 10 提供了直观的用户界面，用于数据库设计、创建、管理和查询操作，能够方便地进行数据库连接和数据操作。


环境：JDK8
JDK 8 引入了许多新特性，如 Lambda 表达式和 Stream API，这些特性有助于编写更简洁和高效的 Java 代码。
6．代码实现
6.1 类之间关系图

6.2 程序运行的主要界面或效果
在IDEA中直接运行

图表6.2-1 开始运行




运行后进入首页界面

图表6.2-2 首页界面


用户注册界面

图表6.2-3 注册界面








用户登录界面

图表6.2-4 登录界面


以学生权限登录界面

图表6.2-5 学生界面








查看问题界面

图表6.2-6 问题界面


解答问题界面

图表6.2-7 解答界面









个人中心界面

图表6.2-8 个人中心


以老师权限登录界面

图表6.2-9 老师登录界面








评分界面

图表6.2-10 评分界面

管理员登录界面

图表6.2-11 登录界面


图表6.2-12


图表6.2-13


图表6.2-14
6.3 程序实现中的主要难点
(1) 用户体验与界面设计：友好的界面设计对于提升用户体验至关重要。需要设计直观的导航、合理的层次结构、简洁的布局、合适的字体大小和颜色。
(2) 权限管理与认证：设计合适的算法实现用户身份验证，对于不同权限设计不同功能。
(3) 数据库设计：选择合适的数据库类型，设计合理的表结构，选择合适的字段类型。
6.4 程序测试与调试分析
(1)学生

启动程序，进入网页，首先点击用户注册进行注册。



填写所有信息后点击提交，若无重复用户则注册成功，然后进行登录。



填写用户名、密码和验证码后点击登录按钮。











登录成功，权限为学生，现在点进一个板块查看问题，进行解答。




进入C#NET板块，点进问题列表中的一号问题。













在输入栏输入解答内容后，点击发布按钮即成功发布解答。


接下来回到主页，点进个人中心发布新的问题。

点进左侧问题提问中的问题提问添加，填写完整即可发布提问。此外，还可在该栏目查询自己的提问、解答、评分。


个人中心一栏中可以修改个人信息和密码。



回到首页，点进JAVA板块，可见新问题已经发布。



回到首页，点击退出即可退出登录。

(2)老师
注册权限为老师的账号并登录。


进入JAVA板块的一号问题进行打分，点击优秀打分按钮。

选定评分后提交，即可发现该学生优秀分变为5分。



在老师的个人中心中，可以查询自己打出的评分。

(3)管理员
点击首页中的后台管理。

输入用户名、密码（也是admin）、验证码后登录。


在账号管理一栏中，可查询、添加管理员，修改管理员密码。






在用户管理一栏中，可直接添加新用户，也可查询已存在用户。






在课程分类管理一栏中，可添加新板块，也可查询已存在的板块。


问题提问管理一栏中可查询已发布的问题。





在问题解答管理一栏中，可查询解答及评分。



优秀打分管理一栏中可查询优秀打分。

答题提问可视化一栏中可查看学生和老师的可视化数据。



系统管理一栏中，可添加、查询友情链接、轮播图。







7．总结与体会
本次 Java 课设聚焦于打造一个在线图书管理子系统，致力于优化图书借阅流程，高效处理图书信息以及读者借阅记录等事务，进而提升图书馆的管理效能。在整个项目开发周期里，严格依据软件工程规范推进，从精准剖析需求、精心构思系统架构、严谨编写代码，再到全面细致地测试与调试，一步步将系统各项功能雕琢完善。经此课设历练，我们对 Java 语言的精妙之处与独特优势有了更透彻的领悟，熟练驾驭了 Java 基础语法以及面向对象编程范式，同时精通了数据库核心操作，诸如表结构搭建、数据的精准录入、灵活修改、妥善删除与高效查询等，此次课设为我们后续的学业精进和职业发展筑牢了坚实根基。
