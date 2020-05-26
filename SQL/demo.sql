/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50728
Source Host           : 127.0.0.1:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2020-05-18 15:52:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `ano` char(6) NOT NULL COMMENT '管理员号',
  `adm_psw` varchar(255) NOT NULL DEFAULT '123456' COMMENT '登录密码，默认为123456',
  `adm_name` varchar(255) NOT NULL COMMENT '管理员姓名',
  `adm_sex` varchar(255) NOT NULL DEFAULT '女' COMMENT '管理员性别',
  `adm_email` varchar(255) NOT NULL COMMENT '管理员邮箱',
  `adm_phone` char(11) DEFAULT NULL COMMENT '管理员手机号码',
  `adm_last_login_time` datetime DEFAULT NULL COMMENT '管理员最近登录时间',
  PRIMARY KEY (`ano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('100000', '123456', '小王', '男', '123456@qq.com', '13358452698', '2020-05-02 15:46:07');
INSERT INTO `admin` VALUES ('100001', '123456', '小李', '男', '123456@qq.com', '13358452695', null);
INSERT INTO `admin` VALUES ('123456', '123456', '小张', '男', '123456@qq.com', '13380544897', '2020-05-03 22:28:17');
INSERT INTO `admin` VALUES ('admin1', 'admin1', '小牛', '男', '123456@qq.com', '15114897562', '2020-05-17 19:37:26');

-- ----------------------------
-- Table structure for assessment_info
-- ----------------------------
DROP TABLE IF EXISTS `assessment_info`;
CREATE TABLE `assessment_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `final_examination` int(255) DEFAULT NULL COMMENT '期末考核',
  `practical_examination` int(255) DEFAULT NULL COMMENT '实践考核',
  `experimental_examination` int(255) DEFAULT NULL COMMENT '实验考核',
  `homework_assessment` int(255) DEFAULT NULL COMMENT '作业',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `state_data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assessment_info
-- ----------------------------
INSERT INTO `assessment_info` VALUES ('1', '65', '87', '77', '98', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `assessment_info` VALUES ('2', '88', '54', '89', '87', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `assessment_info` VALUES ('3', '65', '87', '77', '98', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `assessment_info` VALUES ('4', '88', '54', '89', '87', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `assessment_info` VALUES ('5', '77', '77', '87', '67', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `assessment_info` VALUES ('6', '60', '65', '78', '66', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `assessment_info` VALUES ('7', '73', '65', '78', '88', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `assessment_info` VALUES ('8', '65', '89', '78', '75', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `assessment_info` VALUES ('9', '65', '87', '77', '98', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `assessment_info` VALUES ('10', '88', '54', '89', '87', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');

-- ----------------------------
-- Table structure for bank_fill_que
-- ----------------------------
DROP TABLE IF EXISTS `bank_fill_que`;
CREATE TABLE `bank_fill_que` (
  `fill_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '填空题id',
  `fill_content` varchar(255) DEFAULT NULL COMMENT '填空题内容',
  `fill_answer` varchar(255) DEFAULT NULL COMMENT '填空题答案',
  `compose_flag` varchar(255) DEFAULT '0' COMMENT '是否被组成',
  `answer_explain` varchar(255) DEFAULT NULL COMMENT '题目解析',
  `lang_id` int(11) DEFAULT NULL COMMENT '该题所属编程语言',
  PRIMARY KEY (`fill_id`),
  KEY `fill_lang_id` (`lang_id`),
  CONSTRAINT `bank_fill_que_ibfk_1` FOREIGN KEY (`lang_id`) REFERENCES `programing_language` (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank_fill_que
-- ----------------------------
INSERT INTO `bank_fill_que` VALUES ('1', 'Java的三大平台分别是Java SE、______和Java ME。', 'Java EE', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('2', 'Java程序开发前需下载安装Java应用程序开发包，其英文缩写是__________。', 'JDK', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('3', '在Windows下打开命令行界面的方法是搜索输入命令_________________。', 'CMD', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('4', 'JDK安装完成后，javac和java这些编译和运行工具存放在JDK安装目录的_____________子目录中。', 'bin', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('5', 'JDK安装完成后，在操作系统上还需要配置_______________环境变量，\n该环境变量用于存储Java的编译和运行工具所在的路径。', 'Path', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('6', 'Java中的________________用于为程序增加一些说明性文字，增加程序的可读性，\n本身不会被执行。', '注释', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('7', 'Java中单行注释是在注释前书写______________符号。', '//', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('8', 'Java中有三种注释，分别是单行注释、多行注释和_________________。', '文档注释', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('9', 'Java程序从________________方法开始执行。', 'main()', '0', null, '1');
INSERT INTO `bank_fill_que` VALUES ('10', 'Java是一种___________________编程语言，它要求所有变量都具有一个类型。', '强类型', '0', null, '1');
INSERT INTO `bank_fill_que` VALUES ('11', 'Java数据类型分为两大类，分别是基本数据类型和____________________。', '引用数据类型', '0', null, '1');
INSERT INTO `bank_fill_que` VALUES ('12', 'Java中的int类型占用______________个字节。', '4', '0', null, '1');
INSERT INTO `bank_fill_que` VALUES ('13', 'Java中的整型数的字面值在表示八进制时，需添加前缀________________。', '0', '0', null, '1');
INSERT INTO `bank_fill_que` VALUES ('14', 'Java中都整型数的字面值在表示十六进制时，需添加前缀_______________。', '0x', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('15', 'Java中在整数后面添加后缀字母______________表示long型整数。', 'L', '0', null, '1');
INSERT INTO `bank_fill_que` VALUES ('16', 'Java的基本数据类型中，float和____________________类型用于保存浮点数。', 'double', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('17', 'float类型的字面值在书写时浮点数时，还需要在最后添加后缀字母_____________。', 'f', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('18', 'Java的基本类型中，_______________类型表示字符型。', 'char', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('19', 'Java中的赋值运算符是______________。', '=', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('20', 'Java的boolean类型只有_______________和false两个取值。', 'true', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('21', '依据结构化程序设计理论，所有程序都可以用三种基本控制结构构成，', '循环', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('22', '它们分别是顺序、选择和________________。', 'if-else', '0', null, '1');
INSERT INTO `bank_fill_que` VALUES ('23', '而条件为false时执行另一些语句。。', '分号', '0', null, '1');
INSERT INTO `bank_fill_que` VALUES ('24', '（用汉字回答）', 'switch', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('25', '从多路分支中选择其中一路执行。。', 'do-while', '0', null, '1');
INSERT INTO `bank_fill_que` VALUES ('26', '______________循环会在执行循环体之后判断测试条件，因此至少会执行一遍循环体。', 'continue', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('27', '会跳过循环体中剩下的语句，继续进行下一次循环。', 'void', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('28', 'Java的数组属于___________________数据类型。', '引用', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('29', 'Java中取得数组的长度，可以使用用数组变量的_______________属性。', 'length', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('30', 'Java中包含10个元素的数组，其下标的范围是___________________。', '从0到9', '1', null, '1');
INSERT INTO `bank_fill_que` VALUES ('31', '测试填空题1', '测试填空题答案1', '0', '测试填空题解析1', '1');
INSERT INTO `bank_fill_que` VALUES ('32', '测试填空题2', '测试填空题答案2', '0', '测试填空题解析2', '2');
INSERT INTO `bank_fill_que` VALUES ('34', '测试手动录填空题哈哈哈', '测试手动录填空题啊啊啊', '0', '测试手动录填空题呀呀呀', '4');

-- ----------------------------
-- Table structure for bank_judge_que
-- ----------------------------
DROP TABLE IF EXISTS `bank_judge_que`;
CREATE TABLE `bank_judge_que` (
  `judge_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '判断题id',
  `judge_content` varchar(255) DEFAULT NULL COMMENT '判断题内容',
  `judge_answer` varchar(255) DEFAULT NULL COMMENT '判断题答案',
  `compose_flag` varchar(255) DEFAULT '0' COMMENT '是否被组成试卷',
  `answer_explain` varchar(255) DEFAULT NULL COMMENT '题目解析',
  `lang_id` int(11) DEFAULT NULL COMMENT '该题所属编程语言',
  PRIMARY KEY (`judge_id`),
  KEY `judge_lang_id` (`lang_id`),
  CONSTRAINT `bank_judge_que_ibfk_1` FOREIGN KEY (`lang_id`) REFERENCES `programing_language` (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank_judge_que
-- ----------------------------
INSERT INTO `bank_judge_que` VALUES ('1', 'Java中，h22是合法的变量名，而22h是不合法的变量名。（  ）', 'T', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('2', 'Java中birthday和birthDay是两个不同的变量。（     ）。', 'T', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('3', 'Java中，多行注释/* …*/中可以嵌套//的单行注释，\n但不能嵌套/*… */的多行注释。（      ）', 'T', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('4', 'Java表达式 5>7 || 3>=2的运算结果是true。（      ）', 'T', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('5', 'Java语句int n=9/2;执行后，n的值是5。（      ）', 'F', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('6', 'Java表达式 7>=7 ? 777 : 888的运算结果是888。（      ）', 'F', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('7', '已知int型的Java变量int x=3;，那么执行完int y=x++;语句后，y的值是4。（      ）', 'F', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('8', 'Java表达式0xC8-2的运算结果是198。（      ）', 'T', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('9', '已知int型的Java变量int x=5;，那么执行完x%=3;语句后，x的值是2。（      ）', 'T', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('10', 'Java源代码中出现的整型数5其默认类型是int。（      ）', 'T', '0', null, '1');
INSERT INTO `bank_judge_que` VALUES ('11', 'Java源代码中出现的浮点数值4.5其默认类型是float。（      ）', 'F', '0', null, '1');
INSERT INTO `bank_judge_que` VALUES ('12', 'Java中，int类型的数据可以直接赋值给double类型的变量，实现自动类型转换。（      ）', 'T', '0', null, '1');
INSERT INTO `bank_judge_que` VALUES ('13', 'Java中的boolean类型可以和int类型之间相互转换。（      ）', 'F', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('14', 'Java的switch语句中可以没有default子句，该子句是可选的。（      ）', 'T', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('15', 'Java的for循环语句中，for关键字后面的小括号()内三部分内容之间用逗号(,)分隔。（      ）', 'F', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('16', '在Java方法的内部不能调用自身方法。（      ）', 'F', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('17', 'Java的数组声明并初始化语句int[ ] arrayX = (1, 7, 8, 5, 9); 是正确的。（      ）', 'F', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('18', '声明Java数组boolean[ ] boolArray = new boolean[3]，那么boolArray[0]的值是false。（      ）', 'T', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('19', '声明并初始化二维数组int[ ][ ] dim2Array = { {1, 2}, {3, 4, 5}}，则dim2Array[1][2]的值是2。（      ）', 'F', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('20', 'Java在循环中出现的break语句的作用是结束本次循环，执行下一次循环。（      ）', 'F', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('21', 'Java中，h22是合法的变量名，而22h是不合法的变量名。（  ）', 'T', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('22', 'Java中birthday和birthDay是两个不同的变量。（     ）。', 'T', '1', null, '1');
INSERT INTO `bank_judge_que` VALUES ('23', '测试判断题1', 'T', '0', '测试判断题解析1', '1');
INSERT INTO `bank_judge_que` VALUES ('24', '测试判断题2', 'F', '0', '测试判断题解析2', '3');

-- ----------------------------
-- Table structure for bank_multiple_choice_que
-- ----------------------------
DROP TABLE IF EXISTS `bank_multiple_choice_que`;
CREATE TABLE `bank_multiple_choice_que` (
  `multiple_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '多选题id',
  `multiple_content` varchar(255) DEFAULT NULL COMMENT '多选题内容',
  `choice_A` varchar(255) DEFAULT NULL COMMENT '选项A',
  `choice_B` varchar(255) DEFAULT NULL COMMENT '选项B',
  `choice_C` varchar(255) DEFAULT NULL COMMENT '选项C',
  `choice_D` varchar(255) DEFAULT NULL COMMENT '选项D',
  `choice_E` varchar(255) DEFAULT NULL COMMENT '选项E',
  `choice_F` varchar(255) DEFAULT NULL COMMENT '选项F',
  `choice_G` varchar(255) DEFAULT NULL COMMENT '选项G',
  `multiple_answer` varchar(255) DEFAULT NULL COMMENT '多选题答案',
  `compose_flag` varchar(255) DEFAULT '0' COMMENT '是否被组成试卷',
  `answer_explain` varchar(255) DEFAULT NULL COMMENT '题目解析',
  `lang_id` int(11) DEFAULT NULL COMMENT '该题所属编程语言',
  PRIMARY KEY (`multiple_id`),
  KEY `multiple_lang_id` (`lang_id`),
  CONSTRAINT `bank_multiple_choice_que_ibfk_1` FOREIGN KEY (`lang_id`) REFERENCES `programing_language` (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank_multiple_choice_que
-- ----------------------------
INSERT INTO `bank_multiple_choice_que` VALUES ('1', '下面说法错误的是（）？[[[31b23b75-6de2-4aef-9c1b-1873ecf45b79]]]', 'A:能被java.exe成功运行的java class文件必须有mian（）方法。', 'B:J2SDK就是Java API。', 'C:Appletviewer.exe可利用jar选项运行.jar文件。', 'D:能被Appletviewer成功运行的java class文件必须有main方法。', 'E:Collection属于MVC模式中的对象。', '', null, 'BCDE', '1', 'A：main是主函数，是程序执行的起始点。没有main函数会报错不能编译执行。B：J2SDK是java开发环境包，包括了JDK（开发工具包）和JRE（运行环境包）。而API是Application Programming Interface，是应用程序编程接口，两者不是一个东西。C：这个楼楼真的没搞懂，欢迎懂得大佬来踢馆。D：Applet只要继承Applet类就行了,不需要main()方法。', '1');
INSERT INTO `bank_multiple_choice_que` VALUES ('2', '下面说法正确的是（）？', 'A:环境变量可在编译source code（源编译）时指定。', 'B:在编译程序时，所能指定的环境变量不包括classpath。', 'C:javac一次可同时编译数个Java源文件。', 'D:javac.exe能指定编译结果要置于哪个directory（目录）。', 'E:与HttpSessionListener接口有关的方法是sessionInitialized()。', null, null, 'BCD', '1', 'A：环境变量不能再源编译的时候指定的，它的配置一般都是在系统环境变量中。B：错误，可以设置classpath。C：这个不知道怎么讲，我只知道可以。 D：可以，在CDM中就能进行相应的操作。', '1');
INSERT INTO `bank_multiple_choice_que` VALUES ('3', '下面说法错误的是（）？', 'A:数组是一种对象。', 'B:数组属于一种原生类。', 'C:int number=[]={31,23,33,43,35,63}。', 'D:数组的大小可以任意改变。', 'E:可以在声明数组的同时进行初始化，也可以在声明以后进行初始化。', 'F:可以通过下标来引用数组。', null, 'BCD', '1', 'A：数组是一个对象，其内存分配在堆内。基本类型内存分配在栈内。 B：所谓的原生类，也称基本数据类型或内置对象。显然数组属于引用数据类型。 C：写法错误。D：数组的定义是：相同类型，固定长度的一组数据，一旦被初始化，长度不可更改。', '1');
INSERT INTO `bank_multiple_choice_que` VALUES ('4', '不能用来修饰interface的有（）？', 'A:private', 'B:public', 'C:protected', 'D:static', null, null, null, 'ACD', '1', 'A：接口是为了让别人实现的，你私有化了，就和自身作用其冲突，所以错误。B：正确。C：接口为的是实现，所以你修饰protected了，别的类就无法实现了，错误。 D：interface是一个接口，也就是说它的方法全部都为空，只有方法名，没有方法体，如果定义成static，那么就能直接调用类来调用抽象方法，没有意义。故而规定interface不能用static修饰。', '1');
INSERT INTO `bank_multiple_choice_que` VALUES ('5', '下列正确的有（）？', 'A:call by value（值调用）不会改变实际参数的数值。', 'B:call by reference（引用调用）能改变实际参数的参考地址。', 'C:call by reference（引用调用）不能改变实际参数的参考地址。', 'D:call by reference（引用调用）能改变实际参数的内容。', 'E:XML 是一种元语言, 可以用它来描述其他语言。', 'F:类图用来表示系统中类和类与类之间的关系，它是对系统动态结构的描述。', 'G:context为JSP的隐含对象。', 'ACD', '1', 'A：因为在java中，值调用的形参是实参的一个拷贝体。B：正确。C：引用调用，传递的是对象的地址，也就是说你改变的只能是形参对象。 D：引用调用，不能改变实参的参考地址，却能改变实参的属性（内容）。', '1');
INSERT INTO `bank_multiple_choice_que` VALUES ('6', '下列说法错误的有（）？', 'A:在类方法中可用this来调用本类的类方法。', 'B:在类方法中调用本类的类方法时可直接调用。', 'C:在类方法中只能调用本类中的类方法。', 'D:在类方法中绝对不能调用实例方法。', 'E:在类方法中可使用本类声明的私有变量。', null, null, 'ACD', '1', 'A：所谓的类方法就是静态方法，super和this都指向的是父类和本类的对象，而在类方法中调用的时候，这些指代的对象有可能都还没有创建。静态方法是用类方法名.方法名称调用。 B：正确。C：错误，类方法可以调用其他类的类方法。D：错误，实例化对象，然后调用方法。', '1');
INSERT INTO `bank_multiple_choice_que` VALUES ('7', '下列说法错误的有（）？', 'A:Java面向对象语言容许单独的过程与函数存在。', 'B:Java面向对象语言容许单独的方法存在。', 'C:Java语言中的方法属于类中的成员。', 'D:Java语言中的方法必定隶属于某一类（对象），调用方法与过程或函数相同。', null, null, null, 'ABC', '1', 'A：错误，java是面向对象编程语言。B：错误，java是面向对象编程的语言。C：错误，类方法属于类中的成员，实例方法属于对象中的成员。D：正确。', '1');
INSERT INTO `bank_multiple_choice_que` VALUES ('8', '下列属于J2EE的体系是()', 'A:JSP', 'B:JAVA', 'C:Servlet', 'D:WebService', null, null, null, 'AC', '1', 'J2EE的核心技术包括：JDBC(Java Database Connectivity) JNDI(Java Name and Directory Interface)', '1');
INSERT INTO `bank_multiple_choice_que` VALUES ('9', '下列函数是public void method(){...}的重载函数有（）？', 'A:public void method(int m){...}', 'B:public int method(){...}', 'C:public void method2(){...}', 'D:public int method(int m,float f){...}', null, null, null, 'AD', '1', '重载函数要求函数必须同名，必须参数数量或者参数类型不同，与修饰符和返回值无关。', '1');
INSERT INTO `bank_multiple_choice_que` VALUES ('10', '执行下列代码后，哪个结论是错误的String[] s =new String[10];（）？', 'A:s[10]为\"\";', 'B:s[9]为null;', 'C:s[0]为未定义;', 'D:s.length()=10;', null, null, null, 'ACD', '1', null, '1');
INSERT INTO `bank_multiple_choice_que` VALUES ('17', '测试导入多选题1[[[62bb69e2-ca56-4ee6-aaf3-88fffaacbdb5]]]', 'A:测试A', 'B:测试B', 'C:测试C', 'D:测试D', 'E:测试E', 'F:测试F', null, 'ABCDEF', '0', '测试多选题答案解析1', '1');
INSERT INTO `bank_multiple_choice_que` VALUES ('18', '测试导入多选题2', 'A:测试A', 'B:测试B', 'C:测试C', 'D:测试D', 'E:测试E', null, 'G:测试G', 'BCDG', '0', '测试多选题答案解析2', '2');
INSERT INTO `bank_multiple_choice_que` VALUES ('19', '测试手动添加多选题[[[056ae06e-c54f-4839-acdf-7d56cccbe769]]]', 'A:答案A', 'B:答案B', 'C:答案C', 'D:答案D', 'E:答案E', 'F:答案F', '', 'ACDEF', '0', '测试手动添加多选题答案解析', '2');

-- ----------------------------
-- Table structure for bank_single_choice_que
-- ----------------------------
DROP TABLE IF EXISTS `bank_single_choice_que`;
CREATE TABLE `bank_single_choice_que` (
  `single_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单选题id',
  `single_content` varchar(255) DEFAULT NULL COMMENT '单选题内容',
  `choice_A` varchar(255) DEFAULT NULL COMMENT '选项A',
  `choice_B` varchar(255) DEFAULT NULL COMMENT '选项B',
  `choice_C` varchar(255) DEFAULT NULL COMMENT '选项C',
  `choice_D` varchar(255) DEFAULT NULL COMMENT '选项D',
  `choice_E` varchar(255) DEFAULT NULL COMMENT '选项E',
  `choice_F` varchar(255) DEFAULT NULL COMMENT '选项F',
  `choice_G` varchar(255) DEFAULT NULL COMMENT '选项G',
  `single_answer` varchar(255) DEFAULT NULL COMMENT '单选题答案',
  `compose_flag` varchar(255) DEFAULT '0' COMMENT '是否被组成试卷',
  `answer_explain` varchar(255) DEFAULT NULL COMMENT '题目解析',
  `lang_id` int(11) DEFAULT NULL COMMENT '该题所属编程语言',
  PRIMARY KEY (`single_id`),
  KEY `single_lang_id` (`lang_id`),
  CONSTRAINT `bank_single_choice_que_ibfk_1` FOREIGN KEY (`lang_id`) REFERENCES `programing_language` (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank_single_choice_que
-- ----------------------------
INSERT INTO `bank_single_choice_que` VALUES ('1', '如果JDK的安装路径是\"d:\\jdk\"，若想在命令行窗口中任何路径下，都可以直接使用javac和java命令，\n需要将环境变量Path设置为以下哪个选项：（     ）', 'A. d:\\jdk', 'B. d:\\jdk\\bin', 'C. d:\\jre\\bin', 'D. d:\\jre', null, null, null, 'B', '1', '这是常识喔，请自行百度哈', '1');
INSERT INTO `bank_single_choice_que` VALUES ('2', '下面以哪种类型的文件可以直接在Java虚拟机中运行：（     ）。', 'A．.java', 'B．.jre', 'C．.exe', 'D．.class', null, null, null, 'D', '1', '哦你陀佛', '1');
INSERT INTO `bank_single_choice_que` VALUES ('3', '下面哪个是合法的Java标识符：（      ）', 'A．void', 'B．12class', 'C．_blank', 'D．95', null, null, null, 'C', '1', '善哉善哉', '1');
INSERT INTO `bank_single_choice_que` VALUES ('4', 'Java中类的定义必须包含在一下哪种符号之间？（      ）', 'A. 方括号[ ]', 'B. 花括号{ }', 'C. 双引号\" \"', 'D. 圆括号( )', null, null, null, 'B', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('5', 'Java的运算符中用于执行除法运算的是哪个？（      ）', 'A. /', 'B. \\', 'C. %', 'D. *', null, null, null, 'A', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('6', '以下哪个关键字不是用于循环语句的？（      ）', 'A. for', 'B. do...while', 'C. while', 'D. switch', null, null, null, 'D', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('7', '以下哪种写法可以实现访问数组array的最开始的第一个元素？（      ）', 'A. array[0]', 'B. array(0)', 'C. array[1]', 'D. array(1)', null, null, null, 'A', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('8', '如下哪个选项可以正确地创建一个长度为3的二维数组？（      ）', 'A. new int[2][3]', 'B. new int[3][ ]', 'C. new int[ ][3]', 'D. 以上都不对', null, null, null, 'B', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('9', '当编译和运行下列代码会发生什么？（      ）[[[c229fd38-9eb4-4337-818d-3772c4071060]]]', 'A. 编译错误', 'B. 运行错误', 'C. 输出888', 'D. 输出125', null, null, null, 'A', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('10', '下列选项中，哪个不属于Java语言的基本数据类型？（      ）', 'A. 整型', 'B. 数组', 'C. 字符型', 'D. 浮点型', null, null, null, 'B', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('11', '有关方法重载，以下说法正确的是：（      ）', 'A. 重载的方法，其方法名可以不一致', 'B. 重载的方法参数的个数或类型必须不一致', 'C. 重载的方法，其返回值类型必须不同', 'D. 重载的方法，其参数个数必须一致', null, null, null, 'B', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('12', '下列关于Java语言简单数据类型的说法中，正确的一项是：（      ）', 'A. 以0开头的整数数值代表8进制整型数', 'B. 以0x或0X开头的整数代表8进制整型常量', 'C. char型的值可以包含一个或多个字符', 'D. double类型的数据占计算机存储的32位', null, null, null, 'A', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('13', '下列语句中编译错误的一个是：（      ）', 'A. float f = 1.1f;', 'B. byte b = 128;', 'C. double d = 1.1/0.0;', 'D. char c = (char)1.1f;', null, null, null, 'B', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('14', '表达式(12==0) && (1/0 < 1)的值为：（      ）', 'A. true', 'B. false', 'C. 0', 'D. 运行时抛出异常', null, null, null, 'B', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('15', '表达式10^2的值为：（      ）', 'A. 100', 'B. 12', 'C. 8', 'D. 10', null, null, null, 'C', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('16', '假设i=10, j=20, k=30，则表达式 !(i<j+k) || !(i+10<=j) 的值为：（      ）', 'A. true', 'B. false', 'C. 表达式错误', 'D. 以上都不对', null, null, null, 'B', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('17', '以下代码的运行结果是：（      ）[[[b6ce7968-6d8b-4ba3-aad7-c2341d4c65ee]]]', 'A. 1', 'B. 2', 'C. 3', 'D. 以上都不对', null, null, null, 'A', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('18', '分析以下代码，正确的选项是：（      ）[[[5be9f02f-1d2a-4e1d-b421-5772818d3679]]]', 'A. 打印b=3', 'B. 打印b=7', 'C. 编译错误', 'D. 以上都不对', null, null, null, 'C', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('19', '分析以下代码，正确的选项是：（      ）[[[354dc7c3-11d3-4821-978f-bc15b323f2c0]]]', 'A. 打印3', 'B. 打印6', 'C. 编译错误', 'D. 以上都不对', null, null, null, 'A', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('20', '分析以下代码，正确的选项是：（      ）[[[1f9b26b1-dec3-4041-9250-6568041be8d6]]]', 'A. 打印9 8 7', 'B. 打印9 8 7 6', 'C. 打印9 8 7 6 5', 'D. 以上都不对', null, null, null, 'B', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('21', '如果JDK的安装路径是\"d:\\jdk\"，若想在命令行窗口中任何路径下，都可以直接使用javac和java命令，', 'A. d:\\jdk', 'B. d:\\jdk\\bin', 'C. d:\\jre\\bin', 'D. d:\\jre', null, null, null, 'B', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('22', '下面以哪种类型的文件可以直接在Java虚拟机中运行：（     ）。', 'A．.java', 'B．.jre', 'C．.exe', 'D．.class', null, null, null, 'D', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('23', '下面哪个是合法的Java标识符：（      ）', 'A．void', 'B．12class', 'C．_blank', 'D．95', null, null, null, 'C', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('24', 'Java中类的定义必须包含在一下哪种符号之间？（      ）', 'A. 方括号[ ]', 'B. 花括号{ }', 'C. 双引号\" \"', 'D. 圆括号( )', null, null, null, 'B', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('25', 'Java的运算符中用于执行除法运算的是哪个？（      ）', 'A. /', 'B. \\', 'C. %', 'D. *', null, null, null, 'A', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('26', '以下哪个关键字不是用于循环语句的？（      ）', 'A. for', 'B. do...while', 'C. while', 'D. switch', null, null, null, 'D', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('27', '以下哪种写法可以实现访问数组array的最开始的第一个元素？（      ）', 'A. array[0]', 'B. array(0)', 'C. array[1]', 'D. array(1)', null, null, null, 'A', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('28', '如下哪个选项可以正确地创建一个长度为3的二维数组？（      ）', 'A. new int[2][3]', 'B. new int[3][ ]', 'C. new int[ ][3]', 'D. 以上都不对', null, null, null, 'B', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('29', '当编译和运行下列代码会发生什么？（      ）', 'A. 编译错误', 'B. 运行错误', 'C. 输出888', 'D. 输出125', null, null, null, 'A', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('30', '下列选项中，哪个不属于Java语言的基本数据类型？（      ）', 'A. 整型', 'B. 数组', 'C. 字符型', 'D. 浮点型', null, null, null, 'B', '1', null, '1');
INSERT INTO `bank_single_choice_que` VALUES ('31', '测试添加单选题[[[f686007e-3caf-45f1-912f-257619296645]]]', 'A:测试', 'B:测试', 'C:测试', 'D:测试', '', '', '', 'B', '0', '测试添加单选题', '2');
INSERT INTO `bank_single_choice_que` VALUES ('32', '测试导入单选题1', 'A:测试A', 'B:测试B', 'C:测试C', 'D:测试D', null, null, null, 'A', '0', '测试单选题答案解析1', '1');
INSERT INTO `bank_single_choice_que` VALUES ('33', '测试导入单选题2', 'A:测试A', 'B:测试B', 'C:测试C', 'D:测试D', null, null, null, 'B', '0', '测试单选题答案解析2', '2');
INSERT INTO `bank_single_choice_que` VALUES ('36', '测试导入单选题3', 'A:测试A', 'B:测试B', 'C:测试C', 'D:测试D', null, null, null, 'A', '0', '测试单选题答案解析1', '1');
INSERT INTO `bank_single_choice_que` VALUES ('37', '测试导入单选题4', 'A:测试A', 'B:测试B', 'C:测试C', 'D:测试D', null, null, null, 'B', '0', '测试单选题答案解析2', '2');

-- ----------------------------
-- Table structure for barrage_info
-- ----------------------------
DROP TABLE IF EXISTS `barrage_info`;
CREATE TABLE `barrage_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `send_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(255) NOT NULL COMMENT '弹幕内容',
  `color` varchar(10) NOT NULL COMMENT '弹幕颜色',
  `offtime` int(11) NOT NULL COMMENT '播放偏移时间',
  `position` tinyint(1) NOT NULL COMMENT '0 固定弹幕 2 浮动弹幕',
  `state` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of barrage_info
-- ----------------------------
INSERT INTO `barrage_info` VALUES ('1', '19', '1', '2020-04-30 14:09:05', '哈哈哈哈', '白色', '0', '2', 'A');
INSERT INTO `barrage_info` VALUES ('2', '19', '1', '2020-04-30 14:11:22', '好看！', '红色', '0', '0', 'A');

-- ----------------------------
-- Table structure for classroom_info
-- ----------------------------
DROP TABLE IF EXISTS `classroom_info`;
CREATE TABLE `classroom_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教室标识',
  `teach_build_number` varchar(100) DEFAULT NULL COMMENT '教学楼编码',
  `classroom_number` varchar(255) DEFAULT NULL COMMENT '教室编号',
  `capacity` int(11) DEFAULT NULL COMMENT '教室容纳人数',
  `classroom_attr` varchar(10) DEFAULT NULL COMMENT '教室属性',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `state` char(1) NOT NULL DEFAULT 'A',
  `state_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classroom_info
-- ----------------------------
INSERT INTO `classroom_info` VALUES ('1', '01', '01-101', '70', '01', null, 'A', '2020-04-03 19:28:08');
INSERT INTO `classroom_info` VALUES ('2', '01', '01-102', '60', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('3', '01', '01-103', '60', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('4', '01', '01-104', '70', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('5', '01', '01-105', '60', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('6', '01', '01-106', '70', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('7', '01', '01-107', '120', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('8', '01', '01-108', '140', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('9', '01', '01-109', '140', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('10', '01', '01-110', '50', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('14', '01', '01-201', '70', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('15', '01', '01-202', '60', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('16', '01', '01-203', '60', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('17', '01', '01-204', '70', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('18', '01', '01-205', '60', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('19', '01', '01-206', '70', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('20', '01', '01-207', '120', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('21', '01', '01-208', '140', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('22', '01', '01-209', '140', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('23', '01', '01-210', '50', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('24', '01', '01-301', '70', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('25', '01', '01-302', '60', '01', null, 'A', '2020-04-03 19:30:08');
INSERT INTO `classroom_info` VALUES ('26', '01', '01-303', '60', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('27', '01', '01-304', '70', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('28', '01', '01-305', '60', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('29', '01', '01-306', '70', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('30', '01', '01-307', '120', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('31', '01', '01-308', '140', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('32', '01', '01-309', '140', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('33', '01', '01-310', '50', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('34', '02', '02-101', '70', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('35', '02', '02-102', '60', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('36', '02', '02-103', '60', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('37', '02', '02-104', '70', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('38', '02', '02-105', '60', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('39', '02', '02-106', '70', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('40', '02', '02-107', '120', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('41', '02', '02-108', '140', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('42', '02', '02-109', '140', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('43', '02', '02-110', '50', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('44', '02', '02-201', '70', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('45', '02', '02-202', '60', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('46', '02', '02-203', '60', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('47', '02', '02-204', '70', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('48', '02', '02-205', '60', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('49', '02', '02-206', '70', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('50', '02', '02-207', '120', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('51', '02', '02-208', '140', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('52', '02', '02-209', '140', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('53', '02', '02-210', '50', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('54', '02', '02-301', '70', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('55', '02', '02-302', '60', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('56', '02', '02-303', '60', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('57', '02', '02-304', '70', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('58', '02', '02-305', '60', '07', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('59', '02', '02-306', '70', '07', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('60', '02', '02-307', '120', '07', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('61', '02', '02-308', '140', '07', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('62', '02', '02-309', '140', '07', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('63', '02', '02-310', '50', '07', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('64', '03', '03-101', '70', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('65', '03', '03-102', '60', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('66', '03', '03-103', '60', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('67', '03', '03-104', '70', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('68', '03', '03-105', '60', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('69', '03', '03-106', '70', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('70', '03', '03-107', '120', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('71', '03', '03-108', '140', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('72', '03', '03-109', '140', '01', null, 'A', '2020-04-03 19:30:09');
INSERT INTO `classroom_info` VALUES ('73', '03', '03-110', '50', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('74', '03', '03-201', '70', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('75', '03', '03-202', '60', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('76', '03', '03-203', '60', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('77', '03', '03-204', '70', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('78', '03', '03-205', '60', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('79', '03', '03-206', '70', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('80', '03', '03-207', '120', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('81', '03', '03-208', '140', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('82', '03', '03-209', '140', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('83', '03', '03-210', '50', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('84', '03', '03-301', '70', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('85', '03', '03-302', '60', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('86', '03', '03-303', '60', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('87', '03', '03-304', '70', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('88', '03', '03-305', '60', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('89', '03', '03-306', '70', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('90', '03', '03-307', '120', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('91', '03', '03-308', '140', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('92', '04', '04-101', '70', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('93', '04', '04-102', '60', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('94', '04', '04-103', '60', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('95', '04', '04-104', '70', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('96', '04', '04-105', '60', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('97', '04', '04-106', '70', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('98', '04', '04-107', '120', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('99', '04', '04-108', '140', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('100', '04', '04-109', '140', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('101', '04', '04-110', '50', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('102', '04', '04-201', '70', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('103', '04', '04-202', '60', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('104', '04', '04-203', '60', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('105', '04', '04-204', '70', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('106', '04', '04-205', '60', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('107', '04', '04-206', '70', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('108', '04', '04-207', '120', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('109', '04', '04-208', '140', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('110', '04', '04-209', '140', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('111', '04', '04-210', '50', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('112', '04', '04-301', '70', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('113', '04', '04-302', '60', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('114', '04', '04-303', '60', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('115', '04', '04-304', '70', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('116', '04', '04-305', '60', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('117', '04', '04-306', '70', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('118', '04', '04-307', '120', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('119', '04', '04-308', '140', '01', null, 'A', '2020-04-03 19:30:10');
INSERT INTO `classroom_info` VALUES ('120', '05', '05-101', '70', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('121', '05', '05-102', '60', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('122', '05', '05-103', '60', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('123', '05', '05-104', '70', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('124', '05', '05-105', '60', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('125', '05', '05-106', '70', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('126', '05', '05-107', '120', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('127', '05', '05-108', '140', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('128', '05', '05-109', '140', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('129', '05', '05-110', '50', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('130', '05', '05-201', '70', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('131', '05', '05-202', '60', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('132', '05', '05-203', '60', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('133', '05', '05-204', '70', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('134', '05', '05-205', '60', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('135', '05', '05-206', '70', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('136', '05', '05-207', '120', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('137', '05', '05-208', '140', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('138', '05', '05-209', '140', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('139', '05', '05-210', '50', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('140', '05', '05-301', '70', '05', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('141', '05', '05-302', '60', '05', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('142', '05', '05-303', '60', '05', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('143', '05', '05-304', '70', '05', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('144', '05', '05-305', '60', '05', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('145', '05', '05-306', '70', '05', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('146', '05', '05-307', '120', '05', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('147', '05', '05-308', '140', '05', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('148', '05', '05-309', '140', '05', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('149', '05', '05-310', '50', '05', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('150', '06', '06-101', '70', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('151', '06', '06-102', '60', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('152', '06', '06-103', '60', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('153', '06', '06-104', '70', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('154', '06', '06-105', '60', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('155', '06', '06-106', '70', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('156', '06', '06-107', '120', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('157', '06', '06-108', '140', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('158', '06', '06-109', '140', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('159', '06', '06-110', '50', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('160', '06', '06-201', '70', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('161', '06', '06-202', '60', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('162', '06', '06-203', '60', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('163', '06', '06-204', '70', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('164', '06', '06-205', '60', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('165', '06', '06-206', '70', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('166', '06', '06-207', '120', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('167', '06', '06-208', '140', '01', null, 'A', '2020-04-03 19:30:11');
INSERT INTO `classroom_info` VALUES ('168', '06', '06-209', '140', '09', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('169', '06', '06-210', '50', '09', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('170', '06', '06-301', '70', '09', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('171', '06', '06-302', '60', '09', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('172', '06', '06-303', '60', '09', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('173', '06', '06-304', '70', '09', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('174', '06', '06-305', '60', '09', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('175', '06', '06-306', '70', '09', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('176', '06', '06-307', '120', '09', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('177', '06', '06-308', '140', '09', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('178', '06', '06-309', '140', '09', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('179', '06', '06-310', '50', '09', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('180', '07', '07-101', '70', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('181', '07', '07-102', '60', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('182', '07', '07-103', '60', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('183', '07', '07-104', '70', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('184', '07', '07-105', '60', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('185', '07', '07-106', '70', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('186', '07', '07-107', '120', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('187', '07', '07-108', '140', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('188', '07', '07-109', '140', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('189', '07', '07-110', '50', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('190', '07', '07-201', '70', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('191', '07', '07-202', '60', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('192', '07', '07-203', '60', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('193', '07', '07-204', '70', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('194', '07', '07-205', '60', '06', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('195', '07', '07-206', '70', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('196', '07', '07-207', '120', '06', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('197', '07', '07-208', '140', '06', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('198', '07', '07-209', '140', '06', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('199', '07', '07-210', '50', '06', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('200', '07', '07-301', '70', '06', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('201', '07', '07-302', '60', '06', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('202', '07', '07-303', '60', '06', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('203', '07', '07-304', '70', '06', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('204', '07', '07-305', '60', '11', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('205', '07', '07-306', '70', '11', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('206', '07', '07-307', '120', '11', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('207', '07', '07-308', '140', '11', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('208', '07', '07-309', '140', '11', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('209', '07', '07-310', '50', '11', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('210', '08', '08-101', '70', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('211', '08', '08-102', '60', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('212', '08', '08-103', '60', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('213', '08', '08-104', '70', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('214', '08', '08-105', '60', '01', null, 'A', '2020-04-03 19:30:12');
INSERT INTO `classroom_info` VALUES ('215', '08', '08-106', '70', '01', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('216', '08', '08-107', '120', '01', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('217', '08', '08-108', '140', '01', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('218', '08', '08-109', '140', '01', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('219', '08', '08-110', '50', '01', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('220', '08', '08-201', '70', '01', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('221', '08', '08-202', '60', '01', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('222', '08', '08-203', '60', '01', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('223', '08', '08-204', '70', '01', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('224', '08', '08-205', '60', '01', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('225', '08', '08-206', '70', '01', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('226', '08', '08-207', '120', '01', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('227', '08', '08-208', '140', '01', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('228', '08', '08-209', '140', '01', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('229', '08', '08-210', '50', '01', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('230', '08', '08-301', '70', '03', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('231', '08', '08-302', '60', '03', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('232', '08', '08-303', '60', '03', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('233', '08', '08-304', '70', '03', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('234', '08', '08-305', '60', '03', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('235', '08', '08-306', '70', '03', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('236', '08', '08-307', '120', '03', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('237', '08', '08-308', '140', '03', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('238', '08', '08-309', '140', '03', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('239', '08', '08-310', '50', '03', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('240', '09', '09-101', '70', '08', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('241', '09', '09-102', '60', '08', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('242', '09', '09-103', '60', '08', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('243', '09', '09-104', '70', '08', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('244', '09', '09-105', '60', '08', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('245', '09', '09-106', '70', '08', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('246', '09', '09-107', '120', '08', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('247', '09', '09-108', '140', '08', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('248', '09', '09-109', '140', '08', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('249', '09', '09-110', '50', '08', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('250', '09', '09-201', '70', '10', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('251', '09', '09-202', '60', '10', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('252', '09', '09-203', '60', '10', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('253', '09', '09-204', '70', '10', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('254', '09', '09-205', '60', '10', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('255', '09', '09-206', '70', '10', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('256', '09', '09-207', '120', '10', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('257', '09', '09-208', '140', '10', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('258', '09', '09-209', '140', '10', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('259', '09', '09-210', '50', '10', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('260', '09', '09-301', '70', '12', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('261', '09', '09-302', '60', '12', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('262', '09', '09-303', '60', '12', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('263', '09', '09-304', '70', '12', null, 'A', '2020-04-03 19:30:13');
INSERT INTO `classroom_info` VALUES ('264', '09', '09-305', '60', '12', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('265', '09', '09-306', '70', '12', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('266', '09', '09-307', '120', '12', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('267', '09', '09-308', '140', '12', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('268', '09', '09-309', '140', '12', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('269', '09', '09-310', '50', '12', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('270', '10', '09-101', '70', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('271', '10', '09-102', '60', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('272', '10', '09-103', '60', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('273', '10', '09-104', '70', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('274', '10', '09-105', '60', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('275', '10', '09-106', '70', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('276', '10', '09-107', '120', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('277', '10', '09-108', '140', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('278', '10', '09-109', '140', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('279', '10', '09-110', '50', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('280', '10', '09-201', '70', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('281', '10', '09-202', '60', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('282', '10', '09-203', '60', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('283', '10', '09-204', '70', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('284', '10', '09-205', '60', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('285', '10', '09-206', '70', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('286', '10', '09-207', '120', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('287', '10', '09-208', '140', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('288', '10', '09-209', '140', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('289', '10', '09-210', '50', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('290', '10', '09-301', '70', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('291', '10', '09-302', '60', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('292', '10', '09-303', '60', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('293', '10', '09-304', '70', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('294', '10', '09-305', '60', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('295', '10', '09-306', '70', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('296', '10', '09-307', '120', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('297', '10', '09-308', '140', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('298', '10', '09-309', '140', '04', null, 'A', '2020-04-03 19:30:14');
INSERT INTO `classroom_info` VALUES ('299', '10', '09-310', '50', '04', null, 'A', '2020-04-03 19:30:14');

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(30) NOT NULL COMMENT '班级名称',
  `class_no` varchar(100) DEFAULT NULL COMMENT '班级编码',
  `student_number` int(4) DEFAULT NULL COMMENT '学生人数',
  `specialty_id` int(2) NOT NULL COMMENT '专业标识',
  `remark` varchar(500) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='班级信息表';

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES ('1', '16物流管理（1）班', '16008001', '48', '8', null, '2020-04-03 20:32:41', '2020-04-07 15:50:25', 'A');
INSERT INTO `class_info` VALUES ('2', '16物流管理（2）班', '16008002', '47', '8', null, '2020-04-03 20:33:48', '2020-04-07 15:50:25', 'A');
INSERT INTO `class_info` VALUES ('3', '16物流管理（3）班', '16008003', '47', '8', null, '2020-04-03 20:33:48', '2020-04-07 15:50:25', 'A');
INSERT INTO `class_info` VALUES ('4', '17物流管理（1）班', '17008001', '45', '8', null, '2020-04-03 20:33:48', '2020-04-07 15:50:25', 'A');
INSERT INTO `class_info` VALUES ('5', '17物流管理（2）班', '17008002', '36', '8', null, '2020-04-03 20:33:48', '2020-04-07 15:50:25', 'A');
INSERT INTO `class_info` VALUES ('6', '17物流管理（3）班', '17008003', '40', '8', null, '2020-04-03 20:33:48', '2020-04-07 15:50:25', 'A');
INSERT INTO `class_info` VALUES ('7', '18物流管理（1）班', '18008001', '55', '8', null, '2020-04-03 20:33:48', '2020-04-07 15:50:25', 'A');
INSERT INTO `class_info` VALUES ('8', '18物流管理（2）班', '18008002', '46', '8', null, '2020-04-03 20:33:48', '2020-04-07 15:50:25', 'A');
INSERT INTO `class_info` VALUES ('9', '18物流管理（3）班', '18008003', '37', '8', null, '2020-04-03 20:33:48', '2020-04-07 15:50:25', 'A');
INSERT INTO `class_info` VALUES ('10', '18物流管理（4）班', '18008004', '46', '8', null, '2020-04-03 20:33:48', '2020-04-07 15:50:25', 'A');
INSERT INTO `class_info` VALUES ('11', '19物流管理（1）班', '19008001', '32', '8', null, '2020-04-03 20:33:48', '2020-04-07 15:50:25', 'A');
INSERT INTO `class_info` VALUES ('12', '19物流管理（2）班', '19008002', '35', '8', null, '2020-04-03 20:33:48', '2020-04-07 15:50:25', 'A');
INSERT INTO `class_info` VALUES ('13', '16体育教育（1）班', '16002001', '37', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:25', 'A');
INSERT INTO `class_info` VALUES ('14', '16体育教育（2）班', '16002002', '51', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:25', 'A');
INSERT INTO `class_info` VALUES ('15', '16体育教育（3）班', '16002003', '49', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:25', 'A');
INSERT INTO `class_info` VALUES ('16', '17体育教育（1）班', '17002001', '54', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('17', '17体育教育（2）班', '17002002', '53', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('18', '17体育教育（3）班', '17002003', '32', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('19', '18体育教育（1）班', '18002001', '33', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('20', '18体育教育（2）班', '18002002', '44', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('21', '18体育教育（3）班', '18002003', '45', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('22', '18体育教育（4）班', '18002004', '43', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('23', '18体育教育（5）班', '18002005', '45', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('24', '18体育教育（6）班', '18002006', '34', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('25', '16体育管理（1）班', '16002101', '32', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('26', '16体育管理（2）班', '16002102', '45', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('27', '16体育管理（3）班', '16002103', '43', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('28', '17体育管理（1）班', '17002101', '45', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('29', '17体育管理（2）班', '17002102', '46', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('30', '17体育管理（3）班', '17002103', '48', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('31', '18体育管理（1）班', '18002101', '52', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('32', '18体育管理（2）班', '18002102', '49', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('33', '18体育管理（3）班', '18002103', '61', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('34', '18体育管理（4）班', '18002104', '59', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('35', '18体育管理（5）班', '18002105', '45', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('36', '18体育管理（6）班', '18002106', '43', '2', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('37', '16软件工程（1）班', '16001001', '45', '1', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('38', '16软件工程（2）班', '16001002', '47', '1', null, '2020-04-03 20:33:48', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('39', '16软件工程（3）班', '16001003', '43', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('40', '17软件工程（1）班', '17001001', '45', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('41', '17软件工程（2）班', '17001002', '51', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('42', '17软件工程（3）班', '17001003', '32', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('43', '18软件工程（1）班', '18001001', '48', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('44', '18软件工程（2）班', '18001002', '53', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('45', '18软件工程（3）班', '18001003', '47', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('46', '18软件工程（4）班', '18001004', '45', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('47', '18软件工程（5）班', '18001005', '36', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('48', '18软件工程（6）班', '18001006', '40', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('49', '16软件工程（嵌入式培养）（1）班', '16001101', '55', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('50', '16软件工程（嵌入式培养）（2）班', '16001102', '46', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('51', '16软件工程（嵌入式培养）（3）班', '16001103', '37', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('52', '17软件工程（嵌入式培养）（1）班', '17001101', '46', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('53', '17软件工程（嵌入式培养）（2）班', '17001102', '32', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('54', '17软件工程（嵌入式培养）（3）班', '17001103', '35', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('55', '18软件工程（嵌入式培养）（1）班', '18001101', '37', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('56', '18软件工程（嵌入式培养）（2）班', '18001102', '51', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('57', '18软件工程（嵌入式培养）（3）班', '18001103', '49', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('58', '18软件工程（嵌入式培养）（4）班', '18001104', '54', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('59', '18软件工程（嵌入式培养）（5）班', '18001105', '53', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('60', '18软件工程（嵌入式培养）（6）班', '18001106', '32', '1', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('61', '16音乐表演（1）班', '16014001', '33', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('62', '16音乐表演（2）班', '16014002', '44', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('63', '16音乐表演（3）班', '16014003', '45', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('64', '17音乐表演（1）班', '17014001', '43', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('65', '17音乐表演（2）班', '17014002', '45', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('66', '17音乐表演（3）班', '17014003', '34', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('67', '18音乐表演（1）班', '18014001', '32', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('68', '18音乐表演（2）班', '18014002', '45', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('69', '18音乐表演（3）班', '18014003', '43', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('70', '19音乐表演（1）班', '19014001', '45', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('71', '19音乐表演（2）班', '19014002', '46', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('72', '19音乐表演（3）班', '19014003', '48', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('73', '16音乐教育（1）班', '16014101', '52', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('74', '16音乐教育（2）班', '16014102', '49', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('75', '16音乐教育（3）班', '16014103', '61', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('76', '17音乐教育（1）班', '17014101', '59', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('77', '17音乐教育（2）班', '17014102', '45', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('78', '17音乐教育（3）班', '17014103', '43', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('79', '18音乐教育（1）班', '18014101', '45', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('80', '18音乐教育（2）班', '18014102', '47', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('81', '18音乐教育（3）班', '18014103', '43', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('82', '19音乐教育（1）班', '19014101', '45', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('83', '19音乐教育（2）班', '19014102', '51', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('84', '19音乐教育（3）班', '19014103', '32', '14', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('85', '16经济管理（1）班', '16008101', '48', '8', null, '2020-04-03 20:33:49', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('86', '16经济管理（2）班', '16008102', '53', '8', null, '2020-04-03 20:33:50', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('87', '16经济管理（3）班', '16008103', '47', '8', null, '2020-04-03 20:33:50', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('88', '17经济管理（1）班', '17008101', '45', '8', null, '2020-04-03 20:33:50', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('89', '17经济管理（2）班', '17008102', '36', '8', null, '2020-04-03 20:33:50', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('90', '17经济管理（3）班', '17008103', '40', '8', null, '2020-04-03 20:33:50', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('91', '18经济管理（1）班', '18008101', '55', '8', null, '2020-04-03 20:33:50', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('92', '18经济管理（2）班', '18008102', '46', '8', null, '2020-04-03 20:33:50', '2020-04-07 15:50:26', 'A');
INSERT INTO `class_info` VALUES ('93', '18经济管理（3）班', '18008103', '37', '8', null, '2020-04-03 20:33:50', '2020-04-07 15:50:26', 'A');

-- ----------------------------
-- Table structure for class_task
-- ----------------------------
DROP TABLE IF EXISTS `class_task`;
CREATE TABLE `class_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term_name` varchar(11) DEFAULT NULL COMMENT '学期名称',
  `school_no` varchar(11) DEFAULT NULL COMMENT '学院编码',
  `class_no` varchar(11) DEFAULT NULL COMMENT '班级编码',
  `course_no` varchar(11) DEFAULT NULL COMMENT '课程编码',
  `staff_no` varchar(11) DEFAULT NULL COMMENT '教师编码',
  `course_attr` varchar(11) DEFAULT NULL COMMENT '课程类型',
  `student_sum` int(11) DEFAULT NULL COMMENT '学生人数',
  `weeks_sum` int(11) DEFAULT NULL COMMENT '上课总周时',
  `weeks_number` int(11) DEFAULT NULL COMMENT '周时',
  `class_time` varchar(255) DEFAULT NULL COMMENT '上课时间',
  `is_fix` char(1) DEFAULT NULL COMMENT '是否固定',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `state` char(1) NOT NULL DEFAULT 'A' COMMENT '状态',
  `state_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '状态时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_task
-- ----------------------------
INSERT INTO `class_task` VALUES ('1', '2019-2020-1', '01', '16001101', '0502111015', '011001', '01', '53', '18', '10', null, '1', '', 'A', '2020-05-03 15:47:52');
INSERT INTO `class_task` VALUES ('2', '2019-2020-1', '01', '17001101', '0502111015', '011002', '01', '47', '10', '2', null, '1', '', 'A', '2020-05-03 15:51:20');
INSERT INTO `class_task` VALUES ('3', '2019-2020-1', '01', '16008003', '0305128003', '011003', '01', '45', '12', '4', null, '1', '', 'A', '2020-05-03 15:19:54');
INSERT INTO `class_task` VALUES ('4', '2019-2020-1', '01', '17008001', '0502111030', '011004', '02', '45', '10', '4', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('5', '2019-2020-1', '02', '17008002', '0502111015', '011005', '01', '36', '4', '2', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('6', '2019-2020-1', '02', '17008003', '0502111015', '011007', '01', '40', '12', '4', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('7', '2019-2020-1', '02', '18008001', '0502111015', '021001', '01', '55', '12', '2', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('8', '2019-2020-1', '02', '18008002', '0402120012', '021002', '02', '46', '10', '4', '', '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('9', '2019-2020-1', '08', '18008003', '0402120013', '021003', '01', '37', '4', '2', '', '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('10', '2019-2020-1', '08', '18008004', '0502111015', '021004', '02', '46', '12', '2', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('11', '2019-2020-1', '08', '19008001', '0502111015', '021005', '02', '32', '14', '4', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('12', '2019-2020-1', '08', '19008002', '0502111015', '021006', '01', '35', '8', '2', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('13', '2019-2020-1', '02', '16002001', '0502111015', '031001', '02', '37', '12', '4', '', '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('14', '2019-2020-1', '02', '16002002', '0502111015', '031002', '01', '51', '18', '4', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('15', '2019-2020-1', '04', '16002003', '0702120209', '031003', '01', '54', '10', '4', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('16', '2019-2020-1', '04', '17002001', '0702920401', '031004', '01', '53', '16', '4', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('17', '2019-2020-1', '04', '17002002', '0306131000', '031005', '01', '33', '18', '4', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('18', '2019-2020-1', '04', '17002003', '0303132002', '031007', '01', '44', '10', '4', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('19', '2019-2020-1', '04', '18002001', '0303132003', '041001', '01', '45', '14', '4', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('20', '2019-2020-1', '02', '18002002', '0303132004', '041002', '02', '43', '18', '2', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('21', '2019-2020-1', '02', '18002003', '0809212017', '041003', '01', '45', '16', '4', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('22', '2019-2020-1', '02', '18002004', '0809412108', '041004', '01', '34', '10', '4', '', '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('23', '2019-2020-1', '02', '18002005', '0305128000', '041005', '01', '32', '10', '4', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('24', '2019-2020-1', '02', '18002006', '0305128001', '041006', '01', '45', '7', '4', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('25', '2019-2020-1', '02', '16002101', '0305128002', '041007', '01', '43', '12', '4', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('26', '2019-2020-1', '02', '16002102', '0305128003', '051001', '01', '45', '12', '6', '', '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('27', '2019-2020-1', '02', '16002103', '0305134000', '051002', '02', '46', '12', '4', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('28', '2019-2020-1', '06', '17002101', '0502111029', '051003', '01', '48', '12', '4', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('29', '2019-2020-1', '06', '17002102', '0502111002', '051004', '01', '52', '10', '2', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('30', '2019-2020-1', '06', '17002103', '0502111030', '051005', '01', '49', '10', '2', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('31', '2019-2020-1', '06', '18002101', '0502111015', '051006', '01', '61', '12', '2', null, '1', null, 'A', '2020-05-03 15:12:22');
INSERT INTO `class_task` VALUES ('39', '2019-2020-1', '01', '18001106', '0701120117', '151009', '01', '56', '15', '4', null, '1', null, 'A', '2020-05-03 15:38:20');
INSERT INTO `class_task` VALUES ('40', '2019-2020-2', '02', '16002001', '0402120011', '041007', '01', '36', '9', '4', null, '1', null, 'A', '2020-05-05 15:35:47');
INSERT INTO `class_task` VALUES ('41', '2019-2020-2', '02', '16002002', '0402120011', '051001', '01', '46', '9', '4', null, '1', null, 'A', '2020-05-05 15:35:47');
INSERT INTO `class_task` VALUES ('42', '2019-2020-2', '04', '17001003', '0701120117', '011011', '05', '32', '11', '2', null, '1', null, 'A', '2020-05-05 15:58:19');
INSERT INTO `class_task` VALUES ('43', '2019-2020-2', '05', '18008101', '0809412108', '011010', '04', '51', '12', '4', null, '1', null, 'A', '2020-05-05 15:58:43');
INSERT INTO `class_task` VALUES ('44', '2019-2020-2', '06', '16001101', '0809212017', '011009', '02', '33', '12', '4', null, '1', null, 'A', '2020-05-05 16:03:23');
INSERT INTO `class_task` VALUES ('45', '2019-2020-2', '07', '16014001', '0303132004', '011008', '01', '54', '15', '4', null, '1', null, 'A', '2020-05-05 16:03:31');
INSERT INTO `class_task` VALUES ('46', '2019-2020-2', '07', '16014001', '0303132003', '011008', '01', '54', '15', '4', null, '1', null, 'A', '2020-05-05 16:03:31');
INSERT INTO `class_task` VALUES ('47', '2019-2020-2', '09', '16002001', '0303132002', '151008', '01', '34', '10', '4', '0218', '2', null, 'A', '2020-05-05 16:04:05');
INSERT INTO `class_task` VALUES ('48', '2019-2020-2', '02', '16002001', '0306131000', '151009', '02', '36', '4', '2', '05', '2', null, 'A', '2020-05-05 16:04:05');
INSERT INTO `class_task` VALUES ('49', '2019-2020-2', '02', '16002001', '0711131000', '151010', '01', '36', '12', '4', null, '1', null, 'A', '2020-05-05 16:04:05');
INSERT INTO `class_task` VALUES ('50', '2019-2020-2', '02', '16002001', '0702920401', '151007', '02', '36', '12', '2', null, '1', null, 'A', '2020-05-05 16:04:34');
INSERT INTO `class_task` VALUES ('51', '2019-2020-2', '02', '16002002', '0306131000', '151005', '02', '46', '12', '4', null, '1', null, 'A', '2020-05-05 16:05:46');
INSERT INTO `class_task` VALUES ('52', '2019-2020-2', '02', '16002002', '0711131000', '151006', '01', '46', '12', '4', '0814', '2', null, 'A', '2020-05-05 16:05:46');
INSERT INTO `class_task` VALUES ('53', '2019-2020-2', '02', '16002002', '0702920401', '151007', '02', '46', '12', '2', null, '1', null, 'A', '2020-05-05 16:04:39');
INSERT INTO `class_task` VALUES ('54', '2019-2020-2', '04', '17001003', '0702120209', '151003', '01', '32', '14', '4', null, '1', null, 'A', '2020-05-05 16:05:53');
INSERT INTO `class_task` VALUES ('55', '2019-2020-2', '04', '17001003', '0701120117', '151004', '05', '32', '8', '2', null, '1', null, 'A', '2020-05-05 16:05:53');
INSERT INTO `class_task` VALUES ('56', '2019-2020-2', '05', '18008101', '0701120102', '011010', '01', '51', '18', '4', null, '1', null, 'A', '2020-05-05 15:58:47');
INSERT INTO `class_task` VALUES ('57', '2019-2020-2', '05', '18008101', '0701120114', '141003', '01', '51', '18', '4', null, '1', null, 'A', '2020-05-05 16:07:03');
INSERT INTO `class_task` VALUES ('58', '2019-2020-2', '05', '18008101', '0809113011', '141004', '01', '51', '18', '4', null, '1', null, 'A', '2020-05-05 16:07:03');
INSERT INTO `class_task` VALUES ('59', '2019-2020-2', '05', '18008101', '0809412108', '141005', '04', '51', '10', '4', null, '1', null, 'A', '2020-05-05 16:07:03');
INSERT INTO `class_task` VALUES ('60', '2019-2020-2', '06', '16001101', '0809212017', '141006', '02', '33', '16', '4', null, '1', null, 'A', '2020-05-05 16:07:03');
INSERT INTO `class_task` VALUES ('61', '2019-2020-2', '06', '16001101', '0305128000', '141007', '01', '33', '12', '4', '0208', '2', null, 'A', '2020-05-05 16:07:03');
INSERT INTO `class_task` VALUES ('62', '2019-2020-2', '06', '16001101', '0305128001', '151001', '01', '33', '18', '4', null, '1', null, 'A', '2020-05-05 16:07:03');
INSERT INTO `class_task` VALUES ('63', '2019-2020-2', '07', '16014001', '0305128002', '151002', '06', '54', '10', '4', null, '1', null, 'A', '2020-05-05 16:07:03');
INSERT INTO `class_task` VALUES ('64', '2019-2020-2', '08', '17008101', '0305128003', '141001', '01', '33', '14', '4', null, '1', null, 'A', '2020-05-05 16:07:23');
INSERT INTO `class_task` VALUES ('65', '2019-2020-2', '08', '17008101', '0305134000', '141001', '09', '33', '18', '2', '', '1', null, 'A', '2020-05-05 16:07:19');
INSERT INTO `class_task` VALUES ('66', '2019-2020-2', '09', '16002001', '0502111029', '141002', '01', '34', '16', '4', null, '1', null, 'A', '2020-05-05 16:07:19');
INSERT INTO `class_task` VALUES ('67', '2019-2020-2', '09', '16002001', '0502111002', '141002', '02', '34', '16', '4', null, '1', null, 'A', '2020-05-05 16:07:30');
INSERT INTO `class_task` VALUES ('68', '2019-2020-2', '03', '18002006', '0502111030', '011011', '01', '37', '10', '4', null, '1', null, 'A', '2020-05-05 15:58:23');
INSERT INTO `class_task` VALUES ('69', '2019-2020-2', '01', '17002103', '0502111015', '151007', '01', '48', '7', '4', null, '1', null, 'A', '2020-05-05 16:04:43');
INSERT INTO `class_task` VALUES ('70', '2019-2020-2', '01', '17002103', '0701120120', '131005', '01', '48', '12', '4', null, '1', null, 'A', '2020-05-05 16:08:07');
INSERT INTO `class_task` VALUES ('71', '2019-2020-2', '01', '17002103', '0402120011', '131006', '01', '48', '12', '6', null, '1', null, 'A', '2020-05-05 16:08:07');
INSERT INTO `class_task` VALUES ('72', '2019-2020-2', '01', '18002006', '0402120012', '131007', '01', '47', '12', '4', null, '1', null, 'A', '2020-05-05 16:08:07');
INSERT INTO `class_task` VALUES ('73', '2019-2020-2', '01', '18002006', '0402120013', '131002', '01', '47', '12', '4', null, '1', null, 'A', '2020-05-05 16:08:13');
INSERT INTO `class_task` VALUES ('74', '2019-2020-2', '01', '18002006', '0402120014', '131003', '02', '47', '10', '2', '05', '2', null, 'A', '2020-05-05 16:08:13');
INSERT INTO `class_task` VALUES ('75', '2019-2020-2', '01', '17002103', '0303132002', '131004', '01', '48', '10', '2', '02', '2', null, 'A', '2020-05-05 16:08:13');
INSERT INTO `class_task` VALUES ('76', '2019-2020-2', '01', '17002103', '0809113011', '131003', '02', '48', '12', '2', null, '1', null, 'A', '2020-05-05 16:08:22');

-- ----------------------------
-- Table structure for comment_info
-- ----------------------------
DROP TABLE IF EXISTS `comment_info`;
CREATE TABLE `comment_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `send_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间',
  `count_like` int(11) DEFAULT NULL COMMENT '点赞量',
  `state` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_info
-- ----------------------------
INSERT INTO `comment_info` VALUES ('1', '1', '1', '真好看！', '2020-04-13 02:04:58', '107', 'A');
INSERT INTO `comment_info` VALUES ('2', '1', '19', '好看！', '2020-04-30 17:18:15', '14', 'A');
INSERT INTO `comment_info` VALUES ('3', '1', '19', '好好看！', '2020-04-30 16:25:19', '245', 'A');
INSERT INTO `comment_info` VALUES ('4', '1', '4', '哈哈哈哈哈', '2020-04-30 15:30:25', '6', 'A');
INSERT INTO `comment_info` VALUES ('5', '1', '19', '最短路径问题是图论研究中的一个经典算法问题', '2020-04-30 17:47:51', '1', 'A');
INSERT INTO `comment_info` VALUES ('6', '1', '19', '由结点和路径组成的', '2020-04-30 17:48:09', '1', 'A');
INSERT INTO `comment_info` VALUES ('7', '1', '19', ' 算法具体的形式包括：确定起点的最短路径问题 - 即已知起始结点，求最短路径的问题。', '2020-04-30 17:48:22', '1', 'A');
INSERT INTO `comment_info` VALUES ('8', '1', '19', '确定终点的最短路径问题 - 与确定起点的问题相反，该问题是已知终结结点，求最短路径的问题。', '2020-04-30 17:48:35', '1', 'A');
INSERT INTO `comment_info` VALUES ('9', '1', '19', '在无向图中该问题与确定起点的问题完全等同，在有向图中该问题等同于把所有路径方向反转的确定起点的问题。', '2020-04-30 17:48:48', '1', 'A');
INSERT INTO `comment_info` VALUES ('10', '1', '19', ' 确定起点终点的最短路径问题 - 即已知起点和终点，求两结点之间的最短路径。', '2020-04-30 17:48:55', '1', 'A');
INSERT INTO `comment_info` VALUES ('11', '1', '19', ' 全局最短路径问题 - 求图中所有的最短路径。', '2020-04-30 17:49:00', '1', 'A');

-- ----------------------------
-- Table structure for course_info
-- ----------------------------
DROP TABLE IF EXISTS `course_info`;
CREATE TABLE `course_info` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户标识',
  `course_type_id` int(2) NOT NULL COMMENT '课程类别标识',
  `course_code` varchar(20) NOT NULL COMMENT '课程编码',
  `course_name` varchar(200) NOT NULL COMMENT '课程名称',
  `scord` double(3,1) NOT NULL COMMENT '学分',
  `theory_dur` int(3) NOT NULL COMMENT '课内理论学时',
  `exp_dur` int(3) NOT NULL COMMENT '课内实验学时',
  `total_dur` int(4) NOT NULL COMMENT '课内总学时:课内理论学时+课内实验学时',
  `outside_dru` int(3) NOT NULL COMMENT '课外学时数',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `state_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '状态日期',
  `state` char(1) NOT NULL DEFAULT 'A' COMMENT '状态：\r\nA-在用;\r\nX-删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='课程信息表';

-- ----------------------------
-- Records of course_info
-- ----------------------------
INSERT INTO `course_info` VALUES ('1', '1', '0305128000', '思想道德修养与法律基础', '3.0', '48', '0', '48', '0', null, '2019-07-05 14:46:26', '2019-09-25 15:36:51', 'A');
INSERT INTO `course_info` VALUES ('2', '1', '0305128001', '中国近现代史纲要', '2.0', '32', '0', '32', '0', null, '2019-07-05 15:03:46', '2019-07-31 09:34:15', 'A');
INSERT INTO `course_info` VALUES ('3', '1', '0305128002', '马克思主义基本原理', '3.0', '48', '0', '48', '0', null, '2019-07-05 15:19:31', '2019-07-31 09:34:15', 'A');
INSERT INTO `course_info` VALUES ('4', '1', '0305128003', '毛泽东思想和中国特色社会主义理论体系概论', '6.0', '64', '0', '64', '32', null, '2019-07-05 15:30:28', '2019-07-31 09:34:15', 'A');
INSERT INTO `course_info` VALUES ('5', '1', '0305134000', '形势与政策', '2.0', '0', '0', '0', '32', null, '2019-07-05 15:30:55', '2019-07-31 09:34:16', 'A');
INSERT INTO `course_info` VALUES ('6', '1', '0502111029', '大学英语1', '4.0', '56', '0', '56', '16', null, '2019-07-05 15:31:24', '2019-07-31 09:34:16', 'A');
INSERT INTO `course_info` VALUES ('7', '1', '0502111002', '大学英语2', '4.5', '64', '0', '64', '32', null, '2019-07-05 15:31:54', '2019-07-31 09:34:16', 'A');
INSERT INTO `course_info` VALUES ('8', '1', '0502111030', '大学英语3', '4.0', '56', '0', '56', '16', null, '2019-07-05 15:32:16', '2019-07-31 09:34:16', 'A');
INSERT INTO `course_info` VALUES ('9', '1', '0502111015', '大学英语4', '3.0', '48', '0', '48', '0', null, '2019-07-05 15:39:12', '2019-09-25 15:04:48', 'A');
INSERT INTO `course_info` VALUES ('10', '1', '0701120120', '数学建模（新增）', '3.0', '48', '0', '48', '0', null, '2019-07-05 15:40:12', '2019-07-31 09:34:16', 'A');
INSERT INTO `course_info` VALUES ('11', '1', '0402120011', '体育 Ⅰ', '1.0', '8', '24', '32', '0', null, '2019-07-05 15:42:20', '2019-07-31 09:34:16', 'A');
INSERT INTO `course_info` VALUES ('12', '1', '0402120012', '体育 Ⅱ', '1.0', '8', '24', '32', '0', null, '2019-07-05 15:42:43', '2019-07-31 09:34:16', 'A');
INSERT INTO `course_info` VALUES ('13', '1', '0402120013', '体育 Ⅲ', '1.0', '8', '24', '32', '0', null, '2019-07-05 15:43:05', '2019-07-31 09:34:16', 'A');
INSERT INTO `course_info` VALUES ('14', '1', '0402120014', '体育 Ⅳ', '1.0', '8', '24', '32', '0', null, '2019-07-05 15:43:29', '2019-07-31 09:34:16', 'A');
INSERT INTO `course_info` VALUES ('15', '1', '0701120101', '高等数学A1', '4.5', '72', '0', '72', '0', null, '2019-07-05 15:44:12', '2019-07-31 09:34:16', 'A');
INSERT INTO `course_info` VALUES ('16', '1', '0701120117', '线性代数与空间解析几何', '3.0', '48', '0', '48', '0', null, '2019-07-05 15:46:24', '2019-07-31 09:34:16', 'A');
INSERT INTO `course_info` VALUES ('17', '1', '0701120102', '高等数学A2', '5.5', '88', '0', '88', '0', null, '2019-07-05 15:46:42', '2019-07-31 09:34:17', 'A');
INSERT INTO `course_info` VALUES ('18', '1', '0701120114', '概率论与数理统计A', '3.0', '48', '0', '84', '0', null, '2019-07-05 15:46:58', '2019-07-31 09:34:17', 'A');
INSERT INTO `course_info` VALUES ('19', '1', '0809113011', 'C语言程序设计', '5.0', '56', '24', '80', '8', null, '2019-07-05 15:47:19', '2019-07-31 10:57:30', 'A');
INSERT INTO `course_info` VALUES ('20', '1', '0702120209', '大学物理C', '4.0', '64', '0', '64', '0', null, '2019-07-05 15:47:40', '2019-07-31 10:57:30', 'A');
INSERT INTO `course_info` VALUES ('21', '1', '0702920401', '大学物理实验1', '1.0', '0', '16', '16', '0', null, '2019-07-05 15:48:01', '2019-07-31 10:57:31', 'A');
INSERT INTO `course_info` VALUES ('22', '1', '0711131000', '心理健康教育', '0.0', '2', '0', '2', '0', null, '2019-07-05 15:48:44', '2019-07-31 10:57:31', 'A');
INSERT INTO `course_info` VALUES ('23', '1', '0306131000', '军事理论概论', '2.0', '0', '0', '0', '32', null, '2019-07-05 15:48:59', '2019-07-31 10:57:31', 'A');
INSERT INTO `course_info` VALUES ('24', '1', '0303132002', '大学生职业生涯规划指导', '2.0', '0', '0', '3', '0', '', '2019-07-05 15:51:26', '2019-09-25 15:41:44', 'X');
INSERT INTO `course_info` VALUES ('25', '1', '0303132003', '大学生创业基础', '1.0', '16', '0', '16', '0', null, '2019-07-05 15:51:47', '2019-09-25 15:42:06', 'X');
INSERT INTO `course_info` VALUES ('26', '1', '0303132004', '大学生创新创业', '2.0', '32', '0', '32', '0', null, '2019-07-05 15:52:04', '2019-09-25 15:46:49', 'A');
INSERT INTO `course_info` VALUES ('27', '2', '0809212017', '离散结构', '3.0', '48', '0', '48', '0', '2', '2019-07-31 10:58:55', '2019-07-31 10:59:16', 'A');
INSERT INTO `course_info` VALUES ('28', '3', '0809412108', 'Web前端技术', '3.0', '32', '16', '48', '0', '', '2019-07-31 11:01:37', '2019-07-31 11:01:37', 'A');

-- ----------------------------
-- Table structure for course_plan
-- ----------------------------
DROP TABLE IF EXISTS `course_plan`;
CREATE TABLE `course_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程计划标识',
  `school_no` varchar(100) DEFAULT NULL COMMENT '学院编码',
  `class_no` varchar(100) DEFAULT NULL COMMENT '班级编码',
  `course_no` varchar(100) DEFAULT NULL COMMENT '课程编码',
  `staff_no` varchar(100) DEFAULT NULL COMMENT '教师编码',
  `classroom_no` varchar(100) DEFAULT NULL COMMENT '教室编码',
  `term_name` varchar(100) DEFAULT NULL COMMENT '学期名称',
  `weeks_sum` int(4) DEFAULT NULL COMMENT '课程总时长',
  `class_time` varchar(255) DEFAULT NULL COMMENT '上课时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `state` char(1) NOT NULL DEFAULT 'A',
  `state_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_plan
-- ----------------------------
INSERT INTO `course_plan` VALUES ('1', '01', '17008001', '0305128000', '011001', '04-302', '2019-2020-1', '10', '05', null, 'A', '2020-04-23 10:52:27');
INSERT INTO `course_plan` VALUES ('2', '01', '17008001', '0305128001', '011002', '04-302', '2019-2020-1', '12', '20', null, 'A', '2020-04-23 10:52:27');
INSERT INTO `course_plan` VALUES ('3', '01', '17008001', '0305128002', '011003', '04-303', '2019-2020-1', '12', '11', null, 'A', '2020-04-23 10:52:27');
INSERT INTO `course_plan` VALUES ('4', '01', '17008001', '0305128003', '011004', '04-106', '2019-2020-1', '12', '18', null, 'A', '2020-04-23 10:52:27');
INSERT INTO `course_plan` VALUES ('5', '01', '17008001', '0305134000', '011005', '04-209', '2019-2020-1', '12', '24', null, 'A', '2020-04-23 10:52:27');
INSERT INTO `course_plan` VALUES ('6', '01', '16008003', '0701120101', '011007', '04-202', '2019-2020-1', '10', '02', null, 'A', '2020-04-23 10:54:15');
INSERT INTO `course_plan` VALUES ('7', '01', '16008003', '0701120117', '021001', '04-102', '2019-2020-1', '7', '19', null, 'A', '2020-04-23 10:54:15');
INSERT INTO `course_plan` VALUES ('8', '02', '16008003', '0701120102', '021002', '01-305', '2019-2020-1', '7', '01', null, 'A', '2020-04-23 10:54:15');
INSERT INTO `course_plan` VALUES ('9', '02', '16008003', '0701120114', '021003', '01-108', '2019-2020-1', '12', '22', null, 'A', '2020-04-23 10:54:15');
INSERT INTO `course_plan` VALUES ('10', '02', '16008003', '0809113011', '021004', '01-108', '2019-2020-1', '12', '12', null, 'A', '2020-04-23 10:54:15');
INSERT INTO `course_plan` VALUES ('11', '02', '16002103', '0305134000', '051002', '01-103', '2019-2020-1', '12', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('12', '02', '16002103', '0305134000', '051002', '01-307', '2019-2020-1', '12', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('13', '02', '16002103', '0502111015', '031001', '01-101', '2019-2020-1', '12', '02', null, 'A', '2020-04-23 10:54:37');
INSERT INTO `course_plan` VALUES ('14', '02', '16002103', '0502111015', '031001', '01-202', '2019-2020-1', '12', '02', null, 'A', '2020-04-23 10:54:37');
INSERT INTO `course_plan` VALUES ('15', '02', '16002103', '0502111015', '031002', '01-206', '2019-2020-1', '18', '02', null, 'A', '2020-04-23 10:54:37');
INSERT INTO `course_plan` VALUES ('16', '02', '16002002', '0502111015', '031002', '01-308', '2019-2020-1', '18', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('17', '02', '16002002', '0305128002', '041007', '01-205', '2019-2020-1', '12', '02', null, 'A', '2020-04-23 13:11:53');
INSERT INTO `course_plan` VALUES ('18', '02', '16002002', '0305128002', '041007', '01-201', '2019-2020-1', '12', '02', null, 'A', '2020-04-23 13:11:53');
INSERT INTO `course_plan` VALUES ('19', '02', '16002002', '0305128001', '041006', '01-201', '2019-2020-1', '7', '02', null, 'A', '2020-04-23 13:11:53');
INSERT INTO `course_plan` VALUES ('20', '02', '16002002', '0305128001', '041006', '01-209', '2019-2020-1', '7', '02', null, 'A', '2020-04-23 13:11:53');
INSERT INTO `course_plan` VALUES ('21', '02', '18002005', '0702120209', '041005', '01-203', '2019-2020-1', '10', '02', null, 'A', '2020-04-23 11:57:18');
INSERT INTO `course_plan` VALUES ('22', '02', '18002005', '0702920401', '041005', '01-103', '2019-2020-1', '10', '02', null, 'A', '2020-04-23 11:57:18');
INSERT INTO `course_plan` VALUES ('23', '02', '18002005', '0711131000', '041004', '01-309', '2019-2020-1', '10', '02', null, 'A', '2020-04-23 13:12:03');
INSERT INTO `course_plan` VALUES ('24', '02', '18002005', '0306131000', '041004', '01-108', '2019-2020-1', '10', '02', null, 'A', '2020-04-23 13:12:03');
INSERT INTO `course_plan` VALUES ('25', '02', '18002005', '0303132002', '041003', '01-207', '2019-2020-1', '16', '02', null, 'A', '2020-04-23 13:12:03');
INSERT INTO `course_plan` VALUES ('26', '02', '18002003', '0809212017', '041003', '01-209', '2019-2020-1', '16', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('27', '02', '17008003', '0502111015', '011007', '01-105', '2019-2020-1', '12', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('28', '02', '17008003', '0502111015', '011007', '01-305', '2019-2020-1', '12', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('29', '02', '18008002', '0402120012', '021002', '01-203', '2019-2020-1', '10', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('30', '02', '18008002', '0402120012', '021002', '01-206', '2019-2020-1', '10', '08', null, 'A', '2020-04-22 17:59:02');
INSERT INTO `course_plan` VALUES ('31', '04', '16002003', '0702120209', '031003', '05-210', '2019-2020-1', '10', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('32', '04', '16002003', '0702120209', '031003', '05-105', '2019-2020-1', '10', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('33', '04', '17002001', '0702920401', '031004', '05-209', '2019-2020-1', '16', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('34', '04', '17002001', '0702920401', '031004', '05-204', '2019-2020-1', '16', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('35', '04', '17002002', '0306131000', '031005', '05-207', '2019-2020-1', '18', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('36', '04', '17002002', '0306131000', '031005', '05-104', '2019-2020-1', '18', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('37', '04', '17002003', '0303132002', '031007', '05-104', '2019-2020-1', '10', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('38', '04', '17002003', '0303132002', '031007', '05-106', '2019-2020-1', '10', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('39', '04', '18002001', '0303132003', '041001', '05-102', '2019-2020-1', '14', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('40', '04', '18002001', '0303132003', '041001', '05-101', '2019-2020-1', '14', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('41', '06', '17002101', '0502111029', '051003', '03-209', '2019-2020-1', '12', '15', null, 'A', '2020-04-22 23:42:55');
INSERT INTO `course_plan` VALUES ('42', '06', '17002101', '0502111029', '051003', '03-202', '2019-2020-1', '12', '22', null, 'A', '2020-04-22 23:43:01');
INSERT INTO `course_plan` VALUES ('43', '08', '19008001', '0502111015', '021005', '06-104', '2019-2020-1', '14', '15', null, 'A', '2020-04-22 23:43:05');
INSERT INTO `course_plan` VALUES ('44', '08', '19008001', '0502111015', '021005', '06-203', '2019-2020-1', '14', '08', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `course_plan` VALUES ('45', '01', '17008001', '0502111030', '011004', '04-204', '2019-2020-1', '10', '20', null, 'A', '2020-04-22 23:43:17');
INSERT INTO `course_plan` VALUES ('46', '01', '17008001', '0502111030', '011004', '04-302', '2019-2020-1', '10', '01', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('47', '01', '16008001', '0502111015', '011001', '04-104', '2019-2020-1', '9', '12', null, 'A', '2020-04-22 23:43:23');
INSERT INTO `course_plan` VALUES ('48', '01', '16008001', '0502111015', '011001', '04-205', '2019-2020-1', '9', '06', null, 'A', '2020-04-22 23:43:27');
INSERT INTO `course_plan` VALUES ('49', '01', '16008003', '0305128003', '011003', '04-110', '2019-2020-1', '12', '01', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('50', '01', '16008003', '0702120209', '011003', '04-304', '2019-2020-1', '12', '01', null, 'A', '2020-04-23 11:58:00');
INSERT INTO `course_plan` VALUES ('51', '02', '16002102', '0702920401', '051001', '01-201', '2019-2020-1', '12', '02', null, 'A', '2020-04-23 11:58:00');
INSERT INTO `course_plan` VALUES ('52', '02', '16002102', '0711131000', '051001', '01-204', '2019-2020-1', '12', '02', null, 'A', '2020-04-23 11:58:00');
INSERT INTO `course_plan` VALUES ('53', '02', '16002102', '0306131000', '051001', '01-206', '2019-2020-1', '12', '02', null, 'A', '2020-04-23 11:58:00');
INSERT INTO `course_plan` VALUES ('54', '02', '16002103', '0303132002', '051002', '01-108', '2019-2020-1', '12', '02', null, 'A', '2020-04-23 11:58:00');
INSERT INTO `course_plan` VALUES ('55', '02', '16002103', '0305134000', '051002', '01-202', '2019-2020-1', '12', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('56', '02', '16002001', '0502111015', '031001', '01-305', '2019-2020-1', '12', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('57', '02', '16002001', '0502111015', '031001', '01-306', '2019-2020-1', '12', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('58', '02', '16002002', '0502111015', '031002', '01-309', '2019-2020-1', '18', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('59', '02', '16002002', '0502111015', '031002', '01-308', '2019-2020-1', '18', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('60', '02', '16002101', '0305128002', '041007', '01-105', '2019-2020-1', '12', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('61', '02', '16002101', '0305128002', '041007', '01-206', '2019-2020-1', '12', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('62', '02', '18002006', '0305128001', '041006', '01-306', '2019-2020-1', '7', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('63', '02', '18002006', '0305128001', '041006', '01-108', '2019-2020-1', '7', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('64', '02', '18002005', '0305128000', '041005', '01-302', '2019-2020-1', '10', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('65', '02', '18002005', '0305128000', '041005', '01-109', '2019-2020-1', '10', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('66', '02', '18002004', '0702120209', '041004', '01-104', '2019-2020-1', '10', '02', null, 'A', '2020-04-23 11:57:50');
INSERT INTO `course_plan` VALUES ('67', '02', '18002004', '0702920401', '041004', '01-203', '2019-2020-1', '10', '02', null, 'A', '2020-04-23 11:57:50');
INSERT INTO `course_plan` VALUES ('68', '02', '18002003', '0711131000', '041003', '01-107', '2019-2020-1', '16', '02', null, 'A', '2020-04-23 11:57:50');
INSERT INTO `course_plan` VALUES ('69', '02', '18002003', '0306131000', '041003', '01-202', '2019-2020-1', '16', '02', null, 'A', '2020-04-23 11:57:50');
INSERT INTO `course_plan` VALUES ('70', '02', '17008003', '0303132002', '011007', '01-205', '2019-2020-1', '12', '02', null, 'A', '2020-04-23 11:57:50');
INSERT INTO `course_plan` VALUES ('71', '02', '17008003', '0502111015', '011007', '01-307', '2019-2020-1', '12', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('72', '02', '18008002', '0402120012', '021002', '01-101', '2019-2020-1', '10', '09', null, 'A', '2020-04-22 17:59:12');
INSERT INTO `course_plan` VALUES ('73', '02', '18008002', '0402120012', '021002', '01-304', '2019-2020-1', '10', '15', null, 'A', '2020-04-22 17:59:16');
INSERT INTO `course_plan` VALUES ('74', '04', '16002003', '0702120209', '031003', '05-103', '2019-2020-1', '10', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('75', '04', '16002003', '0702120209', '031003', '05-107', '2019-2020-1', '10', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('76', '04', '17002001', '0702920401', '031004', '05-107', '2019-2020-1', '16', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('77', '04', '17002001', '0702920401', '031004', '05-202', '2019-2020-1', '16', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('78', '04', '17002002', '0306131000', '031005', '05-204', '2019-2020-1', '18', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('79', '04', '17002002', '0306131000', '031005', '05-105', '2019-2020-1', '18', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('80', '04', '17002003', '0303132002', '031007', '05-205', '2019-2020-1', '10', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('81', '04', '17002003', '0303132002', '031007', '05-106', '2019-2020-1', '10', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('82', '04', '18002001', '0303132003', '041001', '05-101', '2019-2020-1', '14', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `course_plan` VALUES ('83', '04', '18002001', '0702120209', '041001', '05-203', '2019-2020-1', '14', '04', null, 'A', '2020-04-23 11:57:35');
INSERT INTO `course_plan` VALUES ('84', '06', '17002101', '0702920401', '051003', '03-203', '2019-2020-1', '12', '06', null, 'A', '2020-04-23 11:57:35');
INSERT INTO `course_plan` VALUES ('85', '06', '17002101', '0711131000', '051003', '03-202', '2019-2020-1', '12', '06', null, 'A', '2020-04-23 11:57:35');
INSERT INTO `course_plan` VALUES ('86', '08', '19008001', '0306131000', '021005', '06-107', '2019-2020-1', '14', '24', null, 'A', '2020-04-23 11:57:35');
INSERT INTO `course_plan` VALUES ('87', '08', '19008001', '0303132002', '021005', '06-108', '2019-2020-1', '14', '13', null, 'A', '2020-04-23 11:57:35');
INSERT INTO `course_plan` VALUES ('88', '01', '16001101', '0502111015', '011001', '04-208', '2019-2020-1', '18', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('89', '01', '16001101', '0502111015', '011001', '04-101', '2019-2020-1', '18', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('90', '01', '16001101', '0502111015', '011001', '04-206', '2019-2020-1', '18', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('91', '01', '16001101', '0502111015', '011001', '04-207', '2019-2020-1', '18', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('92', '01', '16001101', '0502111015', '011001', '04-105', '2019-2020-1', '18', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('93', '01', '17008001', '0502111030', '011004', '04-102', '2019-2020-1', '10', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('94', '01', '17008001', '0502111030', '011004', '04-305', '2019-2020-1', '10', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('95', '01', '16008003', '0305128003', '011003', '04-102', '2019-2020-1', '12', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('96', '01', '16008003', '0305128003', '011003', '04-303', '2019-2020-1', '12', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('97', '01', '18001106', '0701120117', '151009', '04-204', '2019-2020-1', '15', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('98', '01', '18001106', '0701120117', '151009', '04-307', '2019-2020-1', '15', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('99', '02', '16002102', '0305128003', '051001', '01-101', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('100', '02', '16002102', '0305128003', '051001', '01-305', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('101', '02', '16002102', '0305128003', '051001', '01-307', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('102', '02', '16002103', '0305134000', '051002', '01-301', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('103', '02', '16002103', '0305134000', '051002', '01-110', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('104', '02', '16002001', '0502111015', '031001', '01-104', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('105', '02', '16002001', '0502111015', '031001', '01-204', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('106', '02', '16002002', '0502111015', '031002', '01-107', '2019-2020-1', '18', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('107', '02', '16002002', '0502111015', '031002', '01-202', '2019-2020-1', '18', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('108', '02', '16002101', '0305128002', '041007', '01-302', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('109', '02', '16002101', '0305128002', '041007', '01-107', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('110', '02', '18002006', '0305128001', '041006', '01-207', '2019-2020-1', '7', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('111', '02', '18002006', '0305128001', '041006', '01-102', '2019-2020-1', '7', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('112', '02', '18002005', '0305128000', '041005', '01-207', '2019-2020-1', '10', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('113', '02', '18002005', '0305128000', '041005', '01-307', '2019-2020-1', '10', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('114', '02', '18002004', '0809412108', '041004', '01-109', '2019-2020-1', '10', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('115', '02', '18002004', '0809412108', '041004', '01-306', '2019-2020-1', '10', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('116', '02', '18002003', '0809212017', '041003', '01-204', '2019-2020-1', '16', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('117', '02', '18002003', '0809212017', '041003', '01-110', '2019-2020-1', '16', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('118', '02', '17008003', '0502111015', '011007', '01-201', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('119', '02', '17008003', '0502111015', '011007', '01-210', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('120', '02', '18008002', '0402120012', '021002', '01-305', '2019-2020-1', '10', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('121', '02', '18008002', '0402120012', '021002', '01-101', '2019-2020-1', '10', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('122', '04', '16002003', '0702120209', '031003', '05-205', '2019-2020-1', '10', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('123', '04', '16002003', '0702120209', '031003', '05-109', '2019-2020-1', '10', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('124', '04', '17002001', '0702920401', '031004', '05-204', '2019-2020-1', '16', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('125', '04', '17002001', '0702920401', '031004', '05-206', '2019-2020-1', '16', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('126', '04', '17002002', '0306131000', '031005', '05-203', '2019-2020-1', '18', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('127', '04', '17002002', '0306131000', '031005', '05-106', '2019-2020-1', '18', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('128', '04', '17002003', '0303132002', '031007', '05-108', '2019-2020-1', '10', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('129', '04', '17002003', '0303132002', '031007', '05-209', '2019-2020-1', '10', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('130', '04', '18002001', '0303132003', '041001', '05-104', '2019-2020-1', '14', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('131', '04', '18002001', '0303132003', '041001', '05-103', '2019-2020-1', '14', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('132', '06', '17002101', '0502111029', '051003', '03-305', '2019-2020-1', '12', '06', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('133', '06', '17002101', '0502111029', '051003', '03-105', '2019-2020-1', '12', '06', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('134', '08', '19008001', '0502111015', '021005', '06-201', '2019-2020-1', '14', '08', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('135', '08', '19008001', '0502111015', '021005', '06-110', '2019-2020-1', '14', '08', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `course_plan` VALUES ('136', '01', '16001101', '0502111015', '011001', '04-105', '2019-2020-1', '18', '01', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('137', '01', '16001101', '0502111015', '011001', '04-306', '2019-2020-1', '18', '01', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('138', '01', '16001101', '0502111015', '011001', '04-106', '2019-2020-1', '18', '01', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('139', '01', '16001101', '0502111015', '011001', '04-107', '2019-2020-1', '18', '01', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('140', '01', '16001101', '0502111015', '011001', '04-304', '2019-2020-1', '18', '01', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('141', '01', '17008001', '0502111030', '011004', '04-104', '2019-2020-1', '10', '01', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('142', '01', '17008001', '0502111030', '011004', '04-206', '2019-2020-1', '10', '01', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('143', '01', '16008003', '0305128003', '011003', '04-108', '2019-2020-1', '12', '01', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('144', '01', '16008003', '0305128003', '011003', '04-304', '2019-2020-1', '12', '01', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('145', '01', '18001106', '0701120117', '151009', '04-103', '2019-2020-1', '15', '01', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('146', '01', '18001106', '0701120117', '151009', '04-308', '2019-2020-1', '15', '01', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('147', '02', '16002102', '0305128003', '051001', '01-203', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('148', '02', '16002102', '0305128003', '051001', '01-301', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('149', '02', '16002102', '0305128003', '051001', '01-302', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('150', '02', '16002103', '0305134000', '051002', '01-207', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('151', '02', '16002103', '0305134000', '051002', '01-106', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('152', '02', '16002001', '0502111015', '031001', '01-103', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('153', '02', '16002001', '0502111015', '031001', '01-108', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('154', '02', '16002002', '0502111015', '031002', '01-305', '2019-2020-1', '18', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('155', '02', '16002002', '0502111015', '031002', '01-203', '2019-2020-1', '18', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('156', '02', '16002101', '0305128002', '041007', '01-203', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('157', '02', '16002101', '0305128002', '041007', '01-309', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('158', '02', '18002006', '0305128001', '041006', '01-308', '2019-2020-1', '7', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('159', '02', '18002006', '0305128001', '041006', '01-104', '2019-2020-1', '7', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('160', '02', '18002005', '0305128000', '041005', '01-207', '2019-2020-1', '10', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('161', '02', '18002005', '0305128000', '041005', '01-208', '2019-2020-1', '10', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('162', '02', '18002004', '0809412108', '041004', '01-106', '2019-2020-1', '10', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('163', '02', '18002004', '0809412108', '041004', '01-107', '2019-2020-1', '10', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('164', '02', '18002003', '0809212017', '041003', '01-106', '2019-2020-1', '16', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('165', '02', '18002003', '0809212017', '041003', '01-203', '2019-2020-1', '16', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('166', '02', '17008003', '0502111015', '011007', '01-204', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('167', '02', '17008003', '0502111015', '011007', '01-210', '2019-2020-1', '12', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('168', '02', '18008002', '0402120012', '021002', '01-204', '2019-2020-1', '10', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('169', '02', '18008002', '0402120012', '021002', '01-303', '2019-2020-1', '10', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('170', '04', '16002003', '0702120209', '031003', '05-107', '2019-2020-1', '10', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('171', '04', '16002003', '0702120209', '031003', '05-102', '2019-2020-1', '10', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('172', '04', '17002001', '0702920401', '031004', '05-101', '2019-2020-1', '16', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('173', '04', '17002001', '0702920401', '031004', '05-205', '2019-2020-1', '16', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('174', '04', '17002002', '0306131000', '031005', '05-105', '2019-2020-1', '18', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('175', '04', '17002002', '0306131000', '031005', '05-208', '2019-2020-1', '18', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('176', '04', '17002003', '0303132002', '031007', '05-204', '2019-2020-1', '10', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('177', '04', '17002003', '0303132002', '031007', '05-102', '2019-2020-1', '10', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('178', '04', '18002001', '0303132003', '041001', '05-105', '2019-2020-1', '14', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('179', '04', '18002001', '0303132003', '041001', '05-103', '2019-2020-1', '14', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('180', '06', '17002101', '0502111029', '051003', '03-208', '2019-2020-1', '12', '06', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('181', '06', '17002101', '0502111029', '051003', '03-101', '2019-2020-1', '12', '06', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('182', '08', '19008001', '0502111015', '021005', '06-104', '2019-2020-1', '14', '08', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('183', '08', '19008001', '0502111015', '021005', '06-107', '2019-2020-1', '14', '08', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `course_plan` VALUES ('184', '01', '16001101', '0502111015', '011001', '04-106', '2019-2020-1', '18', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('185', '01', '16001101', '0502111015', '011001', '04-303', '2019-2020-1', '18', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('186', '01', '16001101', '0502111015', '011001', '04-101', '2019-2020-1', '18', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('187', '01', '16001101', '0502111015', '011001', '04-201', '2019-2020-1', '18', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('188', '01', '16001101', '0502111015', '011001', '04-102', '2019-2020-1', '18', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('189', '01', '17008001', '0502111030', '011004', '04-305', '2019-2020-1', '10', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('190', '01', '17008001', '0502111030', '011004', '04-103', '2019-2020-1', '10', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('191', '01', '16008003', '0305128003', '011003', '04-101', '2019-2020-1', '12', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('192', '01', '16008003', '0305128003', '011003', '04-203', '2019-2020-1', '12', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('193', '01', '18001106', '0701120117', '151009', '04-210', '2019-2020-1', '15', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('194', '01', '18001106', '0701120117', '151009', '04-209', '2019-2020-1', '15', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('195', '02', '16002102', '0305128003', '051001', '01-304', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('196', '02', '16002102', '0305128003', '051001', '01-306', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('197', '02', '16002102', '0305128003', '051001', '01-207', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('198', '02', '16002103', '0305134000', '051002', '01-302', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('199', '02', '16002103', '0305134000', '051002', '01-107', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('200', '02', '16002001', '0502111015', '031001', '01-309', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('201', '02', '16002001', '0502111015', '031001', '01-203', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('202', '02', '16002002', '0502111015', '031002', '01-207', '2019-2020-1', '18', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('203', '02', '16002002', '0502111015', '031002', '01-304', '2019-2020-1', '18', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('204', '02', '16002101', '0305128002', '041007', '01-103', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('205', '02', '16002101', '0305128002', '041007', '01-205', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('206', '02', '18002006', '0305128001', '041006', '01-203', '2019-2020-1', '7', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('207', '02', '18002006', '0305128001', '041006', '01-107', '2019-2020-1', '7', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('208', '02', '18002005', '0305128000', '041005', '01-106', '2019-2020-1', '10', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('209', '02', '18002005', '0305128000', '041005', '01-102', '2019-2020-1', '10', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('210', '02', '18002004', '0809412108', '041004', '01-110', '2019-2020-1', '10', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('211', '02', '18002004', '0809412108', '041004', '01-201', '2019-2020-1', '10', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('212', '02', '18002003', '0809212017', '041003', '01-106', '2019-2020-1', '16', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('213', '02', '18002003', '0809212017', '041003', '01-201', '2019-2020-1', '16', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('214', '02', '17008003', '0502111015', '011007', '01-304', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('215', '02', '17008003', '0502111015', '011007', '01-106', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('216', '02', '18008002', '0402120012', '021002', '01-106', '2019-2020-1', '10', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('217', '02', '18008002', '0402120012', '021002', '01-204', '2019-2020-1', '10', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('218', '04', '16002003', '0702120209', '031003', '05-102', '2019-2020-1', '10', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('219', '04', '16002003', '0702120209', '031003', '05-210', '2019-2020-1', '10', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('220', '04', '17002001', '0702920401', '031004', '05-207', '2019-2020-1', '16', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('221', '04', '17002001', '0702920401', '031004', '05-109', '2019-2020-1', '16', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('222', '04', '17002002', '0306131000', '031005', '05-108', '2019-2020-1', '18', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('223', '04', '17002002', '0306131000', '031005', '05-105', '2019-2020-1', '18', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('224', '04', '17002003', '0303132002', '031007', '05-108', '2019-2020-1', '10', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('225', '04', '17002003', '0303132002', '031007', '05-201', '2019-2020-1', '10', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('226', '04', '18002001', '0303132003', '041001', '05-202', '2019-2020-1', '14', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('227', '04', '18002001', '0303132003', '041001', '05-103', '2019-2020-1', '14', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('228', '06', '17002101', '0502111029', '051003', '03-110', '2019-2020-1', '12', '06', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('229', '06', '17002101', '0502111029', '051003', '03-107', '2019-2020-1', '12', '06', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('230', '08', '19008001', '0502111015', '021005', '06-204', '2019-2020-1', '14', '08', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('231', '08', '19008001', '0502111015', '021005', '06-104', '2019-2020-1', '14', '08', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `course_plan` VALUES ('232', '01', '16001101', '0502111015', '011001', '04-202', '2019-2020-1', '18', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('233', '01', '16001101', '0502111015', '011001', '04-107', '2019-2020-1', '18', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('234', '01', '16001101', '0502111015', '011001', '04-107', '2019-2020-1', '18', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('235', '01', '16001101', '0502111015', '011001', '04-305', '2019-2020-1', '18', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('236', '01', '16001101', '0502111015', '011001', '04-204', '2019-2020-1', '18', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('237', '01', '17008001', '0502111030', '011004', '04-306', '2019-2020-1', '10', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('238', '01', '17008001', '0502111030', '011004', '04-207', '2019-2020-1', '10', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('239', '01', '16008003', '0305128003', '011003', '04-107', '2019-2020-1', '12', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('240', '01', '16008003', '0305128003', '011003', '04-106', '2019-2020-1', '12', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('241', '01', '18001106', '0701120117', '151009', '04-104', '2019-2020-1', '15', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('242', '01', '18001106', '0701120117', '151009', '04-210', '2019-2020-1', '15', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('243', '02', '16002102', '0305128003', '051001', '01-107', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('244', '02', '16002102', '0305128003', '051001', '01-308', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('245', '02', '16002102', '0305128003', '051001', '01-109', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('246', '02', '16002103', '0305134000', '051002', '01-106', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('247', '02', '16002103', '0305134000', '051002', '01-202', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('248', '02', '16002001', '0502111015', '031001', '01-104', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('249', '02', '16002001', '0502111015', '031001', '01-107', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('250', '02', '16002002', '0502111015', '031002', '01-209', '2019-2020-1', '18', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('251', '02', '16002002', '0502111015', '031002', '01-305', '2019-2020-1', '18', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('252', '02', '16002101', '0305128002', '041007', '01-210', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('253', '02', '16002101', '0305128002', '041007', '01-310', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('254', '02', '18002006', '0305128001', '041006', '01-203', '2019-2020-1', '7', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('255', '02', '18002006', '0305128001', '041006', '01-205', '2019-2020-1', '7', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('256', '02', '18002005', '0305128000', '041005', '01-308', '2019-2020-1', '10', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('257', '02', '18002005', '0305128000', '041005', '01-110', '2019-2020-1', '10', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('258', '02', '18002004', '0809412108', '041004', '01-102', '2019-2020-1', '10', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('259', '02', '18002004', '0809412108', '041004', '01-104', '2019-2020-1', '10', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('260', '02', '18002003', '0809212017', '041003', '01-203', '2019-2020-1', '16', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('261', '02', '18002003', '0809212017', '041003', '01-107', '2019-2020-1', '16', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('262', '02', '17008003', '0502111015', '011007', '01-305', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('263', '02', '17008003', '0502111015', '011007', '01-208', '2019-2020-1', '12', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('264', '02', '18008002', '0402120012', '021002', '01-304', '2019-2020-1', '10', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('265', '02', '18008002', '0402120012', '021002', '01-304', '2019-2020-1', '10', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('266', '04', '16002003', '0702120209', '031003', '05-104', '2019-2020-1', '10', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('267', '04', '16002003', '0702120209', '031003', '05-108', '2019-2020-1', '10', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('268', '04', '17002001', '0702920401', '031004', '05-102', '2019-2020-1', '16', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('269', '04', '17002001', '0702920401', '031004', '05-103', '2019-2020-1', '16', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('270', '04', '17002002', '0306131000', '031005', '05-209', '2019-2020-1', '18', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('271', '04', '17002002', '0306131000', '031005', '05-204', '2019-2020-1', '18', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('272', '04', '17002003', '0303132002', '031007', '05-206', '2019-2020-1', '10', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('273', '04', '17002003', '0303132002', '031007', '05-210', '2019-2020-1', '10', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('274', '04', '18002001', '0303132003', '041001', '05-108', '2019-2020-1', '14', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('275', '04', '18002001', '0303132003', '041001', '05-108', '2019-2020-1', '14', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('276', '06', '17002101', '0502111029', '051003', '03-205', '2019-2020-1', '12', '06', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('277', '06', '17002101', '0502111029', '051003', '03-302', '2019-2020-1', '12', '06', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('278', '08', '19008001', '0502111015', '021005', '06-207', '2019-2020-1', '14', '08', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('279', '08', '19008001', '0502111015', '021005', '06-204', '2019-2020-1', '14', '08', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `course_plan` VALUES ('280', '01', '16001101', '0502111015', '011001', '04-207', '2019-2020-1', '18', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('281', '01', '16001101', '0502111015', '011001', '04-304', '2019-2020-1', '18', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('282', '01', '16001101', '0502111015', '011001', '04-104', '2019-2020-1', '18', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('283', '01', '16001101', '0502111015', '011001', '04-103', '2019-2020-1', '18', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('284', '01', '16001101', '0502111015', '011001', '04-209', '2019-2020-1', '18', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('285', '01', '17008001', '0502111030', '011004', '04-209', '2019-2020-1', '10', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('286', '01', '17008001', '0502111030', '011004', '04-204', '2019-2020-1', '10', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('287', '01', '16008003', '0305128003', '011003', '04-109', '2019-2020-1', '12', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('288', '01', '16008003', '0305128003', '011003', '04-108', '2019-2020-1', '12', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('289', '01', '18001106', '0701120117', '151009', '04-304', '2019-2020-1', '15', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('290', '01', '18001106', '0701120117', '151009', '04-208', '2019-2020-1', '15', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('291', '02', '16002102', '0305128003', '051001', '01-101', '2019-2020-1', '12', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('292', '02', '16002102', '0305128003', '051001', '01-105', '2019-2020-1', '12', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('293', '02', '16002102', '0305128003', '051001', '01-102', '2019-2020-1', '12', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('294', '02', '16002103', '0305134000', '051002', '01-210', '2019-2020-1', '12', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('295', '02', '16002103', '0305134000', '051002', '01-306', '2019-2020-1', '12', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('296', '02', '16002001', '0502111015', '031001', '01-108', '2019-2020-1', '12', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('297', '02', '16002001', '0502111015', '031001', '01-307', '2019-2020-1', '12', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('298', '02', '16002002', '0502111015', '031002', '01-203', '2019-2020-1', '18', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('299', '02', '16002002', '0502111015', '031002', '01-109', '2019-2020-1', '18', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('300', '02', '16002101', '0305128002', '041007', '01-107', '2019-2020-1', '12', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('301', '02', '16002101', '0305128002', '041007', '01-307', '2019-2020-1', '12', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('302', '02', '18002006', '0305128001', '041006', '01-308', '2019-2020-1', '7', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('303', '02', '18002006', '0305128001', '041006', '01-202', '2019-2020-1', '7', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('304', '02', '18002005', '0305128000', '041005', '01-302', '2019-2020-1', '10', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('305', '02', '18002005', '0305128000', '041005', '01-110', '2019-2020-1', '10', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('306', '02', '18002004', '0809412108', '041004', '01-307', '2019-2020-1', '10', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('307', '02', '18002004', '0809412108', '041004', '01-109', '2019-2020-1', '10', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('308', '02', '18002003', '0809212017', '041003', '01-105', '2019-2020-1', '16', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('309', '02', '18002003', '0809212017', '041003', '01-205', '2019-2020-1', '16', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('310', '02', '17008003', '0502111015', '011007', '01-101', '2019-2020-1', '12', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('311', '02', '17008003', '0502111015', '011007', '01-204', '2019-2020-1', '12', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('312', '02', '18008002', '0402120012', '021002', '01-305', '2019-2020-1', '10', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('313', '02', '18008002', '0402120012', '021002', '01-107', '2019-2020-1', '10', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('314', '04', '16002003', '0702120209', '031003', '05-106', '2019-2020-1', '10', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('315', '04', '16002003', '0702120209', '031003', '05-110', '2019-2020-1', '10', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('316', '04', '17002001', '0702920401', '031004', '05-105', '2019-2020-1', '16', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('317', '04', '17002001', '0702920401', '031004', '05-207', '2019-2020-1', '16', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('318', '04', '17002002', '0306131000', '031005', '05-207', '2019-2020-1', '18', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('319', '04', '17002002', '0306131000', '031005', '05-104', '2019-2020-1', '18', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('320', '04', '17002003', '0303132002', '031007', '05-105', '2019-2020-1', '10', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('321', '04', '17002003', '0303132002', '031007', '05-104', '2019-2020-1', '10', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('322', '04', '18002001', '0303132003', '041001', '05-203', '2019-2020-1', '14', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('323', '04', '18002001', '0303132003', '041001', '05-210', '2019-2020-1', '14', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('324', '06', '17002101', '0502111029', '051003', '03-305', '2019-2020-1', '12', '06', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('325', '06', '17002101', '0502111029', '051003', '03-307', '2019-2020-1', '12', '06', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('326', '08', '19008001', '0502111015', '021005', '06-107', '2019-2020-1', '14', '08', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `course_plan` VALUES ('327', '08', '19008001', '0502111015', '021005', '06-104', '2019-2020-1', '14', '08', null, 'A', '2020-05-08 22:35:23');

-- ----------------------------
-- Table structure for course_type
-- ----------------------------
DROP TABLE IF EXISTS `course_type`;
CREATE TABLE `course_type` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `user_id` int(2) NOT NULL COMMENT '用户标识',
  `type_name` varchar(200) NOT NULL COMMENT '类别名称',
  `type_no` varchar(255) DEFAULT NULL COMMENT '课程类型编码',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` char(1) NOT NULL DEFAULT 'A' COMMENT '''A-在用;\r\nX-删除'';\r\n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='课程类别：''用于配置课程类别''';

-- ----------------------------
-- Records of course_type
-- ----------------------------
INSERT INTO `course_type` VALUES ('1', '1', '公共基础课程', '01', '2019-05-10 00:00:00', '2020-04-03 15:13:32', 'A');
INSERT INTO `course_type` VALUES ('2', '1', '专业基础课程', '02', '2019-05-11 00:00:00', '2020-04-03 15:13:33', 'A');
INSERT INTO `course_type` VALUES ('3', '1', '专业课程', '03', '2019-05-11 00:00:00', '2020-04-03 15:13:35', 'A');
INSERT INTO `course_type` VALUES ('4', '1', '公共基础课', '04', '2019-08-08 12:38:44', '2020-04-03 15:13:37', 'A');
INSERT INTO `course_type` VALUES ('5', '1', '公共基础课（体育）', '05', '2020-04-02 23:20:15', '2020-04-03 15:13:40', 'A');

-- ----------------------------
-- Table structure for eecstate
-- ----------------------------
DROP TABLE IF EXISTS `eecstate`;
CREATE TABLE `eecstate` (
  `id` int(3) NOT NULL AUTO_INCREMENT COMMENT '用户标识',
  `table` varchar(20) DEFAULT NULL,
  `table_name` varchar(20) NOT NULL COMMENT '表名称',
  `colm` varchar(50) DEFAULT '',
  `colm_name` varchar(20) NOT NULL COMMENT '列名',
  `code` char(1) NOT NULL COMMENT '编码',
  `code_name` varchar(20) NOT NULL COMMENT '编码名称',
  `seq` int(2) DEFAULT NULL COMMENT '序号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `state` char(1) NOT NULL DEFAULT 'A' COMMENT '状态 X:隐藏；A：显示',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `state_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '状态日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eecstate
-- ----------------------------
INSERT INTO `eecstate` VALUES ('53', 'role', '角色表', 'is_enable', '状态', '1', '启用', '1', '', 'A', '2019-06-24 15:21:30', '2019-09-10 14:30:10');
INSERT INTO `eecstate` VALUES ('54', 'role', '角色表', 'is_enable', '状态', '0', '禁用', '2', '', 'A', '2019-06-24 15:22:26', '2019-09-10 14:30:10');
INSERT INTO `eecstate` VALUES ('55', 'public', '公用表', 'sex', '性别', 'm', '男', '1', '', 'A', '2019-06-28 13:49:47', '2019-09-10 14:30:10');
INSERT INTO `eecstate` VALUES ('56', 'public', '公用表', 'sex', '性别', 'f', '女', '2', '', 'A', '2019-06-28 13:50:08', '2019-09-10 14:30:10');
INSERT INTO `eecstate` VALUES ('57', 'eecstate', '域表', 'state', '状态', 'X', '隐藏', '2', '', 'A', '2019-06-30 17:48:32', '2019-09-10 14:30:10');
INSERT INTO `eecstate` VALUES ('58', 'eecstate', '域表', 'state', '状态', 'A', '显示', '1', '', 'A', '2019-06-30 17:48:32', '2019-09-10 14:30:10');
INSERT INTO `eecstate` VALUES ('70', 'class_student', '班级学生表', 'student_state', '学生状态', 'A', '在读', '1', '', 'A', '2019-07-01 16:21:11', '2019-09-10 14:30:10');
INSERT INTO `eecstate` VALUES ('71', 'class_student', '班级学生表', 'student_state', '学生状态', 'B', '入伍', '2', '', 'A', '2019-07-01 16:21:48', '2019-09-10 14:30:10');
INSERT INTO `eecstate` VALUES ('72', 'class_student', '班级学生表', 'student_state', '学生状态', 'C', '病休', '3', '', 'A', '2019-07-01 16:22:18', '2019-09-10 14:30:10');
INSERT INTO `eecstate` VALUES ('73', 'class_student', '班级学生表', 'student_state', '学生状态', 'D', '毕业', '4', '', 'A', '2019-07-01 16:22:57', '2019-09-10 14:30:10');
INSERT INTO `eecstate` VALUES ('74', 'class_student', '班级学生表', 'student_state', '学生状态', 'X', '退学', '5', '', 'A', '2019-07-01 16:23:33', '2019-09-10 14:30:10');
INSERT INTO `eecstate` VALUES ('89', 'course_outline', '课程大纲表', 'outline_no', '版本号', 'A', '2010版', '1', '', 'A', '2019-07-31 09:50:50', '2019-09-10 14:30:10');
INSERT INTO `eecstate` VALUES ('90', 'course_outline', '课程大纲表', 'outline_no', '版本号', 'B', '2012版', '2', '', 'A', '2019-07-31 09:51:22', '2019-09-10 14:30:11');
INSERT INTO `eecstate` VALUES ('91', 'course_outline', '课程大纲表', 'outline_no', '版本号', 'C', '2014版', '3', '', 'A', '2019-07-31 09:51:22', '2019-09-10 14:30:11');
INSERT INTO `eecstate` VALUES ('92', 'course_outline', '课程大纲表', 'outline_no', '版本号', 'D', '2016版', '4', '', 'A', '2019-07-31 09:51:22', '2019-09-10 14:30:11');
INSERT INTO `eecstate` VALUES ('93', 'course_outline', '课程大纲表', 'outline_no', '版本号', 'E', '2018版', '5', '', 'A', '2019-07-31 09:51:22', '2019-09-12 15:31:04');

-- ----------------------------
-- Table structure for file_info
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) NOT NULL COMMENT '文件名称',
  `access_url` varchar(200) NOT NULL COMMENT '文件访问路径',
  `type` char(1) DEFAULT NULL COMMENT '文件类型',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `state` char(1) NOT NULL DEFAULT 'W' COMMENT '状态：在用-''A'';待用-''W'';删除-''X''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_info
-- ----------------------------
INSERT INTO `file_info` VALUES ('1', 'test04.xlsx', '/upload/text/20200401151715_test04.xlsx', 'T', '2020-04-01 15:17:15', 'W');
INSERT INTO `file_info` VALUES ('2', 'test04.xlsx', '/upload/text/20200401152011_test04.xlsx', 'T', '2020-04-01 15:20:11', 'W');
INSERT INTO `file_info` VALUES ('3', '9-1.mp4', '/upload/video/20200411134123_9-1.mp4', 'V', '2020-04-11 13:42:28', 'W');
INSERT INTO `file_info` VALUES ('4', '27_尚学堂_高淇_JAVA基础300集最全教程_键盘输入_Scanner类的使用_import简单入门.wmv', '/upload/video/20200411215250_27_尚学堂_高淇_JAVA基础300集最全教程_键盘输入_Scanner类的使用_import简单入门.wmv', 'V', '2020-04-11 21:52:51', 'W');
INSERT INTO `file_info` VALUES ('5', '28-1 课程总结.mp4', '/upload/video/20200411220913_28-1 课程总结.mp4', 'V', '2020-04-11 22:09:15', 'W');

-- ----------------------------
-- Table structure for grade_info
-- ----------------------------
DROP TABLE IF EXISTS `grade_info`;
CREATE TABLE `grade_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(255) DEFAULT NULL COMMENT '年级名称',
  `remark` varchar(1000) DEFAULT NULL,
  `state` char(1) NOT NULL DEFAULT 'A',
  `created_data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade_info
-- ----------------------------
INSERT INTO `grade_info` VALUES ('1', '大一', null, 'A', '2020-04-01 01:55:17');
INSERT INTO `grade_info` VALUES ('2', '大二', null, 'A', '2020-04-01 01:55:20');
INSERT INTO `grade_info` VALUES ('3', '大三', null, 'A', '2020-04-01 01:55:23');
INSERT INTO `grade_info` VALUES ('4', '大四', null, 'A', '2020-04-01 01:55:25');
INSERT INTO `grade_info` VALUES ('5', '大五', null, 'A', '2020-04-01 01:55:29');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '菜单项的唯一标识',
  `title` varchar(64) NOT NULL COMMENT '菜单标题',
  `path` varchar(64) DEFAULT NULL COMMENT '页面在项目中的路径',
  `parent_id` int(2) NOT NULL DEFAULT '0' COMMENT '父级菜单 0表示是父级菜单',
  `seq` int(1) DEFAULT NULL COMMENT '菜单排序序号',
  `is_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用:\r\n1-启用\r\n0-禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '/info', '信息管理', '', '0', '2', '1');
INSERT INTO `menu` VALUES ('2', '/schedule', '排课管理', null, '0', '3', '1');
INSERT INTO `menu` VALUES ('3', '/account', '账户管理', '', '0', '1', '1');
INSERT INTO `menu` VALUES ('4', '/video', '视频', null, '0', '4', '1');
INSERT INTO `menu` VALUES ('5', '/info/staff_info', '员工信息', '/info/staffInfo.html', '1', '5', '1');
INSERT INTO `menu` VALUES ('6', '/info/student_info', '学生信息', '/info/studentInfo.html', '1', '6', '1');
INSERT INTO `menu` VALUES ('7', '/info/course_info', '课程信息', '/info/courseInfo.html', '1', '1', '1');
INSERT INTO `menu` VALUES ('8', '/info/subject_info', '题库信息', '/info/subjectInfo.html', '1', '7', '0');
INSERT INTO `menu` VALUES ('9', '/info/score_info', '成绩信息', '/info/scoreInfo.html', '1', '8', '1');
INSERT INTO `menu` VALUES ('10', '/info/school_info', '学院信息', '/info/schoolInfo.html', '1', '4', '1');
INSERT INTO `menu` VALUES ('11', '/info/specialty_', '专业信息', '/info/specialty.html', '1', '2', '1');
INSERT INTO `menu` VALUES ('12', '/info/class_info', '班级信息', '/info/classInfo.html', '1', '3', '1');
INSERT INTO `menu` VALUES ('13', '/schedule/classroom_info', '教室信息', '/schedule/classroomInfo.html', '2', '1', '1');
INSERT INTO `menu` VALUES ('14', '/schedule/teachBuild_info', '教学楼信息', '/schedule/teachBuildInfo.html', '2', '2', '1');
INSERT INTO `menu` VALUES ('15', '/schedule/class_task', '开课任务', '/schedule/classTask.html', '2', '3', '1');
INSERT INTO `menu` VALUES ('16', '/schedule/schoolTeachBuild_info', '学院教学区', '/schedule/schoolTeachBuildInfo.html', '2', '4', '1');
INSERT INTO `menu` VALUES ('17', '/schedule/teacher_course', '教室计划', '/schedule/teacherCourse.html', '2', '5', '1');
INSERT INTO `menu` VALUES ('18', '/schedule/time_table', '课表信息', '/schedule/timetable.html', '2', '6', '1');
INSERT INTO `menu` VALUES ('19', '/account/userMenu_', '用户管理', '/account/userMenu.html', '3', '1', '1');
INSERT INTO `menu` VALUES ('20', '/account/role_', '角色管理', '/account/role.html', '3', '2', '1');
INSERT INTO `menu` VALUES ('21', '/account/menu_', '菜单管理', '/account/menu.html', '3', '3', '1');
INSERT INTO `menu` VALUES ('22', '/video/video', '视频信息', '/video/videoTest.html', '4', '1', '1');
INSERT INTO `menu` VALUES ('23', '/info/subject_test', '测试', '/info/test.html', '1', '9', '0');
INSERT INTO `menu` VALUES ('24', 'http://127.0.0.1:8088/', '超级管理员入口', 'http://127.0.0.1:8088/', '27', '1', '1');
INSERT INTO `menu` VALUES ('25', 'http://127.0.0.1:8099/', '学生考试入口', 'http://127.0.0.1:8099/', '27', '2', '1');
INSERT INTO `menu` VALUES ('26', 'http://127.0.0.1:8077/', '考试管理（老师）', 'http://127.0.0.1:8077/', '27', '3', '1');
INSERT INTO `menu` VALUES ('27', '/other', '其他入口', null, '0', '5', '1');

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `role_id` int(2) NOT NULL COMMENT '角色标识',
  `menu_id` int(2) NOT NULL COMMENT '菜单标识',
  `state` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES ('1', '1', '1', 'A');
INSERT INTO `menu_role` VALUES ('2', '1', '2', 'A');
INSERT INTO `menu_role` VALUES ('3', '1', '3', 'A');
INSERT INTO `menu_role` VALUES ('4', '1', '4', 'A');
INSERT INTO `menu_role` VALUES ('5', '1', '5', 'A');
INSERT INTO `menu_role` VALUES ('6', '1', '6', 'A');
INSERT INTO `menu_role` VALUES ('7', '1', '7', 'A');
INSERT INTO `menu_role` VALUES ('8', '1', '8', 'A');
INSERT INTO `menu_role` VALUES ('9', '1', '9', 'A');
INSERT INTO `menu_role` VALUES ('10', '1', '10', 'A');
INSERT INTO `menu_role` VALUES ('11', '1', '11', 'A');
INSERT INTO `menu_role` VALUES ('12', '1', '12', 'A');
INSERT INTO `menu_role` VALUES ('13', '1', '13', 'A');
INSERT INTO `menu_role` VALUES ('14', '1', '14', 'A');
INSERT INTO `menu_role` VALUES ('15', '1', '15', 'A');
INSERT INTO `menu_role` VALUES ('16', '1', '16', 'A');
INSERT INTO `menu_role` VALUES ('17', '1', '17', 'A');
INSERT INTO `menu_role` VALUES ('18', '1', '18', 'A');
INSERT INTO `menu_role` VALUES ('19', '1', '19', 'A');
INSERT INTO `menu_role` VALUES ('20', '1', '20', 'A');
INSERT INTO `menu_role` VALUES ('21', '1', '21', 'A');
INSERT INTO `menu_role` VALUES ('22', '1', '22', 'A');
INSERT INTO `menu_role` VALUES ('23', '1', '23', 'A');
INSERT INTO `menu_role` VALUES ('24', '1', '24', 'A');
INSERT INTO `menu_role` VALUES ('25', '1', '25', 'A');
INSERT INTO `menu_role` VALUES ('26', '1', '26', 'A');
INSERT INTO `menu_role` VALUES ('27', '1', '27', 'A');

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `paper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '试卷id',
  `paper_name` varchar(255) DEFAULT NULL COMMENT '试卷名称',
  `paper_create_time` datetime DEFAULT NULL COMMENT '试卷创建时间',
  `paper_duration` int(11) DEFAULT NULL COMMENT '考试时长，单位秒',
  `paper_difficulty` int(11) DEFAULT NULL COMMENT '试卷难度',
  `paper_attention` varchar(255) DEFAULT NULL COMMENT '考试注意事项',
  `paper_type` int(11) DEFAULT NULL COMMENT '组卷机制，1为随机，2为固定',
  `single_score` int(11) DEFAULT NULL COMMENT '单选题分配分数',
  `multiple_score` int(11) DEFAULT NULL COMMENT '多选题分配分数',
  `judge_score` int(11) DEFAULT NULL COMMENT '判断题分配分数',
  `fill_score` int(11) DEFAULT NULL COMMENT '填空题分配分数',
  `lang_id` int(11) DEFAULT NULL COMMENT '试卷所属编程语言',
  `participate_num` int(11) DEFAULT '0' COMMENT '已参加人数',
  PRIMARY KEY (`paper_id`),
  KEY `paper_lang_id` (`lang_id`),
  CONSTRAINT `paper_ibfk_1` FOREIGN KEY (`lang_id`) REFERENCES `programing_language` (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('1', 'Java语言程序设计（一）', '2019-03-15 14:35:58', '6000', '2', '考试时间结束系统将自动提交试卷，考试过程强制退出浏览器成绩记0分', '2', '3', '5', '1', '2', '1', '14');
INSERT INTO `paper` VALUES ('2', 'Java语言程序设计（二）', '2019-03-15 14:41:35', '3000', '3', '请勿作弊，考试过程强制退出浏览器成绩记0分', '1', '4', '6', '2', '2', '1', '8');
INSERT INTO `paper` VALUES ('3', 'Java进阶训练（一）', '2019-03-15 19:36:30', '9000', '4', '请遵守考试规则，考试过程强制退出浏览器成绩记0分', '2', '4', '6', '3', '5', '1', '1');
INSERT INTO `paper` VALUES ('4', 'Java进阶训练（二）', '2019-03-16 00:03:46', '5400', '5', '请务必认真答题，考试过程强制退出浏览器成绩记0分', '1', '4', '6', '2', '4', '1', '0');
INSERT INTO `paper` VALUES ('5', 'Java应用技术', '2019-03-16 00:06:00', '3600', '3', '请按照要求答题，考试过程强制退出浏览器成绩记0分', '2', '4', '6', '1', '4', '1', '1');
INSERT INTO `paper` VALUES ('6', 'C++语言程序设计', '2019-03-25 22:38:07', '5400', '3', '请仔细阅卷，考试过程强制退出浏览器成绩记0分', '1', '3', '5', '2', '3', '2', '0');
INSERT INTO `paper` VALUES ('7', 'Android程序设计', '2019-03-25 22:40:58', '4200', '1', '请仔细作答，考试过程强制退出浏览器成绩记0分', '2', '4', '6', '2', '2', '3', '0');
INSERT INTO `paper` VALUES ('8', '测试随机组卷', '2019-04-13 19:40:50', '7200', '4', '测试随机组卷', '1', '6', '4', '4', '5', '1', '0');
INSERT INTO `paper` VALUES ('9', '111', '2019-04-13 21:19:44', '1200', '4', '111', '1', '1', '1', '1', '1', '1', '0');
INSERT INTO `paper` VALUES ('10', '测试固定组卷', '2019-04-14 02:25:46', '5400', '3', 'this is测试固定组卷喔', '2', '4', '4', '2', '5', '1', '0');
INSERT INTO `paper` VALUES ('11', '222', '2019-04-15 00:46:17', '1200', '2', '222', '2', '1', '1', '1', '1', '1', '9');

-- ----------------------------
-- Table structure for paper_que
-- ----------------------------
DROP TABLE IF EXISTS `paper_que`;
CREATE TABLE `paper_que` (
  `que_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '问题id',
  `que_type` int(11) DEFAULT NULL COMMENT '题类型',
  `single_id` int(11) DEFAULT NULL COMMENT '单选题id',
  `multiple_id` int(11) DEFAULT NULL COMMENT '多选题id',
  `judge_id` int(11) DEFAULT NULL COMMENT '判断题id',
  `fill_id` int(11) DEFAULT NULL COMMENT '填空题id',
  `paper_id` int(11) DEFAULT NULL COMMENT '试卷id',
  PRIMARY KEY (`que_id`),
  KEY `que_single_id` (`single_id`),
  KEY `que_multiple_id` (`multiple_id`),
  KEY `que_judge_id` (`judge_id`),
  KEY `que_fill_id` (`fill_id`),
  KEY `que_paper_id` (`paper_id`),
  CONSTRAINT `paper_que_ibfk_1` FOREIGN KEY (`fill_id`) REFERENCES `bank_fill_que` (`fill_id`),
  CONSTRAINT `paper_que_ibfk_2` FOREIGN KEY (`judge_id`) REFERENCES `bank_judge_que` (`judge_id`),
  CONSTRAINT `paper_que_ibfk_3` FOREIGN KEY (`multiple_id`) REFERENCES `bank_multiple_choice_que` (`multiple_id`),
  CONSTRAINT `paper_que_ibfk_4` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`paper_id`),
  CONSTRAINT `paper_que_ibfk_5` FOREIGN KEY (`single_id`) REFERENCES `bank_single_choice_que` (`single_id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper_que
-- ----------------------------
INSERT INTO `paper_que` VALUES ('1', '1', '1', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('2', '1', '2', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('3', '1', '3', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('4', '1', '4', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('5', '1', '5', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('6', '1', '6', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('7', '1', '7', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('8', '1', '8', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('9', '1', '9', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('10', '1', '10', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('11', '1', '11', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('12', '1', '12', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('13', '1', '13', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('14', '1', '14', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('15', '1', '15', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('16', '1', '16', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('17', '1', '17', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('18', '1', '18', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('19', '1', '19', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('20', '1', '20', null, null, null, '1');
INSERT INTO `paper_que` VALUES ('21', '2', null, '1', null, null, '1');
INSERT INTO `paper_que` VALUES ('22', '2', null, '2', null, null, '1');
INSERT INTO `paper_que` VALUES ('23', '2', null, '3', null, null, '1');
INSERT INTO `paper_que` VALUES ('24', '2', null, '4', null, null, '1');
INSERT INTO `paper_que` VALUES ('25', '2', null, '5', null, null, '1');
INSERT INTO `paper_que` VALUES ('26', '3', null, null, '1', null, '1');
INSERT INTO `paper_que` VALUES ('27', '3', null, null, '2', null, '1');
INSERT INTO `paper_que` VALUES ('28', '3', null, null, '3', null, '1');
INSERT INTO `paper_que` VALUES ('29', '3', null, null, '4', null, '1');
INSERT INTO `paper_que` VALUES ('30', '3', null, null, '5', null, '1');
INSERT INTO `paper_que` VALUES ('31', '4', null, null, null, '1', '1');
INSERT INTO `paper_que` VALUES ('32', '4', null, null, null, '2', '1');
INSERT INTO `paper_que` VALUES ('33', '4', null, null, null, '3', '1');
INSERT INTO `paper_que` VALUES ('34', '4', null, null, null, '4', '1');
INSERT INTO `paper_que` VALUES ('35', '4', null, null, null, '5', '1');
INSERT INTO `paper_que` VALUES ('36', '1', '21', null, null, null, '2');
INSERT INTO `paper_que` VALUES ('37', '1', '22', null, null, null, '2');
INSERT INTO `paper_que` VALUES ('38', '1', '23', null, null, null, '2');
INSERT INTO `paper_que` VALUES ('39', '1', '24', null, null, null, '2');
INSERT INTO `paper_que` VALUES ('40', '1', '25', null, null, null, '2');
INSERT INTO `paper_que` VALUES ('41', '1', '26', null, null, null, '2');
INSERT INTO `paper_que` VALUES ('42', '2', null, '6', null, null, '2');
INSERT INTO `paper_que` VALUES ('43', '2', null, '7', null, null, '2');
INSERT INTO `paper_que` VALUES ('44', '2', null, '8', null, null, '2');
INSERT INTO `paper_que` VALUES ('45', '3', null, null, '6', null, '2');
INSERT INTO `paper_que` VALUES ('46', '3', null, null, '7', null, '2');
INSERT INTO `paper_que` VALUES ('47', '4', null, null, null, '6', '2');
INSERT INTO `paper_que` VALUES ('48', '4', null, null, null, '7', '2');
INSERT INTO `paper_que` VALUES ('49', '1', '9', null, null, null, '3');
INSERT INTO `paper_que` VALUES ('50', '1', '17', null, null, null, '3');
INSERT INTO `paper_que` VALUES ('51', '1', '18', null, null, null, '3');
INSERT INTO `paper_que` VALUES ('52', '1', '19', null, null, null, '3');
INSERT INTO `paper_que` VALUES ('53', '2', null, '8', null, null, '3');
INSERT INTO `paper_que` VALUES ('54', '2', null, '9', null, null, '3');
INSERT INTO `paper_que` VALUES ('55', '3', null, null, '13', null, '3');
INSERT INTO `paper_que` VALUES ('56', '3', null, null, '14', null, '3');
INSERT INTO `paper_que` VALUES ('57', '4', null, null, null, '17', '3');
INSERT INTO `paper_que` VALUES ('58', '4', null, null, null, '18', '3');
INSERT INTO `paper_que` VALUES ('59', '1', '20', null, null, null, '4');
INSERT INTO `paper_que` VALUES ('60', '1', '21', null, null, null, '4');
INSERT INTO `paper_que` VALUES ('61', '2', null, '9', null, null, '4');
INSERT INTO `paper_que` VALUES ('62', '2', null, '10', null, null, '4');
INSERT INTO `paper_que` VALUES ('63', '3', null, null, '15', null, '4');
INSERT INTO `paper_que` VALUES ('64', '4', null, null, null, '19', '4');
INSERT INTO `paper_que` VALUES ('65', '1', '22', null, null, null, '5');
INSERT INTO `paper_que` VALUES ('66', '2', null, '5', null, null, '5');
INSERT INTO `paper_que` VALUES ('67', '3', null, null, '16', null, '5');
INSERT INTO `paper_que` VALUES ('68', '4', null, null, null, '20', '5');
INSERT INTO `paper_que` VALUES ('81', '1', '30', null, null, null, '8');
INSERT INTO `paper_que` VALUES ('82', '1', '18', null, null, null, '8');
INSERT INTO `paper_que` VALUES ('83', '1', '17', null, null, null, '8');
INSERT INTO `paper_que` VALUES ('84', '1', '2', null, null, null, '8');
INSERT INTO `paper_que` VALUES ('85', '1', '11', null, null, null, '8');
INSERT INTO `paper_que` VALUES ('86', '1', '27', null, null, null, '8');
INSERT INTO `paper_que` VALUES ('87', '1', '26', null, null, null, '8');
INSERT INTO `paper_que` VALUES ('88', '1', '19', null, null, null, '8');
INSERT INTO `paper_que` VALUES ('89', '1', '25', null, null, null, '8');
INSERT INTO `paper_que` VALUES ('90', '1', '14', null, null, null, '8');
INSERT INTO `paper_que` VALUES ('91', '2', null, '10', null, null, '8');
INSERT INTO `paper_que` VALUES ('92', '2', null, '1', null, null, '8');
INSERT INTO `paper_que` VALUES ('93', '2', null, '7', null, null, '8');
INSERT INTO `paper_que` VALUES ('94', '2', null, '6', null, null, '8');
INSERT INTO `paper_que` VALUES ('95', '2', null, '3', null, null, '8');
INSERT INTO `paper_que` VALUES ('96', '3', null, null, '1', null, '8');
INSERT INTO `paper_que` VALUES ('97', '3', null, null, '7', null, '8');
INSERT INTO `paper_que` VALUES ('98', '3', null, null, '22', null, '8');
INSERT INTO `paper_que` VALUES ('99', '3', null, null, '9', null, '8');
INSERT INTO `paper_que` VALUES ('100', '3', null, null, '13', null, '8');
INSERT INTO `paper_que` VALUES ('101', '4', null, null, null, '5', '8');
INSERT INTO `paper_que` VALUES ('102', '4', null, null, null, '14', '8');
INSERT INTO `paper_que` VALUES ('103', '4', null, null, null, '21', '8');
INSERT INTO `paper_que` VALUES ('104', '4', null, null, null, '19', '8');
INSERT INTO `paper_que` VALUES ('105', '4', null, null, null, '24', '8');
INSERT INTO `paper_que` VALUES ('106', '1', '24', null, null, null, '9');
INSERT INTO `paper_que` VALUES ('107', '2', null, '2', null, null, '9');
INSERT INTO `paper_que` VALUES ('108', '3', null, null, '6', null, '9');
INSERT INTO `paper_que` VALUES ('109', '4', null, null, null, '16', '9');
INSERT INTO `paper_que` VALUES ('110', '1', '20', null, null, null, '10');
INSERT INTO `paper_que` VALUES ('111', '1', '21', null, null, null, '10');
INSERT INTO `paper_que` VALUES ('112', '1', '22', null, null, null, '10');
INSERT INTO `paper_que` VALUES ('113', '1', '23', null, null, null, '10');
INSERT INTO `paper_que` VALUES ('114', '1', '24', null, null, null, '10');
INSERT INTO `paper_que` VALUES ('115', '1', '25', null, null, null, '10');
INSERT INTO `paper_que` VALUES ('116', '1', '26', null, null, null, '10');
INSERT INTO `paper_que` VALUES ('117', '1', '27', null, null, null, '10');
INSERT INTO `paper_que` VALUES ('118', '1', '28', null, null, null, '10');
INSERT INTO `paper_que` VALUES ('119', '1', '29', null, null, null, '10');
INSERT INTO `paper_que` VALUES ('120', '1', '30', null, null, null, '10');
INSERT INTO `paper_que` VALUES ('121', '2', null, '6', null, null, '10');
INSERT INTO `paper_que` VALUES ('122', '2', null, '7', null, null, '10');
INSERT INTO `paper_que` VALUES ('123', '2', null, '8', null, null, '10');
INSERT INTO `paper_que` VALUES ('124', '2', null, '9', null, null, '10');
INSERT INTO `paper_que` VALUES ('125', '2', null, '10', null, null, '10');
INSERT INTO `paper_que` VALUES ('126', '3', null, null, '17', null, '10');
INSERT INTO `paper_que` VALUES ('127', '3', null, null, '18', null, '10');
INSERT INTO `paper_que` VALUES ('128', '3', null, null, '19', null, '10');
INSERT INTO `paper_que` VALUES ('129', '3', null, null, '20', null, '10');
INSERT INTO `paper_que` VALUES ('130', '3', null, null, '21', null, '10');
INSERT INTO `paper_que` VALUES ('131', '4', null, null, null, '26', '10');
INSERT INTO `paper_que` VALUES ('132', '4', null, null, null, '27', '10');
INSERT INTO `paper_que` VALUES ('133', '4', null, null, null, '28', '10');
INSERT INTO `paper_que` VALUES ('134', '4', null, null, null, '29', '10');
INSERT INTO `paper_que` VALUES ('135', '4', null, null, null, '30', '10');
INSERT INTO `paper_que` VALUES ('136', '1', '1', null, null, null, '11');
INSERT INTO `paper_que` VALUES ('137', '2', null, '1', null, null, '11');
INSERT INTO `paper_que` VALUES ('138', '3', null, null, '8', null, '11');
INSERT INTO `paper_que` VALUES ('139', '4', null, null, null, '8', '11');

-- ----------------------------
-- Table structure for programing_language
-- ----------------------------
DROP TABLE IF EXISTS `programing_language`;
CREATE TABLE `programing_language` (
  `lang_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编程语言id',
  `lang_name` varchar(255) DEFAULT NULL COMMENT '编程语言名称',
  `lang_desc` varchar(255) DEFAULT NULL COMMENT '编程语言描述',
  `lang_img_src` varchar(255) DEFAULT NULL COMMENT '编程语言图标',
  `lang_create_time` datetime DEFAULT NULL COMMENT '编程语言创建时间',
  `lang_created_by` varchar(255) DEFAULT NULL COMMENT '编程语言被创建者',
  `lang_change_time` datetime DEFAULT NULL COMMENT '编程语言最近修改时间',
  `lang_last_changer` varchar(255) DEFAULT NULL COMMENT '编程语言最近被修改者',
  `is_recommend` varchar(255) DEFAULT '0' COMMENT '是否在学生首页显示推荐，默认为0不推荐，1为推荐',
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programing_language
-- ----------------------------
INSERT INTO `programing_language` VALUES ('1', 'Java', 'Java工程师能力评估', 'http://qiniu.maweitao.top/programImages/6f582277-9665-4acc-b52d-9adbf9839110', '2019-03-13 03:53:24', '小张', '2019-04-20 20:18:07', '小张', '1');
INSERT INTO `programing_language` VALUES ('2', 'C++', 'C++工程师能力评估', 'http://qiniu.maweitao.top/programImages/08733a00-dcd8-4d18-9619-4fff03034399', '2019-03-13 03:54:24', '小张', '2019-04-20 20:18:16', '小张', '0');
INSERT INTO `programing_language` VALUES ('3', 'Android', 'Android工程师能力评估', 'http://qiniu.maweitao.top/programImages/91675aeb-111d-4694-a5c4-5a44cc4aadbd', '2019-03-13 03:55:09', '小张', '2019-04-20 20:18:24', '小张', '1');
INSERT INTO `programing_language` VALUES ('4', 'IOS', 'IOS工程师能力评估', 'http://qiniu.maweitao.top/programImages/14ac1435-3e81-4e00-b192-17cf65ca6940', '2019-03-13 03:55:43', '小张', '2019-04-20 20:18:30', '小张', '0');
INSERT INTO `programing_language` VALUES ('5', 'php', 'php工程师能力评估', 'http://qiniu.maweitao.top/programImages/5001af39-ef9f-463c-997f-2f8303a0f936', '2019-03-13 03:56:37', '小张', '2019-04-20 20:18:37', '小张', '1');
INSERT INTO `programing_language` VALUES ('6', 'Python', 'Python工程师能力评估', 'http://qiniu.maweitao.top/programImages/5f034ff5-0248-4068-9ee6-8a446b8e1c9d', '2019-03-13 03:58:59', '小张', '2019-04-20 20:18:45', '小张', '1');
INSERT INTO `programing_language` VALUES ('7', 'Ruby', 'Ruby工程师能力评估', 'http://qiniu.maweitao.top/programImages/53b34746-6de9-4496-a937-593bcb630c74', '2019-03-13 03:59:59', '小张', '2019-04-20 20:19:31', '小张', '0');
INSERT INTO `programing_language` VALUES ('8', 'Go', 'Go工程师能力评估', 'http://qiniu.maweitao.top/programImages/3a4cbb26-ee50-422c-a462-300e9c9c572e', '2019-03-13 04:00:36', '小张', '2019-04-20 20:19:03', '小张', '0');
INSERT INTO `programing_language` VALUES ('9', 'JavaScript', 'Web工程师能力评估', 'http://qiniu.maweitao.top/programImages/cc74a51c-74fb-4be9-a851-342e0705c5e5', '2019-03-13 04:03:40', '小张', '2019-04-20 20:19:16', '小张', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(2) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `mykey` varchar(64) NOT NULL COMMENT '角色key',
  `name` varchar(64) NOT NULL COMMENT '角色名称',
  `description` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `is_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用:\r\n1-启用\r\n0-禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ROLE_SYSTEM', '系统管理员', '系统开发者账户', '1');
INSERT INTO `role` VALUES ('2', 'ROLE_ADMIN', '超级管理员', '系统使用者超级管理员', '1');
INSERT INTO `role` VALUES ('3', 'ROLE_USER', '普通用户', '系统使用者普通用户', '1');

-- ----------------------------
-- Table structure for school_info
-- ----------------------------
DROP TABLE IF EXISTS `school_info`;
CREATE TABLE `school_info` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(50) NOT NULL COMMENT '学院名称',
  `school_no` varchar(100) DEFAULT NULL COMMENT '学院编码',
  `remark` varchar(4000) DEFAULT NULL,
  `state_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school_info
-- ----------------------------
INSERT INTO `school_info` VALUES ('1', '软件工程学院', '01', '', '2020-04-03 12:52:56', 'A');
INSERT INTO `school_info` VALUES ('2', '体育学院', '02', null, '2020-04-03 12:52:58', 'A');
INSERT INTO `school_info` VALUES ('3', '机电工程学院', '03', '', '2020-04-03 12:52:59', 'A');
INSERT INTO `school_info` VALUES ('4', '电子信息工程学院', '04', '', '2020-04-03 12:53:00', 'A');
INSERT INTO `school_info` VALUES ('5', '建筑工程学院', '05', null, '2020-04-03 12:53:01', 'A');
INSERT INTO `school_info` VALUES ('6', '材料工程学院', '06', null, '2020-04-03 12:53:01', 'A');
INSERT INTO `school_info` VALUES ('7', '智控学院', '07', null, '2020-04-03 12:53:02', 'A');
INSERT INTO `school_info` VALUES ('8', '商学院', '08', null, '2020-04-03 12:53:03', 'A');
INSERT INTO `school_info` VALUES ('9', '动物科学与技术学院', '09', null, '2020-04-03 12:53:05', 'A');
INSERT INTO `school_info` VALUES ('10', '人文学院', '10', null, '2020-04-03 12:53:06', 'A');
INSERT INTO `school_info` VALUES ('11', '园林园艺学院', '11', null, '2020-04-03 12:53:06', 'A');
INSERT INTO `school_info` VALUES ('12', '外国语学院', '12', null, '2020-04-03 12:53:07', 'A');
INSERT INTO `school_info` VALUES ('13', '艺术学院', '13', null, '2020-04-03 12:53:08', 'A');
INSERT INTO `school_info` VALUES ('14', '音乐学院', '14', '', '2020-04-03 12:53:12', 'A');
INSERT INTO `school_info` VALUES ('15', '医学院', '15', '', '2020-04-03 13:01:41', 'A');

-- ----------------------------
-- Table structure for school_teach_build_info
-- ----------------------------
DROP TABLE IF EXISTS `school_teach_build_info`;
CREATE TABLE `school_teach_build_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学院教学楼标识',
  `school_no` varchar(100) DEFAULT NULL COMMENT '学院标识',
  `teach_build_no` varchar(100) DEFAULT NULL COMMENT '教学楼标识',
  `remark` varchar(1000) DEFAULT NULL,
  `state` char(1) NOT NULL DEFAULT 'A',
  `state_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school_teach_build_info
-- ----------------------------
INSERT INTO `school_teach_build_info` VALUES ('1', '04', '05', null, 'A', '2020-04-03 21:33:42');
INSERT INTO `school_teach_build_info` VALUES ('2', '05', '03', '', 'A', '2020-04-03 21:33:42');
INSERT INTO `school_teach_build_info` VALUES ('3', '06', '03', '其他学院禁止进入', 'A', '2020-04-03 21:33:42');
INSERT INTO `school_teach_build_info` VALUES ('4', '07', '07', null, 'A', '2020-04-03 21:33:42');
INSERT INTO `school_teach_build_info` VALUES ('5', '08', '06', null, 'A', '2020-04-03 21:33:42');
INSERT INTO `school_teach_build_info` VALUES ('6', '15', '04', null, 'A', '2020-04-03 21:33:42');
INSERT INTO `school_teach_build_info` VALUES ('7', '02', '01', null, 'A', '2020-04-03 21:33:42');
INSERT INTO `school_teach_build_info` VALUES ('8', '03', '01', null, 'A', '2020-04-03 21:33:42');
INSERT INTO `school_teach_build_info` VALUES ('9', '09', '02', null, 'A', '2020-04-03 21:33:42');
INSERT INTO `school_teach_build_info` VALUES ('10', '10', '02', null, 'A', '2020-04-03 21:33:42');
INSERT INTO `school_teach_build_info` VALUES ('11', '13', '04', null, 'A', '2020-04-03 21:33:42');
INSERT INTO `school_teach_build_info` VALUES ('12', '11', '02', null, 'A', '2020-04-03 21:33:42');
INSERT INTO `school_teach_build_info` VALUES ('13', '01', '04', null, 'A', '2020-04-03 21:33:42');

-- ----------------------------
-- Table structure for score_info
-- ----------------------------
DROP TABLE IF EXISTS `score_info`;
CREATE TABLE `score_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '总成绩标识',
  `school_info_id` int(11) DEFAULT NULL COMMENT '学院标识',
  `class_info_id` int(11) DEFAULT NULL COMMENT '班级标识',
  `student_info_id` int(11) DEFAULT NULL COMMENT '学生标识',
  `assessment_info_id` int(11) DEFAULT NULL COMMENT '评估考核标识',
  `student_state` char(1) DEFAULT NULL COMMENT '学生状态',
  `remark` varchar(1000) DEFAULT NULL,
  `state` char(1) NOT NULL DEFAULT 'A',
  `state_data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score_info
-- ----------------------------
INSERT INTO `score_info` VALUES ('1', '1', '2', '11', '1', 'A', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `score_info` VALUES ('2', '1', '2', '12', '2', 'A', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `score_info` VALUES ('3', '1', '2', '13', '3', 'A', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `score_info` VALUES ('4', '1', '2', '14', '4', 'A', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `score_info` VALUES ('5', '1', '2', '15', '5', 'A', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `score_info` VALUES ('6', '1', '2', '16', '6', 'A', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `score_info` VALUES ('7', '1', '2', '17', '7', 'A', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `score_info` VALUES ('8', '1', '2', '18', '8', 'A', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `score_info` VALUES ('9', '1', '2', '19', '9', 'A', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');
INSERT INTO `score_info` VALUES ('10', '1', '2', '20', '10', 'A', '正常', 'A', '2020-04-01 02:17:40', '2020-04-01 02:17:40');

-- ----------------------------
-- Table structure for specialty
-- ----------------------------
DROP TABLE IF EXISTS `specialty`;
CREATE TABLE `specialty` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `school_info_id` int(2) NOT NULL COMMENT '学院标识',
  `subject_name` varchar(200) NOT NULL COMMENT '专业名称',
  `remark` varchar(4000) DEFAULT NULL COMMENT '备注',
  `state_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='专业';

-- ----------------------------
-- Records of specialty
-- ----------------------------
INSERT INTO `specialty` VALUES ('1', '1', '软件工程', null, '2019-08-08 18:13:32', 'A');
INSERT INTO `specialty` VALUES ('2', '1', '软件工程(嵌入式培养)', null, '2019-08-08 14:49:15', 'A');
INSERT INTO `specialty` VALUES ('3', '1', '软件工程(NIIT)', null, '2019-08-08 14:49:15', 'A');
INSERT INTO `specialty` VALUES ('4', '1', '软件工程(专转本)', null, '2019-08-08 15:27:57', 'A');
INSERT INTO `specialty` VALUES ('5', '12', '计算机工程', null, '2019-08-27 12:53:13', 'A');
INSERT INTO `specialty` VALUES ('6', '12', '计算机工程(嵌入式培养)', null, '2019-08-27 12:53:14', 'A');
INSERT INTO `specialty` VALUES ('7', '12', '计算机工程(NIIT)', null, '2019-08-27 12:53:15', 'A');
INSERT INTO `specialty` VALUES ('8', '12', '计算机工程(专转本)', null, '2019-08-27 12:53:17', 'A');

-- ----------------------------
-- Table structure for staff_info
-- ----------------------------
DROP TABLE IF EXISTS `staff_info`;
CREATE TABLE `staff_info` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(50) NOT NULL COMMENT '姓名',
  `staff_code` varchar(50) NOT NULL COMMENT '编码',
  `user_id` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '用户标识',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `sex` char(1) DEFAULT NULL COMMENT '性别:m-男；f-女',
  `school_no` varchar(50) DEFAULT NULL COMMENT '学院编码',
  `title` varchar(50) DEFAULT NULL COMMENT '职称',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` char(1) NOT NULL DEFAULT 'A' COMMENT '状态：\r\nA-在用;\r\nX-删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='教工信息表';

-- ----------------------------
-- Records of staff_info
-- ----------------------------
INSERT INTO `staff_info` VALUES ('1', '李小王', '011001', '1', '2000-06-01', 'm', '01', '教授', '2020-04-03 21:03:59', '2020-04-07 15:47:16', 'A');
INSERT INTO `staff_info` VALUES ('2', '谢天', '011002', '1', '2000-06-01', 'f', '01', '讲师', '2020-04-03 21:03:59', '2020-04-07 15:47:18', 'A');
INSERT INTO `staff_info` VALUES ('3', '张三丰', '011003', '1', '2000-06-01', 'f', '01', '副教授', '2020-04-03 21:03:59', '2020-04-07 15:47:20', 'A');
INSERT INTO `staff_info` VALUES ('4', '郭广辉', '011004', '1', '2000-06-01', 'f', '01', '副教授', '2020-04-03 21:04:00', '2020-04-07 15:47:23', 'A');
INSERT INTO `staff_info` VALUES ('5', '王益利', '011005', '1', '2000-06-01', 'm', '01', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('6', '刘思佳', '011007', '1', '2000-06-01', 'm', '01', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('7', '周玲', '021001', '1', '2000-06-01', 'm', '02', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('8', '黎佳果', '021002', '1', '2000-06-01', 'm', '02', '副教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('9', '刘致希', '021003', '1', '2000-06-01', 'f', '02', '教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('10', '杨逸庭', '021004', '1', '2000-06-01', 'f', '02', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('11', '唐影', '021005', '1', '2000-06-01', 'm', '02', '副教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('12', '陈茜', '021006', '1', '2000-06-01', 'f', '02', '教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('13', '李佳琳', '031001', '1', '2000-06-01', 'm', '03', '副教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('14', '李霞', '031002', '1', '2000-06-01', 'm', '03', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('15', '李璐', '031003', '1', '2000-06-01', 'f', '03', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('16', '王鸿鑫', '031004', '1', '2000-06-01', 'f', '03', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('17', '文琳', '031005', '1', '2000-06-01', 'f', '03', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('18', '王晶', '031007', '1', '2000-06-01', 'm', '03', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('19', '龙利星', '041001', '1', '2000-06-01', 'm', '04', '教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('20', '郭文峰', '041002', '1', '2000-06-01', 'm', '04', '副教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('21', '李烁宇', '041003', '1', '2000-06-01', 'm', '04', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('22', '邓玉坤', '041004', '1', '2000-06-01', 'f', '04', '教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('23', '丁赛', '041005', '1', '2000-06-01', 'f', '04', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('24', '王坤', '041006', '1', '2000-06-01', 'm', '04', '副教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('25', '李星', '041007', '1', '2000-06-01', 'f', '04', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('26', '罗湘文', '051001', '1', '2000-06-01', 'm', '05', '教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('27', '刘博', '051002', '1', '2000-06-01', 'm', '05', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('28', '刘湘', '051003', '1', '2000-06-01', 'f', '05', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('29', '付琦', '051004', '1', '2000-06-01', 'f', '05', '教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('30', '李梦', '051005', '1', '2000-06-01', 'f', '05', '教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('31', '阳向鸿', '051006', '1', '2000-06-01', 'm', '05', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('32', '阳辉', '051007', '1', '2000-06-01', 'm', '05', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('33', '严刑', '051008', '1', '2000-06-01', 'm', '05', '教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('34', '刘辉', '051009', '1', '2000-06-01', 'm', '05', '副教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('35', '刘呀', '061001', '1', '2000-06-01', 'f', '06', '教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('36', '王二', '061002', '1', '2000-06-01', 'f', '06', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('37', '陈睿', '061003', '1', '2000-06-01', 'm', '06', '副教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('38', '陈天骄', '061004', '1', '2000-06-01', 'f', '06', '教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('39', '康阳', '061005', '1', '2000-06-01', 'm', '06', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('40', '邓香玲', '061006', '1', '2000-06-01', 'm', '06', '副教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('41', '宫禧', '071001', '1', '2000-06-01', 'f', '07', '教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('42', '阳茜', '071002', '1', '2000-06-01', 'f', '07', '副教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('43', '欧阳锋', '071003', '1', '2000-06-01', 'f', '07', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('44', '程心', '071004', '1', '2000-06-01', 'm', '07', '副教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('45', '程心', '071004', '1', '2000-06-01', 'm', '07', '副教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('46', '刘旭', '071005', '1', '2000-06-01', 'm', '07', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('47', '伊脉', '081001', '1', '2000-06-01', 'm', '08', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('48', '游海霞', '081002', '1', '2000-06-01', 'f', '08', '副教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('49', '章子秋', '081003', '1', '2000-06-01', 'f', '08', '副教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('50', '唐慧玲', '081004', '1', '2000-06-01', 'm', '08', '教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('51', '陈澄珏', '081005', '1', '2000-06-01', 'f', '08', '教授', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('52', '廖维涵', '081006', '1', '2000-06-01', 'm', '08', '讲师', '2020-04-03 21:04:00', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('53', '何耀文', '091001', '1', '2000-06-01', 'm', '09', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('54', '李月庭', '091002', '1', '2000-06-01', 'f', '09', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('55', '陈云婷', '091003', '1', '2000-06-01', 'f', '09', '教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('56', '颜亚兰', '091004', '1', '2000-06-01', 'f', '09', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('57', '陈浩文', '091005', '1', '2000-06-01', 'm', '09', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('58', '陈敏怡', '101001', '1', '2000-06-01', 'm', '10', '教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('59', '梁静仪', '101002', '1', '2000-06-01', 'm', '10', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('60', '徐雁鸿', '101003', '1', '2000-06-01', 'm', '10', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('61', '向飞鹏', '101004', '1', '2000-06-01', 'f', '10', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('62', '谷凯丽', '101005', '1', '2000-06-01', 'f', '10', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('63', '郭潘志', '101006', '1', '2000-06-01', 'm', '10', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('64', '罗阳', '111001', '1', '2000-06-01', 'f', '11', '教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('65', '胡婷', '111002', '1', '2000-06-01', 'm', '11', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('66', '宁文琴', '111003', '1', '2000-06-01', 'm', '11', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('67', '李亚男', '111004', '1', '2000-06-01', 'f', '11', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('68', '罗天阳', '111005', '1', '2000-06-01', 'f', '11', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('69', '赵小娇', '111006', '1', '2000-06-01', 'f', '11', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('70', '邓雪乔', '121001', '1', '2000-06-01', 'm', '12', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('71', '赵雪', '121002', '1', '2000-06-01', 'm', '12', '教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('72', '王华', '121003', '1', '2000-06-01', 'm', '12', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('73', '陈雪刚', '121004', '1', '2000-06-01', 'm', '12', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('74', '王小明', '121005', '1', '2000-06-01', 'f', '12', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('75', '王也', '121006', '1', '2000-06-01', 'f', '12', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('76', '陈乔', '121007', '1', '2000-06-01', 'm', '12', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('77', '田明金', '131001', '1', '2000-06-01', 'f', '13', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('78', '赵卓', '131002', '1', '2000-06-01', 'm', '13', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('79', '何柱铭', '131003', '1', '2000-06-01', 'm', '13', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('80', '徐娉婷', '131004', '1', '2000-06-01', 'f', '13', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('81', '李亿豪', '131005', '1', '2000-06-01', 'f', '13', '教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('82', '肖禄', '131006', '1', '2000-06-01', 'f', '13', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('83', '王文康', '131007', '1', '2000-06-01', 'm', '13', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('84', '吴皖瑶', '141001', '1', '2000-06-01', 'm', '14', '教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('85', '邓香玲', '141002', '1', '2000-06-01', 'm', '14', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('86', '蔡娥', '141003', '1', '2000-06-01', 'm', '14', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('87', '谭艳', '141004', '1', '2000-06-01', 'f', '14', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('88', '王娟', '141005', '1', '2000-06-01', 'f', '14', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('89', '赵娟', '141006', '1', '2000-06-01', 'm', '14', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('90', '王凯', '141007', '1', '2000-06-01', 'f', '14', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('91', '杨江南', '151001', '1', '2000-06-01', 'm', '15', '教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('92', '朱登科', '151002', '1', '2000-06-01', 'm', '15', '教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('93', '刘开郎', '151003', '1', '2000-06-01', 'f', '15', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('94', '曾上海', '151004', '1', '2000-06-01', 'f', '15', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('95', '汤旭煌', '151005', '1', '2000-06-01', 'f', '15', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('96', '何友情', '151006', '1', '2000-06-01', 'm', '15', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('97', '陈陪陪', '151007', '1', '2000-06-01', 'm', '15', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('98', '王帅', '151008', '1', '2000-06-01', 'm', '15', '副教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('99', '将胜利', '151009', '1', '2000-06-01', 'm', '15', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('100', '严肃', '151010', '1', '2000-06-01', 'f', '15', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('101', '张华', '011008', '1', '2000-06-01', 'f', '01', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('102', '刘强', '011009', '1', '2000-06-01', 'm', '01', '教授', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('103', '张忠周', '011010', '1', '2000-06-01', 'f', '01', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');
INSERT INTO `staff_info` VALUES ('104', '陈文福', '011011', '1', '2000-06-01', 'm', '01', '讲师', '2020-04-03 21:04:01', '2020-04-07 15:48:16', 'A');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sno` char(12) NOT NULL COMMENT '主键，学生学号',
  `stu_psw` varchar(255) NOT NULL DEFAULT '123456' COMMENT '登录密码，默认为123456',
  `stu_name` varchar(255) NOT NULL COMMENT '学生姓名',
  `stu_img_src` varchar(255) DEFAULT NULL COMMENT '头像链接',
  `stu_sex` varchar(255) NOT NULL DEFAULT '男' COMMENT '学生性别',
  `stu_email` varchar(255) DEFAULT NULL COMMENT '学生邮箱',
  `stu_phone` char(11) DEFAULT NULL COMMENT '学生手机号码',
  `stu_create_time` datetime NOT NULL COMMENT '学生注册时间',
  `stu_last_login_time` datetime DEFAULT NULL COMMENT '学生最近登录时间',
  `stu_status` char(1) NOT NULL DEFAULT '1' COMMENT '学生登录状态',
  `stu_security_code` varchar(255) NOT NULL DEFAULT '123456' COMMENT '安全码用于密码找回',
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('201511314001', '123456', '小四', null, '男', '1234@qq.com', '13458956478', '2019-04-28 01:20:39', '2020-05-03 16:56:02', '1', '123456');
INSERT INTO `student` VALUES ('201511314002', '123456', '小五', null, '男', '1234@qq.com', '13458956478', '2019-04-28 01:21:10', '2020-05-03 17:18:25', '1', '123456');
INSERT INTO `student` VALUES ('201511314003', '123456', '小刘', null, '男', '12345@qq.com', '13565895641', '2019-04-28 01:21:45', '2020-05-05 13:16:35', '1', '123456');
INSERT INTO `student` VALUES ('201511314301', '123456', '小三', 'http://qiniu.maweitao.top/profiles/c721b496-fb54-4fc0-96a8-4a5095584bfd', '男', '123456789@qq.com', '13526459823', '2019-04-28 00:46:29', '2019-04-28 00:47:27', '1', '123456');
INSERT INTO `student` VALUES ('201511314321', '123456', '小马', 'http://qiniu.maweitao.top/profiles/e52b0c14-afe5-46dd-8433-01aa5a667753', '男', '1234567@qq.com', '13658952365', '2019-04-28 00:57:25', '2019-04-28 00:57:28', '1', '123456');
INSERT INTO `student` VALUES ('201521314301', '123456', '谢永宁', 'http://qiniu.maweitao.top/profiles/e67db9be-0faa-4118-abe5-d618f2561108', '男', '123456@qq.com', '13254896548', '2019-03-10 20:15:37', '2019-04-28 01:44:43', '1', '123456');
INSERT INTO `student` VALUES ('201521314302', '123456', '李四', 'http://qiniu.maweitao.top/profiles/bca36eb8-118a-4f16-9e51-e2f8bfa16e5c', '男', '123456@qq.com', '13625498549', '2019-03-11 18:37:18', '2019-04-15 20:16:00', '0', '123456');
INSERT INTO `student` VALUES ('201521314303', '123456', '马瑞欣', 'http://qiniu.maweitao.top/profiles/00b54bf8-dbfe-4952-80b7-045e42e8b11d', '女', '123456@qq.com', '13625894562', '2019-03-31 21:19:19', '2019-04-15 20:17:15', '1', '123456');
INSERT INTO `student` VALUES ('201521314304', '123456', '阿水', 'http://qiniu.maweitao.top/profiles/fd5fb96d-bd08-499f-9092-75699fba9adf', '男', '123456@qq.com', '13652485962', '2019-03-31 22:48:05', '2019-04-15 20:17:35', '0', '123456');
INSERT INTO `student` VALUES ('201521314305', '123456', '马导', 'http://qiniu.maweitao.top/profiles/30db92f7-6fef-401d-b756-765a21e31a2b', '女', '123456@qq.com', '13452685942', '2019-03-31 22:59:39', '2019-04-15 20:18:05', '1', '123456');
INSERT INTO `student` VALUES ('201521314310', '123456', '叶国冲', 'http://qiniu.maweitao.top/profiles/eadb0262-e703-4d66-a3ce-27ce5874a12b', '男', '1234567@qq.com', '13754695862', '2019-03-11 01:10:22', '2019-04-15 20:18:14', '1', '123456');
INSERT INTO `student` VALUES ('201521314316', '123456', '汤梓豪', 'http://qiniu.maweitao.top/profiles/1f987c0f-9af5-46c8-bc8f-1129abb13b22', '男', '123456@qq.com', '13225849856', '2019-03-03 18:59:47', '2019-04-15 20:18:29', '1', '123456');
INSERT INTO `student` VALUES ('201521314318', '123456', '张家豪', 'http://qiniu.maweitao.top/profiles/318dc134-5261-4bac-bde6-e7ea67c7dc53', '男', '123456@qq.com', '13632289756', '2019-03-10 20:10:30', '2019-04-15 20:19:25', '1', '123456');
INSERT INTO `student` VALUES ('201521314319', '123456', '罗建宏', 'http://qiniu.maweitao.top/profiles/9ed8e71c-d67f-4e80-8054-3172e124f41e', '男', '123456@qq.com', '13545687959', '2019-03-10 20:12:14', '2019-04-15 20:20:19', '1', '123456');
INSERT INTO `student` VALUES ('201521314321', '123456', '马伟涛', 'http://qiniu.maweitao.top/profiles/59665a0e-4387-45c9-91c3-0b307c7f0951', '男', '815699563@qq.com', '13602890590', '2019-03-01 18:35:26', '2019-05-07 16:31:01', '1', '123456');
INSERT INTO `student` VALUES ('201521314322', '123456', '杨铎', 'http://qiniu.maweitao.top/profiles/26a86525-916e-429f-afc6-e34450c66316', '男', '123456@qq.com', '13225849856', '2019-03-03 18:25:42', '2019-04-15 20:20:33', '1', '123456');
INSERT INTO `student` VALUES ('201521314323', '123456', '陈国', 'http://qiniu.maweitao.top/profiles/b3d029f1-0237-4595-bdf4-12e8f00cf1d9', '男', '123456@136.com', '15524752689', '2019-03-03 17:20:56', '2019-04-15 20:20:48', '1', '123456');
INSERT INTO `student` VALUES ('201521314330', '123456', '魏伟康', 'http://qiniu.maweitao.top/profiles/560662e3-d83f-43d0-bbcc-d3b830ad5d68', '男', '12345678@qq.com', '18054687965', '2019-03-10 20:17:37', '2019-04-15 20:21:27', '1', '123456');
INSERT INTO `student` VALUES ('201521314332', '123456', '陈荣涛', 'http://qiniu.maweitao.top/profiles/5d1435fb-ca6f-4a20-91bc-f6e79535a45b', '男', '123456@qq.com', '13456987532', '2019-03-10 20:20:32', '2019-04-15 20:22:01', '1', '123456');
INSERT INTO `student` VALUES ('201521314501', '123456', '小明', 'http://qiniu.maweitao.top/profiles/6431fa5d-9307-49f4-93fe-835866d50cca', '男', '123456@qq.com', '13625248596', '2019-04-08 03:32:29', '2019-04-15 20:22:45', '1', '123456');
INSERT INTO `student` VALUES ('201521314502', '123456', '小红', 'http://qiniu.maweitao.top/profiles/20a95a11-7af6-4e9f-ae52-1e0c068ed361', '女', '123456@qq.com', '13456258956', '2019-04-08 03:33:00', '2019-04-15 20:22:59', '1', '123456');
INSERT INTO `student` VALUES ('201521314503', '123456', '小黄', 'http://qiniu.maweitao.top/profiles/1cbc7613-0646-4d37-99e7-dbd5a10890d9', '男', '123456@qq.com', '13456258958', '2019-04-08 03:33:20', '2019-04-15 20:23:15', '1', '123456');
INSERT INTO `student` VALUES ('201521314505', '123456', '小飞', 'http://qiniu.maweitao.top/profiles/c34d8251-a0d7-4f67-a4fd-57719e5548dd', '男', '123456@qq.com', '13895487596', '2019-04-08 03:33:50', '2019-04-15 20:23:38', '1', '123456');
INSERT INTO `student` VALUES ('201521314506', '123456', '小亮', 'http://qiniu.maweitao.top/profiles/a4de68f1-adae-4087-a670-a0b5bce14a05', '男', '123456@qq.com', '13895487599', '2019-04-08 03:34:21', '2019-04-15 20:24:03', '1', '123456');
INSERT INTO `student` VALUES ('201521314507', '123456', '红苹果', 'http://qiniu.maweitao.top/profiles/23026bbc-2e85-4c14-ad8d-8d70094bea56', '女', '123456@qq.com', '13895487545', '2019-04-08 03:34:35', '2019-04-15 20:24:19', '1', '123456');
INSERT INTO `student` VALUES ('201521314508', '123456', '小敏', 'http://qiniu.maweitao.top/profiles/d6511ad5-ece1-43aa-ad69-c385dbe51104', '女', '123456@qq.com', '13895487548', '2019-04-08 03:34:46', '2019-04-15 20:24:33', '1', '123456');
INSERT INTO `student` VALUES ('201521314610', '123456', '飘雪国', 'http://qiniu.maweitao.top/profiles/007f6b62-5af8-4067-924c-ac9c0fe4f24a', '男', '123456@qq.com', '13526489523', '2019-04-08 03:48:40', '2019-04-15 20:24:54', '1', '123456');
INSERT INTO `student` VALUES ('201521314700', '123456', '咸蛋超人', 'http://qiniu.maweitao.top/profiles/9159e950-c550-4594-b15d-e33018eb70b5', '男', '8954233@qq.com', '18952484562', '2019-04-08 15:42:49', '2019-04-15 20:25:09', '1', '123456');
INSERT INTO `student` VALUES ('201521314701', '123456', '泽泽', 'http://qiniu.maweitao.top/profiles/407594a5-b296-4a48-b60b-63985b574218', '男', '123456@qq.com', '13526458952', '2019-04-08 15:44:36', '2019-04-15 20:25:22', '1', '123456');
INSERT INTO `student` VALUES ('201521314900', '123456', '张阿三', null, '男', null, null, '2019-04-16 22:40:19', '2019-04-28 01:45:49', '1', '123456');
INSERT INTO `student` VALUES ('201521314901', '123456', '张小红', null, '女', null, null, '2019-04-16 22:40:19', null, '1', '123456');
INSERT INTO `student` VALUES ('201521314902', '123456', '李阿四', null, '男', null, null, '2019-04-16 22:40:19', null, '1', '123456');
INSERT INTO `student` VALUES ('201612011001', '123456', '冯光辉', null, '女', null, null, '2020-05-05 22:34:25', null, '1', '123456');
INSERT INTO `student` VALUES ('201612011002', '123456', '周清源', null, '女', null, null, '2020-05-05 22:34:25', null, '1', '123456');
INSERT INTO `student` VALUES ('201612011003', '123456', '胡杨', null, '女', null, null, '2020-05-05 22:34:25', null, '1', '123456');
INSERT INTO `student` VALUES ('201612011004', '123456', '吴航', null, '女', null, null, '2020-05-05 22:34:25', null, '1', '123456');
INSERT INTO `student` VALUES ('201612011005', '123456', '吴万东', null, '女', null, null, '2020-05-05 22:34:25', null, '1', '123456');
INSERT INTO `student` VALUES ('201612011189', '123456', '牛开专', null, '男', '2650135668@qq.com', '15651806205', '2020-05-03 22:02:12', '2020-05-17 19:19:36', '1', '123456');

-- ----------------------------
-- Table structure for student_feedback
-- ----------------------------
DROP TABLE IF EXISTS `student_feedback`;
CREATE TABLE `student_feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '反馈id',
  `feedback_content` varchar(255) NOT NULL COMMENT '反馈内容',
  `feedback_create_time` datetime NOT NULL COMMENT '反馈创建时间',
  `sno` char(12) NOT NULL COMMENT '学号',
  `stu_name` varchar(255) DEFAULT NULL COMMENT '学生姓名',
  `adm_answer` varchar(255) DEFAULT NULL COMMENT '管理员回复',
  `ano` char(6) DEFAULT NULL COMMENT '管理员号',
  `adm_name` varchar(255) DEFAULT NULL COMMENT '管理员姓名',
  `feedback_status` char(1) DEFAULT '0' COMMENT '留言状态0为管理员未读，1为管理员已读学生未读，2为学生已读',
  `reply_time` datetime DEFAULT NULL COMMENT '管理员回复时间',
  PRIMARY KEY (`feedback_id`),
  KEY `feedback_sno` (`sno`),
  KEY `feedback_ano` (`ano`),
  CONSTRAINT `student_feedback_ibfk_1` FOREIGN KEY (`ano`) REFERENCES `admin` (`ano`),
  CONSTRAINT `student_feedback_ibfk_2` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_feedback
-- ----------------------------
INSERT INTO `student_feedback` VALUES ('2', '666', '2019-03-12 00:30:13', '201521314321', '马伟涛', '谢谢您的夸奖！', '100001', '小李', '2', '2019-03-12 14:59:34');
INSERT INTO `student_feedback` VALUES ('3', '加油，继续努力', '2019-03-12 00:30:55', '201521314321', '马伟涛', '好的，收到。记得给五星好评喔', '123456', '小张', '2', '2019-03-12 17:15:53');
INSERT INTO `student_feedback` VALUES ('4', '在线考试系统', '2019-03-12 00:45:16', '201521314321', '马伟涛', '嗯嗯，感谢您的使用', '100001', '小李', '2', '2019-03-13 18:25:11');
INSERT INTO `student_feedback` VALUES ('5', '111', '2019-03-12 00:50:50', '201521314321', '马伟涛', '222', '100000', '小王', '2', '2019-03-13 18:25:31');
INSERT INTO `student_feedback` VALUES ('6', '牛逼', '2019-03-12 00:52:47', '201521314322', '杨铎', '拓荒者牛逼', '100000', '小王', '1', '2019-03-13 19:00:06');
INSERT INTO `student_feedback` VALUES ('7', '小母牛开摩托车咯', '2019-03-12 00:53:07', '201521314322', '杨铎', '牛逼轰轰喔！', '100001', '小李', '1', '2019-03-13 19:00:08');
INSERT INTO `student_feedback` VALUES ('8', '我是谢永宁哈哈哈', '2019-03-13 19:08:47', '201521314301', '谢永宁', '我叼你啊，你再逼', '100000', '小王', '2', '2019-04-02 18:26:26');
INSERT INTO `student_feedback` VALUES ('10', '你好啊，哈哈哈', '2019-03-22 03:52:22', '201521314321', '马伟涛', '呵呵哒', '100000', '小王', '2', '2019-04-02 18:26:22');
INSERT INTO `student_feedback` VALUES ('19', '666', '2019-04-02 18:41:35', '201521314321', '马伟涛', '鸡你太美', '123456', '小张', '2', '2019-04-21 00:29:46');
INSERT INTO `student_feedback` VALUES ('21', '555', '2019-04-02 19:13:15', '201521314321', '马伟涛', '呜呜呜', '123456', '小张', '2', '2019-04-21 00:34:34');
INSERT INTO `student_feedback` VALUES ('23', '222', '2019-04-21 19:32:49', '201521314321', '马伟涛', '222', '100000', '小王', '2', '2019-04-21 23:50:43');
INSERT INTO `student_feedback` VALUES ('24', '111', '2019-04-21 19:33:12', '201521314321', '马伟涛', '111', '100000', '小王', '2', '2019-04-21 23:51:29');
INSERT INTO `student_feedback` VALUES ('36', '11', '2019-04-21 23:38:57', '201521314321', '马伟涛', '11', '100000', '小王', '2', '2019-04-22 00:11:25');
INSERT INTO `student_feedback` VALUES ('37', '111', '2019-04-21 23:40:54', '201521314321', '马伟涛', '111', '100000', '小王', '2', '2019-04-22 00:04:11');
INSERT INTO `student_feedback` VALUES ('38', '888', '2019-04-21 23:42:08', '201521314321', '马伟涛', '888', '100000', '小王', '2', '2019-04-22 00:02:07');
INSERT INTO `student_feedback` VALUES ('39', '大碗面', '2019-04-21 23:49:58', '201521314321', '马伟涛', '面大碗', '100000', '小王', '2', '2019-04-21 23:50:18');
INSERT INTO `student_feedback` VALUES ('40', '5555', '2019-04-21 23:52:31', '201521314321', '马伟涛', '5555', '100000', '小王', '2', '2019-04-21 23:52:49');
INSERT INTO `student_feedback` VALUES ('41', '11', '2019-04-21 23:53:36', '201521314321', '马伟涛', '22', '100000', '小王', '2', '2019-04-21 23:55:22');
INSERT INTO `student_feedback` VALUES ('42', '9999', '2019-04-22 00:04:36', '201521314321', '马伟涛', '9999', '100000', '小王', '2', '2019-04-22 00:04:44');
INSERT INTO `student_feedback` VALUES ('43', '测试一下', '2019-04-22 00:12:47', '201521314321', '马伟涛', '好的', '100000', '小王', '2', '2019-04-22 00:13:05');
INSERT INTO `student_feedback` VALUES ('44', '测试', '2019-04-22 00:14:10', '201521314321', '马伟涛', '测试', '100000', '小王', '2', '2019-04-22 00:14:16');
INSERT INTO `student_feedback` VALUES ('45', 'qqq', '2019-04-22 00:14:59', '201521314321', '马伟涛', 'qqq', '100000', '小王', '2', '2019-04-22 00:15:07');
INSERT INTO `student_feedback` VALUES ('46', '我们', '2019-04-22 00:15:39', '201521314321', '马伟涛', '我们', '100000', '小王', '2', '2019-04-22 00:15:44');
INSERT INTO `student_feedback` VALUES ('47', '8585', '2019-04-22 00:16:01', '201521314321', '马伟涛', '85585', '100000', '小王', '2', '2019-04-22 00:20:17');
INSERT INTO `student_feedback` VALUES ('48', '8888', '2019-04-22 00:16:04', '201521314321', '马伟涛', '8888', '100000', '小王', '2', '2019-04-22 00:16:15');
INSERT INTO `student_feedback` VALUES ('49', '7777', '2019-04-22 00:18:03', '201521314321', '马伟涛', '7777', '100000', '小王', '2', '2019-04-22 00:18:27');
INSERT INTO `student_feedback` VALUES ('50', '1111', '2019-04-22 00:19:53', '201521314321', '马伟涛', '1111', '100000', '小王', '2', '2019-04-22 00:20:02');
INSERT INTO `student_feedback` VALUES ('51', '我们', '2019-04-22 00:20:29', '201521314321', '马伟涛', '我们', '100000', '小王', '2', '2019-04-22 00:20:42');
INSERT INTO `student_feedback` VALUES ('52', '555', '2019-04-22 01:11:39', '201521314321', '马伟涛', '555', '100000', '小王', '2', '2019-04-22 01:41:39');
INSERT INTO `student_feedback` VALUES ('53', '测试额', '2019-04-22 01:40:40', '201521314321', '马伟涛', '测试额', '100000', '小王', '2', '2019-04-22 01:46:30');
INSERT INTO `student_feedback` VALUES ('54', '再来', '2019-04-22 01:41:05', '201521314321', '马伟涛', '再来', '100000', '小王', '2', '2019-04-22 01:51:07');
INSERT INTO `student_feedback` VALUES ('55', '来', '2019-04-22 01:53:58', '201521314321', '马伟涛', '来', '123456', '小张', '2', '2019-04-22 01:55:05');
INSERT INTO `student_feedback` VALUES ('56', '拉来', '2019-04-22 01:54:44', '201521314321', '马伟涛', '拉来', '100000', '小王', '2', '2019-04-22 02:00:01');
INSERT INTO `student_feedback` VALUES ('57', '来来来', '2019-04-22 01:55:52', '201521314321', '马伟涛', '来来来', '100000', '小王', '2', '2019-04-22 02:11:32');
INSERT INTO `student_feedback` VALUES ('58', '啦啦啦', '2019-04-22 01:58:44', '201521314321', '马伟涛', '啦啦啦', '100000', '小王', '2', '2019-04-22 02:12:22');
INSERT INTO `student_feedback` VALUES ('59', '哔哩哔哩', '2019-04-22 01:59:09', '201521314321', '马伟涛', '哔哩哔哩', '123456', '小张', '2', '2019-04-22 02:12:43');
INSERT INTO `student_feedback` VALUES ('60', '大碗宽面', '2019-04-22 01:59:42', '201521314321', '马伟涛', '大碗宽面', '123456', '小张', '2', '2019-04-25 16:05:36');
INSERT INTO `student_feedback` VALUES ('61', '渣渣辉', '2019-04-22 02:13:08', '201521314321', '马伟涛', '渣渣辉', '123456', '小张', '2', '2019-04-25 16:06:16');
INSERT INTO `student_feedback` VALUES ('62', '111', '2019-04-22 02:45:51', '201521314321', '马伟涛', '111', '123456', '小张', '2', '2019-04-22 02:46:51');
INSERT INTO `student_feedback` VALUES ('63', '222', '2019-04-22 02:47:00', '201521314321', '马伟涛', '222', '123456', '小张', '2', '2019-04-22 16:18:14');
INSERT INTO `student_feedback` VALUES ('64', '222', '2019-04-22 16:17:31', '201521314321', '马伟涛', '222', '123456', '小张', '2', '2019-04-22 16:17:46');
INSERT INTO `student_feedback` VALUES ('65', '996', '2019-04-22 16:21:22', '201521314321', '马伟涛', '996', '123456', '小张', '2', '2019-04-25 16:05:11');
INSERT INTO `student_feedback` VALUES ('66', '979', '2019-04-22 16:21:57', '201521314321', '马伟涛', '979', '123456', '小张', '2', '2019-04-22 17:17:36');
INSERT INTO `student_feedback` VALUES ('67', '878', '2019-04-22 16:22:56', '201521314321', '马伟涛', '878', '123456', '小张', '2', '2019-04-22 16:23:55');
INSERT INTO `student_feedback` VALUES ('68', '669', '2019-04-22 17:17:56', '201521314321', '马伟涛', '669', '123456', '小张', '2', '2019-04-23 23:38:34');
INSERT INTO `student_feedback` VALUES ('69', '打包咯', '2019-04-22 19:41:04', '201521314321', '马伟涛', '好的喔', '123456', '小张', '2', '2019-04-22 19:41:16');
INSERT INTO `student_feedback` VALUES ('70', '123', '2019-04-25 16:03:36', '201521314321', '马伟涛', '123', '123456', '小张', '2', '2019-04-25 16:04:05');
INSERT INTO `student_feedback` VALUES ('71', '11', '2019-04-25 16:08:18', '201521314321', '马伟涛', '11', '123456', '小张', '2', '2019-04-25 16:11:38');
INSERT INTO `student_feedback` VALUES ('72', '222', '2019-04-25 16:12:21', '201521314321', '马伟涛', '222', '123456', '小张', '2', '2019-04-25 16:14:48');
INSERT INTO `student_feedback` VALUES ('73', '33', '2019-04-25 16:15:06', '201521314321', '马伟涛', '33', '123456', '小张', '2', '2019-04-25 16:15:20');
INSERT INTO `student_feedback` VALUES ('74', '44', '2019-04-25 16:15:31', '201521314321', '马伟涛', '44', '123456', '小张', '2', '2019-04-25 16:17:22');
INSERT INTO `student_feedback` VALUES ('75', '55', '2019-04-25 16:31:05', '201521314321', '马伟涛', '55', '123456', '小张', '2', '2019-04-25 16:31:43');
INSERT INTO `student_feedback` VALUES ('76', '66', '2019-04-25 16:31:20', '201521314321', '马伟涛', '66', '123456', '小张', '2', '2019-04-25 16:31:53');
INSERT INTO `student_feedback` VALUES ('77', '77', '2019-04-25 16:31:29', '201521314321', '马伟涛', '77', '123456', '小张', '2', '2019-04-25 16:36:52');
INSERT INTO `student_feedback` VALUES ('78', '88', '2019-04-25 16:39:59', '201521314321', '马伟涛', '88', '123456', '小张', '2', '2019-04-25 16:40:09');
INSERT INTO `student_feedback` VALUES ('79', '99', '2019-04-25 16:46:32', '201521314321', '马伟涛', '99', '123456', '小张', '2', '2019-04-25 16:46:37');
INSERT INTO `student_feedback` VALUES ('80', '10', '2019-04-25 16:46:49', '201521314321', '马伟涛', '10', '123456', '小张', '2', '2019-04-25 16:46:57');
INSERT INTO `student_feedback` VALUES ('81', '12', '2019-04-25 16:49:56', '201521314321', '马伟涛', '12', '123456', '小张', '2', '2019-04-25 16:50:39');
INSERT INTO `student_feedback` VALUES ('82', '13', '2019-04-25 16:50:02', '201521314321', '马伟涛', '13', '123456', '小张', '2', '2019-04-25 16:52:34');
INSERT INTO `student_feedback` VALUES ('83', '14', '2019-04-25 16:50:05', '201521314321', '马伟涛', '14', '123456', '小张', '2', '2019-04-25 16:53:08');
INSERT INTO `student_feedback` VALUES ('84', '15', '2019-04-25 16:54:20', '201521314321', '马伟涛', '15', '123456', '小张', '2', '2019-04-25 16:54:26');
INSERT INTO `student_feedback` VALUES ('85', '16', '2019-04-25 16:54:31', '201521314321', '马伟涛', '16', '123456', '小张', '2', '2019-04-25 16:54:43');
INSERT INTO `student_feedback` VALUES ('86', '17', '2019-04-25 16:54:35', '201521314321', '马伟涛', '17', '123456', '小张', '2', '2019-04-25 16:55:46');
INSERT INTO `student_feedback` VALUES ('87', '18', '2019-04-25 16:56:36', '201521314321', '马伟涛', '18', '123456', '小张', '2', '2019-04-25 16:56:46');
INSERT INTO `student_feedback` VALUES ('88', '19', '2019-04-25 16:56:38', '201521314321', '马伟涛', '19', '123456', '小张', '2', '2019-04-25 16:58:13');
INSERT INTO `student_feedback` VALUES ('89', '20', '2019-04-25 16:56:40', '201521314321', '马伟涛', '20', '123456', '小张', '2', '2019-04-25 16:58:24');
INSERT INTO `student_feedback` VALUES ('90', '18', '2019-04-25 16:57:40', '201521314321', '马伟涛', '18', '123456', '小张', '2', '2019-04-25 16:57:47');
INSERT INTO `student_feedback` VALUES ('91', '21', '2019-04-25 16:59:26', '201521314321', '马伟涛', '21', '123456', '小张', '2', '2019-04-25 16:59:31');
INSERT INTO `student_feedback` VALUES ('92', '22', '2019-04-25 16:59:36', '201521314321', '马伟涛', '22', '123456', '小张', '2', '2019-04-25 16:59:40');
INSERT INTO `student_feedback` VALUES ('93', '23', '2019-04-25 16:59:44', '201521314321', '马伟涛', '23', '123456', '小张', '2', '2019-04-25 16:59:48');
INSERT INTO `student_feedback` VALUES ('94', '24', '2019-04-25 16:59:51', '201521314321', '马伟涛', '24', '123456', '小张', '2', '2019-04-25 17:00:48');
INSERT INTO `student_feedback` VALUES ('95', '25', '2019-04-25 16:59:52', '201521314321', '马伟涛', '25', '123456', '小张', '2', '2019-04-25 17:05:34');
INSERT INTO `student_feedback` VALUES ('96', '26', '2019-04-25 17:00:05', '201521314321', '马伟涛', '26', '123456', '小张', '2', '2019-04-25 17:07:02');
INSERT INTO `student_feedback` VALUES ('97', '27', '2019-04-25 17:07:27', '201521314321', '马伟涛', '27', '123456', '小张', '2', '2019-04-25 17:07:32');
INSERT INTO `student_feedback` VALUES ('98', '28', '2019-04-25 17:07:35', '201521314321', '马伟涛', '28', '123456', '小张', '2', '2019-04-25 17:07:46');
INSERT INTO `student_feedback` VALUES ('99', '29', '2019-04-25 17:07:37', '201521314321', '马伟涛', '29', '123456', '小张', '2', '2019-04-25 17:10:07');
INSERT INTO `student_feedback` VALUES ('100', '30', '2019-04-25 17:07:39', '201521314321', '马伟涛', '30', '123456', '小张', '2', '2019-04-25 17:10:53');
INSERT INTO `student_feedback` VALUES ('101', '31', '2019-04-25 17:11:03', '201521314321', '马伟涛', '31', '123456', '小张', '2', '2019-04-25 17:11:06');
INSERT INTO `student_feedback` VALUES ('102', '32', '2019-04-25 17:11:12', '201521314321', '马伟涛', '32', '123456', '小张', '2', '2019-04-25 17:11:25');
INSERT INTO `student_feedback` VALUES ('103', '33', '2019-04-25 17:11:14', '201521314321', '马伟涛', '33', '123456', '小张', '2', '2019-04-25 17:16:26');
INSERT INTO `student_feedback` VALUES ('104', '34', '2019-04-25 17:11:15', '201521314321', '马伟涛', '4', '123456', '小张', '2', '2019-04-25 17:16:44');
INSERT INTO `student_feedback` VALUES ('105', '35', '2019-04-25 17:16:35', '201521314321', '马伟涛', '35', '123456', '小张', '2', '2019-04-25 17:16:51');
INSERT INTO `student_feedback` VALUES ('106', '36', '2019-04-25 17:16:36', '201521314321', '马伟涛', '36', '123456', '小张', '2', '2019-04-25 17:18:11');
INSERT INTO `student_feedback` VALUES ('107', '37', '2019-04-25 17:16:40', '201521314321', '马伟涛', '37', '123456', '小张', '2', '2019-04-25 17:19:16');
INSERT INTO `student_feedback` VALUES ('108', '40', '2019-04-25 17:25:31', '201521314321', '马伟涛', '40', '123456', '小张', '2', '2019-04-25 17:31:06');
INSERT INTO `student_feedback` VALUES ('109', '41', '2019-04-25 17:25:42', '201521314321', '马伟涛', '41', '123456', '小张', '2', '2019-04-25 17:31:33');
INSERT INTO `student_feedback` VALUES ('110', '42', '2019-04-25 17:26:19', '201521314321', '马伟涛', '42', '123456', '小张', '2', '2019-04-25 17:37:53');
INSERT INTO `student_feedback` VALUES ('111', '45', '2019-04-25 17:29:03', '201521314321', '马伟涛', '45', '123456', '小张', '2', '2019-04-25 17:38:29');
INSERT INTO `student_feedback` VALUES ('112', '43', '2019-04-25 17:30:52', '201521314321', '马伟涛', '43', '123456', '小张', '2', '2019-04-25 17:38:15');
INSERT INTO `student_feedback` VALUES ('113', '44', '2019-04-25 17:30:57', '201521314321', '马伟涛', '44', '123456', '小张', '2', '2019-04-25 17:38:19');
INSERT INTO `student_feedback` VALUES ('114', '46', '2019-04-25 17:31:24', '201521314321', '马伟涛', '46', '123456', '小张', '2', '2019-04-25 17:39:08');
INSERT INTO `student_feedback` VALUES ('115', '47', '2019-04-25 17:38:07', '201521314321', '马伟涛', '47', '123456', '小张', '2', '2019-04-25 17:41:00');
INSERT INTO `student_feedback` VALUES ('116', '48', '2019-04-25 17:38:10', '201521314321', '马伟涛', '48', '123456', '小张', '2', '2019-04-25 17:41:47');
INSERT INTO `student_feedback` VALUES ('117', '49', '2019-04-25 17:42:17', '201521314321', '马伟涛', '49', '123456', '小张', '2', '2019-04-25 17:42:36');
INSERT INTO `student_feedback` VALUES ('118', '50', '2019-04-25 17:42:30', '201521314321', '马伟涛', '50', '123456', '小张', '2', '2019-04-25 17:43:04');
INSERT INTO `student_feedback` VALUES ('119', '50', '2019-04-25 17:42:44', '201521314321', '马伟涛', '50', '123456', '小张', '2', '2019-04-25 17:44:51');
INSERT INTO `student_feedback` VALUES ('120', '51', '2019-04-25 17:42:48', '201521314321', '马伟涛', '51', '123456', '小张', '2', '2019-04-25 17:45:04');
INSERT INTO `student_feedback` VALUES ('121', '52', '2019-04-25 17:42:50', '201521314321', '马伟涛', '52', '123456', '小张', '2', '2019-04-25 17:45:16');
INSERT INTO `student_feedback` VALUES ('122', '53', '2019-04-25 17:45:09', '201521314321', '马伟涛', '53', '123456', '小张', '2', '2019-04-25 17:45:22');
INSERT INTO `student_feedback` VALUES ('123', '54', '2019-04-25 17:45:11', '201521314321', '马伟涛', '54', '123456', '小张', '2', '2019-04-25 17:50:36');
INSERT INTO `student_feedback` VALUES ('124', '60', '2019-04-25 17:51:26', '201521314321', '马伟涛', '60', '123456', '小张', '2', '2019-04-25 17:51:56');
INSERT INTO `student_feedback` VALUES ('125', '61', '2019-04-25 17:51:31', '201521314321', '马伟涛', '61', '123456', '小张', '2', '2019-04-25 17:52:08');
INSERT INTO `student_feedback` VALUES ('126', '62', '2019-04-25 17:51:45', '201521314321', '马伟涛', '62', '123456', '小张', '2', '2019-04-25 17:52:22');
INSERT INTO `student_feedback` VALUES ('127', '63', '2019-04-25 17:51:48', '201521314321', '马伟涛', '63', '123456', '小张', '2', '2019-04-25 17:52:57');
INSERT INTO `student_feedback` VALUES ('128', '64', '2019-04-25 17:52:39', '201521314321', '马伟涛', '64', '123456', '小张', '2', '2019-04-25 17:52:44');
INSERT INTO `student_feedback` VALUES ('129', '65', '2019-04-25 17:52:49', '201521314321', '马伟涛', '65', '123456', '小张', '2', '2019-04-25 17:56:01');
INSERT INTO `student_feedback` VALUES ('130', '66', '2019-04-25 17:52:50', '201521314321', '马伟涛', '66', '123456', '小张', '2', '2019-04-26 22:30:15');
INSERT INTO `student_feedback` VALUES ('131', '67', '2019-04-25 17:55:48', '201521314321', '马伟涛', '67', '123456', '小张', '2', '2019-04-26 22:30:18');
INSERT INTO `student_feedback` VALUES ('132', '68', '2019-04-25 17:56:13', '201521314321', '马伟涛', '68', '123456', '小张', '2', '2019-04-25 17:56:18');
INSERT INTO `student_feedback` VALUES ('133', '#流泪;#流泪;#流泪;', '2019-04-26 21:13:52', '201521314321', '马伟涛', '摸摸头', '123456', '小张', '2', '2019-04-26 22:29:42');
INSERT INTO `student_feedback` VALUES ('134', '#爱心;#爱心;#爱心;么么哒', '2019-04-26 21:55:12', '201521314321', '马伟涛', '#爱心;#爱心;么么', '123456', '小张', '2', '2019-04-27 00:24:03');
INSERT INTO `student_feedback` VALUES ('135', '#得意;', '2019-04-26 22:04:23', '201521314321', '马伟涛', 'hello', 'admin1', '小牛', '1', '2020-05-08 22:17:05');
INSERT INTO `student_feedback` VALUES ('136', '#发呆;#发呆;', '2019-04-26 22:06:56', '201521314321', '马伟涛', '好的#心碎;', '123456', '小张', '2', '2019-04-27 00:26:21');
INSERT INTO `student_feedback` VALUES ('137', '#发呆;#发呆;#发呆;发呆中', '2019-04-26 22:07:09', '201521314321', '马伟涛', '发呆', '123456', '小张', '2', '2019-04-26 22:30:29');
INSERT INTO `student_feedback` VALUES ('138', '#流泪;#害羞;#闭嘴;', '2019-04-26 22:09:22', '201521314321', '马伟涛', null, null, null, '0', null);
INSERT INTO `student_feedback` VALUES ('139', '#吓;啊啊啊', '2019-04-26 22:17:08', '201521314321', '马伟涛', '#饥饿;#疑问;#衰;咪事阿', '123456', '小张', '2', '2019-04-27 00:29:50');
INSERT INTO `student_feedback` VALUES ('140', '#鼓掌;#坏笑;#微笑;', '2019-04-27 00:35:03', '201521314321', '马伟涛', null, null, null, '0', null);
INSERT INTO `student_feedback` VALUES ('141', '#乒乓;#篮球;来啊', '2019-04-27 02:06:54', '201521314321', '马伟涛', null, null, null, '0', null);
INSERT INTO `student_feedback` VALUES ('142', '#憨笑;嗷嗷嗷', '2019-04-28 00:48:24', '201511314301', '小三', '#发呆;#发呆;啊噢', '123456', '小张', '1', '2019-04-28 00:56:50');
INSERT INTO `student_feedback` VALUES ('143', '#可怜;#可怜;#可怜;哎哎', '2019-04-28 00:51:45', '201511314301', '小三', '1111', '123456', '小张', '1', '2019-05-07 19:17:49');
INSERT INTO `student_feedback` VALUES ('144', '#衰;爱哟', '2019-04-28 00:57:48', '201511314321', '小马', '#害羞;#害羞;害羞', '123456', '小张', '2', '2019-04-28 01:01:16');
INSERT INTO `student_feedback` VALUES ('145', '#亲亲;#亲亲;亲一下', '2019-04-28 01:01:33', '201511314321', '小马', '#咒骂;亲你妹呀', '123456', '小张', '2', '2019-04-28 01:02:16');
INSERT INTO `student_feedback` VALUES ('146', '#亲亲;#糗大了;达', '2019-04-28 01:52:43', '201521314900', '张阿三', '啊啊', '123456', '小张', '1', '2019-05-07 19:02:35');
INSERT INTO `student_feedback` VALUES ('147', '啊哈哈哈#胜利;#鼓掌;', '2019-04-28 02:25:55', '201521314900', '张阿三', '111', '123456', '小张', '1', '2019-05-07 19:02:19');
INSERT INTO `student_feedback` VALUES ('148', '#糗大了;试试', '2019-05-07 16:34:13', '201521314321', '马伟涛', '11', '123456', '小张', '1', '2019-05-07 19:00:06');
INSERT INTO `student_feedback` VALUES ('149', '#发呆;#得意;测试', '2019-05-07 16:35:02', '201521314321', '马伟涛', '#憨笑;#坏笑;#鼓掌;好的喔', '123456', '小张', '2', '2019-05-07 16:35:36');
INSERT INTO `student_feedback` VALUES ('150', '#糗大了;#阴险;', '2019-05-07 17:03:35', '201521314321', '马伟涛', '111#委屈;#抠鼻;', '123456', '小张', '2', '2019-05-07 17:03:59');
INSERT INTO `student_feedback` VALUES ('151', '#撇嘴;', '2020-05-02 15:38:38', '201511314001', '小四', null, null, null, '0', null);

-- ----------------------------
-- Table structure for student_home_rotation_img
-- ----------------------------
DROP TABLE IF EXISTS `student_home_rotation_img`;
CREATE TABLE `student_home_rotation_img` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '轮播图id',
  `img_title` varchar(255) DEFAULT NULL COMMENT '轮播图标题',
  `img_src` varchar(255) NOT NULL COMMENT '轮播图图片地址',
  `img_create_time` datetime NOT NULL COMMENT '轮播图创建时间',
  `ano` int(11) NOT NULL COMMENT '创建轮播图的管理员id',
  `adm_name` varchar(255) DEFAULT NULL COMMENT '创建轮播图的管理员姓名',
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_home_rotation_img
-- ----------------------------
INSERT INTO `student_home_rotation_img` VALUES ('1', '轮播图1', 'nltest01.jpg', '2019-03-05 01:48:22', '123456', '小张');
INSERT INTO `student_home_rotation_img` VALUES ('2', '轮播图2', 'nltest02.jpg', '2019-03-05 01:48:45', '123456', '小张');
INSERT INTO `student_home_rotation_img` VALUES ('3', '轮播图3', 'nltest03.jpg', '2019-03-05 01:49:03', '123456', '小张');
INSERT INTO `student_home_rotation_img` VALUES ('4', '轮播图4', 'nltest04.jpg', '2019-03-05 01:49:17', '123456', '小张');
INSERT INTO `student_home_rotation_img` VALUES ('5', '测试添加轮播图1', 'nltest05.jpg', '2019-04-20 17:18:40', '123456', '小张');
INSERT INTO `student_home_rotation_img` VALUES ('6', '测试添加轮播图2', 'nltest02.jpg', '2019-04-20 17:19:01', '123456', '小张');

-- ----------------------------
-- Table structure for student_info
-- ----------------------------
DROP TABLE IF EXISTS `student_info`;
CREATE TABLE `student_info` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `student_name` varchar(50) NOT NULL COMMENT '学生姓名',
  `student_number` varchar(20) NOT NULL COMMENT '学号',
  `sex` char(1) NOT NULL COMMENT '性别：m-男，f-女',
  `remark` varchar(500) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` char(1) NOT NULL DEFAULT 'A' COMMENT '状态：A-在用;X-删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_student_number` (`student_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COMMENT='学生信息表';

-- ----------------------------
-- Records of student_info
-- ----------------------------
INSERT INTO `student_info` VALUES ('1', '刘坚', '1410103069', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:32:18', 'A');
INSERT INTO `student_info` VALUES ('2', '杨伟勇', '1512001080', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:32:19', 'A');
INSERT INTO `student_info` VALUES ('3', '陆永杰', '1603101007', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:32:21', 'A');
INSERT INTO `student_info` VALUES ('4', '胡士国', '1610031036', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('5', '沈维郑', '1612001051', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('6', '赵鹏飞', '1612001052', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('7', '李莉', '1612001053', 'f', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('8', '吴中诚', '1612001054', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('9', '娄梦', '1612001055', 'f', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('10', '倪金雷', '1612001056', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('11', '李浩', '1612001057', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('12', '满聪', '1612001058', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('13', '胡德成', '1612001059', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('14', '张振辉', '1612001060', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('15', '卞志浩', '1612001063', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('16', '于诚', '1612001064', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('17', '陈哲', '1612001066', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('18', '郝旭晨', '1612001067', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('19', '池鑫', '1612001068', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('20', '黄大翩', '1612001069', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('21', '徐涛', '1612001070', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('22', '马文彪', '1612001072', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('23', '蔡焕鑫', '1612001074', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('24', '夏雨磊', '1612001075', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('25', '桑宇轩', '1612001076', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('26', '沈磊', '1612001077', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('27', '刘忠旭', '1612001078', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('28', '王力平', '1612001079', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('29', '廖春桠', '1612001080', 'f', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('30', '方立', '1612001081', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('31', '屈高强', '1612001082', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('32', '李刘磊', '1616021020', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('33', '王竹贤', '1616021029', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('34', '李磊', '1616031054', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('35', '张馨予', '1616901028', 'f', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('36', '孙宇', '1604081046', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('37', '洪宇', '1606011054', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('38', '于宏伟', '1606011085', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('39', '王鲲鹏', '1606081019', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('40', '方堃', '1612001026', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('41', '赵宏', '1612001028', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('42', '夏海润', '1612001030', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('43', '林佶', '1612001031', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('44', '纪爱栋', '1612001032', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('45', '姜敏', '1612001034', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('46', '姚金伟', '1612001038', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('47', '王涛', '1612001041', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('48', '徐志轩', '1612001044', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('49', '赵婧弛', '1612001045', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('50', '吕昀波', '1612001046', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('51', '王尚尚', '1612001048', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('52', '金华玉', '1612001084', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('53', '谢昆', '1612001085', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('54', '刘贵峰', '1612001087', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('55', '王琪', '1612001089', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('56', '徐国皓', '1612001090', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('57', '郭浩楠', '1615001092', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('58', '董雯铄', '1615011038', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('59', '张云风', '1612001027', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('60', '陈明', '1612001029', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('61', '刘昊', '1612001033', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('62', '夏阳', '1612001035', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('63', '陆谦益', '1612001036', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('64', '徐建一', '1612001037', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('65', '周文杰', '1612001039', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('66', '魏祥', '1612001040', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('67', '徐子陵', '1612001042', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('68', '宗天琪', '1612001043', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('69', '袁敏强', '1612001049', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('70', '龚泽慧', '1612001086', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('71', '陆宇', '1612001091', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('72', '姜鑫', '1607051045', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('73', '陶秦', '1607061046', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('74', '赵雪松', '1607061071', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('75', '黄雅璇', '1607071052', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('76', '陈凯', '1612001001', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('77', '穆文秀', '1612001002', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('78', '石俊杰', '1612001003', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('79', '黄雅琳', '1612001004', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('80', '沈刘鹏', '1612001005', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('81', '夏寅', '1612001006', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('82', '卢健宇', '1612001007', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('83', '万成虎', '1612001008', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('84', '闫磊', '1612001009', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('85', '刘倩', '1612001012', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('86', '许铭烨', '1612001014', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('87', '陈佳俊', '1612001015', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('88', '李方晟', '1612001016', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('89', '张波', '1612001017', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('90', '林铸', '1612001018', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('91', '苏柏武', '1612001019', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('92', '刘涛', '1612001020', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('93', '张星宇', '1612001021', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('94', '陈杨阳', '1612001022', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('95', '周芮', '1612001023', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('96', '相裕晴', '1612001025', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('97', '宫家豪', '1612001094', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('98', '雍国槐', '1612001095', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('99', '莫涛', '1612001096', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('100', '石昆', '1612001097', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('101', '韦兴庆', '1612001098', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('102', '叶倩', '1612001099', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('103', '刘启暘', '1612001101', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('104', '王嘉豪', '1612001103', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('105', '德吉卓嘎', '1612001104', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('106', '蒋苏豪', '1612001010', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('107', '虞朱源', '1612001011', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('108', '韩杰', '1612001013', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('109', '周杨', '1612001024', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('110', '吴彪', '1612001093', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('111', '张钊', '1612001102', 'm', '', '2019-09-11 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('112', '韦苗苗', '1305104025', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('113', '蔡思祺', '1512001002', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('114', '邓庆贵', '1512001012', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('115', '何嘉懿', '1512001021', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('116', '蒋双庆', '1512001026', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('117', '梁敏', '1512001030', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('118', '杨安宇', '1515001019', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('119', '蔡树林', '1512001001', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('120', '陈智超', '1512001008', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('121', '傅丽华', '1512001016', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('122', '黄嘉庆', '1512001024', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('123', '景语尘', '1512001028', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('124', '李瑞', '1512001031', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('125', '徐森', '1517011005', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('126', '李闽川', '1512001035', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('127', '刘涛', '1512001039', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('128', '梁华龙', '1512001041', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('129', '孟德轩', '1512001044', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('130', '倪云鹏', '1512001046', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('131', '沈闯', '1512001048', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('132', '史荟', '1512001051', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('133', '孙远', '1512001054', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('134', '王磊', '1512001058', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('135', '王天伟', '1512001061', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('136', '西日娜依·塞买提', '1512001069', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('137', '周家叶', '1516001080', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('138', '梁振洲', '1512001036', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('139', '李学波', '1512001040', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('140', '马晓晗', '1512001043', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('141', '倪红珠', '1512001045', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('142', '彭逸文', '1512001047', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('143', '沈立升', '1512001049', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('144', '孙兵', '1512001052', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('145', '陶渊', '1512001057', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('146', '王瑞', '1512001060', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('147', '武赏', '1512001068', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('148', '贲小康', '1516001054', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('149', '窦钰博', '1506011073', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('150', '汤韦逸', '1507061021', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('151', '谢俊楠', '1512001070', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('152', '徐晨', '1512001072', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('153', '徐珂', '1512001074', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('154', '徐亚欣', '1512001076', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('155', '颜子皓', '1512001078', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('156', '杨颖晨', '1512001081', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('157', '于梦元', '1512001085', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('158', '曾德樟', '1512001087', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('159', '张明彦', '1512001091', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('160', '张鑫', '1512001093', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('161', '周浩东', '1512001096', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('162', '周巡', '1512001098', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('163', '周舟', '1512001100', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('164', '朱延州', '1512001102', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('165', '耿智龙', '1512001104', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('166', '沈媛', '1506911037', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('167', '石磊', '1507061040', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('168', '谢尧华', '1512001071', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('169', '徐国栋', '1512001073', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('170', '徐笑', '1512001075', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('171', '言迪', '1512001077', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('172', '杨敏', '1512001079', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('173', '姚天益', '1512001084', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('174', '喻恩泽', '1512001086', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('175', '张梦菊', '1512001090', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('176', '张帅帅', '1512001092', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('177', '赵晨曦', '1512001095', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('178', '周天豪', '1512001097', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('179', '周圆立', '1512001099', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('180', '朱小龙', '1512001101', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');
INSERT INTO `student_info` VALUES ('181', '卓顺顺', '1512001103', 'm', '', '2019-09-12 00:00:00', '2020-04-01 01:36:58', 'A');

-- ----------------------------
-- Table structure for student_paper_answer
-- ----------------------------
DROP TABLE IF EXISTS `student_paper_answer`;
CREATE TABLE `student_paper_answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生答卷答案id',
  `stu_answer` varchar(255) DEFAULT NULL COMMENT '学生答卷答案',
  `isCorrect` varchar(255) DEFAULT NULL COMMENT '答案是否正确',
  `que_id` int(11) DEFAULT NULL COMMENT '问题id',
  `paper_id` int(11) DEFAULT NULL COMMENT '试卷id',
  `sno` char(12) DEFAULT NULL COMMENT '学号',
  `isCollect` varchar(255) DEFAULT '0' COMMENT '是否被收藏,0为否，1为是',
  PRIMARY KEY (`answer_id`),
  KEY `answer_que_id` (`que_id`),
  KEY `answer_paper_id` (`paper_id`),
  KEY `answer_sno` (`sno`),
  CONSTRAINT `student_paper_answer_ibfk_1` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`paper_id`),
  CONSTRAINT `student_paper_answer_ibfk_2` FOREIGN KEY (`que_id`) REFERENCES `paper_que` (`que_id`),
  CONSTRAINT `student_paper_answer_ibfk_3` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=1054 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_paper_answer
-- ----------------------------
INSERT INTO `student_paper_answer` VALUES ('3', 'A', '0', '1', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('4', 'A', '0', '2', '1', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('5', 'B', '0', '3', '1', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('6', 'B', '1', '4', '1', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('7', 'A', '1', '5', '1', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('8', 'D', '1', '6', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('9', 'A', '1', '7', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('10', 'B', '1', '8', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('11', 'A', '1', '9', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('12', 'B', '1', '10', '1', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('13', '', '0', '11', '1', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('14', null, '0', '12', '1', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('15', null, '0', '13', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('16', null, '0', '14', '1', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('17', null, '0', '15', '1', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('18', null, '0', '16', '1', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('19', null, '0', '17', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('20', null, '0', '18', '1', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('21', null, '0', '19', '1', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('22', null, '0', '20', '1', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('23', 'BCD', '0', '21', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('24', 'BCD', '1', '22', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('25', 'BCD', '1', '23', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('26', 'BCD', '0', '24', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('27', null, '0', '25', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('28', 'T', '1', '26', '1', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('29', 'T', '1', '27', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('30', 'T', '1', '28', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('31', 'T', '1', '29', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('32', null, '0', '30', '1', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('33', 'java ee', '1', '31', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('34', 'jdk', '1', '32', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('35', 'cmd', '1', '33', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('36', '', '0', '34', '1', '201521314321', '1');
INSERT INTO `student_paper_answer` VALUES ('37', null, '0', '35', '1', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('38', 'A', '0', '1', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('39', 'B', '0', '2', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('40', 'A', '0', '3', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('41', 'B', '1', '4', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('42', 'C', '0', '5', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('43', '', '0', '6', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('44', null, '0', '7', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('45', null, '0', '8', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('46', null, '0', '9', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('47', null, '0', '10', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('48', null, '0', '11', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('49', null, '0', '12', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('50', null, '0', '13', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('51', null, '0', '14', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('52', null, '0', '15', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('53', null, '0', '16', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('54', null, '0', '17', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('55', null, '0', '18', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('56', null, '0', '19', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('57', null, '0', '20', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('58', 'ABC', '0', '21', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('59', 'BCD', '1', '22', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('60', 'BCD', '1', '23', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('61', 'BCD', '0', '24', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('62', 'BCD', '0', '25', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('63', 'T', '1', '26', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('64', 'T', '1', '27', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('65', 'T', '1', '28', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('66', 'T', '1', '29', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('67', 'T', '0', '30', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('68', 'java ee', '1', '31', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('69', 'jdk', '1', '32', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('70', 'cmd', '1', '33', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('71', '', '0', '34', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('72', null, '0', '35', '1', '201521314323', '0');
INSERT INTO `student_paper_answer` VALUES ('73', 'A', '0', '1', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('74', 'B', '0', '2', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('75', 'C', '1', '3', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('76', 'B', '1', '4', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('77', 'A', '1', '5', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('78', 'D', '1', '6', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('79', 'A', '1', '7', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('80', 'B', '1', '8', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('81', 'A', '1', '9', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('82', 'B', '1', '10', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('83', 'B', '1', '11', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('84', 'A', '1', '12', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('85', 'B', '1', '13', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('86', 'B', '1', '14', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('87', 'C', '1', '15', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('88', null, '0', '16', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('89', null, '0', '17', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('90', null, '0', '18', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('91', null, '0', '19', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('92', null, '0', '20', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('93', 'BCDE', '1', '21', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('94', 'BCD', '1', '22', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('95', 'BCD', '1', '23', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('96', 'ACD', '1', '24', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('97', 'ACD', '1', '25', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('98', 'T', '1', '26', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('99', 'T', '1', '27', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('100', 'T', '1', '28', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('101', 'T', '1', '29', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('102', 'F', '1', '30', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('103', 'java ee', '1', '31', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('104', 'jdk', '1', '32', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('105', 'cmd', '1', '33', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('106', 'bin', '1', '34', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('107', 'path', '1', '35', '1', '201521314322', '0');
INSERT INTO `student_paper_answer` VALUES ('180', 'B', '1', '1', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('181', 'D', '1', '2', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('182', 'C', '1', '3', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('183', 'B', '1', '4', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('184', 'A', '1', '5', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('185', 'D', '1', '6', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('186', 'A', '1', '7', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('187', 'B', '1', '8', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('188', 'A', '1', '9', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('189', 'B', '1', '10', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('190', null, '0', '11', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('191', null, '0', '12', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('192', null, '0', '13', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('193', null, '0', '14', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('194', null, '0', '15', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('195', null, '0', '16', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('196', null, '0', '17', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('197', null, '0', '18', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('198', null, '0', '19', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('199', null, '0', '20', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('200', 'BCD', '0', '21', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('201', 'BCD', '1', '22', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('202', 'BCD', '1', '23', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('203', 'BCD', '0', '24', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('204', 'ACD', '1', '25', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('205', 'T', '1', '26', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('206', 'T', '1', '27', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('207', 'T', '1', '28', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('208', 'T', '1', '29', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('209', 'F', '1', '30', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('210', 'java ee', '1', '31', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('211', 'cmd', '0', '32', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('212', 'cmd', '1', '33', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('213', null, '0', '34', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('214', '', '0', '35', '1', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('219', 'A', '0', '1', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('220', 'B', '0', '2', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('221', 'C', '1', '3', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('222', 'D', '0', '4', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('223', 'A', '1', '5', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('224', null, '0', '6', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('225', null, '0', '7', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('226', null, '0', '8', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('227', null, '0', '9', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('228', null, '0', '10', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('229', null, '0', '11', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('230', null, '0', '12', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('231', null, '0', '13', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('232', null, '0', '14', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('233', null, '0', '15', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('234', null, '0', '16', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('235', null, '0', '17', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('236', null, '0', '18', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('237', null, '0', '19', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('238', null, '0', '20', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('239', 'BCD', '0', '21', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('240', 'BCD', '1', '22', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('241', 'BCD', '1', '23', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('242', 'BCD', '0', '24', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('243', 'ACD', '1', '25', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('244', 'T', '1', '26', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('245', 'T', '1', '27', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('246', 'T', '1', '28', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('247', 'T', '1', '29', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('248', 'F', '1', '30', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('249', 'java ee', '1', '31', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('250', null, '0', '32', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('251', null, '0', '33', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('252', null, '0', '34', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('253', null, '0', '35', '1', '201521314330', '0');
INSERT INTO `student_paper_answer` VALUES ('256', 'B', '1', '1', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('257', 'D', '1', '2', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('258', 'C', '1', '3', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('259', 'B', '1', '4', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('260', 'A', '1', '5', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('261', '', '0', '6', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('262', null, '0', '7', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('263', null, '0', '8', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('264', null, '0', '9', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('265', null, '0', '10', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('266', null, '0', '11', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('267', null, '0', '12', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('268', null, '0', '13', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('269', null, '0', '14', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('270', null, '0', '15', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('271', null, '0', '16', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('272', null, '0', '17', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('273', null, '0', '18', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('274', null, '0', '19', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('275', null, '0', '20', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('276', 'BCD', '0', '21', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('277', 'BCD', '1', '22', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('278', 'BCD', '1', '23', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('279', 'BCD', '0', '24', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('280', 'ACD', '1', '25', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('281', 'T', '1', '26', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('282', 'T', '1', '27', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('283', 'T', '1', '28', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('284', 'T', '1', '29', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('285', 'F', '1', '30', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('286', null, '0', '31', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('287', null, '0', '32', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('288', null, '0', '33', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('289', null, '0', '34', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('290', null, '0', '35', '1', '201521314316', '0');
INSERT INTO `student_paper_answer` VALUES ('299', 'A', '0', '1', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('300', 'B', '0', '2', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('301', 'C', '1', '3', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('302', 'D', '0', '4', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('303', null, '0', '5', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('304', null, '0', '6', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('305', null, '0', '7', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('306', null, '0', '8', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('307', null, '0', '9', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('308', null, '0', '10', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('309', null, '0', '11', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('310', null, '0', '12', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('311', null, '0', '13', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('312', null, '0', '14', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('313', null, '0', '15', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('314', null, '0', '16', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('315', null, '0', '17', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('316', null, '0', '18', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('317', null, '0', '19', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('318', null, '0', '20', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('319', 'BCD', '0', '21', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('320', 'BCD', '1', '22', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('321', 'BCD', '1', '23', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('322', 'BCD', '0', '24', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('323', 'ACD', '1', '25', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('324', 'T', '1', '26', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('325', 'T', '1', '27', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('326', 'T', '1', '28', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('327', 'T', '1', '29', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('328', 'T', '0', '30', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('329', 'java ee', '1', '31', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('330', null, '0', '32', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('331', null, '0', '33', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('332', null, '0', '34', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('333', null, '0', '35', '1', '201521314303', '0');
INSERT INTO `student_paper_answer` VALUES ('334', 'A', '0', '1', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('335', 'B', '0', '2', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('336', 'B', '0', '3', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('337', 'C', '0', '4', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('338', 'A', '1', '5', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('339', 'C', '0', '6', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('340', 'D', '0', '7', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('341', 'A', '0', '8', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('342', 'C', '0', '9', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('343', 'D', '0', '10', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('344', 'C', '0', '11', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('345', 'C', '0', '12', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('346', 'B', '1', '13', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('347', 'B', '1', '14', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('348', 'B', '0', '15', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('349', 'A', '0', '16', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('350', 'A', '1', '17', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('351', 'C', '1', '18', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('352', 'C', '0', '19', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('353', 'B', '1', '20', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('354', 'B', '0', '21', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('355', 'BCD', '1', '22', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('356', 'BCD', '1', '23', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('357', 'BCD', '0', '24', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('358', 'ACD', '1', '25', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('359', 'T', '1', '26', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('360', 'T', '1', '27', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('361', 'T', '1', '28', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('362', 'T', '1', '29', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('363', 'T', '0', '30', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('364', 'java ee', '1', '31', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('365', 'jdk', '1', '32', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('366', 'cmd', '1', '33', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('367', '', '0', '34', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('368', '', '0', '35', '1', '201521314304', '0');
INSERT INTO `student_paper_answer` VALUES ('369', 'A', '0', '1', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('370', 'B', '0', '2', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('371', 'B', '0', '3', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('372', 'C', '0', '4', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('373', 'B', '0', '5', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('374', 'A', '0', '6', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('375', 'A', '1', '7', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('376', 'C', '0', '8', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('377', 'C', '0', '9', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('378', 'A', '0', '10', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('379', 'A', '0', '11', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('380', 'A', '1', '12', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('381', 'C', '0', '13', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('382', 'A', '0', '14', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('383', 'C', '1', '15', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('384', '', '0', '16', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('385', null, '0', '17', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('386', null, '0', '18', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('387', null, '0', '19', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('388', null, '0', '20', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('389', 'BC', '0', '21', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('390', 'BCD', '1', '22', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('391', 'BCD', '1', '23', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('392', 'BCD', '0', '24', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('393', 'ACD', '1', '25', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('394', 'T', '1', '26', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('395', 'T', '1', '27', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('396', 'F', '0', '28', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('397', 'T', '1', '29', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('398', 'F', '1', '30', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('399', 'JAVA EE', '1', '31', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('400', 'JDK', '1', '32', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('401', 'CMD', '1', '33', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('402', '', '0', '34', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('403', '', '0', '35', '1', '201521314305', '0');
INSERT INTO `student_paper_answer` VALUES ('478', 'A', '0', '1', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('479', 'B', '0', '2', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('480', 'C', '1', '3', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('481', 'D', '0', '4', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('482', 'A', '1', '5', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('483', 'B', '0', '6', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('484', 'C', '0', '7', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('485', 'C', '0', '8', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('486', 'B', '0', '9', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('487', 'C', '0', '10', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('488', 'C', '0', '11', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('489', 'A', '1', '12', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('490', 'A', '0', '13', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('491', 'C', '0', '14', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('492', 'A', '0', '15', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('493', 'B', '1', '16', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('494', 'A', '1', '17', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('495', 'C', '1', '18', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('496', 'B', '0', '19', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('497', 'B', '1', '20', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('498', 'BCD', '0', '21', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('499', 'BCD', '1', '22', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('500', 'ACD', '0', '23', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('501', 'BCD', '0', '24', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('502', 'ACD', '1', '25', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('503', 'T', '1', '26', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('504', 'T', '1', '27', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('505', 'T', '1', '28', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('506', 'T', '1', '29', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('507', 'T', '0', '30', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('508', 'java ee', '1', '31', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('509', 'jdk', '1', '32', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('510', 'cmd', '1', '33', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('511', null, '0', '34', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('512', null, '0', '35', '1', '201521314318', '0');
INSERT INTO `student_paper_answer` VALUES ('539', 'A', '0', '36', '2', '201521314701', '0');
INSERT INTO `student_paper_answer` VALUES ('540', 'B', '0', '37', '2', '201521314701', '0');
INSERT INTO `student_paper_answer` VALUES ('541', 'C', '1', '38', '2', '201521314701', '0');
INSERT INTO `student_paper_answer` VALUES ('542', 'D', '0', '39', '2', '201521314701', '0');
INSERT INTO `student_paper_answer` VALUES ('543', 'A', '1', '40', '2', '201521314701', '0');
INSERT INTO `student_paper_answer` VALUES ('544', 'B', '0', '41', '2', '201521314701', '0');
INSERT INTO `student_paper_answer` VALUES ('545', 'BCD', '0', '42', '2', '201521314701', '0');
INSERT INTO `student_paper_answer` VALUES ('546', 'BCD', '0', '43', '2', '201521314701', '0');
INSERT INTO `student_paper_answer` VALUES ('547', 'A', '0', '44', '2', '201521314701', '0');
INSERT INTO `student_paper_answer` VALUES ('548', 'T', '0', '45', '2', '201521314701', '0');
INSERT INTO `student_paper_answer` VALUES ('549', 'T', '0', '46', '2', '201521314701', '0');
INSERT INTO `student_paper_answer` VALUES ('550', 'java ee', '0', '47', '2', '201521314701', '0');
INSERT INTO `student_paper_answer` VALUES ('551', '//', '1', '48', '2', '201521314701', '0');
INSERT INTO `student_paper_answer` VALUES ('552', 'B', '1', '36', '2', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('553', 'C', '0', '37', '2', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('554', 'D', '0', '38', '2', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('555', 'B', '1', '39', '2', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('556', 'A', '1', '40', '2', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('557', 'B', '0', '41', '2', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('558', 'BCD', '0', '42', '2', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('559', 'BCD', '0', '43', '2', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('560', 'BCD', '0', '44', '2', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('561', 'T', '0', '45', '2', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('562', 'T', '0', '46', '2', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('563', '', '0', '47', '2', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('564', '//', '1', '48', '2', '201521314301', '0');
INSERT INTO `student_paper_answer` VALUES ('565', 'B', '1', '36', '2', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('566', 'B', '0', '37', '2', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('567', 'A', '0', '38', '2', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('568', 'B', '1', '39', '2', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('569', 'A', '1', '40', '2', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('570', 'D', '1', '41', '2', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('571', 'BCD', '0', '42', '2', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('572', 'BCD', '0', '43', '2', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('573', 'ACD', '0', '44', '2', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('574', 'T', '0', '45', '2', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('575', 'F', '1', '46', '2', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('576', '//', '0', '47', '2', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('577', '//', '1', '48', '2', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('578', 'A', '0', '1', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('579', 'B', '0', '2', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('580', 'C', '1', '3', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('581', 'B', '1', '4', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('582', 'A', '1', '5', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('583', 'D', '1', '6', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('584', 'A', '1', '7', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('585', 'B', '1', '8', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('586', 'C', '0', '9', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('587', 'C', '0', '10', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('588', 'B', '1', '11', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('589', 'C', '0', '12', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('590', 'A', '0', '13', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('591', 'C', '0', '14', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('592', 'B', '0', '15', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('593', 'A', '0', '16', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('594', 'A', '1', '17', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('595', 'A', '0', '18', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('596', 'A', '1', '19', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('597', 'C', '0', '20', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('598', 'BCD', '0', '21', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('599', 'BCD', '1', '22', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('600', 'ACD', '0', '23', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('601', 'ACD', '1', '24', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('602', 'ACD', '1', '25', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('603', 'T', '1', '26', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('604', 'T', '1', '27', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('605', 'F', '0', '28', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('606', 'T', '1', '29', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('607', 'F', '1', '30', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('608', 'java ee', '1', '31', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('609', 'jdk', '1', '32', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('610', 'cmd', '1', '33', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('611', '', '0', '34', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('612', null, '0', '35', '1', '201521314700', '0');
INSERT INTO `student_paper_answer` VALUES ('613', 'A', '0', '36', '2', '201521314610', '0');
INSERT INTO `student_paper_answer` VALUES ('614', 'B', '0', '37', '2', '201521314610', '0');
INSERT INTO `student_paper_answer` VALUES ('615', 'C', '1', '38', '2', '201521314610', '0');
INSERT INTO `student_paper_answer` VALUES ('616', 'B', '1', '39', '2', '201521314610', '0');
INSERT INTO `student_paper_answer` VALUES ('617', 'A', '1', '40', '2', '201521314610', '0');
INSERT INTO `student_paper_answer` VALUES ('618', 'D', '1', '41', '2', '201521314610', '0');
INSERT INTO `student_paper_answer` VALUES ('619', 'BCD', '0', '42', '2', '201521314610', '0');
INSERT INTO `student_paper_answer` VALUES ('620', 'BCD', '0', '43', '2', '201521314610', '0');
INSERT INTO `student_paper_answer` VALUES ('621', 'ACD', '0', '44', '2', '201521314610', '0');
INSERT INTO `student_paper_answer` VALUES ('622', 'T', '0', '45', '2', '201521314610', '0');
INSERT INTO `student_paper_answer` VALUES ('623', 'T', '0', '46', '2', '201521314610', '0');
INSERT INTO `student_paper_answer` VALUES ('624', '//', '0', '47', '2', '201521314610', '0');
INSERT INTO `student_paper_answer` VALUES ('625', '//', '1', '48', '2', '201521314610', '0');
INSERT INTO `student_paper_answer` VALUES ('626', 'B', '1', '36', '2', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('627', 'C', '0', '37', '2', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('628', 'D', '0', '38', '2', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('629', 'A', '0', '39', '2', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('630', 'B', '0', '40', '2', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('631', 'D', '1', '41', '2', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('632', 'BCD', '0', '42', '2', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('633', 'ABC', '1', '43', '2', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('634', 'CD', '0', '44', '2', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('635', 'T', '0', '45', '2', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('636', 'T', '0', '46', '2', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('637', '', '0', '47', '2', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('638', null, '0', '48', '2', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('639', 'C', '0', '36', '2', '201521314310', '0');
INSERT INTO `student_paper_answer` VALUES ('640', 'D', '1', '37', '2', '201521314310', '0');
INSERT INTO `student_paper_answer` VALUES ('641', 'C', '1', '38', '2', '201521314310', '0');
INSERT INTO `student_paper_answer` VALUES ('642', 'B', '1', '39', '2', '201521314310', '0');
INSERT INTO `student_paper_answer` VALUES ('643', 'A', '1', '40', '2', '201521314310', '0');
INSERT INTO `student_paper_answer` VALUES ('644', 'D', '1', '41', '2', '201521314310', '0');
INSERT INTO `student_paper_answer` VALUES ('645', 'BCD', '0', '42', '2', '201521314310', '0');
INSERT INTO `student_paper_answer` VALUES ('646', 'ABC', '1', '43', '2', '201521314310', '0');
INSERT INTO `student_paper_answer` VALUES ('647', 'BCD', '0', '44', '2', '201521314310', '0');
INSERT INTO `student_paper_answer` VALUES ('648', 'T', '0', '45', '2', '201521314310', '0');
INSERT INTO `student_paper_answer` VALUES ('649', 'F', '1', '46', '2', '201521314310', '0');
INSERT INTO `student_paper_answer` VALUES ('650', '', '0', '47', '2', '201521314310', '0');
INSERT INTO `student_paper_answer` VALUES ('651', '', '0', '48', '2', '201521314310', '0');
INSERT INTO `student_paper_answer` VALUES ('658', 'A', '0', '65', '5', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('659', 'BCD', '0', '66', '5', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('660', 'T', '0', '67', '5', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('661', 'true', '1', '68', '5', '201521314321', '0');
INSERT INTO `student_paper_answer` VALUES ('942', 'B', '1', '1', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('943', 'D', '1', '2', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('944', 'B', '0', '3', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('945', 'B', '1', '4', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('946', 'B', '0', '5', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('947', 'B', '0', '6', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('948', 'B', '0', '7', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('949', 'B', '1', '8', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('950', 'B', '0', '9', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('951', 'B', '1', '10', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('952', 'C', '0', '11', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('953', 'B', '0', '12', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('954', 'C', '0', '13', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('955', 'B', '1', '14', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('956', 'B', '0', '15', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('957', 'B', '1', '16', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('958', 'B', '0', '17', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('959', 'B', '0', '18', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('960', 'B', '0', '19', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('961', 'D', '0', '20', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('962', 'ABCDE', '0', '21', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('963', 'ABCDE', '0', '22', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('964', 'BCD', '1', '23', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('965', 'BC', '0', '24', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('966', 'BCDE', '0', '25', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('967', null, '0', '26', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('968', null, '0', '27', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('969', null, '0', '28', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('970', null, '0', '29', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('971', null, '0', '30', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('972', null, '0', '31', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('973', null, '0', '32', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('974', null, '0', '33', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('975', null, '0', '34', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('976', null, '0', '35', '1', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('993', 'C', '0', '36', '2', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('994', 'B', '0', '37', '2', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('995', 'B', '0', '38', '2', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('996', 'B', '1', '39', '2', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('997', 'A', '1', '40', '2', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('998', 'D', '1', '41', '2', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('999', 'ABCD', '0', '42', '2', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('1000', 'ABCD', '0', '43', '2', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('1001', 'BCD', '0', '44', '2', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('1002', 'T', '0', '45', '2', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('1003', 'T', '0', '46', '2', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('1004', 'test', '0', '47', '2', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('1005', '/**/', '0', '48', '2', '201511314003', '0');
INSERT INTO `student_paper_answer` VALUES ('1006', 'C', '0', '1', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1007', 'B', '0', '2', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1008', 'C', '1', '3', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1009', 'B', '1', '4', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1010', 'B', '0', '5', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1011', 'D', '1', '6', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1012', 'A', '1', '7', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1013', 'C', '0', '8', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1014', 'C', '0', '9', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1015', 'B', '1', '10', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1016', 'B', '1', '11', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1017', 'C', '0', '12', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1018', 'C', '0', '13', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1019', 'D', '0', '14', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1020', 'B', '0', '15', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1021', 'B', '1', '16', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1022', 'A', '1', '17', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1023', 'B', '0', '18', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1024', 'B', '0', '19', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1025', 'C', '0', '20', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1026', 'ABCDE', '0', '21', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1027', 'ABC', '0', '22', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1028', 'ABC', '0', '23', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1029', 'ABC', '0', '24', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1030', 'ABCD', '0', '25', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1031', 'T', '1', '26', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1032', 'T', '1', '27', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1033', 'F', '0', '28', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1034', 'T', '1', '29', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1035', 'T', '0', '30', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1036', 'java EE', '1', '31', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1037', 'api', '0', '32', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1038', 'cmd', '1', '33', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1039', 'bin', '1', '34', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1040', '系统', '0', '35', '1', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1041', 'C', '0', '36', '2', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1042', 'B', '0', '37', '2', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1043', null, '0', '38', '2', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1044', null, '0', '39', '2', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1045', null, '0', '40', '2', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1046', null, '0', '41', '2', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1047', null, '0', '42', '2', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1048', null, '0', '43', '2', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1049', null, '0', '44', '2', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1050', null, '0', '45', '2', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1051', null, '0', '46', '2', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1052', null, '0', '47', '2', '201612011189', '0');
INSERT INTO `student_paper_answer` VALUES ('1053', null, '0', '48', '2', '201612011189', '0');

-- ----------------------------
-- Table structure for student_paper_score
-- ----------------------------
DROP TABLE IF EXISTS `student_paper_score`;
CREATE TABLE `student_paper_score` (
  `score_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生答卷分数id',
  `score` int(11) DEFAULT NULL COMMENT '学生答卷总分',
  `time_used` int(11) DEFAULT NULL COMMENT '答题花费时间，单位毫秒',
  `start_time` datetime DEFAULT NULL COMMENT '答题开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '答题结束时间',
  `sno` char(12) DEFAULT NULL COMMENT '学号',
  `paper_id` int(11) DEFAULT NULL COMMENT '试卷id',
  PRIMARY KEY (`score_id`),
  KEY `score_sno` (`sno`),
  KEY `score_paper_id` (`paper_id`),
  CONSTRAINT `student_paper_score_ibfk_1` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`paper_id`),
  CONSTRAINT `student_paper_score_ibfk_2` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_paper_score
-- ----------------------------
INSERT INTO `student_paper_score` VALUES ('2', '41', '113770', '2019-03-24 18:04:47', '2019-03-24 18:06:42', '201521314321', '1');
INSERT INTO `student_paper_score` VALUES ('3', '23', '74330', '2019-03-25 14:57:40', '2019-03-25 14:58:55', '201521314323', '1');
INSERT INTO `student_paper_score` VALUES ('4', '79', '117353', '2019-03-25 15:06:01', '2019-03-25 15:08:00', '201521314322', '1');
INSERT INTO `student_paper_score` VALUES ('7', '54', '76000', '2019-03-25 15:43:54', '2019-03-25 15:45:10', '201521314301', '1');
INSERT INTO `student_paper_score` VALUES ('10', '28', '38214', '2019-03-25 15:50:04', '2019-03-25 15:50:44', '201521314330', '1');
INSERT INTO `student_paper_score` VALUES ('12', '35', '42209', '2019-03-25 15:54:24', '2019-03-25 15:55:08', '201521314316', '1');
INSERT INTO `student_paper_score` VALUES ('22', '24', '28672', '2019-03-31 21:21:42', '2019-03-31 21:22:12', '201521314303', '1');
INSERT INTO `student_paper_score` VALUES ('23', '43', '80000', '2019-03-31 22:48:32', '2019-03-31 22:49:52', '201521314304', '1');
INSERT INTO `student_paper_score` VALUES ('24', '34', '63871', '2019-03-31 23:00:40', '2019-03-31 23:01:46', '201521314305', '1');
INSERT INTO `student_paper_score` VALUES ('29', '41', '76180', '2019-04-01 20:30:19', '2019-04-01 20:31:37', '201521314318', '1');
INSERT INTO `student_paper_score` VALUES ('32', '10', '34478', '2019-04-08 23:40:42', '2019-04-08 23:41:18', '201521314701', '2');
INSERT INTO `student_paper_score` VALUES ('33', '14', '30187', '2019-04-08 23:42:15', '2019-04-08 23:42:46', '201521314301', '2');
INSERT INTO `student_paper_score` VALUES ('34', '20', '41001', '2019-04-08 23:45:56', '2019-04-08 23:46:37', '201521314700', '2');
INSERT INTO `student_paper_score` VALUES ('35', '52', '92894', '2019-04-08 23:46:53', '2019-04-08 23:48:28', '201521314700', '1');
INSERT INTO `student_paper_score` VALUES ('36', '18', '28750', '2019-04-08 23:49:35', '2019-04-08 23:50:04', '201521314610', '2');
INSERT INTO `student_paper_score` VALUES ('37', '14', '36190', '2019-04-11 23:42:15', '2019-04-11 23:42:52', '201521314321', '2');
INSERT INTO `student_paper_score` VALUES ('39', '28', '34092', '2019-04-13 17:58:21', '2019-04-13 17:58:56', '201521314310', '2');
INSERT INTO `student_paper_score` VALUES ('41', null, null, '2019-04-13 18:08:37', null, '201521314310', '1');
INSERT INTO `student_paper_score` VALUES ('43', null, null, '2019-04-27 16:19:20', null, '201521314321', '3');
INSERT INTO `student_paper_score` VALUES ('44', '4', '20456', '2019-04-27 23:43:56', '2019-04-27 23:44:16', '201521314321', '5');
INSERT INTO `student_paper_score` VALUES ('46', '26', '106664', '2020-05-03 21:40:05', '2020-05-03 21:46:32', '201511314003', '1');
INSERT INTO `student_paper_score` VALUES ('49', '12', '82809', '2020-05-05 13:18:55', '2020-05-05 13:20:18', '201511314003', '2');
INSERT INTO `student_paper_score` VALUES ('50', '33', '117891', '2020-05-05 14:02:35', '2020-05-05 14:04:33', '201612011189', '1');
INSERT INTO `student_paper_score` VALUES ('51', '0', '23165', '2020-05-06 22:26:19', '2020-05-06 22:26:42', '201612011189', '2');

-- ----------------------------
-- Table structure for subject_info
-- ----------------------------
DROP TABLE IF EXISTS `subject_info`;
CREATE TABLE `subject_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '题目标识',
  `subject_name` varchar(255) DEFAULT NULL COMMENT '题目',
  `optionA` varchar(255) DEFAULT NULL COMMENT '选项A',
  `optionB` varchar(255) DEFAULT NULL COMMENT '选项B',
  `optionC` varchar(255) DEFAULT NULL COMMENT '选项C',
  `optionD` varchar(255) DEFAULT NULL COMMENT '选项D',
  `right_result` varchar(255) DEFAULT NULL COMMENT '正确答案',
  `subject_score` int(255) DEFAULT NULL COMMENT '分值',
  `course_id` int(11) DEFAULT NULL COMMENT '课程标识',
  `class_info_id` int(11) DEFAULT NULL COMMENT '年级标识',
  `subject_type` char(1) DEFAULT NULL COMMENT '题目类型',
  `subject_easy` char(1) DEFAULT NULL COMMENT '难易程度',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `state_data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` char(1) NOT NULL DEFAULT 'A' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject_info
-- ----------------------------
INSERT INTO `subject_info` VALUES ('1', '铝具有良好抗腐蚀性能的原因是（?）.', '铝化学性质不活泼', '铝不与酸碱反应', '铝常温下不反应', '铝有氧化铝保护膜', 'D', '1', '1', '1', 'A', 'A', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('2', '下列有关国产Q460钢属于化学性质的是（?）。', '强度高', '能导电', '耐腐蚀', '抗震性好', 'C', '2', '1', '1', 'A', 'A', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('3', '正确的实验对实验结果、人身安全都非常重要。下列正确的是（?）。', '闻气体气味 ', '移走蒸发皿', '倾倒液体', '稀释浓硫酸', 'C', '1', '1', '1', 'A', 'A', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('4', '下列说法正确的是？', '青铜成分是铜和锡', '不绣钢就是纯铁', '生铁不含有碳元素', '黄铜只含有铜元素', 'A', '2', '1', '3', 'A', 'B', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('5', '不会对人类的生存环境造成危害的是( ).', '汽车排放的废气', '污水的任意排放', '随意丢弃废旧电池', '氢气燃烧的生成物', 'D', '2', '2', '2', 'A', 'B', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('6', '例如金刚石和石墨互称为同素异形体，下列各组物质属于同素异形体的是？', '氧气和臭氧', '氮气和液态氮　', '一氧化碳和二氧化碳', '生铁和钢', 'A', '1', '2', '2', 'A', 'B', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('7', '森林或草场发生火灾时，救火之一是在火场附近铲除树木和草类，形成“防火墙”，其理由是( )', '温度降到着火点下', '火源隔离', '空气隔绝', '变为不可燃物质', 'B', '2', '2', '2', 'A', 'C', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('8', '下列有关硒原子的说法中，不正确的是( )', '核外电子数为34', '核电荷数为79', '质子数为34', '中子数为45', 'B', '2', '3', '2', 'A', 'C', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('9', '在茉莉花的附近就能闻到花香，说明了( )。', '分子可以再分', '分子间有一定间隔', '分子在不断地运动', '分子的质量都很小', 'C', '1', '3', '2', 'A', 'C', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('10', '钢属于？', '金属材料', '合成材料', '天然材料', '复合材料', 'A', '2', '1', '3', 'A', 'A', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('11', '家庭安全知识和紧急灭火措施，是避免火灾的关键。下列说法你认为正确的是？', '油锅着盖灭', '明火检查液化气罐', '电器着火用水扑灭', '室内起火开窗通风', 'A', '1', '1', '3', 'A', 'A', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('12', '“每天一杯牛奶，强壮一个民族”，这应该其中含有丰富的钙、镁等。这里的钙、镁是指？', '元素', '原子', '分子', '离子', 'A', '2', '3', '3', 'A', 'A', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('13', '一瓶溶液标签只能看清“K”和“O4”。你猜想一定不合理的是(  ).', '高锰酸钾溶液', '锰酸钾溶液', '硫酸钾溶液', '碳酸钾溶液', 'D', '1', '3', '3', 'A', 'A', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('14', '“饭遭殃”是綦江的一种品牌食品，制作原料包含了以下物质，其中富含油脂的是？', '花生', '味精', '辣椒', '瘦牛肉', 'A', '2', '2', '4', 'A', 'D', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('15', '从燃烧条件看，“火要虚”的实质是（?）.', '增大可燃物的热值', '提高氧气的含量', '提高可燃物着火点', '增大与空气面积。', 'D', '1', '4', '4', 'A', 'D', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('16', '不用其他试剂，鉴别石蕊、盐酸、氢氧化钙、氢氧化钠、碳酸钠溶液，第二个被鉴别出来的是（?）.', '盐酸', '氢氧化钙', '氢氧化钠', '碳酸钠', 'D', '1', '4', '3', 'A', 'D', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('17', 'X、Y、Z金属中，Z不能和稀盐酸反应；将Y放入X的中，Y表面有X析出。则它们的活动性顺序为', 'Z>Y>X', 'X>Z>Y', 'Y>Z>X', 'Y>X>Z', 'D', '2', '4', '1', 'A', 'D', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('18', '搜救犬能根据人体发出的气味发现幸存者。分析搜救犬能发现幸存者的原因是(  )', '分子的质量很小', '分子的不断运动 ', '不同分子性质不同', '分子间有间隙', 'B', '2', '5', '2', 'A', 'D', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');
INSERT INTO `subject_info` VALUES ('19', '钾是维持人体生命和植物生长所必须的元素。关于钾元素的有关叙述错误的是(  )', '钾元素序数为19', '钾元素以单质存在', '钾元素质量为39.1', '施用草木灰', 'B', '2', '5', '1', 'A', 'A', null, '2020-04-01 15:20:12', '2020-04-01 15:20:12', 'A');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tno` char(6) NOT NULL COMMENT '教工号',
  `tea_psw` varchar(255) NOT NULL DEFAULT '123456' COMMENT '登录密码，默认为123456',
  `tea_name` varchar(255) NOT NULL COMMENT '教师姓名',
  `tea_sex` varchar(255) NOT NULL DEFAULT '' COMMENT '教师性别',
  `tea_email` varchar(255) DEFAULT NULL COMMENT '教师邮箱',
  `tea_phone` char(11) DEFAULT NULL COMMENT '教师手机号码',
  `tea_last_login_time` datetime DEFAULT NULL COMMENT '教师最近登录时间',
  PRIMARY KEY (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('100000', '123456', '杨老师', '男', '123456@qq.com', '13524569875', null);
INSERT INTO `teacher` VALUES ('100001', '123456', '高老师', '男', '123456@qq.com', '13658426951', null);
INSERT INTO `teacher` VALUES ('100100', '123456', '侯老师', '男', '123456@qq.com', '13658245962', null);
INSERT INTO `teacher` VALUES ('100860', '123456', '王老师', '男', '123456@qq.com', '13254859621', null);
INSERT INTO `teacher` VALUES ('123456', '123456', '胡老师', '男', '123456@qq.com', '13229622789', '2020-05-17 19:25:11');
INSERT INTO `teacher` VALUES ('160001', '123456', '张老师', '女', null, null, null);
INSERT INTO `teacher` VALUES ('160002', '123456', '毛老师', '女', null, null, null);
INSERT INTO `teacher` VALUES ('160003', '123456', '牛老师', '女', null, null, null);
INSERT INTO `teacher` VALUES ('160004', '123456', '吴老师', '女', null, null, null);
INSERT INTO `teacher` VALUES ('160005', '123456', '何老师', '女', null, null, null);
INSERT INTO `teacher` VALUES ('654321', '123456', '鸡你太美', '女', null, null, null);

-- ----------------------------
-- Table structure for teacher_course
-- ----------------------------
DROP TABLE IF EXISTS `teacher_course`;
CREATE TABLE `teacher_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '老师课程标识',
  `staff_no` varchar(50) DEFAULT NULL COMMENT '教师编号',
  `course_no` varchar(50) DEFAULT NULL COMMENT '课程编码',
  `class_no` varchar(50) DEFAULT NULL COMMENT '班级编码',
  `classroom_no` varchar(50) DEFAULT NULL COMMENT '教室编码',
  `class_time` varchar(255) DEFAULT NULL COMMENT '上课时间',
  `remark` varchar(1000) DEFAULT NULL,
  `state` char(1) NOT NULL DEFAULT 'A',
  `state_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_course
-- ----------------------------
INSERT INTO `teacher_course` VALUES ('1', '0322', '0305128000', '2018001001', '01-001', '13', null, 'A', '2020-04-03 14:14:39');
INSERT INTO `teacher_course` VALUES ('2', '0323', '0305128001', '2018001002', '01-002', '23', '多功能教室', 'A', '2020-04-03 14:14:39');
INSERT INTO `teacher_course` VALUES ('3', '0324', '0305128002', '2109001001', '01-003', '', '', 'A', '2020-04-03 14:14:39');
INSERT INTO `teacher_course` VALUES ('4', '0323', '0402120013', '2109001001', '10-001', '', '', 'A', '2020-04-03 14:30:13');
INSERT INTO `teacher_course` VALUES ('5', '011004', '0502111030', '17008001', '04-302', '01', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('6', '011004', '0502111030', '17008001', '04-303', '01', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('7', '011001', '0502111015', '16008001', '04-106', '01', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('8', '011001', '0502111015', '16008001', '04-209', '01', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('9', '011003', '0305128003', '16008003', '04-202', '01', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('10', '011003', '0305128003', '16008003', '04-102', '01', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('11', '051001', '0305128003', '16002102', '01-305', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('12', '051001', '0305128003', '16002102', '01-108', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('13', '051001', '0305128003', '16002102', '01-108', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('14', '051002', '0305134000', '16002103', '01-103', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('15', '051002', '0305134000', '16002103', '01-307', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('16', '031001', '0502111015', '16002001', '01-101', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('17', '031001', '0502111015', '16002001', '01-202', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('18', '031002', '0502111015', '16002002', '01-206', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('19', '031002', '0502111015', '16002002', '01-308', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('20', '041007', '0305128002', '16002101', '01-205', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('21', '041007', '0305128002', '16002101', '01-201', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('22', '041006', '0305128001', '18002006', '01-201', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('23', '041006', '0305128001', '18002006', '01-209', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('24', '041005', '0305128000', '18002005', '01-203', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('25', '041005', '0305128000', '18002005', '01-103', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('26', '041004', '0809412108', '18002004', '01-309', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('27', '041004', '0809412108', '18002004', '01-108', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('28', '041003', '0809212017', '18002003', '01-207', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('29', '041003', '0809212017', '18002003', '01-209', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('30', '011007', '0502111015', '17008003', '01-105', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('31', '011007', '0502111015', '17008003', '01-305', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('32', '021002', '0402120012', '18008002', '01-203', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('33', '021002', '0402120012', '18008002', '01-206', '02', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('34', '031003', '0702120209', '16002003', '05-210', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('35', '031003', '0702120209', '16002003', '05-105', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('36', '031004', '0702920401', '17002001', '05-209', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('37', '031004', '0702920401', '17002001', '05-204', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('38', '031005', '0306131000', '17002002', '05-207', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('39', '031005', '0306131000', '17002002', '05-104', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('40', '031007', '0303132002', '17002003', '05-104', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('41', '031007', '0303132002', '17002003', '05-106', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('42', '041001', '0303132003', '18002001', '05-102', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('43', '041001', '0303132003', '18002001', '05-101', '04', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('44', '051003', '0502111029', '17002101', '03-209', '06', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('45', '051003', '0502111029', '17002101', '03-202', '06', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('46', '021005', '0502111015', '19008001', '06-104', '08', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('47', '021005', '0502111015', '19008001', '06-203', '08', null, 'A', '2020-04-07 16:40:28');
INSERT INTO `teacher_course` VALUES ('48', '011004', '0502111030', '17008001', '04-204', '01', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('49', '011004', '0502111030', '17008001', '04-302', '01', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('50', '011001', '0502111015', '16008001', '04-104', '01', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('51', '011001', '0502111015', '16008001', '04-205', '01', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('52', '011003', '0305128003', '16008003', '04-110', '01', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('53', '011003', '0305128003', '16008003', '04-304', '01', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('54', '051001', '0305128003', '16002102', '01-201', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('55', '051001', '0305128003', '16002102', '01-204', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('56', '051001', '0305128003', '16002102', '01-206', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('57', '051002', '0305134000', '16002103', '01-108', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('58', '051002', '0305134000', '16002103', '01-202', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('59', '031001', '0502111015', '16002001', '01-305', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('60', '031001', '0502111015', '16002001', '01-306', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('61', '031002', '0502111015', '16002002', '01-309', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('62', '031002', '0502111015', '16002002', '01-308', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('63', '041007', '0305128002', '16002101', '01-105', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('64', '041007', '0305128002', '16002101', '01-206', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('65', '041006', '0305128001', '18002006', '01-306', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('66', '041006', '0305128001', '18002006', '01-108', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('67', '041005', '0305128000', '18002005', '01-302', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('68', '041005', '0305128000', '18002005', '01-109', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('69', '041004', '0809412108', '18002004', '01-104', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('70', '041004', '0809412108', '18002004', '01-203', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('71', '041003', '0809212017', '18002003', '01-107', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('72', '041003', '0809212017', '18002003', '01-202', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('73', '011007', '0502111015', '17008003', '01-205', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('74', '011007', '0502111015', '17008003', '01-307', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('75', '021002', '0402120012', '18008002', '01-101', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('76', '021002', '0402120012', '18008002', '01-304', '02', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('77', '031003', '0702120209', '16002003', '05-103', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('78', '031003', '0702120209', '16002003', '05-107', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('79', '031004', '0702920401', '17002001', '05-107', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('80', '031004', '0702920401', '17002001', '05-202', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('81', '031005', '0306131000', '17002002', '05-204', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('82', '031005', '0306131000', '17002002', '05-105', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('83', '031007', '0303132002', '17002003', '05-205', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('84', '031007', '0303132002', '17002003', '05-106', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('85', '041001', '0303132003', '18002001', '05-101', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('86', '041001', '0303132003', '18002001', '05-203', '04', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('87', '051003', '0502111029', '17002101', '03-203', '06', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('88', '051003', '0502111029', '17002101', '03-202', '06', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('89', '021005', '0502111015', '19008001', '06-107', '08', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('90', '021005', '0502111015', '19008001', '06-108', '08', null, 'A', '2020-04-22 09:49:46');
INSERT INTO `teacher_course` VALUES ('91', '011001', '0502111015', '16001101', '04-208', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('92', '011001', '0502111015', '16001101', '04-101', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('93', '011001', '0502111015', '16001101', '04-206', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('94', '011001', '0502111015', '16001101', '04-207', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('95', '011001', '0502111015', '16001101', '04-105', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('96', '011004', '0502111030', '17008001', '04-102', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('97', '011004', '0502111030', '17008001', '04-305', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('98', '011003', '0305128003', '16008003', '04-102', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('99', '011003', '0305128003', '16008003', '04-303', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('100', '151009', '0701120117', '18001106', '04-204', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('101', '151009', '0701120117', '18001106', '04-307', '01', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('102', '051001', '0305128003', '16002102', '01-101', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('103', '051001', '0305128003', '16002102', '01-305', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('104', '051001', '0305128003', '16002102', '01-307', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('105', '051002', '0305134000', '16002103', '01-301', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('106', '051002', '0305134000', '16002103', '01-110', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('107', '031001', '0502111015', '16002001', '01-104', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('108', '031001', '0502111015', '16002001', '01-204', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('109', '031002', '0502111015', '16002002', '01-107', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('110', '031002', '0502111015', '16002002', '01-202', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('111', '041007', '0305128002', '16002101', '01-302', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('112', '041007', '0305128002', '16002101', '01-107', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('113', '041006', '0305128001', '18002006', '01-207', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('114', '041006', '0305128001', '18002006', '01-102', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('115', '041005', '0305128000', '18002005', '01-207', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('116', '041005', '0305128000', '18002005', '01-307', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('117', '041004', '0809412108', '18002004', '01-109', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('118', '041004', '0809412108', '18002004', '01-306', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('119', '041003', '0809212017', '18002003', '01-204', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('120', '041003', '0809212017', '18002003', '01-110', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('121', '011007', '0502111015', '17008003', '01-201', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('122', '011007', '0502111015', '17008003', '01-210', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('123', '021002', '0402120012', '18008002', '01-305', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('124', '021002', '0402120012', '18008002', '01-101', '02', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('125', '031003', '0702120209', '16002003', '05-205', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('126', '031003', '0702120209', '16002003', '05-109', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('127', '031004', '0702920401', '17002001', '05-204', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('128', '031004', '0702920401', '17002001', '05-206', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('129', '031005', '0306131000', '17002002', '05-203', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('130', '031005', '0306131000', '17002002', '05-106', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('131', '031007', '0303132002', '17002003', '05-108', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('132', '031007', '0303132002', '17002003', '05-209', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('133', '041001', '0303132003', '18002001', '05-104', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('134', '041001', '0303132003', '18002001', '05-103', '04', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('135', '051003', '0502111029', '17002101', '03-305', '06', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('136', '051003', '0502111029', '17002101', '03-105', '06', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('137', '021005', '0502111015', '19008001', '06-201', '08', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('138', '021005', '0502111015', '19008001', '06-110', '08', null, 'A', '2020-05-05 17:33:53');
INSERT INTO `teacher_course` VALUES ('139', '011001', '0502111015', '16001101', '04-105', '01', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('140', '011001', '0502111015', '16001101', '04-306', '01', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('141', '011001', '0502111015', '16001101', '04-106', '01', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('142', '011001', '0502111015', '16001101', '04-107', '01', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('143', '011001', '0502111015', '16001101', '04-304', '01', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('144', '011004', '0502111030', '17008001', '04-104', '01', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('145', '011004', '0502111030', '17008001', '04-206', '01', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('146', '011003', '0305128003', '16008003', '04-108', '01', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('147', '011003', '0305128003', '16008003', '04-304', '01', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('148', '151009', '0701120117', '18001106', '04-103', '01', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('149', '151009', '0701120117', '18001106', '04-308', '01', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('150', '051001', '0305128003', '16002102', '01-203', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('151', '051001', '0305128003', '16002102', '01-301', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('152', '051001', '0305128003', '16002102', '01-302', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('153', '051002', '0305134000', '16002103', '01-207', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('154', '051002', '0305134000', '16002103', '01-106', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('155', '031001', '0502111015', '16002001', '01-103', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('156', '031001', '0502111015', '16002001', '01-108', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('157', '031002', '0502111015', '16002002', '01-305', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('158', '031002', '0502111015', '16002002', '01-203', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('159', '041007', '0305128002', '16002101', '01-203', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('160', '041007', '0305128002', '16002101', '01-309', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('161', '041006', '0305128001', '18002006', '01-308', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('162', '041006', '0305128001', '18002006', '01-104', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('163', '041005', '0305128000', '18002005', '01-207', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('164', '041005', '0305128000', '18002005', '01-208', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('165', '041004', '0809412108', '18002004', '01-106', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('166', '041004', '0809412108', '18002004', '01-107', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('167', '041003', '0809212017', '18002003', '01-106', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('168', '041003', '0809212017', '18002003', '01-203', '02', null, 'A', '2020-05-05 17:35:38');
INSERT INTO `teacher_course` VALUES ('169', '011007', '0502111015', '17008003', '01-204', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('170', '011007', '0502111015', '17008003', '01-210', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('171', '021002', '0402120012', '18008002', '01-204', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('172', '021002', '0402120012', '18008002', '01-303', '02', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('173', '031003', '0702120209', '16002003', '05-107', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('174', '031003', '0702120209', '16002003', '05-102', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('175', '031004', '0702920401', '17002001', '05-101', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('176', '031004', '0702920401', '17002001', '05-205', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('177', '031005', '0306131000', '17002002', '05-105', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('178', '031005', '0306131000', '17002002', '05-208', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('179', '031007', '0303132002', '17002003', '05-204', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('180', '031007', '0303132002', '17002003', '05-102', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('181', '041001', '0303132003', '18002001', '05-105', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('182', '041001', '0303132003', '18002001', '05-103', '04', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('183', '051003', '0502111029', '17002101', '03-208', '06', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('184', '051003', '0502111029', '17002101', '03-101', '06', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('185', '021005', '0502111015', '19008001', '06-104', '08', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('186', '021005', '0502111015', '19008001', '06-107', '08', null, 'A', '2020-05-05 17:35:39');
INSERT INTO `teacher_course` VALUES ('187', '011001', '0502111015', '16001101', '04-106', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('188', '011001', '0502111015', '16001101', '04-303', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('189', '011001', '0502111015', '16001101', '04-101', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('190', '011001', '0502111015', '16001101', '04-201', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('191', '011001', '0502111015', '16001101', '04-102', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('192', '011004', '0502111030', '17008001', '04-305', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('193', '011004', '0502111030', '17008001', '04-103', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('194', '011003', '0305128003', '16008003', '04-101', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('195', '011003', '0305128003', '16008003', '04-203', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('196', '151009', '0701120117', '18001106', '04-210', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('197', '151009', '0701120117', '18001106', '04-209', '01', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('198', '051001', '0305128003', '16002102', '01-304', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('199', '051001', '0305128003', '16002102', '01-306', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('200', '051001', '0305128003', '16002102', '01-207', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('201', '051002', '0305134000', '16002103', '01-302', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('202', '051002', '0305134000', '16002103', '01-107', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('203', '031001', '0502111015', '16002001', '01-309', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('204', '031001', '0502111015', '16002001', '01-203', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('205', '031002', '0502111015', '16002002', '01-207', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('206', '031002', '0502111015', '16002002', '01-304', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('207', '041007', '0305128002', '16002101', '01-103', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('208', '041007', '0305128002', '16002101', '01-205', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('209', '041006', '0305128001', '18002006', '01-203', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('210', '041006', '0305128001', '18002006', '01-107', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('211', '041005', '0305128000', '18002005', '01-106', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('212', '041005', '0305128000', '18002005', '01-102', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('213', '041004', '0809412108', '18002004', '01-110', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('214', '041004', '0809412108', '18002004', '01-201', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('215', '041003', '0809212017', '18002003', '01-106', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('216', '041003', '0809212017', '18002003', '01-201', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('217', '011007', '0502111015', '17008003', '01-304', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('218', '011007', '0502111015', '17008003', '01-106', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('219', '021002', '0402120012', '18008002', '01-106', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('220', '021002', '0402120012', '18008002', '01-204', '02', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('221', '031003', '0702120209', '16002003', '05-102', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('222', '031003', '0702120209', '16002003', '05-210', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('223', '031004', '0702920401', '17002001', '05-207', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('224', '031004', '0702920401', '17002001', '05-109', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('225', '031005', '0306131000', '17002002', '05-108', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('226', '031005', '0306131000', '17002002', '05-105', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('227', '031007', '0303132002', '17002003', '05-108', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('228', '031007', '0303132002', '17002003', '05-201', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('229', '041001', '0303132003', '18002001', '05-202', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('230', '041001', '0303132003', '18002001', '05-103', '04', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('231', '051003', '0502111029', '17002101', '03-110', '06', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('232', '051003', '0502111029', '17002101', '03-107', '06', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('233', '021005', '0502111015', '19008001', '06-204', '08', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('234', '021005', '0502111015', '19008001', '06-104', '08', null, 'A', '2020-05-06 10:03:31');
INSERT INTO `teacher_course` VALUES ('235', '011001', '0502111015', '16001101', '04-202', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('236', '011001', '0502111015', '16001101', '04-107', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('237', '011001', '0502111015', '16001101', '04-107', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('238', '011001', '0502111015', '16001101', '04-305', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('239', '011001', '0502111015', '16001101', '04-204', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('240', '011004', '0502111030', '17008001', '04-306', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('241', '011004', '0502111030', '17008001', '04-207', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('242', '011003', '0305128003', '16008003', '04-107', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('243', '011003', '0305128003', '16008003', '04-106', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('244', '151009', '0701120117', '18001106', '04-104', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('245', '151009', '0701120117', '18001106', '04-210', '01', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('246', '051001', '0305128003', '16002102', '01-107', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('247', '051001', '0305128003', '16002102', '01-308', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('248', '051001', '0305128003', '16002102', '01-109', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('249', '051002', '0305134000', '16002103', '01-106', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('250', '051002', '0305134000', '16002103', '01-202', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('251', '031001', '0502111015', '16002001', '01-104', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('252', '031001', '0502111015', '16002001', '01-107', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('253', '031002', '0502111015', '16002002', '01-209', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('254', '031002', '0502111015', '16002002', '01-305', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('255', '041007', '0305128002', '16002101', '01-210', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('256', '041007', '0305128002', '16002101', '01-310', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('257', '041006', '0305128001', '18002006', '01-203', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('258', '041006', '0305128001', '18002006', '01-205', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('259', '041005', '0305128000', '18002005', '01-308', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('260', '041005', '0305128000', '18002005', '01-110', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('261', '041004', '0809412108', '18002004', '01-102', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('262', '041004', '0809412108', '18002004', '01-104', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('263', '041003', '0809212017', '18002003', '01-203', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('264', '041003', '0809212017', '18002003', '01-107', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('265', '011007', '0502111015', '17008003', '01-305', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('266', '011007', '0502111015', '17008003', '01-208', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('267', '021002', '0402120012', '18008002', '01-304', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('268', '021002', '0402120012', '18008002', '01-304', '02', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('269', '031003', '0702120209', '16002003', '05-104', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('270', '031003', '0702120209', '16002003', '05-108', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('271', '031004', '0702920401', '17002001', '05-102', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('272', '031004', '0702920401', '17002001', '05-103', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('273', '031005', '0306131000', '17002002', '05-209', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('274', '031005', '0306131000', '17002002', '05-204', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('275', '031007', '0303132002', '17002003', '05-206', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('276', '031007', '0303132002', '17002003', '05-210', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('277', '041001', '0303132003', '18002001', '05-108', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('278', '041001', '0303132003', '18002001', '05-108', '04', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('279', '051003', '0502111029', '17002101', '03-205', '06', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('280', '051003', '0502111029', '17002101', '03-302', '06', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('281', '021005', '0502111015', '19008001', '06-207', '08', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('282', '021005', '0502111015', '19008001', '06-204', '08', null, 'A', '2020-05-06 10:05:29');
INSERT INTO `teacher_course` VALUES ('283', '011001', '0502111015', '16001101', '04-207', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('284', '011001', '0502111015', '16001101', '04-304', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('285', '011001', '0502111015', '16001101', '04-104', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('286', '011001', '0502111015', '16001101', '04-103', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('287', '011001', '0502111015', '16001101', '04-209', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('288', '011004', '0502111030', '17008001', '04-209', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('289', '011004', '0502111030', '17008001', '04-204', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('290', '011003', '0305128003', '16008003', '04-109', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('291', '011003', '0305128003', '16008003', '04-108', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('292', '151009', '0701120117', '18001106', '04-304', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('293', '151009', '0701120117', '18001106', '04-208', '01', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('294', '051001', '0305128003', '16002102', '01-101', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('295', '051001', '0305128003', '16002102', '01-105', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('296', '051001', '0305128003', '16002102', '01-102', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('297', '051002', '0305134000', '16002103', '01-210', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('298', '051002', '0305134000', '16002103', '01-306', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('299', '031001', '0502111015', '16002001', '01-108', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('300', '031001', '0502111015', '16002001', '01-307', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('301', '031002', '0502111015', '16002002', '01-203', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('302', '031002', '0502111015', '16002002', '01-109', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('303', '041007', '0305128002', '16002101', '01-107', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('304', '041007', '0305128002', '16002101', '01-307', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('305', '041006', '0305128001', '18002006', '01-308', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('306', '041006', '0305128001', '18002006', '01-202', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('307', '041005', '0305128000', '18002005', '01-302', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('308', '041005', '0305128000', '18002005', '01-110', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('309', '041004', '0809412108', '18002004', '01-307', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('310', '041004', '0809412108', '18002004', '01-109', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('311', '041003', '0809212017', '18002003', '01-105', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('312', '041003', '0809212017', '18002003', '01-205', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('313', '011007', '0502111015', '17008003', '01-101', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('314', '011007', '0502111015', '17008003', '01-204', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('315', '021002', '0402120012', '18008002', '01-305', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('316', '021002', '0402120012', '18008002', '01-107', '02', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('317', '031003', '0702120209', '16002003', '05-106', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('318', '031003', '0702120209', '16002003', '05-110', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('319', '031004', '0702920401', '17002001', '05-105', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('320', '031004', '0702920401', '17002001', '05-207', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('321', '031005', '0306131000', '17002002', '05-207', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('322', '031005', '0306131000', '17002002', '05-104', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('323', '031007', '0303132002', '17002003', '05-105', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('324', '031007', '0303132002', '17002003', '05-104', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('325', '041001', '0303132003', '18002001', '05-203', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('326', '041001', '0303132003', '18002001', '05-210', '04', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('327', '051003', '0502111029', '17002101', '03-305', '06', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('328', '051003', '0502111029', '17002101', '03-307', '06', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('329', '021005', '0502111015', '19008001', '06-107', '08', null, 'A', '2020-05-08 22:35:23');
INSERT INTO `teacher_course` VALUES ('330', '021005', '0502111015', '19008001', '06-104', '08', null, 'A', '2020-05-08 22:35:23');

-- ----------------------------
-- Table structure for teacher_notice
-- ----------------------------
DROP TABLE IF EXISTS `teacher_notice`;
CREATE TABLE `teacher_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师公告id',
  `notice_content` varchar(255) NOT NULL COMMENT '公告内容',
  `notice_create_time` datetime DEFAULT NULL COMMENT '公告创建时间',
  `tea_name` varchar(255) DEFAULT NULL COMMENT '创建公告的教师姓名',
  `tno` char(6) DEFAULT NULL COMMENT '创建公告教工号',
  `sno` char(12) DEFAULT NULL COMMENT '学号',
  `is_see` varchar(255) DEFAULT NULL COMMENT '是否查看',
  PRIMARY KEY (`notice_id`),
  KEY `notice_tno` (`tno`),
  KEY `notice_sno` (`sno`),
  CONSTRAINT `teacher_notice_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`),
  CONSTRAINT `teacher_notice_ibfk_2` FOREIGN KEY (`tno`) REFERENCES `teacher` (`tno`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_notice
-- ----------------------------
INSERT INTO `teacher_notice` VALUES ('1', '2019年3月1号下午两点到四点将会有一场计算机图形学在线考试，请同学们做好相关考试准备。', '2019-03-13 19:43:07', '胡老师', '123456', null, null);
INSERT INTO `teacher_notice` VALUES ('2', '2019年3月2号下午两点到四点将会有一场Java语言程序设计在线考试，请同学们做好相关考试准备。', '2019-03-13 19:43:23', '高老师', '100001', null, null);
INSERT INTO `teacher_notice` VALUES ('3', '2019年3月3号下午两点到四点将会有一场数据库原理与设计在线考试，请同学们做好相关考试准备。', '2019-03-13 19:43:41', '杨老师', '100000', null, null);
INSERT INTO `teacher_notice` VALUES ('4', '2019年3月4号下午两点到四点将会有一场C++语言程序设计在线考试，请同学们做好相关考试准备。', '2019-03-13 19:43:55', '杨老师', '100000', null, null);
INSERT INTO `teacher_notice` VALUES ('5', '2019年3月5号下午两点到四点将会有一场Web程序设计在线考试，请同学们做好相关考试准备。', '2019-03-13 19:45:03', '侯老师', '100100', null, null);
INSERT INTO `teacher_notice` VALUES ('6', '2019年3月6号下午两点到四点将会有一场Android程序设计在线考试，请同学们做好相关考试准备。', '2019-03-13 19:45:09', '侯老师', '100100', null, null);
INSERT INTO `teacher_notice` VALUES ('7', '2019年3月7号下午两点到四点将会有一场计算机网络编程在线考试，请同学们做好相关考试准备。', '2019-03-13 19:45:19', '王老师', '100860', null, null);
INSERT INTO `teacher_notice` VALUES ('8', '2019年3月8号下午两点到四点将会有一场PHP语言程序设计在线考试，请同学们做好相关考试准备。', '2019-03-13 19:45:36', '侯老师', '100100', null, null);
INSERT INTO `teacher_notice` VALUES ('9', '2019年3月9号下午两点到四点将会有一场Ruby语言程序设计在线考试，请同学们做好相关考试准备。', '2019-03-14 16:38:08', '高老师', '100001', null, null);
INSERT INTO `teacher_notice` VALUES ('10', '2019年3月10号下午两点到四点将会有一场JavaScript语言程序设计在线考试，请同学们做好相关考试准备。', '2019-03-14 16:40:00', '侯老师', '100100', null, null);
INSERT INTO `teacher_notice` VALUES ('15', '2019年3月11号下午两点到四点将会有一场计算机图形学在线考试，请同学们做好相关考试准备。', '2019-04-11 17:49:28', '胡老师', '123456', null, null);
INSERT INTO `teacher_notice` VALUES ('16', '2019年3月12号下午两点到四点将会有一场计算机图形学在线考试，请同学们做好相关考试准备。', '2019-04-11 17:49:45', '胡老师', '123456', null, null);
INSERT INTO `teacher_notice` VALUES ('37', '2019年4月22号下午两点到四点将会有一场计算机图形学在线考试，请同学们做好相关考试准备。', '2019-04-22 18:44:29', '胡老师', '123456', null, null);
INSERT INTO `teacher_notice` VALUES ('39', '2019年4月23号下午两点到四点将会有一场计算机图形学在线考试，请同学们做好相关考试准备。', '2019-04-22 19:40:09', '胡老师', '123456', null, null);
INSERT INTO `teacher_notice` VALUES ('42', '2019年4月25号下午两点到四点将会有一场前端测试在线考试，请同学们做好相关考试准备。', '2019-04-25 18:00:28', '胡老师', '123456', null, null);
INSERT INTO `teacher_notice` VALUES ('47', '2019年5月7号下午两点到四点将会有一场前端测试在线考试，请同学们做好相关考试准备。', '2019-05-07 16:48:26', '胡老师', '123456', null, null);

-- ----------------------------
-- Table structure for teach_build_info
-- ----------------------------
DROP TABLE IF EXISTS `teach_build_info`;
CREATE TABLE `teach_build_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教学楼标识',
  `teach_build_name` varchar(255) DEFAULT NULL COMMENT '教学楼名称',
  `teach_build_number` varchar(255) DEFAULT NULL COMMENT '教学楼编号',
  `remark` varchar(1000) DEFAULT NULL,
  `state` char(1) DEFAULT 'A',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teach_build_info
-- ----------------------------
INSERT INTO `teach_build_info` VALUES ('1', '1号教学楼', '01', null, 'A', '2020-04-03 20:36:53');
INSERT INTO `teach_build_info` VALUES ('2', '2号教学楼', '02', null, 'A', '2020-04-03 20:36:53');
INSERT INTO `teach_build_info` VALUES ('3', '3号教学楼', '03', '', 'A', '2020-04-03 20:38:03');
INSERT INTO `teach_build_info` VALUES ('4', '4号教学楼', '04', null, 'A', '2020-04-03 20:37:57');
INSERT INTO `teach_build_info` VALUES ('5', '化生楼', '05', null, 'A', '2020-04-03 20:37:57');
INSERT INTO `teach_build_info` VALUES ('6', '美术楼', '06', null, 'A', '2020-04-03 20:37:57');
INSERT INTO `teach_build_info` VALUES ('7', '音乐楼', '07', null, 'A', '2020-04-03 20:37:57');
INSERT INTO `teach_build_info` VALUES ('8', '体育楼', '08', null, 'A', '2020-04-03 20:37:57');
INSERT INTO `teach_build_info` VALUES ('9', '实验大楼', '09', null, 'A', '2020-04-03 20:37:57');
INSERT INTO `teach_build_info` VALUES ('10', '医学实验楼', '10', null, 'A', '2020-04-03 20:37:57');
INSERT INTO `teach_build_info` VALUES ('11', '逸夫楼', '11', null, 'A', '2020-04-03 20:37:57');

-- ----------------------------
-- Table structure for teach_plan
-- ----------------------------
DROP TABLE IF EXISTS `teach_plan`;
CREATE TABLE `teach_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term_name` varchar(255) DEFAULT NULL COMMENT '学期编码',
  `class_no` varchar(255) DEFAULT NULL COMMENT '班级编码',
  `course_no` varchar(255) DEFAULT NULL COMMENT '课程编码',
  `school_no` varchar(255) DEFAULT NULL COMMENT '学院编码',
  `student_number` int(11) DEFAULT NULL COMMENT '学生人数',
  `course_attr` varchar(255) DEFAULT NULL COMMENT '课程性质',
  `class_hour` int(4) DEFAULT NULL COMMENT '课时',
  `weeks_number` int(11) DEFAULT NULL COMMENT '周数',
  `weeks_sum` int(11) DEFAULT NULL COMMENT '周学时',
  `remark` varchar(255) DEFAULT NULL,
  `state` char(1) NOT NULL DEFAULT 'A',
  `state_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teach_plan
-- ----------------------------

-- ----------------------------
-- Table structure for token_info
-- ----------------------------
DROP TABLE IF EXISTS `token_info`;
CREATE TABLE `token_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL COMMENT '授权码',
  `apply_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '申请时间',
  `expire_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '失效时间',
  `count_auth` varchar(255) DEFAULT NULL COMMENT '授权次数',
  `max_count_auth` varchar(255) DEFAULT NULL COMMENT '最大授权次数',
  `ussage` varchar(255) DEFAULT NULL COMMENT '用途',
  `state` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of token_info
-- ----------------------------
INSERT INTO `token_info` VALUES ('26', '2', '1587647ce44HRct14t65k55Y645510', '2020-04-23 21:14:06', '2020-04-23 21:14:06', '0', '1000', 'default', 'A');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(2) NOT NULL AUTO_INCREMENT COMMENT '用户标识',
  `user_name` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码（AES128加密）',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `state_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '状态日期',
  `state` char(1) NOT NULL DEFAULT 'A' COMMENT '状态：\r\nA-在用;\r\nX-删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`user_name`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'dylan', '0856F099633D4220A9EBD44317411A71', '', null, '2019-04-24 12:32:00', '2020-04-30 14:40:47', 'A');
INSERT INTO `user` VALUES ('2', 'zhuxuan', '9AA641979A5F96CE438CAC2E29A776E3', '15605188107', null, '2019-04-24 15:34:57', '2020-04-30 15:30:14', 'A');
INSERT INTO `user` VALUES ('3', 'ww', '6F44E11CD015C4792AFB263461CBE626', '15806182803', null, '2019-04-24 15:43:38', '2020-04-30 15:30:14', 'A');
INSERT INTO `user` VALUES ('4', 'xgh', '6186F797ED207836719AE213D495C8DB', '17687223125', null, '2019-04-24 15:43:49', '2020-04-30 15:30:14', 'A');
INSERT INTO `user` VALUES ('5', 'wjx', '9D34F1942D201D0188E2B5E1816DD2B6', '17761979950', null, '2019-04-24 15:44:15', '2020-04-30 15:30:14', 'A');
INSERT INTO `user` VALUES ('6', '827322286', 'CFDFD8B40042E8D9879FDF18A3F7CA37', '15605180215', null, '2019-04-24 15:44:36', '2020-04-30 15:30:14', 'A');
INSERT INTO `user` VALUES ('7', 'Yatoo', '97A0F658304D9B47940DE6F3BDA779C1', '15195762938', null, '2019-04-24 15:45:01', '2020-04-30 15:30:14', 'A');
INSERT INTO `user` VALUES ('8', 'zlf', '611FDAECB497C60B48DC292995816256', '18551987180', null, '2019-04-24 15:46:14', '2020-04-30 15:30:14', 'A');
INSERT INTO `user` VALUES ('9', 'Asa', 'EFD1D99904D2EB89832E35C4A24D715A', null, '1518009427@qq.com', '2019-04-24 15:51:58', '2020-04-30 15:30:14', 'A');
INSERT INTO `user` VALUES ('11', 'jit_wdm', 'FF9CEABE5F63F4315D1704433A5A10F8', '18068489971', null, '2019-05-08 16:46:11', '2020-04-30 15:30:14', 'A');
INSERT INTO `user` VALUES ('12', 'yac3526641', '84CBFF35A1DD07614946BEA390925EE5', '15605188292', null, '2019-05-09 13:36:51', '2020-04-30 15:30:14', 'A');
INSERT INTO `user` VALUES ('13', 'Kwg', 'CE9995747A934D928A28C6D640C849A4', '18852075903', null, '2019-05-09 15:30:12', '2020-04-30 15:30:14', 'A');
INSERT INTO `user` VALUES ('14', 'rzj', 'B2F2BB1356C0285B13CF6807BFCAFBB7', '13327791704', null, '2019-05-11 15:21:39', '2020-04-30 15:30:14', 'A');
INSERT INTO `user` VALUES ('15', 'wy', '07C64FA5D7FF69E97337BFF427834BCA', '18852070321', null, '2019-06-13 21:43:52', '2020-04-30 15:30:14', 'A');
INSERT INTO `user` VALUES ('19', 'jit_nkz', '5996ABD2CD96A8B1B9F892CBC4370FCD', '15651806205', null, '2019-04-25 17:20:14', '2020-04-27 17:33:28', 'A');

-- ----------------------------
-- Table structure for user_menu
-- ----------------------------
DROP TABLE IF EXISTS `user_menu`;
CREATE TABLE `user_menu` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(6) unsigned NOT NULL,
  `menu_id` int(6) unsigned NOT NULL,
  `state` char(1) NOT NULL DEFAULT 'A',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_menu
-- ----------------------------
INSERT INTO `user_menu` VALUES ('1', '19', '1', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('2', '19', '5', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('3', '19', '6', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('4', '19', '7', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('5', '19', '8', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('6', '19', '9', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('7', '19', '10', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('8', '19', '11', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('9', '19', '12', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('10', '19', '2', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('11', '19', '13', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('12', '19', '14', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('13', '19', '15', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('14', '19', '16', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('15', '19', '17', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('16', '19', '18', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('17', '19', '3', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('18', '19', '19', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('19', '19', '20', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('20', '19', '21', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('21', '19', '4', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('22', '19', '22', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('23', '19', '27', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('24', '19', '24', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('25', '19', '25', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');
INSERT INTO `user_menu` VALUES ('26', '19', '26', 'A', '2020-05-06 18:55:58', '2020-05-06 18:55:58');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `role_id` int(2) NOT NULL COMMENT '角色标识',
  `user_id` int(10) NOT NULL COMMENT '用户标识',
  `state` char(1) DEFAULT 'A',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '19', 'A');

-- ----------------------------
-- Table structure for video_info
-- ----------------------------
DROP TABLE IF EXISTS `video_info`;
CREATE TABLE `video_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频标识',
  `title` varchar(50) DEFAULT NULL COMMENT '视频名称',
  `url` varchar(100) DEFAULT NULL COMMENT '播放地址',
  `upload_userid` int(11) DEFAULT NULL COMMENT '上传用户标识',
  `count_play` int(11) DEFAULT NULL COMMENT '播放量',
  `count_like` int(11) DEFAULT NULL COMMENT '播放量',
  `pic_url` varchar(100) DEFAULT NULL COMMENT '封面地址',
  `description` varchar(1000) DEFAULT NULL COMMENT '描述',
  `upload_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间',
  `state` char(1) NOT NULL DEFAULT 'A' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_info
-- ----------------------------
INSERT INTO `video_info` VALUES ('1', '9-1.mp4', '/upload/video/20200411134123_9-1.mp4', '1', '1', '3', 'upload/video/img.jpg', '最短路径问题是图论研究中的一个经典算法问题， 旨在寻找图（由结点和路径组成的）中两结点之间的最短路径。 算法具体的形式包括：确定起点的最短路径问题 - 即已知起始结点，求最短路径的问题。 [1] \r\n确定终点的最短路径问题 - 与确定起点的问题相反，该问题是已知终结结点，求最短路径的问题。在无向图中该问题与确定起点的问题完全等同，在有向图中该问题等同于把所有路径方向反转的确定起点的问题。\r\n确定起点终点的最短路径问题 - 即已知起点和终点，求两结点之间的最短路径。\r\n全局最短路径问题 - 求图中所有的最短路径。', '2020-04-30 14:56:21', 'A');
INSERT INTO `video_info` VALUES ('2', '28-1 课程总结.mp4', '/upload/video/20200411220913_28-1 课程总结.mp4', '1', '1', '1', 'upload/video/img2.jpg', null, '2020-04-30 14:29:58', 'A');

-- ----------------------------
-- Table structure for year_term
-- ----------------------------
DROP TABLE IF EXISTS `year_term`;
CREATE TABLE `year_term` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `term_name` varchar(20) NOT NULL COMMENT '年份与学期表 ：2015-2016-1，2015-2016-2',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `state_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of year_term
-- ----------------------------
INSERT INTO `year_term` VALUES ('1', '2010-2011-1', '2010至2011学年第一学期', '2019-07-06 21:36:37', 'A');
INSERT INTO `year_term` VALUES ('2', '2010-2011-2', '2010至2011学年第二学期', '2019-07-06 21:36:41', 'A');
INSERT INTO `year_term` VALUES ('3', '2011-2012-1', '2011至2012学年第一学期', '2019-07-06 21:36:51', 'A');
INSERT INTO `year_term` VALUES ('4', '2011-2012-2', '2011至2012学年第二学期', '2019-07-06 21:36:59', 'A');
INSERT INTO `year_term` VALUES ('5', '2012-2013-1', '2012至2013学年第一学期', '2019-07-06 21:37:14', 'A');
INSERT INTO `year_term` VALUES ('6', '2012-2013-2', '2012至2013学年第二学期', '2019-08-05 17:42:14', 'A');
INSERT INTO `year_term` VALUES ('7', '2013-2014-1', '2013至2014学年第一学期', '2019-08-05 17:42:17', 'A');
INSERT INTO `year_term` VALUES ('8', '2013-2014-2', '2013至2014学年第二学期', '2019-08-05 17:42:22', 'A');
INSERT INTO `year_term` VALUES ('9', '2014-2015-1', '2014至2015学年第一学期', '2019-08-05 17:42:24', 'A');
INSERT INTO `year_term` VALUES ('10', '2014-2015-2', '2014至2015学年第二学期', '2019-08-05 17:42:27', 'A');
INSERT INTO `year_term` VALUES ('11', '2015-2016-1', '2015至2016学年第一学期', '2019-08-05 17:42:29', 'A');
INSERT INTO `year_term` VALUES ('12', '2015-2016-2', '2015至2016学年第二学期', '2019-08-05 17:42:31', 'A');
INSERT INTO `year_term` VALUES ('13', '2016-2017-1', '2016至2017学年第一学期', '2019-08-05 17:42:33', 'A');
INSERT INTO `year_term` VALUES ('14', '2016-2017-2', '2016至2017学年第二学期', '2019-08-05 17:42:35', 'A');
INSERT INTO `year_term` VALUES ('15', '2017-2018-1', '2017至2018学年第一学期', '2019-08-05 17:42:39', 'A');
INSERT INTO `year_term` VALUES ('16', '2017-2018-2', '2017至2018学年第二学期', '2019-08-05 17:42:41', 'A');
INSERT INTO `year_term` VALUES ('17', '2018-2019-1', '2018至2019学年第一学期', '2019-08-05 17:42:44', 'A');
INSERT INTO `year_term` VALUES ('18', '2018-2019-2', '2018至2019学年第二学期', '2019-08-05 17:42:46', 'A');
INSERT INTO `year_term` VALUES ('19', '2019-2020-1', '2019至2020学年第一学期', '2019-08-05 17:42:50', 'A');
INSERT INTO `year_term` VALUES ('20', '2019-2020-2', '2019至2020学年第二学期', '2019-08-08 13:12:41', 'A');
