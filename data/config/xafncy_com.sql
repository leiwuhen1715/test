-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2021-09-08 14:30:39
-- 服务器版本： 5.7.33-log
-- PHP 版本： 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `xafncy_com`
--

-- --------------------------------------------------------

--
-- 表的结构 `cmf_admin_menu`
--

CREATE TABLE `cmf_admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';

--
-- 转存表中的数据 `cmf_admin_menu`
--

INSERT INTO `cmf_admin_menu` (`id`, `parent_id`, `type`, `status`, `list_order`, `app`, `controller`, `action`, `param`, `name`, `icon`, `remark`) VALUES
(1, 0, 0, 0, 70, 'admin', 'Plugin', 'default', '', '插件中心', 'util', '插件中心'),
(2, 1, 1, 1, 10000, 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理'),
(3, 2, 1, 0, 10000, 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理'),
(4, 2, 2, 0, 10000, 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序'),
(5, 2, 1, 0, 10000, 'admin', 'Hook', 'sync', '', '同步钩子', '', '同步钩子'),
(6, 0, 0, 1, 0, 'admin', 'Setting', 'default', '', '设置', 'set', '系统设置入口'),
(7, 6, 1, 1, 50, 'admin', 'Link', 'index', '', '友情链接', '', '友情链接管理'),
(8, 7, 1, 0, 10000, 'admin', 'Link', 'add', '', '添加友情链接', '', '添加友情链接'),
(9, 7, 2, 0, 10000, 'admin', 'Link', 'addPost', '', '添加友情链接提交保存', '', '添加友情链接提交保存'),
(10, 7, 1, 0, 10000, 'admin', 'Link', 'edit', '', '编辑友情链接', '', '编辑友情链接'),
(11, 7, 2, 0, 10000, 'admin', 'Link', 'editPost', '', '编辑友情链接提交保存', '', '编辑友情链接提交保存'),
(12, 7, 2, 0, 10000, 'admin', 'Link', 'delete', '', '删除友情链接', '', '删除友情链接'),
(13, 7, 2, 0, 10000, 'admin', 'Link', 'listOrder', '', '友情链接排序', '', '友情链接排序'),
(14, 7, 2, 0, 10000, 'admin', 'Link', 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏'),
(15, 6, 1, 0, 10, 'admin', 'Mailer', 'index', '', '邮箱配置', '', '邮箱配置'),
(16, 15, 2, 0, 10000, 'admin', 'Mailer', 'indexPost', '', '邮箱配置提交保存', '', '邮箱配置提交保存'),
(17, 15, 1, 0, 10000, 'admin', 'Mailer', 'template', '', '邮件模板', '', '邮件模板'),
(18, 15, 2, 0, 10000, 'admin', 'Mailer', 'templatePost', '', '邮件模板提交', '', '邮件模板提交'),
(19, 15, 1, 0, 10000, 'admin', 'Mailer', 'test', '', '邮件发送测试', '', '邮件发送测试'),
(20, 6, 1, 0, 10000, 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理'),
(21, 20, 1, 0, 10000, 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表'),
(22, 20, 1, 0, 10000, 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加'),
(23, 20, 2, 0, 10000, 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存'),
(24, 20, 1, 0, 10000, 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑'),
(25, 20, 2, 0, 10000, 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存'),
(26, 20, 2, 0, 10000, 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除'),
(27, 20, 2, 0, 10000, 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序'),
(28, 20, 1, 0, 10000, 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单'),
(29, 6, 1, 0, 30, 'admin', 'Nav', 'index', '', '导航管理', '', '导航管理'),
(30, 29, 1, 0, 10000, 'admin', 'Nav', 'add', '', '添加导航', '', '添加导航'),
(31, 29, 2, 0, 10000, 'admin', 'Nav', 'addPost', '', '添加导航提交保存', '', '添加导航提交保存'),
(32, 29, 1, 0, 10000, 'admin', 'Nav', 'edit', '', '编辑导航', '', '编辑导航'),
(33, 29, 2, 0, 10000, 'admin', 'Nav', 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存'),
(34, 29, 2, 0, 10000, 'admin', 'Nav', 'delete', '', '删除导航', '', '删除导航'),
(35, 29, 1, 0, 10000, 'admin', 'NavMenu', 'index', '', '导航菜单', '', '导航菜单'),
(36, 35, 1, 0, 10000, 'admin', 'NavMenu', 'add', '', '添加导航菜单', '', '添加导航菜单'),
(37, 35, 2, 0, 10000, 'admin', 'NavMenu', 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存'),
(38, 35, 1, 0, 10000, 'admin', 'NavMenu', 'edit', '', '编辑导航菜单', '', '编辑导航菜单'),
(39, 35, 2, 0, 10000, 'admin', 'NavMenu', 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存'),
(40, 35, 2, 0, 10000, 'admin', 'NavMenu', 'delete', '', '删除导航菜单', '', '删除导航菜单'),
(41, 35, 2, 0, 10000, 'admin', 'NavMenu', 'listOrder', '', '导航菜单排序', '', '导航菜单排序'),
(42, 1, 1, 1, 10000, 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表'),
(43, 42, 2, 0, 10000, 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用'),
(44, 42, 1, 0, 10000, 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置'),
(45, 42, 2, 0, 10000, 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交'),
(46, 42, 2, 0, 10000, 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装'),
(47, 42, 2, 0, 10000, 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新'),
(48, 42, 2, 0, 10000, 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件'),
(49, 0, 0, 1, 10, 'admin', 'User', 'default', '', '权限管理', 'auz', '管理组'),
(50, 49, 1, 1, 10000, 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理'),
(51, 50, 1, 0, 10000, 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色'),
(52, 50, 2, 0, 10000, 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交'),
(53, 50, 1, 0, 10000, 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色'),
(54, 50, 2, 0, 10000, 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交'),
(55, 50, 2, 0, 10000, 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色'),
(56, 50, 1, 0, 10000, 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限'),
(57, 50, 2, 0, 10000, 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交'),
(58, 0, 1, 0, 10000, 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站'),
(59, 58, 2, 0, 10000, 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原'),
(60, 58, 2, 0, 10000, 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除'),
(61, 6, 1, 0, 10000, 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理'),
(62, 61, 1, 0, 10000, 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则'),
(63, 61, 2, 0, 10000, 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交'),
(64, 61, 1, 0, 10000, 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑'),
(65, 61, 2, 0, 10000, 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交'),
(66, 61, 2, 0, 10000, 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除'),
(67, 61, 2, 0, 10000, 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用'),
(68, 61, 2, 0, 10000, 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用'),
(69, 61, 2, 0, 10000, 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序'),
(70, 61, 1, 0, 10000, 'admin', 'Route', 'select', '', '选择URL', '', '选择URL'),
(71, 6, 1, 1, 0, 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息'),
(72, 71, 2, 0, 10000, 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交'),
(73, 6, 1, 0, 10000, 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改'),
(74, 73, 2, 0, 10000, 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交'),
(75, 6, 1, 1, 10000, 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置'),
(76, 75, 2, 0, 10000, 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交'),
(77, 6, 1, 0, 10000, 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存'),
(78, 6, 1, 1, 40, 'admin', 'Slide', 'index', '', '幻灯片管理', '', '幻灯片管理'),
(79, 78, 1, 0, 10000, 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片'),
(80, 78, 2, 0, 10000, 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交'),
(81, 78, 1, 0, 10000, 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片'),
(82, 78, 2, 0, 10000, 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交'),
(83, 78, 2, 0, 10000, 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片'),
(84, 78, 1, 0, 10000, 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表'),
(85, 84, 1, 0, 10000, 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加'),
(86, 84, 2, 0, 10000, 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交'),
(87, 84, 1, 0, 10000, 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑'),
(88, 84, 2, 0, 10000, 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交'),
(89, 84, 2, 0, 10000, 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除'),
(90, 84, 2, 0, 10000, 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏'),
(91, 84, 2, 0, 10000, 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示'),
(92, 84, 2, 0, 10000, 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序'),
(111, 49, 1, 1, 10000, 'admin', 'User', 'index', '', '管理员', '', '管理员管理'),
(112, 111, 1, 0, 10000, 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加'),
(113, 111, 2, 0, 10000, 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交'),
(114, 111, 1, 0, 10000, 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑'),
(115, 111, 2, 0, 10000, 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交'),
(116, 111, 1, 0, 10000, 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改'),
(117, 111, 2, 0, 10000, 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交'),
(118, 111, 2, 0, 10000, 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除'),
(119, 111, 2, 0, 10000, 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员'),
(120, 111, 2, 0, 10000, 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员'),
(121, 6, 1, 1, 10000, 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表'),
(122, 121, 2, 0, 10000, 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件'),
(123, 0, 0, 1, 40, 'user', 'AdminIndex', 'default1', '', '用户管理', 'user', '用户组'),
(124, 123, 1, 1, 100, 'user', 'AdminIndex', 'index', '', '本站用户', '', '本站用户'),
(125, 124, 2, 0, 10000, 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑'),
(126, 124, 2, 0, 10000, 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用'),
(127, 123, 1, 0, 10000, 'user', 'AdminOauth', 'index', '', '第三方用户', '', '第三方用户'),
(128, 127, 2, 0, 10000, 'user', 'AdminOauth', 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定'),
(162, 0, 0, 0, 50, 'portal', 'AdminIndex', 'default', '', '单页管理', 'read', '门户管理'),
(163, 162, 1, 0, 10000, 'portal', 'AdminArticle', 'index', '', '资讯管理', '', '文章列表'),
(164, 163, 1, 0, 10000, 'portal', 'AdminArticle', 'add', '', '添加文章', '', '添加文章'),
(165, 163, 2, 0, 10000, 'portal', 'AdminArticle', 'addPost', '', '添加文章提交', '', '添加文章提交'),
(166, 163, 1, 0, 10000, 'portal', 'AdminArticle', 'edit', '', '编辑文章', '', '编辑文章'),
(167, 163, 2, 0, 10000, 'portal', 'AdminArticle', 'editPost', '', '编辑文章提交', '', '编辑文章提交'),
(168, 163, 2, 0, 10000, 'portal', 'AdminArticle', 'delete', '', '文章删除', '', '文章删除'),
(169, 163, 2, 0, 10000, 'portal', 'AdminArticle', 'publish', '', '文章发布', '', '文章发布'),
(170, 163, 2, 0, 10000, 'portal', 'AdminArticle', 'top', '', '文章置顶', '', '文章置顶'),
(171, 163, 2, 0, 10000, 'portal', 'AdminArticle', 'recommend', '', '文章推荐', '', '文章推荐'),
(172, 163, 2, 0, 10000, 'portal', 'AdminArticle', 'listOrder', '', '文章排序', '', '文章排序'),
(173, 162, 1, 0, 10000, 'portal', 'AdminCategory', 'index', '', '频道管理', '', '文章分类列表'),
(174, 173, 1, 0, 10000, 'portal', 'AdminCategory', 'add', '', '添加文章分类', '', '添加文章分类'),
(175, 173, 2, 0, 10000, 'portal', 'AdminCategory', 'addPost', '', '添加文章分类提交', '', '添加文章分类提交'),
(176, 173, 1, 0, 10000, 'portal', 'AdminCategory', 'edit', '', '编辑文章分类', '', '编辑文章分类'),
(177, 173, 2, 0, 10000, 'portal', 'AdminCategory', 'editPost', '', '编辑文章分类提交', '', '编辑文章分类提交'),
(178, 173, 1, 0, 10000, 'portal', 'AdminCategory', 'select', '', '文章分类选择对话框', '', '文章分类选择对话框'),
(179, 173, 2, 0, 10000, 'portal', 'AdminCategory', 'listOrder', '', '文章分类排序', '', '文章分类排序'),
(180, 173, 2, 0, 10000, 'portal', 'AdminCategory', 'toggle', '', '文章分类显示隐藏', '', '文章分类显示隐藏'),
(181, 173, 2, 0, 10000, 'portal', 'AdminCategory', 'delete', '', '删除文章分类', '', '删除文章分类'),
(182, 162, 1, 1, 10000, 'portal', 'AdminPage', 'index', '', '页面管理', '', '页面管理'),
(183, 182, 1, 0, 10000, 'portal', 'AdminPage', 'add', '', '添加页面', '', '添加页面'),
(184, 182, 2, 0, 10000, 'portal', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交'),
(185, 182, 1, 0, 10000, 'portal', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面'),
(186, 182, 2, 0, 10000, 'portal', 'AdminPage', 'editPost', '', '编辑页面提交', '', '编辑页面提交'),
(187, 182, 2, 0, 10000, 'portal', 'AdminPage', 'delete', '', '删除页面', '', '删除页面'),
(188, 162, 1, 0, 10000, 'portal', 'AdminTag', 'index', '', '文章标签', '', '文章标签'),
(189, 188, 1, 0, 10000, 'portal', 'AdminTag', 'add', '', '添加文章标签', '', '添加文章标签'),
(190, 188, 2, 0, 10000, 'portal', 'AdminTag', 'addPost', '', '添加文章标签提交', '', '添加文章标签提交'),
(191, 188, 2, 0, 10000, 'portal', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态'),
(192, 188, 2, 0, 10000, 'portal', 'AdminTag', 'delete', '', '删除文章标签', '', '删除文章标签'),
(195, 220, 1, 1, 30, 'goods', 'AdminCategory', 'index', '', '商家分类', '', ''),
(201, 0, 1, 1, 60, 'goods', 'AdminOrder', 'default', '', '订单管理', 'app', ''),
(202, 201, 1, 1, 10000, 'goods', 'AdminPlaceOrder', 'index', '', '订单列表', '', ''),
(205, 123, 1, 1, 10000, 'plugin/HzMsgBorad', 'AdminIndex', 'index', '', '商务合作', '', '演示插件'),
(206, 123, 1, 1, 10000, 'user', 'AdminTicket', 'index', '', 'VIP管理', '', ''),
(207, 0, 1, 1, 10000, 'user', 'AdminFard', 'default', '', '资金管理', 'rmb', ''),
(209, 207, 1, 0, 50, 'user', 'AdminCapital', 'add', '', '余额变更', '', ''),
(212, 6, 1, 1, 10000, 'plugin/Wxapp', 'AdminIndex', 'index', '', '小程序管理', '', '小程序管理'),
(213, 212, 1, 0, 10000, 'plugin/Wxapp', 'AdminWxapp', 'add', '', '添加小程序', '', '添加小程序'),
(214, 212, 2, 0, 10000, 'plugin/Wxapp', 'AdminWxapp', 'addPost', '', '添加小程序提交保存', '', '添加小程序提交保存'),
(215, 212, 1, 0, 10000, 'plugin/Wxapp', 'AdminWxapp', 'edit', '', '编辑小程序', '', '编辑小程序'),
(216, 212, 2, 0, 10000, 'plugin/Wxapp', 'AdminWxapp', 'editPost', '', '编辑小程序提交保存', '', '编辑小程序'),
(217, 212, 2, 0, 10000, 'plugin/Wxapp', 'AdminWxapp', 'delete', '', '删除小程序', '', '删除小程序'),
(220, 0, 1, 1, 10000, 'goods', 'AdminSupplier', 'default', '', '商家管理', 'group', ''),
(221, 220, 1, 1, 10000, 'goods', 'AdminSupplier', 'index', '', '商家列表', '', ''),
(227, 1, 1, 1, 10000, 'plugin/Modules', 'AdminIndex', 'index', '', '内容模型', '', '内容模型列表'),
(228, 0, 1, 0, 10000, 'plugin/modules', 'content', 'index', '', '内容管理', '', ''),
(229, 228, 1, 1, 10000, 'plugin/modules', 'content', 'index', '?modules_id=3', '活动管理', '', ''),
(230, 229, 1, 0, 10000, 'plugin/modules', 'content', 'add', '?modules_id=3', '添加活动管理', '', ''),
(231, 229, 1, 0, 10000, 'plugin/modules', 'content', 'edit', '?modules_id=3', '编辑活动管理', '', ''),
(232, 229, 1, 0, 10000, 'plugin/modules', 'content', 'delete', '?modules_id=3', '删除活动管理', '', ''),
(233, 229, 1, 0, 10000, 'plugin/modules', 'content', 'review', '?modules_id=3', '审核活动管理', '', ''),
(234, 229, 1, 0, 10000, 'plugin/modules', 'AdminColumn', 'index', '?modules_id=3', '活动管理分类', '', ''),
(235, 229, 1, 0, 10000, 'plugin/modules', 'AdminColumn', 'add', '?modules_id=3', '添加活动管理分类', '', ''),
(236, 229, 1, 0, 10000, 'plugin/modules', 'AdminColumn', 'edit', '?modules_id=3', '编辑活动管理分类', '', ''),
(237, 229, 1, 0, 10000, 'plugin/modules', 'AdminColumn', 'delete', '?modules_id=3', '删除活动管理分类', '', ''),
(238, 123, 1, 0, 300, 'user', 'AdminRank', 'index', '', '会员等级', '', ''),
(239, 207, 1, 1, 40, 'user', 'AdminScore', 'index', '', '金币明细', '', ''),
(240, 207, 1, 1, 10000, 'user', 'AdminForward', 'index', '', '提现管理', '', ''),
(241, 207, 1, 1, 10000, 'user', 'AdminPay', 'index', '', '支付明细', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_asset`
--

CREATE TABLE `cmf_asset` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源表';

--
-- 转存表中的数据 `cmf_asset`
--

INSERT INTO `cmf_asset` (`id`, `user_id`, `file_size`, `create_time`, `status`, `download_times`, `file_key`, `filename`, `file_path`, `file_md5`, `file_sha1`, `suffix`, `more`) VALUES
(1, 2, 196850, 1629965681, 1, 0, '50935b8be2202e1b0ae39917fcf6165630f57dc513d049cf33aa3cb1dbf004f0', 'a8.png', 'goods/20210826/0c7ead1661d139e9466a1b37e5077e87.png', '50935b8be2202e1b0ae39917fcf61656', 'e047842663e3d4c829c929a0828aedf651c357b0', 'png', NULL),
(2, 2, 121433, 1629965711, 1, 0, '3be98d1dc32487c10d9d1b58307740531c9baa69d9dbb9fd42acde42685c1b47', 'b5.png', 'goods/20210826/22f249048014093bbd148c883a9f0811.png', '3be98d1dc32487c10d9d1b5830774053', '5034b5fa0a3028f5014ff7a8ef1e1ff677eb8b6b', 'png', NULL),
(3, 2, 88254, 1629965771, 1, 0, '3a5c402a5160a0b488ade6aff39b4269558690872cf075cf3934dce8cb51e63a', 'b6.png', 'goods/20210826/a8266316959f37d14f102daf4c2e9909.png', '3a5c402a5160a0b488ade6aff39b4269', '2551804af72c9cf3835cc9e4bf73678ea5cb8c07', 'png', NULL),
(4, 2, 159753, 1629965793, 1, 0, '264f4c5944767b7b132f53c612c7851dc5ecd251cdeab54df5c08d6038b16e8c', 'b7.png', 'goods/20210826/9c222571ddc717cef497f41d0f4825a7.png', '264f4c5944767b7b132f53c612c7851d', 'a75ba86049c7c995823ee0173a5bc2db08c3688a', 'png', NULL),
(5, 2, 202404, 1629966647, 1, 0, 'ad004884f372f6ae3d1896decd51c5660f1b3415abd528ff0f85cfa0de9e161c', 'a2.png', 'admin/20210826/69d46865eafec9c303f8f30a8abfd57d.png', 'ad004884f372f6ae3d1896decd51c566', '874eb7f68e477abac7326003e009cedb77af1541', 'png', NULL),
(6, 2, 170840, 1629971049, 1, 0, '8b5dbaefa13067fdb4de1342fff8c68620b60b191e18c79ab1f6df2e56e20b68', 'banner2.png', 'admin/20210826/fdfa2231b45fe05879754f1587fd820f.png', '8b5dbaefa13067fdb4de1342fff8c686', '88d18143522a875ee2c32bb2e6dd7d959d9816bf', 'png', NULL),
(7, 2, 665043, 1630026246, 1, 0, 'ef9de5193b7b1bc902ca1e4e7696611baa1caa9865b1aaf02a69d9ce42f381dc', 'XYSuvnsucb3i8210eaf38e1d14a32afe6fb2787d3282.png', 'default/20210827/9bd238b68a07841f3d970f4dea26f188.png', 'ef9de5193b7b1bc902ca1e4e7696611b', 'd4f2e5eb3efbc28967b96032dd5c5193ca683eee', 'png', NULL),
(8, 2, 213543, 1630027278, 1, 0, '1e107c004efb53a9473a441d6e8454a31beb3fdc2d7b4675297a97708587395a', 'banner3.png', 'admin/20210827/8fb452b84fe0d048c98fb2059d004c70.png', '1e107c004efb53a9473a441d6e8454a3', '5fc9ed55f6dff50667251e4e03418b2889e1408a', 'png', NULL),
(9, 2, 217979, 1630029649, 1, 0, '228e696abc2417232492b45b448194e7a20596c5f74ca2825e76369683b77350', 'banner4.png', 'admin/20210827/93d967c595b2619be41b0a52b52fec4e.png', '228e696abc2417232492b45b448194e7', 'a53bedb5065d650e08692a431c8e500947b6f558', 'png', NULL),
(10, 2, 142169, 1630046790, 1, 0, '75defab2d0c9574f6213f24b9c2618973882e613c9e2e759d873ccc764291a6d', 'banner5.png', 'goods/20210827/37baa709d3db92a2d626580e045a8969.png', '75defab2d0c9574f6213f24b9c261897', 'd93bb9dc3219e680831f84355c2cdd44b6376120', 'png', NULL),
(11, 2, 235066, 1630306248, 1, 0, '919a0ccb83921c47342113e846ad3ba15fcb09d45e23f63c70ce31b1e6883612', 'rObSzuUYBYs7919a0ccb83921c47342113e846ad3ba1.jpg', 'default/20210830/e3b853ce59aac41d04c85369fba628cc.jpg', '919a0ccb83921c47342113e846ad3ba1', '3261e5a6b8bce72c7ed9cf5ee8f599e715135f3e', 'jpg', NULL),
(12, 2, 1143938, 1630306248, 1, 0, '57576e765e7bf771937ae2a288c2edf587635181269ee06ef26b33e0bf7437f5', 'Ds5y0y5i187057576e765e7bf771937ae2a288c2edf5.jpg', 'default/20210830/163b154c5dbe388a66ba2126416a7eb5.jpg', '57576e765e7bf771937ae2a288c2edf5', 'd8ba22978894f2734f2ef035a5d7f3dbdecfa838', 'jpg', NULL),
(13, 2, 784982, 1630306336, 1, 0, '4d757c212977e60d673c145cccbbf80e67df57acde2cac0ecfff45ab76ef98da', 'ei7bQM0XMZ4x4d757c212977e60d673c145cccbbf80e.jpg', 'default/20210830/9274ea6e220872bcae75452a7e4db9b3.jpg', '4d757c212977e60d673c145cccbbf80e', '9786bae21e9aa9581ee5310ee01a331a1703fc39', 'jpg', NULL),
(14, 2, 199340, 1630310159, 1, 0, '47fdbc9e25548601b7d7f2abec1639bd7f687c620643e6134c17624600eafc51', 'kNnUy6MZjX3k47fdbc9e25548601b7d7f2abec1639bd.jpg', 'default/20210830/4f4941eb5ffa3c5b56209d7324836d9c.jpg', '47fdbc9e25548601b7d7f2abec1639bd', '782eee02c5832e07e7b4a0d3dd799f1668695094', 'jpg', NULL),
(15, 2, 186366, 1630310562, 1, 0, '862eaa807639ad4f120b736a0ffe22c22ebe18ddeb1848c11afa38fd9d8a680c', 'skfFW13NPpqZ862eaa807639ad4f120b736a0ffe22c2.png', 'default/20210830/443f2a8e4f92be252183542f87607539.png', '862eaa807639ad4f120b736a0ffe22c2', '2cd6aa01fac22cc4b350fe7ba4329b70f45b085b', 'png', NULL),
(16, 2, 96959, 1630310562, 1, 0, '36874fd9dd5f43910e0d977659437cf5e6ca49f384356ea0330da913a5d241fd', 's4GOPVV4S5AQ36874fd9dd5f43910e0d977659437cf5.jpg', 'default/20210830/77540c3c83fd86a07355412924104687.jpg', '36874fd9dd5f43910e0d977659437cf5', 'dbf6fd9d6f6ac0bbea466246a5193614b8182e2d', 'jpg', NULL),
(17, 2, 56127, 1630310562, 1, 0, '6d126088eee740081110e7b59027e01164dcdd0851108f7f1844313b62ad840d', 'cTpCUAIbvDem6d126088eee740081110e7b59027e011.jpg', 'default/20210830/c44ad4a5a6094f6343afb88bf6d53b13.jpg', '6d126088eee740081110e7b59027e011', '35eb439ccbbd5417467e37101c804a7e21aebed3', 'jpg', NULL),
(18, 2, 170304, 1630310577, 1, 0, 'c36c03b0915b7a5be19459c41bd51783a0866c6629a8fe10158e1e63aa0d1910', 'tauK5olwEn3gc36c03b0915b7a5be19459c41bd51783.jpg', 'default/20210830/5cae202f24de8a248d6f74b2398ae047.jpg', 'c36c03b0915b7a5be19459c41bd51783', '01a4ce76f9825c39524f7ea98f227e57e6cbf86a', 'jpg', NULL),
(19, 2, 120973, 1630310577, 1, 0, '5d92b7cdea913d9ced06d9b08681933bb17f7787e228a5ea25a94be227305680', 'AUuBZ6PAN2CW5d92b7cdea913d9ced06d9b08681933b.png', 'default/20210830/a6e913ad81c0c46ec7626135afd68d05.png', '5d92b7cdea913d9ced06d9b08681933b', '51cdf6acecea5482c8bbaf9fee50cbcba9c92f1e', 'png', NULL),
(20, 2, 58215, 1630310577, 1, 0, 'd25a6cc85d301d3573a94d6d96a747f6e9cf3d874bfcc1d0c4e7cae64777d9aa', 'Egldk01dlKDad25a6cc85d301d3573a94d6d96a747f6.gif', 'default/20210830/5b7c35061cdddadc5d2f55c4d0682322.gif', 'd25a6cc85d301d3573a94d6d96a747f6', '09faefa51769966e299d6bbfb17029213ef5afd5', 'gif', NULL),
(21, 2, 86768, 1630310586, 1, 0, 'aaffeec7ac9ff119f704047ee07c8649abc5a0373b9c994d8547fdd58ff11c97', 'rtuLLD1VD00maaffeec7ac9ff119f704047ee07c8649.png', 'default/20210830/6d843df11463a18041feb7a532313437.png', 'aaffeec7ac9ff119f704047ee07c8649', 'f778bf97c6ad1941e045646e5296f0684471ce7a', 'png', NULL),
(22, 2, 1101523, 1630310666, 1, 0, '2418b3f61ba36882181fc5eebec1a37f8d7abfb6cfff5a692f398f6a894f8bdd', '59M50M1W3CgE2418b3f61ba36882181fc5eebec1a37f.jpg', 'default/20210830/6372962314b3c55846f86f7ee3e28b6a.jpg', '2418b3f61ba36882181fc5eebec1a37f', '3efc9b7ecbaa4708ae42adcb4b2d1711d10b2bb8', 'jpg', NULL),
(23, 2, 3137, 1630392924, 1, 0, 'd93453af5bcd6e758ba5474c8d16fc571bddafdb384df0fb4309c49707eef6a9', 'c1.png', 'goods/20210831/a37df6390b1c7c19f7f044805798dc77.png', 'd93453af5bcd6e758ba5474c8d16fc57', '7b597ab2162e7db29089e7b15f4dae98fa694877', 'png', NULL),
(24, 2, 3942, 1630392947, 1, 0, 'e2b9b99184317dd77ebdac91bfb6be294d2644dc6791e77bb8c07356dae77d6c', 'c2.png', 'goods/20210831/4b2d7b28046f8abc74f3ccb831e08db5.png', 'e2b9b99184317dd77ebdac91bfb6be29', '2fb0cf055b5fdd29214858f44662ad591be3416c', 'png', NULL),
(25, 2, 5592, 1630392966, 1, 0, '49cad15ac53e552e2eed697805018792a652e47b6e228b25d4fd2922861c4a65', 'c3.png', 'goods/20210831/2be4b1b3fac9e97b98512f9ed9fb0235.png', '49cad15ac53e552e2eed697805018792', 'b533931fd31636bb3da7bb3d3188912bcc5354da', 'png', NULL),
(26, 2, 7553, 1630392986, 1, 0, '34df4ef87ce6eea3aeba7bef0da5be4c9e79d6e6ceee743da7e9b8b477b6a89c', 'c4.png', 'goods/20210831/bb796f040ab745e8422ceed1e4a31535.png', '34df4ef87ce6eea3aeba7bef0da5be4c', 'dacff1fc155b7091d6797d698aa5767df078e5ab', 'png', NULL),
(27, 4, 155370, 1630578709, 1, 0, '182a9b9b743bc3c8a8555f8fe8ebde07ce1f0a108658faf7c346bd7782317f62', 'tmp_afec46838e610a2fccd00bb09a674ee808dbb8a3cac31ee3.jpg', 'default/20210902/a080714a95330f5d844a513f4f3c4708.jpg', '182a9b9b743bc3c8a8555f8fe8ebde07', '9dfb80cdc1981706415e177f04bebb5f60366c85', 'jpg', NULL),
(28, 7, 59001, 1630651467, 1, 0, 'a341651b94955a627767f5a28bb785f5b4cca9e7b1c5c2f92d266fb16ad01420', 'tmp_8f6693f213da44cbe7bd7bef45dfae5d87c4851298d0b8a1.jpg', 'default/20210903/61f27b1bb18bb154b8c60d5620ad4381.jpg', 'a341651b94955a627767f5a28bb785f5', '36e7114afbb711c7e8e4bd616529b34804798acf', 'jpg', NULL),
(29, 7, 56133, 1630651467, 1, 0, 'c46549abc27c8c076fbec98aceb6dba18cf9f9ac537b67ad68917eadb41d0c46', 'tmp_cf08de3bd81bb0b7ab110b564db7e244417719ecccc8b893.jpg', 'default/20210903/367b45c590f657e2e68669e58382c9a7.jpg', 'c46549abc27c8c076fbec98aceb6dba1', '988bed8a720866cd789794dd066e8d792736324f', 'jpg', NULL),
(30, 7, 79475, 1630651467, 1, 0, '1abd50bbb75dbeaa49d4fd8e50477dca94420af7d401e979752e6fb6d13db578', 'tmp_794e612dca6f5cc0d4dc7fc34ed71f9b637aadebb0f3dcf0.jpg', 'default/20210903/dd4339b86c5924c1d482b87fef507893.jpg', '1abd50bbb75dbeaa49d4fd8e50477dca', '24e44df99e7e20f2cb74f63239ecf633850dcfd6', 'jpg', NULL),
(31, 7, 33551, 1630651485, 1, 0, 'f24eefbffb7620db5f64e7ac90c788a2431fc8a2d752b459fd8ebc841e9e32ed', 'tmp_a76ffdce4f769b6dc7fa0da0c12bc0817dc7e786246cf844.jpg', 'default/20210903/8bdda8738fbf0d713b8e4e661ce741eb.jpg', 'f24eefbffb7620db5f64e7ac90c788a2', 'b1c1e4b8780cee2a0252689c669c3c571c8282f7', 'jpg', NULL),
(32, 7, 61616, 1630651485, 1, 0, 'ca9e08154508d83c51d871b28abb51fc87ac99c75dc7d4d6912c2f9f174f1c41', 'tmp_cce37708a5026bbfaa568d19130fdd17620eae51f92e9475.jpg', 'default/20210903/93a83d0c9a642c2e3c73b6f86dbe1787.jpg', 'ca9e08154508d83c51d871b28abb51fc', 'cd31b8e6e9ec26c9066b3c305adc819641c70e59', 'jpg', NULL),
(33, 7, 60668, 1630651485, 1, 0, '498c8041a911c03602001c5bc4e2d65036aac60c3c555f879fce27afac07e5bd', 'tmp_572f0c56b4a217f1abd733d8ebc4932f5fccbc2bb02f533d.jpg', 'default/20210903/3121fd6eb82046f2526683fd806f7864.jpg', '498c8041a911c03602001c5bc4e2d650', '4dbb593d13e177a09c383c6382ed5ff6c607c6bf', 'jpg', NULL),
(34, 5, 398715, 1630667937, 1, 0, 'f1a2b8a7aba851f608fffbdc9197cf97444c0e8f9ad314c098a8030499883979', 'tmp_535f5bef817afced18c1e99797a9ae91e60eca5a1c3a8b26.png', 'default/20210903/408f25506527c98787408121eb31aa85.png', 'f1a2b8a7aba851f608fffbdc9197cf97', '73ce82ccaec78027a7562a6465a2f387cbc30950', 'png', NULL),
(35, 5, 77457, 1630725484, 1, 0, 'cd1046dfff2026f8df14de80e0bd92472034488d6ee0c8860f408d51551d925c', 'tmp_e85d563a2f0269db6f631a6b7b0fea94d00591a306f42dd9.jpg', 'default/20210904/87683c1c26a1d85fb9a235f1929cbbdc.jpg', 'cd1046dfff2026f8df14de80e0bd9247', 'ecf066d7467cd4f43d978b8a0021edf2fbccb9a9', 'jpg', NULL),
(36, 5, 143767, 1630725491, 1, 0, '6ca28cf1facdfd14d0eae18c9145daf069373e19a9333fe58c5a93b2bc5bd2fa', 'tmp_f22c63e3f4cf03c0dee60af0f772fa008a70afaf580c12d7.jpg', 'default/20210904/1164cd4407192c3a39bc293bdb947d8a.jpg', '6ca28cf1facdfd14d0eae18c9145daf0', 'e03b748ad6e58a2e9b6867e2ed7bc9ae6a786e40', 'jpg', NULL),
(37, 5, 183231, 1630725614, 1, 0, 'e6be419f615932ef5e87b3c3e9f99ab55c0c3eb50a48c581daa47b5180e3843c', 'tmp_65c4d2a6df0d8f40fd928017a5ea95458743c4f84c9033c5.jpg', 'default/20210904/0b6d581244ae0a0a6cf69a2041e03d2f.jpg', 'e6be419f615932ef5e87b3c3e9f99ab5', 'e1090b873d263f010a4c901135cc524bf44fcc12', 'jpg', NULL),
(38, 2, 349830, 1630743911, 1, 0, '5269c1fafc0e340ee218eb95e2edb9c416e85442b677434ffd3c1bfa75a7a510', '三大核心点.jpg', 'goods/20210904/9410a886a204f46faf337ee72dbb6300.jpg', '5269c1fafc0e340ee218eb95e2edb9c4', '0a7d8098d355f0f562e2471df1bdcafeb2d47445', 'jpg', NULL),
(39, 2, 246044, 1630984498, 1, 0, '8f19ee720137c92c6782e29e87f940aee6c32805059aeaeb990dbb21cb270056', 'yq_img2.png', 'admin/20210907/807f692894c0cd4114b927a58c26e60a.png', '8f19ee720137c92c6782e29e87f940ae', 'f72db9d25ae9ae5e66d4ab1e771fbada068edd8d', 'png', NULL),
(40, 2, 178946, 1630984520, 1, 0, '72f4d33bae2e20a5c85a12efb3f45c56180ae739252379107f0bdf8f8111a877', 'bg_img.png', 'admin/20210907/30ff42b0adbdd76b313e98b7d8458bfb.png', '72f4d33bae2e20a5c85a12efb3f45c56', 'b85e6bd3389a3ce6997fc11c72ca7f570da9a90e', 'png', NULL),
(41, 2, 164305, 1630984784, 1, 0, 'c67d7f5427bf40400bff307739b72f9f0bfa669f70c13fc0c78edba504171336', 'qd_top_img.png', 'admin/20210907/acc5fb3b80135780abcb7cbe1a722d6b.png', 'c67d7f5427bf40400bff307739b72f9f', '7ab6dfb52043319f266aace73695f20611f4b33a', 'png', NULL),
(42, 2, 32916, 1630985281, 1, 0, '45ca43e3e28104b39b4a69dc1be7aa30120c5f32eeceda471c8e464006702a04', 'b4.png', 'goods/20210907/18556f14dd4438d0c0ae881f85316f72.png', '45ca43e3e28104b39b4a69dc1be7aa30', '7c07e847bd5f5f554beb3b33740fec9055bfa2ec', 'png', NULL),
(43, 2, 54530, 1630985310, 1, 0, 'cd6d54a4f99b517cfd483ebea76a3d38aef5846f2cb0ef17322b8d13e06039ab', 'b3.png', 'goods/20210907/4e39b2628275e2fe86f48483534dfdcb.png', 'cd6d54a4f99b517cfd483ebea76a3d38', 'd8c0b203a438cad75770bcb8e672efc7f47ced14', 'png', NULL),
(44, 2, 172600, 1630999469, 1, 0, 'ee9d32ddd25259596ed3d75138eb4444ecd09d67c0524beb9d5ec8988110f656', '1.jpg', 'admin/20210907/33328b52aa972866b93e895fe7f3cfaf.jpg', 'ee9d32ddd25259596ed3d75138eb4444', 'afee94a9dfec7fcba0e82e8020caff8fca93f04f', 'jpg', NULL),
(45, 2, 151336, 1630999507, 1, 0, '8612bf085a909651a3a7d3842efaf82a25b1ae97a2e8c1e98a69fed11986d376', '2.jpg', 'admin/20210907/f7403fee9075aad585702f2f5b278806.jpg', '8612bf085a909651a3a7d3842efaf82a', 'a91bf1074e2e8ef477a1631ab81f47c7442b9450', 'jpg', NULL),
(46, 2, 143720, 1630999603, 1, 0, 'db115c7fa3543343153617a70b1cd1ad653d24933454f362469d0eb2df09715a', 'hezuo.png', 'admin/20210907/2f08b5ef54d8b4cfcb6579272234a6e6.png', 'db115c7fa3543343153617a70b1cd1ad', '3a2f68ad3e7b481b691ff2fa3535b61997450dff', 'png', NULL),
(47, 2, 224883, 1631000009, 1, 0, '2355477cdd74bcef8fa86da05a280bbc400288ba5a1057493018b6ba599342b0', '2.png', 'admin/20210907/9e30424a1661a6000a269396bebd5b03.png', '2355477cdd74bcef8fa86da05a280bbc', '006a6f3471112b0ab584c77086adf9b41f6214fc', 'png', NULL),
(48, 2, 185916, 1631000022, 1, 0, '3a83bae0daabec89e94cc69cfdc86173838aadba0d94fd1b6cb1fb65252907e3', '1.png', 'admin/20210907/84f03cbdf1503a57f3d92f0da5b0c7a2.png', '3a83bae0daabec89e94cc69cfdc86173', 'a609b9246312399226586d01c5e8c95e6fa6badd', 'png', NULL),
(49, 2, 89189, 1631071345, 1, 0, 'de0777ff1df72f426eb01409ea5e0574534f7c72bb723a21f676d149bd5b8ef0', 'lALPDhmOwzNQmXbM2s0Ctg_694_218.png', 'admin/20210908/0d5bf3e1b403f1369b68eab4840ca935.png', 'de0777ff1df72f426eb01409ea5e0574', 'a14c85e93a6c641f4910262799f0c000f4fb6939', 'png', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_auth_access`
--

CREATE TABLE `cmf_auth_access` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表';

--
-- 转存表中的数据 `cmf_auth_access`
--

INSERT INTO `cmf_auth_access` (`id`, `role_id`, `rule_name`, `type`) VALUES
(6, 3, 'goods/admincategory/index', 'admin_url');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_auth_rule`
--

CREATE TABLE `cmf_auth_rule` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '规则id,自增主键',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(40) NOT NULL DEFAULT '' COMMENT '规则所属app',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';

--
-- 转存表中的数据 `cmf_auth_rule`
--

INSERT INTO `cmf_auth_rule` (`id`, `status`, `app`, `type`, `name`, `param`, `title`, `condition`) VALUES
(1, 1, 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', ''),
(2, 1, 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', ''),
(3, 1, 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', ''),
(4, 1, 'admin', 'admin_url', 'admin/Hook/sync', '', '同步钩子', ''),
(5, 1, 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', ''),
(6, 1, 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', ''),
(7, 1, 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', ''),
(8, 1, 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', ''),
(9, 1, 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', ''),
(10, 1, 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', ''),
(11, 1, 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', ''),
(12, 1, 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', ''),
(13, 1, 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', ''),
(14, 1, 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', ''),
(15, 1, 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', ''),
(16, 1, 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', ''),
(17, 1, 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', ''),
(18, 1, 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', ''),
(19, 1, 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', ''),
(20, 1, 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', ''),
(21, 1, 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', ''),
(22, 1, 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', ''),
(23, 1, 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', ''),
(24, 1, 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', ''),
(25, 1, 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', ''),
(26, 1, 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', ''),
(27, 1, 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', ''),
(28, 1, 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', ''),
(29, 1, 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', ''),
(30, 1, 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', ''),
(31, 1, 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', ''),
(32, 1, 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', ''),
(33, 1, 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', ''),
(34, 1, 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', ''),
(35, 1, 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', ''),
(36, 1, 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', ''),
(37, 1, 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', ''),
(38, 1, 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', ''),
(39, 1, 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', ''),
(40, 1, 'admin', 'admin_url', 'admin/Plugin/default', '', '插件中心', ''),
(41, 1, 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', ''),
(42, 1, 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', ''),
(43, 1, 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', ''),
(44, 1, 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', ''),
(45, 1, 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', ''),
(46, 1, 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', ''),
(47, 1, 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', ''),
(48, 1, 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', ''),
(49, 1, 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', ''),
(50, 1, 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', ''),
(51, 1, 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', ''),
(52, 1, 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', ''),
(53, 1, 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', ''),
(54, 1, 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', ''),
(55, 1, 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', ''),
(56, 1, 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', ''),
(57, 1, 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', ''),
(58, 1, 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', ''),
(59, 1, 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', ''),
(60, 1, 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', ''),
(61, 1, 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', ''),
(62, 1, 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', ''),
(63, 1, 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', ''),
(64, 1, 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', ''),
(65, 1, 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', ''),
(66, 1, 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', ''),
(67, 1, 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', ''),
(68, 1, 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', ''),
(69, 1, 'admin', 'admin_url', 'admin/Setting/default', '', '设置', ''),
(70, 1, 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', ''),
(71, 1, 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', ''),
(72, 1, 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', ''),
(73, 1, 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', ''),
(74, 1, 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', ''),
(75, 1, 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', ''),
(76, 1, 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', ''),
(77, 1, 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', ''),
(78, 1, 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', ''),
(79, 1, 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', ''),
(80, 1, 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', ''),
(81, 1, 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', ''),
(82, 1, 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', ''),
(83, 1, 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', ''),
(84, 1, 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', ''),
(85, 1, 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', ''),
(86, 1, 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', ''),
(87, 1, 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', ''),
(88, 1, 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', ''),
(89, 1, 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', ''),
(90, 1, 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', ''),
(91, 1, 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', ''),
(92, 1, 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', ''),
(93, 1, 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', ''),
(94, 1, 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', ''),
(95, 1, 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', ''),
(96, 1, 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', ''),
(97, 1, 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', ''),
(98, 1, 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', ''),
(99, 1, 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', ''),
(100, 1, 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', ''),
(101, 1, 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', ''),
(102, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', ''),
(103, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', ''),
(104, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', ''),
(105, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', ''),
(106, 1, 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', ''),
(107, 1, 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', ''),
(108, 1, 'admin', 'admin_url', 'admin/Theme/design', '', '模板设计', ''),
(109, 1, 'admin', 'admin_url', 'admin/User/default', '', '权限管理', ''),
(110, 1, 'admin', 'admin_url', 'admin/User/index', '', '管理员', ''),
(111, 1, 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', ''),
(112, 1, 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', ''),
(113, 1, 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', ''),
(114, 1, 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', ''),
(115, 1, 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', ''),
(116, 1, 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', ''),
(117, 1, 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', ''),
(118, 1, 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', ''),
(119, 1, 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', ''),
(120, 1, 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', ''),
(121, 1, 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', ''),
(122, 1, 'user', 'admin_url', 'user/AdminIndex/default', '', '用户管理', ''),
(123, 1, 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户管理', ''),
(124, 1, 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', ''),
(125, 1, 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', ''),
(126, 1, 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', ''),
(127, 1, 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', ''),
(128, 1, 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', ''),
(129, 1, 'user', 'admin_url', 'user/AdminUserAction/index', '', '用户操作管理', ''),
(130, 1, 'user', 'admin_url', 'user/AdminUserAction/edit', '', '编辑用户操作', ''),
(131, 1, 'user', 'admin_url', 'user/AdminUserAction/editPost', '', '编辑用户操作提交', ''),
(132, 1, 'user', 'admin_url', 'user/AdminUserAction/sync', '', '同步用户操作', ''),
(162, 1, 'portal', 'admin_url', 'portal/AdminArticle/index', '', '资讯管理', ''),
(163, 1, 'portal', 'admin_url', 'portal/AdminArticle/add', '', '添加文章', ''),
(164, 1, 'portal', 'admin_url', 'portal/AdminArticle/addPost', '', '添加文章提交', ''),
(165, 1, 'portal', 'admin_url', 'portal/AdminArticle/edit', '', '编辑文章', ''),
(166, 1, 'portal', 'admin_url', 'portal/AdminArticle/editPost', '', '编辑文章提交', ''),
(167, 1, 'portal', 'admin_url', 'portal/AdminArticle/delete', '', '文章删除', ''),
(168, 1, 'portal', 'admin_url', 'portal/AdminArticle/publish', '', '文章发布', ''),
(169, 1, 'portal', 'admin_url', 'portal/AdminArticle/top', '', '文章置顶', ''),
(170, 1, 'portal', 'admin_url', 'portal/AdminArticle/recommend', '', '文章推荐', ''),
(171, 1, 'portal', 'admin_url', 'portal/AdminArticle/listOrder', '', '文章排序', ''),
(172, 1, 'portal', 'admin_url', 'portal/AdminCategory/index', '', '频道管理', ''),
(173, 1, 'portal', 'admin_url', 'portal/AdminCategory/add', '', '添加文章分类', ''),
(174, 1, 'portal', 'admin_url', 'portal/AdminCategory/addPost', '', '添加文章分类提交', ''),
(175, 1, 'portal', 'admin_url', 'portal/AdminCategory/edit', '', '编辑文章分类', ''),
(176, 1, 'portal', 'admin_url', 'portal/AdminCategory/editPost', '', '编辑文章分类提交', ''),
(177, 1, 'portal', 'admin_url', 'portal/AdminCategory/select', '', '文章分类选择对话框', ''),
(178, 1, 'portal', 'admin_url', 'portal/AdminCategory/listOrder', '', '文章分类排序', ''),
(179, 1, 'portal', 'admin_url', 'portal/AdminCategory/toggle', '', '文章分类显示隐藏', ''),
(180, 1, 'portal', 'admin_url', 'portal/AdminCategory/delete', '', '删除文章分类', ''),
(181, 1, 'portal', 'admin_url', 'portal/AdminIndex/default', '', '单页管理', ''),
(182, 1, 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', ''),
(183, 1, 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加页面', ''),
(184, 1, 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加页面提交', ''),
(185, 1, 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑页面', ''),
(186, 1, 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑页面提交', ''),
(187, 1, 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除页面', ''),
(188, 1, 'portal', 'admin_url', 'portal/AdminTag/index', '', '文章标签', ''),
(189, 1, 'portal', 'admin_url', 'portal/AdminTag/add', '', '添加文章标签', ''),
(190, 1, 'portal', 'admin_url', 'portal/AdminTag/addPost', '', '添加文章标签提交', ''),
(191, 1, 'portal', 'admin_url', 'portal/AdminTag/upStatus', '', '更新标签状态', ''),
(192, 1, 'portal', 'admin_url', 'portal/AdminTag/delete', '', '删除文章标签', ''),
(193, 1, 'goods', 'admin_url', 'goods/AdminIndex/default', '', '课程管理', ''),
(194, 1, 'goods', 'admin_url', 'goods/AdminGoods/index', '', '课程列表', ''),
(195, 1, 'goods', 'admin_url', 'goods/AdminCategory/index', '', '商家分类', ''),
(196, 1, 'goods', 'admin_url', 'goods/AdminSpec/index', '', '产品规格', ''),
(197, 1, 'goods', 'admin_url', 'goods/AdminType/index', '', '产品类型', ''),
(198, 1, 'user', 'admin_url', 'user/AdminDefault/default', '', '活动管理', ''),
(199, 1, 'user', 'admin_url', 'user/admin_coupon/index', '', '优惠券管理', ''),
(200, 1, 'goods', 'admin_url', 'goods/AdminSeckill/index', '', '秒杀列表', ''),
(201, 1, 'goods', 'admin_url', 'goods/AdminOrder/default', '', '订单管理', ''),
(202, 1, 'goods', 'admin_url', 'goods/AdminPlaceOrder/index', '', '订单列表', ''),
(203, 1, 'goods', 'admin_url', 'goods/AdminOrder/ship_list', '', '发货单', ''),
(204, 1, 'goods', 'admin_url', 'goods/admin_delivery/index', '', '退款订单', ''),
(205, 1, 'plugin/HzMsgBorad', 'admin_url', 'plugin/HzMsgBorad/AdminIndex/index', '', '商务合作', ''),
(206, 1, 'user', 'admin_url', 'user/AdminTicket/index', '', 'VIP管理', ''),
(207, 1, 'user', 'admin_url', 'user/AdminFard/default', '', '资金管理', ''),
(208, 1, 'user', 'admin_url', 'user/AdminCapital/index', '', '余额明细', ''),
(209, 1, 'user', 'admin_url', 'user/AdminCapital/add', '', '余额变更', ''),
(210, 1, 'user', 'admin_url', 'user/AdminPay/index', '', '支付明细', ''),
(211, 1, 'user', 'admin_url', 'user/AdminRecharge/index', '', '充值设置', ''),
(212, 1, 'plugin/Wxapp', 'admin_url', 'plugin/Wxapp/AdminIndex/index', '', '小程序管理', ''),
(213, 1, 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminWxapp/add', '', '添加小程序', ''),
(214, 1, 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminWxapp/addPost', '', '添加小程序提交保存', ''),
(215, 1, 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminWxapp/edit', '', '编辑小程序', ''),
(216, 1, 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminWxapp/editPost', '', '编辑小程序提交保存', ''),
(217, 1, 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminWxapp/delete', '', '删除小程序', ''),
(218, 1, 'goods', 'admin_url', 'goods/AdminGoods/device', '', '设备管理', ''),
(219, 1, 'goods', 'admin_url', 'goods/AdminSupplier/default', '', '商家管理', ''),
(220, 1, 'goods', 'admin_url', 'goods/AdminSupplier/index', '', '商家列表', ''),
(221, 1, 'user', 'admin_url', 'user/AdminCoach/index', '', '教练管理', ''),
(222, 1, 'goods', 'admin_url', 'goods/AdminTime/index', '', '课时管理', ''),
(223, 1, 'user', 'admin_url', 'user/AdminCoupon/index', '', '优惠券管理', ''),
(225, 1, 'plugin/Modules', 'plugin_url', 'plugin/Modules/AdminIndex/index', '', '内容模型', ''),
(226, 1, 'user', 'admin_url', 'user/AdminRank/index', '', '会员等级', ''),
(227, 1, 'user', 'admin_url', 'user/AdminScore/index', '', '金币明细', ''),
(228, 1, 'user', 'admin_url', 'user/AdminForward/index', '', '提现管理', '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_cart`
--

CREATE TABLE `cmf_cart` (
  `id` int(8) UNSIGNED NOT NULL COMMENT '购物车表',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `session_id` char(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'session',
  `goods_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品货号',
  `goods_img` varchar(255) DEFAULT NULL,
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `market_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `member_goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '会员折扣价',
  `goods_num` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '购买数量',
  `spec_path` varchar(64) DEFAULT '' COMMENT '商品规格key',
  `spec_item_name` varchar(64) DEFAULT NULL COMMENT '商品规格组合名称',
  `bar_code` varchar(64) DEFAULT '' COMMENT '商品条码',
  `selected` tinyint(1) DEFAULT '1' COMMENT '购物车选中状态',
  `add_time` int(11) DEFAULT '0' COMMENT '加入购物车的时间',
  `prom_type` tinyint(1) DEFAULT '0' COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠',
  `prom_id` int(11) DEFAULT '0' COMMENT '活动id',
  `sku` varchar(128) DEFAULT '' COMMENT 'sku',
  `goods_cat_id` int(5) DEFAULT NULL,
  `type` smallint(1) NOT NULL DEFAULT '0',
  `supplier_id` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_coach_student`
--

CREATE TABLE `cmf_coach_student` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT '0' COMMENT '用户id',
  `coach_user_id` int(10) DEFAULT '0' COMMENT '教练id',
  `add_time` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `train_time` int(10) NOT NULL DEFAULT '0' COMMENT '训练时长',
  `class_hour` int(10) NOT NULL DEFAULT '0' COMMENT '课时'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_coach_student`
--

INSERT INTO `cmf_coach_student` (`id`, `user_id`, `coach_user_id`, `add_time`, `update_time`, `train_time`, `class_hour`) VALUES
(1, 2, 2, 1623830012, 1623830012, 14400, 2),
(2, 5, 2, 1624354934, 1624354934, 1, 1),
(26, 3, 5, 1624700338, 1624700338, 28800, 3),
(27, 8, 2, 1624933996, 1624933996, 0, 0),
(28, 8, 5, 1624934383, 1624934383, 0, 0),
(29, 3, 2, 1625130610, 1625130610, 7200, 1),
(30, 3, 8, 1625477978, 1625477978, 7200, 1),
(31, 5, 8, 1625551182, 1625551182, 0, 0),
(32, 8, 8, 1625552393, 1625552393, 0, 0),
(33, 5, 5, 1625628500, 1625628500, 3000, 1),
(43, NULL, NULL, 1625830392, 1625830392, 0, 0),
(47, 4, 5, 1625916911, 1625916911, 0, 0),
(48, 6, 5, 1625916951, 1625916951, 0, 0),
(49, 33, 5, 1625917191, 1625917191, 0, 0),
(50, 30, 5, 1625917192, 1625917192, 0, 0),
(51, 3, 3, 1626076856, 1626076856, 1, 1),
(52, 4, 19, 1626264111, 1626264111, 0, 0),
(53, 63, 45, 1626424930, 1626424930, 0, 0),
(54, 35, 25, 1626426467, 1626426467, 2700, 1),
(55, 66, 45, 1626430748, 1626430748, 2700, 1),
(56, 68, 45, 1626437108, 1626437108, 0, 0),
(57, 37, 45, 1626437352, 1626437352, 0, 0),
(58, 5, 6, 1626440447, 1626440447, 1080, 1),
(59, 4, 6, 1626440583, 1626440583, 1080, 1),
(60, 71, 25, 1626443030, 1626443030, 0, 0),
(61, 72, 45, 1626443118, 1626443118, 2700, 1),
(62, 75, 23, 1626445850, 1626445850, 2700, 1),
(63, 73, 19, 1626447442, 1626447442, 2700, 1),
(81, 38, 45, 1626502866, 1626502866, 2700, 1),
(82, 83, 24, 1626511642, 1626511642, 2700, 1),
(83, 3, 19, 1626659301, 1626659301, 0, 0),
(84, 93, 25, 1626701799, 1626701799, 6000, 2),
(85, 94, 25, 1626702420, 1626702420, 6000, 2),
(86, 57, 25, 1626704866, 1626704866, 0, 0),
(87, 68, 25, 1626763630, 1626763630, 3000, 1),
(92, 4, 25, 1626772753, 1626772753, 0, 0),
(98, 3, 23, 1626773885, 1626773885, 0, 0),
(99, 4, 45, 1626949769, 1626949769, 0, 0),
(100, 5, 45, 1626955996, 1626955996, 0, 0),
(101, 67, 45, 1627020263, 1627020263, 0, 0),
(102, 95, 45, 1627020384, 1627020384, 0, 0),
(103, 35, 5, 1627030197, 1627030197, 0, 0),
(104, 101, 45, 1627033613, 1627033613, 0, 0),
(105, 107, 5, 1627043602, 1627043602, 0, 0),
(106, 109, 5, 1627048186, 1627048186, 0, 0),
(107, 15, 25, 1627380328, 1627380328, 0, 0),
(108, 5, 25, 1627381281, 1627381281, 0, 0),
(109, 62, 45, 1627386002, 1627386002, 0, 0),
(110, 119, 25, 1627386334, 1627386334, 0, 0),
(111, 123, 45, 1627449482, 1627449482, 0, 0),
(112, 122, 45, 1627449934, 1627449934, 0, 0),
(113, 121, 45, 1627464958, 1627464958, 0, 0),
(114, 119, 45, 1627473260, 1627473260, 0, 0),
(115, 119, 23, 1627559179, 1627559179, 3000, 1),
(118, 135, 45, 1627642705, 1627642705, 0, 0),
(127, 64, 45, 1627807950, 1627807950, 0, 0),
(128, 158, 45, 1627959648, 1627959648, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_comment`
--

CREATE TABLE `cmf_comment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `like_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislike_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '不喜欢数',
  `floor` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '楼层数',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text CHARACTER SET utf8mb4 COMMENT '评论内容',
  `more` text CHARACTER SET utf8mb4 COMMENT '扩展属性'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_coupon`
--

CREATE TABLE `cmf_coupon` (
  `id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(4,1) NOT NULL DEFAULT '0.0',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `add_time` int(10) DEFAULT NULL,
  `use_time` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `is_use` smallint(1) NOT NULL DEFAULT '0',
  `end_time` int(11) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `type` smallint(1) NOT NULL DEFAULT '0' COMMENT '0：满减劵:1：立减',
  `name` varchar(100) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `type_id` int(10) NOT NULL DEFAULT '0' COMMENT '类型 2：新人赠送'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_coupon`
--

INSERT INTO `cmf_coupon` (`id`, `user_id`, `amount`, `total_amount`, `add_time`, `use_time`, `order_id`, `is_use`, `end_time`, `start_time`, `type`, `name`, `remark`, `type_id`) VALUES
(1, 2, '50.0', '100.00', 1623921153, NULL, NULL, 0, 1623913074, 1623921153, 0, '满减', '【限时】超大红包', 0),
(2, 2, '50.0', '100.00', 1623923074, NULL, NULL, 0, 1631699074, 1623923074, 0, '优惠抵用券', '【限时】超大红包', 0),
(3, 2, '50.0', '100.00', 1623923366, 1623923366, NULL, 1, 1631699366, 1623923366, 0, '优惠抵用券', '【限时】超大红包', 0),
(4, 3, '4.9', '5.00', 1624850308, 1624852559, NULL, 1, 1632626308, 1624850308, 0, '优惠抵用券', '【限时】超大红包', 0),
(5, 8, '4.9', '5.00', 1624934951, NULL, NULL, 0, 1632710951, 1624934951, 0, '优惠抵用券', '【限时】超大红包', 0),
(6, 5, '4.9', '5.00', 1625745593, NULL, NULL, 0, 1633521593, 1625745593, 0, '优惠抵用券', '【限时】超大红包', 0),
(7, 5, '4.9', '5.00', 1625747497, NULL, NULL, 0, 1633523497, 1625747497, 0, '优惠抵用券', '【限时】超大红包', 0),
(8, 5, '4.9', '5.00', 1625747502, NULL, NULL, 0, 1633523502, 1625747502, 0, '优惠抵用券', '【限时】超大红包', 0),
(9, 5, '4.9', '5.00', 1625747506, NULL, NULL, 0, 1633523506, 1625747506, 0, '优惠抵用券', '【限时】超大红包', 0),
(10, 3, '4.9', '5.00', 1626074177, NULL, NULL, 0, 1633850177, 1626074177, 0, '优惠抵用券', '【限时】超大红包', 0),
(11, 3, '10.0', '0.00', 1626083705, NULL, NULL, 0, 1626947705, 1626083705, 1, '无门槛代金券', '', 0),
(12, 3, '78.9', '79.00', 1626161296, NULL, NULL, 0, 1628753296, 1626161296, 0, '新人优惠券', '【限时】超大红包', 2),
(13, 45, '79.0', '79.00', 1626230260, NULL, NULL, 0, 1628822260, 1626230260, 0, '新人优惠券', '【限时】超大红包', 2),
(14, 24, '79.0', '79.00', 1626231978, NULL, NULL, 0, 1628823978, 1626231978, 0, '新人优惠券', '【限时】超大红包', 2),
(15, 38, '79.0', '79.00', 1626233745, 1626501585, NULL, 1, 1628825745, 1626233745, 0, '新人优惠券', '【限时】超大红包', 0),
(16, 5, '129.0', '0.00', 1626238518, NULL, NULL, 0, 1634014518, 1626238518, 1, '优惠抵用券', '【限时】内测活动', 0),
(17, 46, '129.0', '79.00', 1626239320, NULL, NULL, 0, 1628831320, 1626239320, 1, '新人优惠券', '【限时】超大红包', 2),
(18, 47, '129.0', '79.00', 1626251510, NULL, NULL, 0, 1628843510, 1626251510, 1, '新人优惠券', '【限时】超大红包', 2),
(19, 48, '129.0', '79.00', 1626253808, NULL, NULL, 0, 1628845808, 1626253808, 1, '新人优惠券', '【限时】超大红包', 2),
(20, 49, '129.0', '79.00', 1626253832, NULL, NULL, 0, 1628845832, 1626253832, 1, '新人优惠券', '【限时】超大红包', 2),
(21, 50, '129.0', '79.00', 1626254000, NULL, NULL, 0, 1628846000, 1626254000, 1, '新人优惠券', '【限时】超大红包', 2),
(22, 51, '129.0', '79.00', 1626254083, NULL, NULL, 0, 1628846083, 1626254083, 1, '新人优惠券', '【限时】超大红包', 2),
(23, 52, '129.0', '79.00', 1626264528, NULL, NULL, 0, 1628856528, 1626264528, 1, '新人优惠券', '【限时】超大红包', 2),
(24, 53, '129.0', '79.00', 1626316052, NULL, NULL, 0, 1628908052, 1626316052, 1, '新人优惠券', '【限时】超大红包', 2),
(25, 35, '129.0', '79.00', 1626319248, 1626426466, NULL, 1, 1628911248, 1626319248, 1, '新人优惠券', '【限时】超大红包', 0),
(26, 40, '129.0', '79.00', 1626319258, NULL, NULL, 0, 1628911258, 1626319258, 1, '新人优惠券', '【限时】超大红包', 0),
(27, 37, '129.0', '79.00', 1626319273, 1626437352, NULL, 1, 1628911273, 1626319273, 1, '新人优惠券', '【限时】超大红包', 0),
(28, 38, '129.0', '79.00', 1626319587, 1626502866, NULL, 1, 1628911587, 1626319587, 1, '新人优惠券', '【限时】超大红包', 0),
(29, 35, '129.0', '79.00', 1626319867, 1627030195, NULL, 1, 1628911867, 1626319867, 1, '新人优惠券', '【限时】超大红包', 2),
(30, 11, '129.0', '79.00', 1626320861, NULL, NULL, 0, 1628912861, 1626320861, 1, '新人优惠券', '【限时】超大红包', 0),
(31, 54, '129.0', '79.00', 1626320928, NULL, NULL, 0, 1628912928, 1626320928, 1, '新人优惠券', '【限时】超大红包', 2),
(32, 55, '129.0', '79.00', 1626320965, NULL, NULL, 0, 1628912965, 1626320965, 1, '新人优惠券', '【限时】超大红包', 2),
(33, 3, '129.0', '0.00', 1626321874, NULL, NULL, 0, 1634097874, 1626321874, 1, '课后抵用券', '【限时】课后活动', 0),
(34, 56, '129.0', '79.00', 1626348284, NULL, NULL, 0, 1628940284, 1626348284, 1, '新人优惠券', '【限时】超大红包', 2),
(35, 57, '129.0', '79.00', 1626364798, 1626704866, NULL, 1, 1628956798, 1626364798, 1, '新人优惠券', '【限时】超大红包', 2),
(36, 58, '129.0', '79.00', 1626387433, NULL, NULL, 0, 1628979433, 1626387433, 1, '新人优惠券', '【限时】超大红包', 2),
(37, 59, '129.0', '79.00', 1626396058, NULL, NULL, 0, 1628988058, 1626396058, 1, '新人优惠券', '【限时】超大红包', 2),
(38, 60, '129.0', '79.00', 1626402716, NULL, NULL, 0, 1628994716, 1626402716, 1, '新人优惠券', '【限时】超大红包', 2),
(39, 20, '129.0', '79.00', 1626410114, NULL, NULL, 0, 1629002114, 1626410114, 1, '新人优惠券', '【限时】超大红包', 2),
(40, 61, '129.0', '79.00', 1626412462, NULL, NULL, 0, 1629004462, 1626412462, 1, '新人优惠券', '【限时】超大红包', 2),
(41, 62, '129.0', '79.00', 1626420636, 1627386002, NULL, 1, 1629012636, 1626420636, 1, '新人优惠券', '【限时】超大红包', 2),
(42, 63, '129.0', '79.00', 1626424656, 1626424930, NULL, 1, 1629016656, 1626424656, 1, '新人优惠券', '【限时】超大红包', 2),
(43, 64, '129.0', '79.00', 1626426453, 1627807950, NULL, 1, 1629018453, 1626426453, 1, '新人优惠券', '【限时】超大红包', 2),
(44, 65, '129.0', '79.00', 1626429387, NULL, NULL, 0, 1629021387, 1626429387, 1, '新人优惠券', '【限时】超大红包', 2),
(45, 66, '129.0', '79.00', 1626430690, 1626430747, NULL, 1, 1629022690, 1626430690, 1, '新人优惠券', '【限时】超大红包', 2),
(46, 67, '129.0', '79.00', 1626431425, 1627020263, NULL, 1, 1629023425, 1626431425, 1, '新人优惠券', '【限时】超大红包', 2),
(47, 68, '129.0', '79.00', 1626437088, 1626437108, NULL, 1, 1629029088, 1626437088, 1, '新人优惠券', '【限时】超大红包', 2),
(48, 69, '129.0', '79.00', 1626437188, NULL, NULL, 0, 1629029188, 1626437188, 1, '新人优惠券', '【限时】超大红包', 2),
(49, 70, '129.0', '79.00', 1626438941, NULL, NULL, 0, 1629030941, 1626438941, 1, '新人优惠券', '【限时】超大红包', 2),
(50, 6, '129.0', '79.00', 1626440273, NULL, NULL, 0, 1629032273, 1626440273, 1, '新人优惠券', '【限时】超大红包', 2),
(51, 4, '129.0', '79.00', 1626440338, NULL, NULL, 0, 1629032338, 1626440338, 1, '新人优惠券', '【限时】超大红包', 2),
(52, 5, '79.0', '129.00', 1626440762, NULL, NULL, 0, 1634216762, 1626440762, 0, '课后抵用券', '【限时】课后活动', 0),
(53, 4, '79.0', '129.00', 1626440807, NULL, NULL, 0, 1634216807, 1626440807, 0, '课后抵用券', '【限时】课后活动', 0),
(54, 71, '129.0', '79.00', 1626442801, 1626443029, NULL, 1, 1629034801, 1626442801, 1, '新人优惠券', '【限时】超大红包', 2),
(55, 72, '129.0', '79.00', 1626443077, 1626443117, NULL, 1, 1629035077, 1626443077, 1, '新人优惠券', '【限时】超大红包', 2),
(56, 73, '129.0', '79.00', 1626443513, 1626447442, NULL, 1, 1629035513, 1626443513, 1, '新人优惠券', '【限时】超大红包', 2),
(57, 74, '129.0', '79.00', 1626443614, NULL, NULL, 0, 1629035614, 1626443614, 1, '新人优惠券', '【限时】超大红包', 2),
(58, 10, '129.0', '79.00', 1626443738, NULL, NULL, 0, 1629035738, 1626443738, 1, '新人优惠券', '【限时】超大红包', 0),
(59, 11, '129.0', '79.00', 1626443749, NULL, NULL, 0, 1629035749, 1626443749, 1, '新人优惠券', '【限时】超大红包', 0),
(60, 12, '129.0', '79.00', 1626443761, NULL, NULL, 0, 1629035761, 1626443761, 1, '新人优惠券', '【限时】超大红包', 0),
(61, 13, '129.0', '79.00', 1626443771, NULL, NULL, 0, 1629035771, 1626443771, 1, '新人优惠券', '【限时】超大红包', 0),
(62, 14, '129.0', '79.00', 1626443782, NULL, NULL, 0, 1629035782, 1626443782, 1, '新人优惠券', '【限时】超大红包', 0),
(63, 15, '129.0', '79.00', 1626443792, 1627380328, NULL, 1, 1629035792, 1626443792, 1, '新人优惠券', '【限时】超大红包', 0),
(64, 16, '129.0', '79.00', 1626443803, NULL, NULL, 0, 1629035803, 1626443803, 1, '新人优惠券', '【限时】超大红包', 0),
(65, 17, '129.0', '79.00', 1626443813, NULL, NULL, 0, 1629035813, 1626443813, 1, '新人优惠券', '【限时】超大红包', 0),
(66, 18, '129.0', '79.00', 1626443829, NULL, NULL, 0, 1629035829, 1626443829, 1, '新人优惠券', '【限时】超大红包', 0),
(67, 26, '129.0', '79.00', 1626443843, NULL, NULL, 0, 1629035843, 1626443843, 1, '新人优惠券', '【限时】超大红包', 0),
(68, 29, '129.0', '79.00', 1626443858, NULL, NULL, 0, 1629035858, 1626443858, 1, '新人优惠券', '【限时】超大红包', 0),
(69, 30, '129.0', '79.00', 1626443872, NULL, NULL, 0, 1629035872, 1626443872, 1, '新人优惠券', '【限时】超大红包', 0),
(70, 34, '129.0', '79.00', 1626443889, NULL, NULL, 0, 1629035889, 1626443889, 1, '新人优惠券', '【限时】超大红包', 0),
(71, 36, '129.0', '79.00', 1626443900, NULL, NULL, 0, 1629035900, 1626443900, 1, '新人优惠券', '【限时】超大红包', 0),
(72, 39, '129.0', '79.00', 1626443914, NULL, NULL, 0, 1629035914, 1626443914, 1, '新人优惠券', '【限时】超大红包', 0),
(73, 41, '129.0', '79.00', 1626443929, NULL, NULL, 0, 1629035929, 1626443929, 1, '新人优惠券', '【限时】超大红包', 0),
(74, 42, '129.0', '79.00', 1626443955, NULL, NULL, 0, 1629035955, 1626443955, 1, '新人优惠券', '【限时】超大红包', 0),
(75, 43, '129.0', '79.00', 1626443970, NULL, NULL, 0, 1629035970, 1626443970, 1, '新人优惠券', '【限时】超大红包', 0),
(76, 47, '129.0', '79.00', 1626443984, NULL, NULL, 0, 1629035984, 1626443984, 1, '新人优惠券', '【限时】超大红包', 0),
(77, 48, '129.0', '79.00', 1626444000, NULL, NULL, 0, 1629036000, 1626444000, 1, '新人优惠券', '【限时】超大红包', 0),
(78, 50, '129.0', '79.00', 1626444024, NULL, NULL, 0, 1629036024, 1626444024, 1, '新人优惠券', '【限时】超大红包', 0),
(79, 51, '129.0', '79.00', 1626444039, NULL, NULL, 0, 1629036039, 1626444039, 1, '新人优惠券', '【限时】超大红包', 0),
(80, 51, '129.0', '79.00', 1626444055, NULL, NULL, 0, 1629036055, 1626444055, 1, '新人优惠券', '【限时】超大红包', 0),
(81, 52, '129.0', '79.00', 1626444066, NULL, NULL, 0, 1629036066, 1626444066, 1, '新人优惠券', '【限时】超大红包', 0),
(82, 53, '129.0', '79.00', 1626444079, NULL, NULL, 0, 1629036079, 1626444079, 1, '新人优惠券', '【限时】超大红包', 0),
(83, 54, '129.0', '79.00', 1626444098, NULL, NULL, 0, 1629036098, 1626444098, 1, '新人优惠券', '【限时】超大红包', 0),
(84, 55, '129.0', '79.00', 1626444111, NULL, NULL, 0, 1629036111, 1626444111, 1, '新人优惠券', '【限时】超大红包', 0),
(85, 57, '129.0', '79.00', 1626444151, NULL, NULL, 0, 1629036151, 1626444151, 1, '新人优惠券', '【限时】超大红包', 0),
(86, 58, '129.0', '79.00', 1626444165, NULL, NULL, 0, 1629036165, 1626444165, 1, '新人优惠券', '【限时】超大红包', 0),
(87, 61, '129.0', '79.00', 1626444185, NULL, NULL, 0, 1629036185, 1626444185, 1, '新人优惠券', '【限时】超大红包', 0),
(88, 62, '129.0', '79.00', 1626444197, 1627386070, NULL, 1, 1629036197, 1626444197, 1, '新人优惠券', '【限时】超大红包', 0),
(89, 63, '129.0', '79.00', 1626444221, NULL, NULL, 0, 1629036221, 1626444221, 1, '新人优惠券', '【限时】超大红包', 0),
(90, 65, '129.0', '79.00', 1626444232, NULL, NULL, 0, 1629036232, 1626444232, 1, '新人优惠券', '【限时】超大红包', 0),
(91, 66, '129.0', '79.00', 1626444244, NULL, NULL, 0, 1629036244, 1626444244, 1, '新人优惠券', '【限时】超大红包', 0),
(92, 67, '129.0', '79.00', 1626444254, 1627642570, NULL, 1, 1629036254, 1626444254, 1, '新人优惠券', '【限时】超大红包', 0),
(93, 70, '129.0', '79.00', 1626444297, NULL, NULL, 0, 1629036297, 1626444297, 1, '新人优惠券', '【限时】超大红包', 0),
(94, 72, '129.0', '79.00', 1626444320, 1627034711, NULL, 1, 1629036320, 1626444320, 1, '新人优惠券', '【限时】超大红包', 0),
(95, 73, '129.0', '79.00', 1626444334, NULL, NULL, 0, 1629036334, 1626444334, 1, '新人优惠券', '【限时】超大红包', 0),
(96, 74, '129.0', '79.00', 1626444346, NULL, NULL, 0, 1629036346, 1626444346, 1, '新人优惠券', '【限时】超大红包', 0),
(97, 75, '129.0', '79.00', 1626445808, 1626445849, NULL, 1, 1629037808, 1626445808, 1, '新人优惠券', '【限时】超大红包', 2),
(98, 76, '129.0', '79.00', 1626448450, NULL, NULL, 0, 1629040450, 1626448450, 1, '新人优惠券', '【限时】超大红包', 2),
(99, 77, '129.0', '79.00', 1626472508, NULL, NULL, 0, 1629064508, 1626472508, 1, '新人优惠券', '【限时】超大红包', 2),
(100, 78, '129.0', '79.00', 1626479982, NULL, NULL, 0, 1629071982, 1626479982, 1, '新人优惠券', '【限时】超大红包', 2),
(101, 79, '129.0', '79.00', 1626482806, NULL, NULL, 0, 1629074806, 1626482806, 1, '新人优惠券', '【限时】超大红包', 2),
(102, 73, '79.0', '129.00', 1626482950, NULL, NULL, 0, 1634258950, 1626482950, 0, '课后抵用券', '【限时】课后活动', 0),
(103, 35, '79.0', '129.00', 1626493621, NULL, NULL, 0, 1634269621, 1626493621, 0, '课后抵用券', '【限时】课后活动', 0),
(104, 80, '129.0', '79.00', 1626494432, NULL, NULL, 0, 1629086432, 1626494432, 1, '新人优惠券', '【限时】超大红包', 2),
(105, 81, '129.0', '79.00', 1626496570, NULL, NULL, 0, 1629088570, 1626496570, 1, '新人优惠券', '【限时】超大红包', 2),
(106, 5, '129.0', '79.00', 1626499386, NULL, NULL, 0, 1629091386, 1626499386, 1, '新人优惠券', '【限时】超大红包', 2),
(107, 82, '129.0', '79.00', 1626499587, NULL, NULL, 0, 1629091587, 1626499587, 1, '新人优惠券', '【限时】超大红包', 2),
(108, 75, '79.0', '129.00', 1626501639, NULL, NULL, 0, 1634277639, 1626501639, 0, '课后抵用券', '【限时】课后活动', 0),
(109, 83, '129.0', '79.00', 1626511600, 1626511642, NULL, 1, 1629103600, 1626511600, 1, '新人优惠券', '【限时】超大红包', 2),
(110, 83, '79.0', '129.00', 1626511994, NULL, NULL, 0, 1634287994, 1626511994, 0, '课后抵用券', '【限时】课后活动', 0),
(111, 84, '129.0', '79.00', 1626512690, NULL, NULL, 0, 1629104690, 1626512690, 1, '新人优惠券', '【限时】超大红包', 2),
(112, 85, '129.0', '79.00', 1626513967, NULL, NULL, 0, 1629105967, 1626513967, 1, '新人优惠券', '【限时】超大红包', 2),
(113, 72, '79.0', '129.00', 1626527107, NULL, NULL, 0, 1634303107, 1626527107, 0, '课后抵用券', '【限时】课后活动', 0),
(114, 86, '129.0', '79.00', 1626527109, NULL, NULL, 0, 1629119109, 1626527109, 1, '新人优惠券', '【限时】超大红包', 2),
(115, 38, '79.0', '129.00', 1626527112, NULL, NULL, 0, 1634303112, 1626527112, 0, '课后抵用券', '【限时】课后活动', 0),
(116, 66, '79.0', '129.00', 1626527171, NULL, NULL, 0, 1634303171, 1626527171, 0, '课后抵用券', '【限时】课后活动', 0),
(117, 87, '129.0', '79.00', 1626604140, NULL, NULL, 0, 1629196140, 1626604140, 1, '新人优惠券', '【限时】超大红包', 2),
(118, 88, '129.0', '79.00', 1626620289, NULL, NULL, 0, 1629212289, 1626620289, 1, '新人优惠券', '【限时】超大红包', 2),
(119, 89, '129.0', '79.00', 1626624986, NULL, NULL, 0, 1629216986, 1626624986, 1, '新人优惠券', '【限时】超大红包', 2),
(120, 90, '129.0', '79.00', 1626653174, NULL, NULL, 0, 1629245174, 1626653174, 1, '新人优惠券', '【限时】超大红包', 2),
(121, 91, '129.0', '79.00', 1626667445, NULL, NULL, 0, 1629259445, 1626667445, 1, '新人优惠券', '【限时】超大红包', 2),
(122, 92, '129.0', '79.00', 1626684611, NULL, NULL, 0, 1629276611, 1626684611, 1, '新人优惠券', '【限时】超大红包', 2),
(123, 2, '10.0', '0.00', 1626692998, NULL, NULL, 0, 1627556998, 1626692998, 1, '无门槛代金券', '', 0),
(124, 3, '10.0', '0.00', 1626692998, NULL, NULL, 0, 1627556998, 1626692998, 1, '无门槛代金券', '', 0),
(125, 71, '129.0', '79.00', 1626701209, 1626701491, NULL, 1, 1629293209, 1626701209, 1, '新人优惠券', '【限时】超大红包', 0),
(126, 93, '129.0', '79.00', 1626701782, 1626701798, NULL, 1, 1629293782, 1626701782, 1, '新人优惠券', '【限时】超大红包', 2),
(127, 94, '129.0', '79.00', 1626702061, 1626702420, NULL, 1, 1629294061, 1626702061, 1, '新人优惠券', '【限时】超大红包', 2),
(128, 71, '129.0', '79.00', 1626702939, NULL, NULL, 0, 1629294939, 1626702939, 1, '新人优惠券', '【限时】超大红包', 0),
(129, 94, '129.0', '79.00', 1626702954, 1626703211, NULL, 1, 1629294954, 1626702954, 1, '新人优惠券', '【限时】超大红包', 0),
(130, 93, '129.0', '79.00', 1626702971, 1626703089, NULL, 1, 1629294971, 1626702971, 1, '新人优惠券', '【限时】超大红包', 0),
(131, 68, '129.0', '79.00', 1626707751, 1626763630, NULL, 1, 1629299751, 1626707751, 1, '新人优惠券', '【限时】超大红包', 0),
(132, 3, '79.0', '129.00', 1626769468, NULL, NULL, 0, 1634545468, 1626769468, 0, '课后抵用券', '【限时】课后活动', 0),
(133, 3, '79.0', '129.00', 1626769663, NULL, NULL, 0, 1634545663, 1626769663, 0, '课后抵用券', '【限时】课后活动', 0),
(134, 3, '79.0', '129.00', 1626769691, NULL, NULL, 0, 1634545691, 1626769691, 0, '课后抵用券', '【限时】课后活动', 0),
(135, 95, '129.0', '79.00', 1626775508, 1627020384, NULL, 1, 1629367508, 1626775508, 1, '新人优惠券', '【限时】超大红包', 2),
(136, 94, '79.0', '129.00', 1626785432, NULL, NULL, 0, 1634561432, 1626785432, 0, '课后抵用券', '【限时】课后活动', 0),
(137, 68, '79.0', '129.00', 1626785455, NULL, NULL, 0, 1634561455, 1626785455, 0, '课后抵用券', '【限时】课后活动', 0),
(138, 94, '79.0', '129.00', 1626785470, NULL, NULL, 0, 1634561470, 1626785470, 0, '课后抵用券', '【限时】课后活动', 0),
(139, 93, '79.0', '129.00', 1626785485, NULL, NULL, 0, 1634561485, 1626785485, 0, '课后抵用券', '【限时】课后活动', 0),
(140, 93, '79.0', '129.00', 1626785493, NULL, NULL, 0, 1634561493, 1626785493, 0, '课后抵用券', '【限时】课后活动', 0),
(141, 96, '129.0', '79.00', 1626787389, NULL, NULL, 0, 1629379389, 1626787389, 1, '新人优惠券', '【限时】超大红包', 2),
(142, 97, '129.0', '79.00', 1626799691, NULL, NULL, 0, 1629391691, 1626799691, 1, '新人优惠券', '【限时】超大红包', 2),
(143, 98, '129.0', '79.00', 1626815554, NULL, NULL, 0, 1629407554, 1626815554, 1, '新人优惠券', '【限时】超大红包', 2),
(144, 99, '129.0', '79.00', 1626845871, NULL, NULL, 0, 1629437871, 1626845871, 1, '新人优惠券', '【限时】超大红包', 2),
(145, 38, '129.0', '79.00', 1626867759, NULL, NULL, 0, 1629459759, 1626867759, 1, '新人优惠券', '【限时】超大红包', 0),
(146, 45, '129.0', '79.00', 1626867759, NULL, NULL, 0, 1629459759, 1626867759, 1, '新人优惠券', '【限时】超大红包', 0),
(147, 100, '129.0', '79.00', 1626933326, NULL, NULL, 0, 1629525326, 1626933326, 1, '新人优惠券', '【限时】超大红包', 2),
(148, 101, '129.0', '79.00', 1626950177, 1627033613, NULL, 1, 1629542177, 1626950177, 1, '新人优惠券', '【限时】超大红包', 2),
(149, 102, '129.0', '79.00', 1626951188, NULL, NULL, 0, 1629543188, 1626951188, 1, '新人优惠券', '【限时】超大红包', 2),
(150, 103, '129.0', '79.00', 1626961772, NULL, NULL, 0, 1629553772, 1626961772, 1, '新人优惠券', '【限时】超大红包', 2),
(151, 104, '129.0', '79.00', 1627009403, NULL, NULL, 0, 1629601403, 1627009403, 1, '新人优惠券', '【限时】超大红包', 2),
(152, 105, '129.0', '79.00', 1627020887, NULL, NULL, 0, 1629612887, 1627020887, 1, '新人优惠券', '【限时】超大红包', 2),
(153, 35, '129.0', '79.00', 1627029841, 1627127687, NULL, 1, 1629621841, 1627029841, 1, '新人优惠券', '【限时】超大红包', 0),
(154, 106, '129.0', '79.00', 1627030821, NULL, NULL, 0, 1629622821, 1627030821, 1, '新人优惠券', '【限时】超大红包', 2),
(155, 107, '129.0', '79.00', 1627043569, 1627043602, NULL, 1, 1629635569, 1627043569, 1, '新人优惠券', '【限时】超大红包', 2),
(156, 108, '129.0', '79.00', 1627045725, NULL, NULL, 0, 1629637725, 1627045725, 1, '新人优惠券', '【限时】超大红包', 2),
(157, 109, '129.0', '79.00', 1627046950, 1627048186, NULL, 1, 1629638950, 1627046950, 1, '新人优惠券', '【限时】超大红包', 2),
(158, 8, '129.0', '79.00', 1627048095, 1627048139, NULL, 1, 1629640095, 1627048095, 1, '新人优惠券', '【限时】超大红包', 2),
(159, 110, '129.0', '79.00', 1627097357, NULL, NULL, 0, 1629689357, 1627097357, 1, '新人优惠券', '【限时】超大红包', 2),
(160, 111, '129.0', '79.00', 1627136569, NULL, NULL, 0, 1629728569, 1627136569, 1, '新人优惠券', '【限时】超大红包', 2),
(161, 112, '129.0', '79.00', 1627259643, NULL, NULL, 0, 1629851643, 1627259643, 1, '新人优惠券', '点我预约免费课', 2),
(162, 5, '79.0', '129.00', 1627280226, NULL, NULL, 0, 1635056226, 1627280226, 0, '课后抵用券', '【限时】课后活动', 0),
(163, 113, '129.0', '79.00', 1627291608, NULL, NULL, 0, 1629883608, 1627291608, 1, '新人优惠券', '点我预约免费课', 2),
(164, 114, '129.0', '79.00', 1627291608, NULL, NULL, 0, 1629883608, 1627291608, 1, '新人优惠券', '点我预约免费课', 2),
(165, 115, '129.0', '79.00', 1627291618, NULL, NULL, 0, 1629883618, 1627291618, 1, '新人优惠券', '点我预约免费课', 2),
(166, 116, '129.0', '79.00', 1627292036, NULL, NULL, 0, 1629884036, 1627292036, 1, '新人优惠券', '点我预约免费课', 2),
(167, 107, '129.0', '79.00', 1627294566, NULL, NULL, 0, 1629886566, 1627294566, 1, '新人优惠券', '点我预约免费课', 0),
(168, 35, '129.0', '79.00', 1627294576, 1627294832, NULL, 1, 1629886576, 1627294576, 1, '新人优惠券', '点我预约免费课', 0),
(169, 15, '129.0', '79.00', 1627381454, 1627381504, NULL, 1, 1629973454, 1627381454, 1, '新人优惠券', '点我预约免费课', 0),
(170, 119, '79.0', '129.00', 1627559223, NULL, NULL, 0, 1635335223, 1627559223, 0, '课后抵用券', '【限时】课后活动', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_coupon_type`
--

CREATE TABLE `cmf_coupon_type` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) DEFAULT '0' COMMENT '0:满减劵；1：立减',
  `days` tinyint(4) DEFAULT '0' COMMENT '天数',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `discount` decimal(3,1) DEFAULT '0.0' COMMENT '折扣',
  `amount` decimal(4,1) DEFAULT NULL COMMENT '金额',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `states` tinyint(1) DEFAULT '0',
  `is_coin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：普通，1：鹿角兑换',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '鹿角数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_coupon_type`
--

INSERT INTO `cmf_coupon_type` (`id`, `type`, `days`, `name`, `remark`, `discount`, `amount`, `total_amount`, `states`, `is_coin`, `coin`) VALUES
(1, 0, 90, '课后抵用券', '【限时】课后活动', '8.0', '79.0', '129.00', 1, 0, 0),
(2, 1, 30, '新人优惠券', '点我预约免费课', '8.0', '129.0', '79.00', 1, 0, 0),
(3, 1, 10, '无门槛代金券', '', '0.0', '10.0', '0.00', 1, 1, 5);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_device`
--

CREATE TABLE `cmf_device` (
  `id` int(11) NOT NULL,
  `add_time` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `device_sn` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `cmf_device`
--

INSERT INTO `cmf_device` (`id`, `add_time`, `update_time`, `device_sn`, `device_name`) VALUES
(5, 1624873856, 1627958668, '2358992010', '门禁'),
(7, 1625753779, 1627958233, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_goods`
--

CREATE TABLE `cmf_goods` (
  `goods_id` mediumint(8) UNSIGNED NOT NULL COMMENT '商品id',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类id',
  `tags` varchar(60) NOT NULL DEFAULT '' COMMENT '商品编号',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `click_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点击数',
  `store_count` smallint(5) UNSIGNED NOT NULL DEFAULT '10' COMMENT '库存数量',
  `comment_count` smallint(5) DEFAULT '0' COMMENT '商品评论数',
  `shop_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价',
  `video_url` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `good_desc` text,
  `goods_brief` varchar(1000) DEFAULT NULL COMMENT '介绍',
  `goods_rule` varchar(1000) DEFAULT NULL COMMENT '收费标砖',
  `goods_remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '进场须知',
  `goods_img` varchar(255) NOT NULL DEFAULT '' COMMENT '商品上传原始图',
  `photo` text,
  `is_on_sale` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否上架',
  `on_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品上架时间',
  `list_order` smallint(4) UNSIGNED NOT NULL DEFAULT '50' COMMENT '商品排序',
  `is_recommend` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_new` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否新品',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否热卖',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '0正常 3回收站',
  `last_update` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `give_integral` mediumint(8) DEFAULT '0' COMMENT '购买商品赠送积分',
  `supplier_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '供货商ID',
  `sales_sum` int(11) DEFAULT '0' COMMENT '商品销量',
  `course_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '课程类型  1：专业，2：必须，3：课间操'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_goods`
--

INSERT INTO `cmf_goods` (`goods_id`, `cat_id`, `tags`, `goods_name`, `click_count`, `store_count`, `comment_count`, `shop_price`, `cost_price`, `video_url`, `keywords`, `good_desc`, `goods_brief`, `goods_rule`, `goods_remark`, `goods_img`, `photo`, `is_on_sale`, `on_time`, `list_order`, `is_recommend`, `is_new`, `is_hot`, `is_delete`, `last_update`, `give_integral`, `supplier_id`, `sales_sum`, `course_type`) VALUES
(6, 4, '1,2,3,4', 'Dear Combat（拳力出击）', 442, 10, 0, '0.00', '0.00', 'goods/20210722/662772d07c2f84c1f46d9e191142aff7.mp4', '', '\n&lt;p&gt;1.运动装备：适合贴身的运动服饰， 避免衣服过于宽松产生动作的影响，脚下要穿舒适耐磨防滑的运动鞋&lt;/p&gt;\n&lt;p&gt;2.在运动前1小时可以食用少量食物，避免在运动中会产生晕头恶心的状况，同时可以增加运动效果。运动前补充适量的水分可以减少脱水的可能，忌讳一次性大量饮水&lt;/p&gt;\n&lt;p&gt;3.本地提供更衣室、储物柜、不设淋浴&lt;/p&gt;\n&lt;p&gt;4.室内设有WIFI  小鹿乱撞：xllz6666 小鹿乱撞-5G：xllz6666&lt;/p&gt;\n&lt;p&gt;5.未满18周岁未成年人请勿进入小鹿乱撞门店&lt;/p&gt;\n&lt;p&gt;6.店内设有视频监控&lt;/p&gt;\n&lt;p&gt;7.如有任何身体不适，请及时告知教练或场地工作人员&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br style=&quot;white-space: normal;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br style=&quot;white-space: normal;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br style=&quot;white-space: normal;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', 'Dear Combat是伴随帅气的出拳，燃烧大量的卡路里，将你的情绪在热烈的音乐氛围中尽情释放！', 'Dear Combat将搏击和有氧训练结合，拳击、踢腿等酷炫的动作和动感的音乐均由顶级教练员、运动生理专家编辑精心研究，安全有效适合于任何喜欢运动的人', 'Dear Combat是快节奏、中高强度、多重复次数的搏击主题有氧运动项目，高效训练四肢肌群和核心，不仅可以燃烧高达800千卡的热量还能让你尽情的释放压力', 'goods/20210618/2b5c8d179b05bd2862da2231796fe19d.png', NULL, 1, 0, 50, 0, 0, 0, 0, 1627807879, 0, 0, 0, 1),
(8, 6, '1,2,3,4', 'Dear Pump（杠铃操）', 182, 10, 0, '0.00', '0.00', 'goods/20210722/841a0163e3e356cac9de2ae12148e5a3.mp4', '', '\n&lt;p&gt;1.运动装备：适合贴身的运动服饰， 避免衣服过于宽松产生动作的影响，脚下要穿舒适耐磨防滑的运动鞋&lt;/p&gt;\n&lt;p&gt;2.在运动前1小时可以食用少量食物，避免在运动中会产生晕头恶心的状况，同时可以增加运动效果。运动前补充适量的水分可以减少脱水的可能，忌讳一次性大量饮水&lt;/p&gt;\n&lt;p&gt;3.本地提供更衣室、储物柜、不设淋浴&lt;/p&gt;\n&lt;p&gt;4.室内设有WIFI  小鹿乱撞：xllz6666 小鹿乱撞-5G：xllz6666&lt;/p&gt;\n&lt;p&gt;5.未满18周岁未成年人请勿进入小鹿乱撞门店&lt;/p&gt;\n&lt;p&gt;6.店内设有视频监控&lt;/p&gt;\n&lt;p&gt;7.如有任何身体不适，请及时告知教练或场地工作人员&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br style=&quot;white-space: normal;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br style=&quot;white-space: normal;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br style=&quot;white-space: normal;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', 'Dear Pump是通过重复多次举起轻量级到中量级的重量，BODYPUMP 能让您全身得到训练，并燃烧掉多达430卡路里的热量。教练将指导您完成一些经科学证明行之有效的训练动作和技巧，在给予你激励与动力的同时，还有律动的音乐，帮助你达到独自训练所无法取得的效果！一堂课下来，你不仅会感到得到了锻炼，情绪也会被调动起来，并期待在下次课程中接受更多挑战。', 'Dear Pump适合希望迅速实现瘦身、紧致和健美效果的人士。', 'Dear Pump是通过完成课程实现全身塑形，并且不会增加不必要的肌肉。获得力量，塑造身材紧致，增加核心力量，改善骨骼健康。', '', NULL, 1, 0, 50, 0, 0, 0, 0, 1627435397, 0, 0, 0, 1),
(9, 5, '1,2,3,4', 'Dear Shbam（炫舞派对）', 75, 10, 0, '0.00', '0.00', 'goods/20210722/aa230f63e91c1ab1e772b626fc469fc6.mp4', '', '\n&lt;ol class=&quot; list-paddingleft-2&quot; style=&quot;width: 752.391px; white-space: normal;&quot;&gt;\n&lt;li&gt;&lt;p&gt;运动装备：适合贴身的运动服饰， 避免衣服过于宽松产生动作的影响，脚下要穿舒适耐磨防滑的运动鞋&lt;/p&gt;&lt;/li&gt;\n&lt;li&gt;&lt;p&gt;在运动前1小时可以食用少量食物，避免在运动中会产生晕头恶心的状况，同时可以增加运动效果。运动前补充适量的水分可以减少脱水的可能，忌讳一次性大量饮水&lt;/p&gt;&lt;/li&gt;\n&lt;li&gt;&lt;p&gt;本地提供更衣室、储物柜、不设淋浴&lt;/p&gt;&lt;/li&gt;\n&lt;li&gt;&lt;p&gt;室内设有WIFI  小鹿乱撞：xllz6666 小鹿乱撞-5G：xllz6666&lt;/p&gt;&lt;/li&gt;\n&lt;li&gt;&lt;p&gt;未满18周岁未成年人请勿进入小鹿乱撞门店&lt;/p&gt;&lt;/li&gt;\n&lt;li&gt;&lt;p&gt;店内设有视频监控&lt;/p&gt;&lt;/li&gt;\n&lt;li&gt;\n&lt;p&gt;如有任何身体不适，请及时告知教练或场地工作人员&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;/li&gt;\n&lt;/ol&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', 'Dear Shbam一方面能消耗较多热量，能把许多舞蹈动作健美操化，通过有氧健美操的锻炼形式，反复或进行组合练习。有氧舞蹈动作不象健美操动作比较操化，有氧舞蹈有许多风格，其音乐与舞蹈的结合紧密，锻炼时能达到愉悦身心，同时人的创造、想象、表现和艺术修养等综合能力都能达到提高', '希望减脂的人群和舞蹈爱好者', '①控制超重肥胖效果明显：有氧运动的特点是强度低、不间断、有节奏、持续时间长，而且方便易行、容易坚持，因此能真正消耗脂肪而不是水分或肌肉，有氧运动控制体重的作用虽然不是“立竿见影”，但长期坚持，效果是显著的。\r\n②可增强心血管功能：长期坚持有规律的有氧运动，不仅能有效控制体重，还可使肌体对氧气的吸入、输送和利用的功能进一步增强，使心肌的收缩变得更为有力，心脏每分钟排出的血量因此而变得更多。这样，心脏就可用较低的心率提供同样的派出血量。\r\n③增大肺活量：有氧运动能增加全身特别是肺部的循环血量，增强氧气的输送能力。坚持有氧运动，会使肺活量迅速提高。\r\n④调节物质代谢：有氧运动可使高血糖者的血糖降低，血脂异常者甘油三脂、胆固醇和低密度脂蛋白等“坏”血脂减少，还能提高血液中对冠心病有益的高密度脂蛋白的含量。此外，还能增强骨骼密度，防止骨质丢失，预防骨质疏松。', '', NULL, 1, 0, 50, 0, 0, 0, 0, 1627601952, 0, 0, 0, 1),
(10, 5, '1,2,3,4', 'Mocha(舞动青春）', 73, 10, 0, '0.00', '0.00', '', '', '\n&lt;p&gt;1.运动装备：适合贴身的运动服饰， 避免衣服过于宽松产生动作的影响，脚下要穿舒适耐磨防滑的运动鞋&lt;/p&gt;\n&lt;p&gt;2.在运动前1小时可以食用少量食物，避免在运动中会产生晕头恶心的状况，同时可以增加运动效果。运动前补充适量的水分可以减少脱水的可能，忌讳一次性大量饮水&lt;/p&gt;\n&lt;p&gt;3.本地提供更衣室、储物柜、不设淋浴&lt;/p&gt;\n&lt;p&gt;4.室内设有WIFI  小鹿乱撞：xllz6666 小鹿乱撞-5G：xllz6666&lt;/p&gt;\n&lt;p&gt;5.未满18周岁未成年人请勿进入小鹿乱撞门店&lt;/p&gt;\n&lt;p&gt;6.店内设有视频监控&lt;/p&gt;\n&lt;p&gt;7.如有任何身体不适，请及时告知教练或场地工作人员&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br style=&quot;white-space: normal;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br style=&quot;white-space: normal;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', 'MOCHA 魔卡舞蹈:是一种健康时尚等健身舞蹈课程，将南美风格等音 乐与简单易学的舞蹈动作融合在一起，体现出热情与奔放，时尚与欢快。', '课堂以节奏感的音乐帮助舞蹈健身初学者提升自信与魅力', '一节50分钟的Mocha健身舞蹈课分成节奏强度不同的几个阶段，即便没有任何舞蹈基础的人，也可以得到有氧锻炼的效果！', '', NULL, 1, 0, 50, 0, 0, 0, 0, 1627435372, 0, 0, 0, 2),
(11, 5, '1,2,3,4', 'Dear Core', 0, 10, 0, '0.00', '0.00', '', '', '\n&lt;p&gt;1.运动装备：适合贴身的运动服饰， 避免衣服过于宽松产生动作的影响，脚下要穿舒适耐磨防滑的运动鞋&lt;/p&gt;\n&lt;p&gt;2.在运动前1小时可以食用少量食物，避免在运动中会产生晕头恶心的状况，同时可以增加运动效果。运动前补充适量的水分可以减少脱水的可能，忌讳一次性大量饮水&lt;/p&gt;\n&lt;p&gt;3.本地提供更衣室、储物柜、不舍淋浴&lt;/p&gt;\n&lt;p&gt;4.室内设有WIFI  小鹿乱撞：xllz6666 小鹿乱撞-5G：xllz6666&lt;/p&gt;\n&lt;p&gt;5.未满18周岁未成年人请勿进入小鹿乱撞门店&lt;/p&gt;\n&lt;p&gt;6.店内设有视频监控&lt;/p&gt;\n&lt;p&gt;7.如有任何身体不适，请及时告知教练或场地工作人员&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br style=&quot;white-space: normal;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', '', '', '', '', NULL, 1, 0, 50, 0, 0, 0, 0, 1626233395, 0, 0, 0, 2),
(12, 5, '1,2,3,4', 'Dear Foc', 3, 10, 0, '0.00', '0.00', '', '', '\n&lt;p&gt;1.运动装备：适合贴身的运动服饰， 避免衣服过于宽松产生动作的影响，脚下要穿舒适耐磨防滑的运动鞋&lt;/p&gt;\n&lt;p&gt;2.在运动前1小时可以食用少量食物，避免在运动中会产生晕头恶心的状况，同时可以增加运动效果。运动前补充适量的水分可以减少脱水的可能，忌讳一次性大量饮水&lt;/p&gt;\n&lt;p&gt;3.本地提供更衣室、储物柜、不舍淋浴&lt;/p&gt;\n&lt;p&gt;4.室内设有WIFI  小鹿乱撞：xllz6666 小鹿乱撞-5G：xllz6666&lt;/p&gt;\n&lt;p&gt;5.未满18周岁未成年人请勿进入小鹿乱撞门店&lt;/p&gt;\n&lt;p&gt;6.店内设有视频监控&lt;/p&gt;\n&lt;p&gt;7.如有任何身体不适，请及时告知教练或场地工作人员&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br style=&quot;white-space: normal;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', '', '', '', '', NULL, 1, 0, 50, 0, 0, 0, 0, 1626233378, 0, 0, 0, 2),
(13, 6, '1,2,3,4', 'Dear Step（活力踏板）', 82, 10, 0, '0.00', '0.00', 'goods/20210722/6d2170f1d688c759a769277a62859122.mp4', '', '\n&lt;p&gt;1.运动装备：适合贴身的运动服饰， 避免衣服过于宽松产生动作的影响，脚下要穿舒适耐磨防滑的运动鞋&lt;/p&gt;\n&lt;p&gt;2.在运动前1小时可以食用少量食物，避免在运动中会产生晕头恶心的状况，同时可以增加运动效果。运动前补充适量的水分可以减少脱水的可能，忌讳一次性大量饮水&lt;/p&gt;\n&lt;p&gt;3.本地提供更衣室、储物柜、不设淋浴&lt;/p&gt;\n&lt;p&gt;4.室内设有WIFI  小鹿乱撞：xllz6666 小鹿乱撞-5G：xllz6666&lt;/p&gt;\n&lt;p&gt;5.未满18周岁未成年人请勿进入小鹿乱撞门店&lt;/p&gt;\n&lt;p&gt;6.店内设有视频监控&lt;/p&gt;\n&lt;p&gt;7.如有任何身体不适，请及时告知教练或场地工作人员&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br style=&quot;white-space: normal;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br style=&quot;white-space: normal;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br style=&quot;white-space: normal;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', 'Dear Step即在踏板上随着动感音乐（每分钟130拍左右）有节奏地上下舞动，进行健美操、舞蹈 的动作和步伐。具有有氧运动的所有特点。这里的活力踏板为自由风格，每节课都是不同的套路，具有极好的趣味性。', 'Dear Step适宜各年龄段人群，特别是想要提臀美腿提高协调性及喜欢趣味性课程的人群', 'Dear Step大部分动作是在踏板上完成，能更有效地增强心肺功能身体协调性及培养良好的方向感。主要针对的部位是下肢和臀部，具有明显耗能减脂，提臀美腿，改善腿部肌肉线条的功效。', '', NULL, 1, 0, 50, 0, 0, 0, 0, 1627435361, 0, 0, 0, 2),
(14, 5, '1,2,3,4', 'Dear JP(Jazz Party)', 91, 10, 0, '0.00', '0.00', '', '', '\n&lt;p style=&quot;white-space: normal;&quot;&gt;1.运动装备：适合贴身的运动服饰， 避免衣服过于宽松产生动作的影响，脚下要穿舒适耐磨防滑的运动鞋&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;2.在运动前1小时可以食用少量食物，避免在运动中会产生晕头恶心的状况，同时可以增加运动效果。运动前补充适量的水分可以减少脱水的可能，忌讳一次性大量饮水&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;3.本地提供更衣室、储物柜、不设淋浴&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;4.室内设有WIFI  小鹿乱撞：xllz6666 小鹿乱撞-5G：xllz6666&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;5.未满18周岁未成年人请勿进入小鹿乱撞门店&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;6.店内设有视频监控&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;7.如有任何身体不适，请及时告知教练或场地工作人员&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', 'Dear JP是舞蹈健身课程主打爵士舞基础练习，结合有氧健身训练，融贯欧，韩，中三大流行音乐曲风，编排简单易学，帮助零基础练习者迅速掌握爵士舞技巧，感受肢体律动', 'Dear JP以派对的轻松氛围帮助舞蹈健身初学者提升自信与魅力', 'Dear JP是训练四肢协调，在提高身体灵活度的同时增强心肺力量，塑造曲线身型。', '', NULL, 1, 0, 50, 0, 0, 0, 0, 1627435169, 0, 0, 0, 2),
(16, 5, '1,2,3,4', 'Dear Barre', 0, 10, 0, '0.00', '0.00', '', '', '\n&lt;p&gt;1.运动装备：适合贴身的运动服饰， 避免衣服过于宽松产生动作的影响，脚下要穿舒适耐磨防滑的运动鞋&lt;/p&gt;\n&lt;p&gt;2.在运动前1小时可以食用少量食物，避免在运动中会产生晕头恶心的状况，同时可以增加运动效果。运动前补充适量的水分可以减少脱水的可能，忌讳一次性大量饮水&lt;/p&gt;\n&lt;p&gt;3.本地提供更衣室、储物柜、不舍淋浴&lt;/p&gt;\n&lt;p&gt;4.室内设有WIFI  小鹿乱撞：xllz6666 小鹿乱撞-5G：xllz6666&lt;/p&gt;\n&lt;p&gt;5.未满18周岁未成年人请勿进入小鹿乱撞门店&lt;/p&gt;\n&lt;p&gt;6.店内设有视频监控&lt;/p&gt;\n&lt;p&gt;7.如有任何身体不适，请及时告知教练或场地工作人员&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', '', '', '', '', NULL, 1, 0, 50, 0, 0, 0, 0, 1626232807, 0, 0, 0, 2),
(17, 5, '1,2,3,4', 'Dear Zumba(尊巴）', 42, 10, 0, '0.00', '0.00', '', '', '\n&lt;p&gt;1.运动装备：适合贴身的运动服饰， 避免衣服过于宽松产生动作的影响，脚下要穿舒适耐磨防滑的运动鞋&lt;/p&gt;\n&lt;p&gt;2.在运动前1小时可以食用少量食物，避免在运动中会产生晕头恶心的状况，同时可以增加运动效果。运动前补充适量的水分可以减少脱水的可能，忌讳一次性大量饮水&lt;/p&gt;\n&lt;p&gt;3.本地提供更衣室、储物柜、不设淋浴&lt;/p&gt;\n&lt;p&gt;4.室内设有WIFI  小鹿乱撞：xllz6666 小鹿乱撞-5G：xllz6666&lt;/p&gt;\n&lt;p&gt;5.未满18周岁未成年人请勿进入小鹿乱撞门店&lt;/p&gt;\n&lt;p&gt;6.店内设有视频监控&lt;/p&gt;\n&lt;p&gt;7.如有任何身体不适，请及时告知教练或场地工作人员&lt;/p&gt;\n&lt;p&gt;&lt;br style=&quot;white-space: normal;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', 'Dear Zumba（尊巴）是一种健康时尚的健身课程，它将音乐与动感易学的动作还有间歇有氧运动融合在了一起。尊巴是由舞蹈演变而来的一种健身方式，它融合了桑巴、恰恰、萨尔萨、雷鬼、弗拉门戈和探戈等多种南美舞蹈形式。一节尊巴课分成节奏强度不同的几个阶段，即便没有任何舞蹈基础的人，也可以得到放松和乐趣。', 'Dear ZUMBA 没有高冲击步伐、肌肉伸缩范围被控制在合理有效的范围内、对人体没有任何器械性伤害的运动特点，适合更广泛的人群。就算从来没有舞蹈基础，也同样可以玩的开心完成训练。', 'Dear Zumba跟随着音乐节奏，和我们的教练一起自由释放，课程会增强协调性、韵律感，同时心肺耐力得到锻炼，过程中充满乐趣。', '', NULL, 1, 0, 50, 0, 0, 0, 0, 1627449753, 0, 0, 0, 2),
(18, 6, '1,2,3,4', 'Dear 翘臀', 36, 10, 0, '0.00', '0.00', '', '', '\n&lt;p style=&quot;white-space: normal;&quot;&gt;1.运动装备：适合贴身的运动服饰， 避免衣服过于宽松产生动作的影响，脚下要穿舒适耐磨防滑的运动鞋&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;2.在运动前1小时可以食用少量食物，避免在运动中会产生晕头恶心的状况，同时可以增加运动效果。运动前补充适量的水分可以减少脱水的可能，忌讳一次性大量饮水&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;3.本地提供更衣室、储物柜、不设淋浴&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;4.室内设有WIFI  小鹿乱撞：xllz6666 小鹿乱撞-5G：xllz6666&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;5.未满18周岁未成年人请勿进入小鹿乱撞门店&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;6.店内设有视频监控&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;7.如有任何身体不适，请及时告知教练或场地工作人员&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', 'Dear 翘臀是提升紧致臀部肌肉从而达到提升臀线的一门课程，利用各种阻力训练来完成中等难度的训练', 'Dear 燃脂适合想要拥有大长腿的女神', 'Dear 燃脂可以达到提升臀线，拥有大长腿的效果。很好的臀部力量可以改善缓解腰痛的情况。', '', NULL, 1, 0, 50, 0, 0, 0, 0, 1627710176, 0, 0, 0, 2),
(19, 6, '1,2,3,4', 'Dear 燃脂', 26, 10, 0, '0.00', '0.00', '', '', '\n&lt;p style=&quot;white-space: normal;&quot;&gt;1.运动装备：适合贴身的运动服饰， 避免衣服过于宽松产生动作的影响，脚下要穿舒适耐磨防滑的运动鞋&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;2.在运动前1小时可以食用少量食物，避免在运动中会产生晕头恶心的状况，同时可以增加运动效果。运动前补充适量的水分可以减少脱水的可能，忌讳一次性大量饮水&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;3.本地提供更衣室、储物柜、不设淋浴&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;4.室内设有WIFI  小鹿乱撞：xllz6666 小鹿乱撞-5G：xllz6666&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;5.未满18周岁未成年人请勿进入小鹿乱撞门店&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;6.店内设有视频监控&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;7.如有任何身体不适，请及时告知教练或场地工作人员&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', 'Dear 燃脂是一节利用各种小工具来组成短时间快速提高心率的课程，他可以在训练结束后让身体进入持续燃脂的效果', 'Dear 燃脂适合各种想要减脂的人群', 'Dear 燃脂可以达到极速燃脂，提高运动表现的效果', '', NULL, 1, 0, 50, 0, 0, 0, 0, 1627654794, 0, 0, 0, 1),
(20, 4, '1,2,3,4', '私教小团课', 6, 10, 0, '0.00', '0.00', '', '', NULL, '', '', '', '', NULL, 1, 0, 50, 0, 0, 0, 0, 1627637999, 0, 0, 0, 3);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_goods_brand`
--

CREATE TABLE `cmf_goods_brand` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '自增id',
  `goodstype_id` int(10) NOT NULL DEFAULT '0' COMMENT '商品id',
  `brandname` varchar(50) NOT NULL COMMENT '品牌名称',
  `brandimage` varchar(255) CHARACTER SET armscii8 DEFAULT NULL COMMENT '品牌图片',
  `addtime` varchar(20) CHARACTER SET armscii8 NOT NULL DEFAULT '' COMMENT '添加时间',
  `deletetime` varchar(10) CHARACTER SET armscii8 NOT NULL DEFAULT '0' COMMENT '删除时间，0不删除',
  `subname` varchar(50) DEFAULT NULL COMMENT '品牌英文标识',
  `logo` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `description` text,
  `sorts` varchar(1) DEFAULT NULL COMMENT '字母排序',
  `style` varchar(100) DEFAULT NULL COMMENT '风格id拼接'',''',
  `type` varchar(100) DEFAULT NULL COMMENT '类型id拼接'',''',
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_goods_category`
--

CREATE TABLE `cmf_goods_category` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT '商品分类id',
  `name` varchar(90) NOT NULL DEFAULT '' COMMENT '商品分类名称',
  `mobile_name` varchar(64) DEFAULT NULL COMMENT '手机端显示的商品分类名',
  `parent_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父id',
  `parent_id_path` varchar(128) DEFAULT NULL COMMENT '家族图谱',
  `level` tinyint(1) DEFAULT '0' COMMENT '等级',
  `list_order` tinyint(1) UNSIGNED NOT NULL DEFAULT '50' COMMENT '顺序排序',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否推荐为热门分类',
  `cat_group` tinyint(1) DEFAULT '0' COMMENT '分类分组默认0',
  `cat_img` varchar(255) DEFAULT NULL,
  `cat_keywords` varchar(255) DEFAULT NULL,
  `cat_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `list_tpl` varchar(100) DEFAULT NULL COMMENT '列表模板',
  `one_tpl` varchar(100) DEFAULT NULL COMMENT '内页模板'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_goods_category`
--

INSERT INTO `cmf_goods_category` (`id`, `name`, `mobile_name`, `parent_id`, `parent_id_path`, `level`, `list_order`, `is_show`, `is_hot`, `cat_group`, `cat_img`, `cat_keywords`, `cat_desc`, `list_tpl`, `one_tpl`) VALUES
(1, '正餐小吃', NULL, 0, '0-1', 0, 50, 1, 0, 0, 'goods/20210831/a37df6390b1c7c19f7f044805798dc77.png', '', '', NULL, NULL),
(2, '甜品饮食', NULL, 0, '0-2', 0, 50, 1, 0, 0, 'goods/20210831/4b2d7b28046f8abc74f3ccb831e08db5.png', '', '', NULL, NULL),
(3, '宵夜烧烤', NULL, 0, '0-3', 0, 50, 1, 0, 0, 'goods/20210831/2be4b1b3fac9e97b98512f9ed9fb0235.png', '', '', NULL, NULL),
(4, '果蔬超市', NULL, 0, '0-4', 0, 50, 1, 0, 0, 'goods/20210831/bb796f040ab745e8422ceed1e4a31535.png', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_goods_comment`
--

CREATE TABLE `cmf_goods_comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `goods_id` mediumint(8) UNSIGNED NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `content` text NOT NULL,
  `goods_rank` tinyint(1) DEFAULT NULL COMMENT '商品评价星级',
  `parent_id` int(10) DEFAULT NULL COMMENT '父级id',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT '订单id',
  `img` text,
  `ip_address` varchar(20) DEFAULT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `add_time` int(10) NOT NULL,
  `supplier_id` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_goods_comment`
--

INSERT INTO `cmf_goods_comment` (`id`, `goods_id`, `email`, `username`, `avatar`, `content`, `goods_rank`, `parent_id`, `user_id`, `order_id`, `img`, `ip_address`, `is_show`, `add_time`, `supplier_id`) VALUES
(1, 14, NULL, NULL, NULL, '6546+789+789+', 4, NULL, 2, 17, 'default/20200508/a1a1973f4691463e57920fe3b429ff57.png', NULL, 0, 1595350347, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_goods_factory`
--

CREATE TABLE `cmf_goods_factory` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `factory_name` varchar(255) DEFAULT NULL COMMENT '厂区名称',
  `all_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '全包价格',
  `half_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '半包价格',
  `one_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单人价格',
  `people_num` int(5) NOT NULL DEFAULT '0' COMMENT '场地容纳人数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_goods_factory`
--

INSERT INTO `cmf_goods_factory` (`id`, `goods_id`, `factory_name`, `all_price`, `half_price`, `one_price`, `people_num`) VALUES
(1, 3, '1号区', '25.00', '30.00', '0.01', 20),
(2, 3, '2号区', '30.00', '38.00', '40.00', 30),
(3, 3, '3号区', '28.00', '35.00', '38.00', 40);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_goods_images`
--

CREATE TABLE `cmf_goods_images` (
  `img_id` mediumint(8) UNSIGNED NOT NULL,
  `goods_id` mediumint(8) UNSIGNED NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_goods_mold`
--

CREATE TABLE `cmf_goods_mold` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'id自增',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '类型名称',
  `create_time` varchar(15) DEFAULT NULL,
  `delete_time` varchar(15) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `update_time` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_goods_mold`
--

INSERT INTO `cmf_goods_mold` (`id`, `name`, `create_time`, `delete_time`, `update_time`) VALUES
(1, '场地', NULL, '0', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_goods_sku`
--

CREATE TABLE `cmf_goods_sku` (
  `sku_id` int(11) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `item_path` varchar(255) DEFAULT NULL COMMENT '规格id',
  `price` decimal(10,2) DEFAULT NULL,
  `store_count` int(11) DEFAULT NULL COMMENT '库存',
  `seller_count` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_goods_style`
--

CREATE TABLE `cmf_goods_style` (
  `id` int(11) UNSIGNED NOT NULL,
  `stylename` varchar(255) DEFAULT NULL COMMENT '风格名称',
  `ishow` int(1) DEFAULT '1' COMMENT '是否显示',
  `create_time` varchar(15) DEFAULT NULL COMMENT '创建时间',
  `delete_time` varchar(15) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `update_time` varchar(15) DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_goods_tag`
--

CREATE TABLE `cmf_goods_tag` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `list_order` int(5) DEFAULT '1000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_goods_tag`
--

INSERT INTO `cmf_goods_tag` (`id`, `name`, `status`, `list_order`) VALUES
(1, '有趣', 1, 10),
(2, '好玩', 1, 20),
(3, '新潮', 1, 30),
(4, '酷', 1, 40);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_goods_time`
--

CREATE TABLE `cmf_goods_time` (
  `id` int(10) NOT NULL,
  `goods_id` int(10) DEFAULT '0',
  `cat_id` int(10) NOT NULL DEFAULT '0',
  `store_id` int(10) DEFAULT '0' COMMENT '门店id',
  `user_id` int(10) DEFAULT '0' COMMENT '教练用户id',
  `coach_id` int(10) DEFAULT '0' COMMENT '教练id',
  `goods_name` varchar(255) DEFAULT NULL,
  `shop_price` decimal(10,2) DEFAULT '0.00',
  `member_price` decimal(10,2) DEFAULT '0.00',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `end_time` int(10) DEFAULT '0' COMMENT '上课结束时间',
  `start_time` int(10) DEFAULT '0' COMMENT '上课时间',
  `year` mediumint(4) DEFAULT NULL,
  `month` smallint(2) DEFAULT NULL,
  `date_time` int(10) DEFAULT NULL,
  `day` smallint(2) DEFAULT NULL,
  `is_on_sale` tinyint(1) NOT NULL DEFAULT '0',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐',
  `tags` varchar(100) DEFAULT NULL,
  `people_num` smallint(3) NOT NULL DEFAULT '0' COMMENT '人数',
  `enroll_num` smallint(3) NOT NULL DEFAULT '0' COMMENT '报名人数',
  `wait_num` tinyint(3) NOT NULL DEFAULT '0' COMMENT '等候人数',
  `course_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '课程类型  1：专业，2：必须，3：课间操',
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_goods_time`
--

INSERT INTO `cmf_goods_time` (`id`, `goods_id`, `cat_id`, `store_id`, `user_id`, `coach_id`, `goods_name`, `shop_price`, `member_price`, `add_time`, `end_time`, `start_time`, `year`, `month`, `date_time`, `day`, `is_on_sale`, `is_recommend`, `tags`, `people_num`, `enroll_num`, `wait_num`, `course_type`, `photo`) VALUES
(3, 4, 4, 1, 2, 2, 'BODYABCD燃脂搏击 ', '20.00', '15.00', 1623403459, 1623481200, 1623474000, 2021, 6, 1623427200, 12, 1, 0, '1,2,3', 15, 0, 0, 0, NULL),
(7, 1, 1, 1, 2, 2, ' BODYABCD', '10.00', '9.00', 1624262553, 1624334400, 1624327200, 2021, 6, 1624291200, 22, 1, 0, '1,2,3', 10, 0, 0, 0, NULL),
(9, 5, 4, 1, 2, 2, '零噪音减脂进阶', '15.00', '13.00', 1624262656, 1624356000, 1624348800, 2021, 6, 1624291200, 22, 1, 0, '1,2,3', 6, 0, 0, 0, NULL),
(12, 4, 4, 1, 5, 3, 'HIIT燃脂进阶', '0.01', '0.01', 1624702183, 1625644800, 1625630400, 2021, 7, 1625587200, 7, 1, 0, '1,2,3', 12, 1, 0, 0, NULL),
(13, 5, 4, 1, 5, 3, '零噪音减脂进阶', '5.00', '5.00', 1624850362, 1625029200, 1625022000, 2021, 6, 1624982400, 30, 1, 0, '1,2,3', 10, 1, 0, 0, NULL),
(15, 4, 4, 1, 2, 2, 'HIIT燃脂进阶', '0.01', '0.01', 1625130572, 1625209200, 1625202000, 2021, 7, 1625155200, 2, 1, 0, '1,2,3', 5, 1, 0, 0, NULL),
(16, 6, 4, 1, 8, 8, '搏击体验测试', '0.01', '0.01', 1625477925, 1625569200, 1625562000, 2021, 7, 1625500800, 6, 1, 0, '1,2', 5, 3, 0, 1, NULL),
(17, 6, 4, 1, 2, 2, '搏击体验测试', '0.01', '0.01', 1625553086, 1625562000, 1625555116, 2021, 7, 1625500800, 6, 1, 0, '1,2', 12, 1, 0, 1, NULL),
(18, 6, 4, 1, 24, 24, 'Dear Combat燃脂搏击', '159.00', '129.00', 1625739061, 1626094200, 1626091200, 2021, 7, 1626019200, 12, 0, 0, '1,2,3', 20, 0, 0, 1, NULL),
(19, 6, 4, 1, 5, 19, 'Dear Combat燃脂搏击', '0.01', '0.01', 1625743069, 1625746500, 1625744040, 2021, 7, 1625673600, 8, 1, 0, '1,2', 0, 1, 0, 1, NULL),
(20, 7, 4, 1, 5, 27, '品牌发布会', '0.01', '0.01', 1625889434, 1625907600, 1625900400, 2021, 7, 1625846400, 10, 1, 0, '', 30, 1, 0, 2, NULL),
(21, 7, 4, 1, 5, 27, '品牌发布会', '0.01', '0.01', 1625903251, 1625914800, 1625907600, 2021, 7, 1625846400, 10, 1, 0, '1,2,3,4', 30, 1, 0, 2, NULL),
(22, 1, 1, 1, 5, 27, ' BODYABCD', '0.01', '0.01', 1625916867, 1625922000, 1625918400, 2021, 7, 1625846400, 10, 1, 0, '1,2,3', 2, 5, 0, 0, NULL),
(23, 6, 4, 1, 3, 28, 'Dear Combat燃脂搏击', '0.01', '0.01', 1626069922, 1626091200, 1626084000, 2021, 7, 1626019200, 12, 1, 0, '1,2,3', 5, 3, 0, 1, 'default/20210712/337921313134b13d26990062cedcf72b.gif'),
(24, 6, 4, 1, 5, 27, 'Dear Combat燃脂搏击', '0.00', '0.00', 1626145971, 1626151500, 1626147900, 2021, 7, 1626105600, 13, 1, 0, '1,2,3', 2, 1, 0, 1, 'default/20210713/2c632ab078ca8bbd2c3fa2f760df4ba1.jpg'),
(25, 6, 4, 1, 5, 27, 'Dear Combat燃脂搏击', '100.00', '80.00', 1626147443, 1626181200, 1626177600, 2021, 7, 1626105600, 13, 1, 0, '1,2,3', 1, 1, 0, 1, NULL),
(26, 10, 5, 1, 20, 21, 'Mocha(舞动青春）', '129.00', '39.00', 1626189698, 1626190080, 1626188400, 2021, 7, 1626105600, 13, 1, 0, '1,2,3,4', 1, 0, 0, 2, NULL),
(27, 10, 5, 1, 19, 20, 'Mocha(舞动青春）', '129.00', '64.50', 1626226208, 1626486300, 1626483600, 2021, 7, 1626451200, 17, 1, 0, '1,2,3,4', 30, 2, 0, 2, 'default/20210717/aea1ffecc417fc0109073a69e1c78000.jpg'),
(28, 8, 6, 1, 25, 26, 'Dear Pump（杠铃操）', '129.00', '64.50', 1626226263, 1626493500, 1626490800, 2021, 7, 1626451200, 17, 1, 0, '1,2,3,4', 30, 2, 0, 1, 'default/20210717/98bb5745d86d450dc5193838a8767cca.jpg'),
(29, 14, 5, 1, 23, 25, 'Dear JP(Jazz Party)', '129.00', '64.50', 1626226308, 1626500700, 1626498000, 2021, 7, 1626451200, 17, 1, 0, '1,2,3,4', 30, 1, 0, 2, NULL),
(30, 13, 6, 1, 24, 24, 'Dear Step（活力踏板）', '129.00', '64.50', 1626226565, 1626515100, 1626512400, 2021, 7, 1626451200, 17, 1, 0, '1,2,3,4', 30, 1, 0, 2, 'default/20210717/497a976fd87e94a520285873acaef357.jpg'),
(32, 8, 6, 1, 23, 25, 'Dear Pump（杠铃操）', '129.00', '64.50', 1626228119, 1626609000, 1626606000, 2021, 7, 1626537600, 18, 0, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(35, 13, 6, 1, 24, 24, 'Dear Step（活力踏板）', '129.00', '64.50', 1626228874, 1626695400, 1626692400, 2021, 7, 1626624000, 19, 1, 0, '1,2,3,4', 30, 0, 0, 2, NULL),
(36, 6, 4, 1, 24, 24, 'Dear Combat（拳力出击）', '129.00', '64.50', 1626228900, 1626699000, 1626696000, 2021, 7, 1626624000, 19, 1, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(37, 8, 6, 1, 45, 29, 'Dear Pump（杠铃操）', '129.00', '64.50', 1626233014, 1626525900, 1626523200, 2021, 7, 1626451200, 17, 1, 0, '1,2,3,4', 30, 6, 0, 1, NULL),
(38, 17, 5, 1, 45, 29, 'Dear Zumba(尊巴）', '129.00', '64.50', 1626233079, 1626529500, 1626526800, 2021, 7, 1626451200, 17, 1, 0, '1,2,3,4', 30, 0, 0, 2, NULL),
(40, 8, 6, 1, 25, 26, 'Dear Pump（杠铃操）', '129.00', '64.50', 1626282568, 1626785400, 1626782400, 2021, 7, 1626710400, 20, 1, 0, '1,2,3,4', 30, 4, 0, 1, NULL),
(41, 14, 5, 1, 23, 25, 'Dear JP(Jazz Party)', '129.00', '64.50', 1626436331, 1626612600, 1626609600, 2021, 7, 1626537600, 18, 0, 0, '1,2,3,4', 30, 0, 0, 2, NULL),
(42, 6, 4, 1, 6, 30, 'Dear Combat（拳力出击）', '0.01', '0.01', 1626440366, 1626441780, 1626440700, 2021, 7, 1626364800, 16, 1, 0, '1,2,3,4', 9, 2, 0, 1, NULL),
(44, 14, 5, 1, 23, 25, 'Dear JP(Jazz Party)', '129.00', '9.90', 1626489595, 1626954600, 1626951600, 2021, 7, 1626883200, 22, 1, 0, '1,2,3,4', 30, 0, 0, 2, NULL),
(45, 9, 5, 1, 23, 25, 'Dear Shbam', '129.00', '9.90', 1626489613, 1626958200, 1626955200, 2021, 7, 1626883200, 22, 1, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(47, 6, 4, 1, 45, 29, 'Dear Combat（拳力出击）', '129.00', '64.50', 1626689206, 1626868200, 1626865200, 2021, 7, 1626796800, 21, 1, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(48, 17, 5, 1, 45, 29, 'Dear Zumba(尊巴）', '129.00', '64.50', 1626689249, 1626871800, 1626868800, 2021, 7, 1626796800, 21, 1, 0, '1,2,3,4', 30, 0, 0, 2, NULL),
(49, 8, 6, 1, 45, 29, 'Dear Pump（杠铃操）', '129.00', '9.90', 1626689280, 1627041000, 1627038000, 2021, 7, 1626969600, 23, 1, 0, '1,2,3,4', 30, 3, 0, 1, NULL),
(50, 6, 4, 1, 45, 29, 'Dear Combat（拳力出击）', '129.00', '9.90', 1626689329, 1627044600, 1627041600, 2021, 7, 1626969600, 23, 1, 0, '1,2,3,4', 30, 2, 0, 1, NULL),
(51, 9, 5, 1, 25, 26, 'Dear Shbam', '129.00', '64.50', 1626697980, 1626781800, 1626778800, 2021, 7, 1626710400, 20, 1, 0, '1,2,3,4', 30, 4, 0, 1, NULL),
(52, 8, 6, 1, 23, 25, 'Dear Pump（杠铃操）', '129.00', '9.90', 1627014326, 1627213800, 1627210800, 2021, 7, 1627142400, 25, 1, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(53, 14, 5, 1, 23, 25, 'Dear JP(Jazz Party)', '129.00', '9.90', 1627014349, 1627217400, 1627214400, 2021, 7, 1627142400, 25, 1, 0, '1,2,3,4', 30, 0, 0, 2, NULL),
(54, 13, 6, 1, 24, 24, 'Dear Step（活力踏板）', '129.00', '9.90', 1627014447, 1627300200, 1627297200, 2021, 7, 1627228800, 26, 1, 0, '1,2,3,4', 30, 0, 0, 2, NULL),
(55, 6, 4, 1, 24, 24, 'Dear Combat（拳力出击）', '129.00', '9.90', 1627014467, 1627303800, 1627300800, 2021, 7, 1627228800, 26, 1, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(56, 8, 6, 1, 25, 26, 'Dear Pump（杠铃操）', '129.00', '9.90', 1627014519, 1627386600, 1627383600, 2021, 7, 1627315200, 27, 1, 0, '1,2,3,4', 30, 4, 0, 1, NULL),
(57, 9, 5, 1, 25, 26, 'Dear Shbam', '129.00', '9.90', 1627014547, 1627390200, 1627387200, 2021, 7, 1627315200, 27, 1, 0, '1,2,3,4', 30, 2, 0, 1, NULL),
(58, 6, 4, 1, 45, 29, 'Dear Combat（拳力出击）', '129.00', '9.90', 1627014904, 1627473000, 1627470000, 2021, 7, 1627401600, 28, 1, 0, '1,2,3,4', 30, 2, 0, 1, NULL),
(59, 17, 5, 1, 45, 29, 'Dear Zumba(尊巴）', '129.00', '9.90', 1627014927, 1627476600, 1627473600, 2021, 7, 1627401600, 28, 1, 0, '1,2,3,4', 30, 3, 0, 2, NULL),
(60, 14, 5, 1, 23, 25, 'Dear JP(Jazz Party)', '99.00', '79.00', 1627014995, 1627559400, 1627556400, 2021, 7, 1627488000, 29, 1, 0, '1,2,3,4', 30, 0, 0, 2, NULL),
(61, 18, 6, 1, 5, 27, 'Dear 燃脂', '129.00', '9.90', 1627029688, 1627095000, 1627092000, 2021, 7, 1627056000, 24, 1, 0, '1', 30, 3, 0, 2, 'default/20210724/2ff52f5f3cf3d619123872e02989b10b.jpg'),
(62, 19, 6, 1, 5, 27, 'Dear 燃脂', '129.00', '9.90', 1627030969, 1627127400, 1627124400, 2021, 7, 1627056000, 24, 1, 0, '1,2,3,4', 30, 1, 0, 1, NULL),
(63, 18, 6, 1, 5, 27, 'Dear 翘臀', '129.00', '9.90', 1627031106, 1627181400, 1627178400, 2021, 7, 1627142400, 25, 1, 0, '1,2,3,4', 30, 1, 0, 2, NULL),
(64, 19, 6, 1, 5, 27, 'Dear 燃脂', '129.00', '9.90', 1627031126, 1627267800, 1627264800, 2021, 7, 1627228800, 26, 1, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(65, 18, 6, 1, 5, 27, 'Dear 翘臀', '129.00', '9.90', 1627031176, 1627440600, 1627437600, 2021, 7, 1627401600, 28, 1, 0, '1,2,3,4', 30, 0, 0, 2, NULL),
(66, 19, 6, 1, 5, 27, 'Dear 燃脂', '129.00', '9.90', 1627031215, 1627354200, 1627351200, 2021, 7, 1627315200, 27, 1, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(67, 9, 5, 1, 23, 25, 'Dear Shbam', '99.00', '79.00', 1627103343, 1627563000, 1627560000, 2021, 7, 1627488000, 29, 1, 0, '1,2,3,4', 30, 1, 0, 1, NULL),
(68, 18, 6, 1, 5, 27, 'Dear 翘臀', '129.00', '9.90', 1627104596, 1627527000, 1627524000, 2021, 7, 1627488000, 29, 1, 0, '1,2,3,4', 30, 0, 0, 2, NULL),
(69, 19, 6, 1, 5, 27, 'Dear 燃脂', '129.00', '9.90', 1627272172, 1627282200, 1627279200, 2021, 7, 1627228800, 26, 1, 0, '1,2,3,4', 30, 1, 0, 1, NULL),
(70, 19, 6, 1, 5, 27, 'Dear 燃脂', '129.00', '9.90', 1627285718, 1627613400, 1627610400, 2021, 7, 1627574400, 30, 1, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(71, 6, 4, 1, 45, 29, 'Dear Combat（拳力出击）', '129.00', '9.90', 1627287033, 1627649400, 1627646400, 2021, 7, 1627574400, 30, 1, 0, '1,2,3,4', 30, 1, 0, 1, NULL),
(72, 8, 6, 1, 45, 29, 'Dear Pump（杠铃操）', '99.00', '79.00', 1627287055, 1627645800, 1627642800, 2021, 7, 1627574400, 30, 1, 0, '1,2,3,4', 30, 2, 0, 1, NULL),
(73, 19, 6, 1, 5, 27, 'Dear 燃脂', '99.00', '79.00', 1627601862, 1627699800, 1627696800, 2021, 7, 1627660800, 31, 1, 0, '1,2,3,4', 30, 1, 0, 1, NULL),
(74, 18, 6, 1, 5, 27, 'Dear 翘臀', '99.00', '79.00', 1627601880, 1627732200, 1627729200, 2021, 7, 1627660800, 31, 1, 0, '1,2,3,4', 30, 0, 0, 2, NULL),
(75, 13, 6, 1, 25, 26, 'Dear Step（活力踏板）', '99.00', '79.00', 1627601928, 1627818600, 1627815600, 2021, 8, 1627747200, 1, 1, 0, '1,2,3,4', 30, 0, 0, 2, NULL),
(76, 9, 5, 1, 25, 26, 'Dear Shbam（炫舞派对）', '99.00', '79.00', 1627601966, 1627822200, 1627819200, 2021, 8, 1627747200, 1, 1, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(77, 13, 6, 1, 24, 24, 'Dear Step（活力踏板）', '99.00', '79.00', 1627601987, 1627905000, 1627902000, 2021, 8, 1627833600, 2, 1, 0, '1,2,3,4', 30, 0, 0, 2, NULL),
(78, 6, 4, 1, 24, 24, 'Dear Combat（拳力出击）', '99.00', '79.00', 1627602005, 1627908600, 1627905600, 2021, 8, 1627833600, 2, 1, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(79, 9, 5, 1, 25, 26, 'Dear Shbam（炫舞派对）', '99.00', '79.00', 1627602020, 1627991400, 1627988400, 2021, 8, 1627920000, 3, 1, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(80, 8, 6, 1, 25, 26, 'Dear Pump（杠铃操）', '99.00', '79.00', 1627602033, 1627995000, 1627992000, 2021, 8, 1627920000, 3, 1, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(81, 20, 4, 1, 4, 31, '私教小团课', '99.00', '79.00', 1627638029, 1627794000, 1627790400, 2021, 8, 1627747200, 1, 1, 0, '1,2,3,4', 5, 0, 0, 3, NULL),
(82, 20, 4, 1, 5, 27, '私教小团课', '99.00', '79.00', 1627638404, 1627798200, 1627794600, 2021, 8, 1627747200, 1, 1, 0, '1,2,3,4', 5, 0, 0, 3, NULL),
(84, 6, 4, 1, 45, 29, 'Dear Combat（拳力出击）', '99.00', '79.00', 1627725605, 1628077800, 1628074800, 2021, 8, 1628006400, 4, 1, 0, '1,2,3,4', 30, 1, 0, 1, NULL),
(85, 17, 5, 1, 45, 29, 'Dear Zumba(尊巴）', '99.00', '79.00', 1627725622, 1628081400, 1628078400, 2021, 8, 1628006400, 4, 1, 0, '1,2,3,4', 30, 1, 0, 2, NULL),
(86, 14, 5, 1, 23, 25, 'Dear JP(Jazz Party)', '99.00', '79.00', 1627725639, 1628164200, 1628161200, 2021, 8, 1628092800, 5, 1, 0, '1,2,3,4', 30, 0, 0, 2, NULL),
(87, 9, 5, 1, 23, 25, 'Dear Shbam（炫舞派对）', '99.00', '79.00', 1627725659, 1628167800, 1628164800, 2021, 8, 1628092800, 5, 1, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(88, 19, 6, 1, 5, 27, 'Dear 燃脂', '99.00', '79.00', 1627727312, 1627786800, 1627783200, 2021, 8, 1627747200, 1, 1, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(89, 20, 4, 1, 5, 27, '私教小团课', '99.00', '79.00', 1627807579, 1627873200, 1627869600, 2021, 8, 1627833600, 2, 1, 0, '1,2,3,4', 30, 0, 0, 3, NULL),
(90, 20, 4, 1, 4, 31, '私教小团课', '99.00', '79.00', 1627807611, 1627884000, 1627880400, 2021, 8, 1627833600, 2, 0, 0, '1,2,3,4', 5, 0, 0, 3, NULL),
(91, 20, 4, 1, 5, 27, '私教小团课', '99.00', '79.00', 1627807641, 1627889400, 1627885800, 2021, 8, 1627833600, 2, 0, 0, '1,2,3,4', 5, 0, 0, 3, NULL),
(92, 20, 4, 1, 4, 31, '私教小团课', '99.00', '79.00', 1627807670, 1627894800, 1627891200, 2021, 8, 1627833600, 2, 0, 0, '1,2,3,4', 5, 0, 0, 3, NULL),
(93, 6, 4, 1, 45, 29, 'Dear Combat（拳力出击）', '99.00', '79.00', 1627807745, 1627960800, 1627957800, 2021, 8, 1627920000, 3, 1, 0, '1,2,3,4', 30, 1, 0, 1, NULL),
(94, 20, 4, 1, 5, 27, '私教小团课', '99.00', '79.00', 1627807784, 1627970400, 1627966800, 2021, 8, 1627920000, 3, 0, 0, '1,2,3,4', 5, 0, 0, 3, NULL),
(95, 20, 4, 1, 4, 31, '私教小团课', '99.00', '79.00', 1627807819, 1627975800, 1627972200, 2021, 8, 1627920000, 3, 0, 0, '1,2,3,4', 5, 0, 0, 3, NULL),
(96, 18, 6, 1, 5, 27, 'Dear 翘臀', '99.00', '79.00', 1627808093, 1628046000, 1628042400, 2021, 8, 1628006400, 4, 0, 0, '1,2,3,4', 10, 0, 0, 2, NULL),
(97, 20, 4, 1, 4, 31, '私教小团课', '99.00', '79.00', 1627814057, 1628056800, 1628053200, 2021, 8, 1628006400, 4, 0, 0, '1,2,3,4', 30, 0, 0, 3, NULL),
(98, 20, 4, 1, 5, 27, '私教小团课', '99.00', '79.00', 1627814183, 1628062200, 1628058600, 2021, 8, 1628006400, 4, 0, 0, '1,2,3,4', 30, 0, 0, 3, NULL),
(99, 19, 6, 1, 5, 27, 'Dear 燃脂', '99.00', '79.00', 1627814217, 1628067600, 1628064000, 2021, 8, 1628006400, 4, 0, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(100, 20, 4, 1, 5, 27, '私教小团课', '99.00', '79.00', 1627814250, 1628132400, 1628128800, 2021, 8, 1628092800, 5, 0, 0, '1,2,3,4', 30, 0, 0, 3, NULL),
(101, 20, 4, 1, 4, 31, '私教小团课', '99.00', '79.00', 1627814272, 1628143200, 1628139600, 2021, 8, 1628092800, 5, 0, 0, '1,2,3,4', 30, 0, 0, 3, NULL),
(102, 20, 4, 1, 5, 27, '私教小团课', '99.00', '79.00', 1627814319, 1628148600, 1628145000, 2021, 8, 1628092800, 5, 0, 0, '1,2,3,4', 30, 0, 0, 3, NULL),
(103, 8, 6, 1, 45, 29, 'Dear Pump（杠铃操）', '99.00', '79.00', 1627814355, 1628250600, 1628247600, 2021, 8, 1628179200, 6, 1, 0, '1,2,3,4', 30, 0, 0, 1, NULL),
(104, 6, 4, 1, 45, 29, 'Dear Combat（拳力出击）', '99.00', '79.00', 1627814373, 1628254200, 1628251200, 2021, 8, 1628179200, 6, 1, 0, '1,2,3,4', 30, 0, 0, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_hook`
--

CREATE TABLE `cmf_hook` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表';

--
-- 转存表中的数据 `cmf_hook`
--

INSERT INTO `cmf_hook` (`id`, `type`, `once`, `name`, `hook`, `app`, `description`) VALUES
(2, 1, 0, '应用开始', 'app_begin', 'cmf', '应用开始'),
(3, 1, 0, '模块初始化', 'module_init', 'cmf', '模块初始化'),
(4, 1, 0, '控制器开始', 'action_begin', 'cmf', '控制器开始'),
(5, 1, 0, '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤'),
(6, 1, 0, '应用结束', 'app_end', 'cmf', '应用结束'),
(7, 1, 0, '日志write方法', 'log_write', 'cmf', '日志write方法'),
(8, 1, 0, '输出结束', 'response_end', 'cmf', '输出结束'),
(9, 1, 0, '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化'),
(10, 1, 0, '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化'),
(11, 1, 1, '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码'),
(12, 3, 0, '模板 body标签开始', 'body_start', '', '模板 body标签开始'),
(13, 3, 0, '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前'),
(14, 3, 0, '模板底部开始', 'footer_start', '', '模板底部开始'),
(15, 3, 0, '模板底部开始之前', 'before_footer', '', '模板底部开始之前'),
(16, 3, 0, '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前'),
(17, 3, 0, '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前'),
(18, 3, 0, '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始'),
(19, 3, 0, '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前'),
(20, 3, 0, '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始'),
(21, 3, 0, '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前'),
(22, 3, 1, '评论区', 'comment', '', '评论区'),
(23, 3, 1, '留言区', 'guestbook', '', '留言区'),
(24, 2, 0, '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘'),
(25, 4, 0, '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前'),
(26, 4, 0, '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前'),
(27, 2, 0, '后台登录页面', 'admin_login', 'admin', '后台登录页面'),
(28, 1, 1, '前台模板切换', 'switch_theme', 'cmf', '前台模板切换'),
(29, 3, 0, '主要内容之后', 'after_content', '', '主要内容之后'),
(32, 2, 1, '获取上传界面', 'fetch_upload_view', 'user', '获取上传界面'),
(33, 3, 0, '主要内容之前', 'before_content', 'cmf', '主要内容之前'),
(34, 1, 0, '日志写入完成', 'log_write_done', 'cmf', '日志写入完成'),
(35, 1, 1, '后台模板切换', 'switch_admin_theme', 'cmf', '后台模板切换'),
(36, 1, 1, '验证码图片', 'captcha_image', 'cmf', '验证码图片'),
(37, 2, 1, '后台模板设计界面', 'admin_theme_design_view', 'admin', '后台模板设计界面'),
(38, 2, 1, '后台设置网站信息界面', 'admin_setting_site_view', 'admin', '后台设置网站信息界面'),
(39, 2, 1, '后台清除缓存界面', 'admin_setting_clear_cache_view', 'admin', '后台清除缓存界面'),
(40, 2, 1, '后台导航管理界面', 'admin_nav_index_view', 'admin', '后台导航管理界面'),
(41, 2, 1, '后台友情链接管理界面', 'admin_link_index_view', 'admin', '后台友情链接管理界面'),
(42, 2, 1, '后台幻灯片管理界面', 'admin_slide_index_view', 'admin', '后台幻灯片管理界面'),
(43, 2, 1, '后台管理员列表界面', 'admin_user_index_view', 'admin', '后台管理员列表界面'),
(44, 2, 1, '后台角色管理界面', 'admin_rbac_index_view', 'admin', '后台角色管理界面'),
(49, 2, 1, '用户管理本站用户列表界面', 'user_admin_index_view', 'user', '用户管理本站用户列表界面'),
(50, 2, 1, '资源管理列表界面', 'user_admin_asset_index_view', 'user', '资源管理列表界面'),
(51, 2, 1, '用户管理第三方用户列表界面', 'user_admin_oauth_index_view', 'user', '用户管理第三方用户列表界面'),
(52, 2, 1, '后台首页界面', 'admin_index_index_view', 'admin', '后台首页界面'),
(53, 2, 1, '后台回收站界面', 'admin_recycle_bin_index_view', 'admin', '后台回收站界面'),
(54, 2, 1, '后台菜单管理界面', 'admin_menu_index_view', 'admin', '后台菜单管理界面'),
(55, 2, 1, '后台自定义登录是否开启钩子', 'admin_custom_login_open', 'admin', '后台自定义登录是否开启钩子'),
(64, 2, 1, '后台幻灯片页面列表界面', 'admin_slide_item_index_view', 'admin', '后台幻灯片页面列表界面'),
(65, 2, 1, '后台幻灯片页面添加界面', 'admin_slide_item_add_view', 'admin', '后台幻灯片页面添加界面'),
(66, 2, 1, '后台幻灯片页面编辑界面', 'admin_slide_item_edit_view', 'admin', '后台幻灯片页面编辑界面'),
(67, 2, 1, '后台管理员添加界面', 'admin_user_add_view', 'admin', '后台管理员添加界面'),
(68, 2, 1, '后台管理员编辑界面', 'admin_user_edit_view', 'admin', '后台管理员编辑界面'),
(69, 2, 1, '后台角色添加界面', 'admin_rbac_role_add_view', 'admin', '后台角色添加界面'),
(70, 2, 1, '后台角色编辑界面', 'admin_rbac_role_edit_view', 'admin', '后台角色编辑界面'),
(71, 2, 1, '后台角色授权界面', 'admin_rbac_authorize_view', 'admin', '后台角色授权界面'),
(72, 2, 0, '文章显示之前', 'portal_before_assign_article', 'portal', '文章显示之前'),
(73, 2, 0, '后台文章保存之后', 'portal_admin_after_save_article', 'portal', '后台文章保存之后'),
(74, 2, 1, '门户后台文章管理列表界面', 'portal_admin_article_index_view', 'portal', '门户后台文章管理列表界面'),
(75, 2, 1, '门户后台文章添加界面', 'portal_admin_article_add_view', 'portal', '门户后台文章添加界面'),
(76, 2, 1, '门户后台文章编辑界面', 'portal_admin_article_edit_view', 'portal', '门户后台文章编辑界面'),
(77, 2, 1, '门户后台文章分类管理列表界面', 'portal_admin_category_index_view', 'portal', '门户后台文章分类管理列表界面'),
(78, 2, 1, '门户后台文章分类添加界面', 'portal_admin_category_add_view', 'portal', '门户后台文章分类添加界面'),
(79, 2, 1, '门户后台文章分类编辑界面', 'portal_admin_category_edit_view', 'portal', '门户后台文章分类编辑界面'),
(80, 2, 1, '门户后台页面管理列表界面', 'portal_admin_page_index_view', 'portal', '门户后台页面管理列表界面'),
(81, 2, 1, '门户后台页面添加界面', 'portal_admin_page_add_view', 'portal', '门户后台页面添加界面'),
(82, 2, 1, '门户后台页面编辑界面', 'portal_admin_page_edit_view', 'portal', '门户后台页面编辑界面'),
(83, 2, 1, '门户后台文章标签管理列表界面', 'portal_admin_tag_index_view', 'portal', '门户后台文章标签管理列表界面'),
(84, 4, 0, '门户后台文章添加编辑界面右侧栏', 'portal_admin_article_edit_view_right_sidebar', 'portal', '门户后台文章添加编辑界面右侧栏'),
(85, 4, 0, '门户后台文章添加编辑界面主要内容', 'portal_admin_article_edit_view_main', 'portal', '门户后台文章添加编辑界面主要内容'),
(86, 1, 0, '应用调度', 'app_dispatch', 'cmf', '应用调度');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_hook_plugin`
--

CREATE TABLE `cmf_hook_plugin` (
  `id` int(10) UNSIGNED NOT NULL,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';

--
-- 转存表中的数据 `cmf_hook_plugin`
--

INSERT INTO `cmf_hook_plugin` (`id`, `list_order`, `status`, `hook`, `plugin`) VALUES
(1, 10000, 1, 'guestbook', 'HzMsgBorad'),
(2, 10000, 1, 'admin_login', 'ShangAdminLogin'),
(4, 10000, 1, 'admin_dashboard', 'Modules');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_item_activity`
--

CREATE TABLE `cmf_item_activity` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'id',
  `list_order` int(10) DEFAULT '1000' COMMENT '排序',
  `category` int(10) DEFAULT NULL COMMENT '栏目',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `keywords` varchar(128) DEFAULT NULL COMMENT '关键词',
  `state` tinyint(1) DEFAULT '2' COMMENT '状态',
  `showtype` tinyint(1) DEFAULT '1' COMMENT '被推送标识',
  `digest` varchar(255) DEFAULT NULL COMMENT '摘要',
  `editorid` int(10) DEFAULT NULL COMMENT '编辑人员ID',
  `picture` varchar(255) DEFAULT NULL COMMENT '缩略图片',
  `createtime` int(10) DEFAULT NULL COMMENT '录入时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `showtime` int(10) DEFAULT NULL COMMENT '发布时间',
  `pv` int(10) DEFAULT NULL COMMENT '总访问次数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='活动管理表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_item_activity_texts`
--

CREATE TABLE `cmf_item_activity_texts` (
  `itemid` int(10) DEFAULT NULL COMMENT '文章ID',
  `text` text COMMENT '内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='活动管理内容表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_league_order`
--

CREATE TABLE `cmf_league_order` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `store_id` int(10) DEFAULT NULL,
  `time_id` int(10) DEFAULT NULL COMMENT '教练课时id',
  `goods_id` int(10) DEFAULT NULL COMMENT '课程id',
  `coach_id` int(10) DEFAULT NULL COMMENT '教练id',
  `coach_user_id` int(10) DEFAULT NULL COMMENT '教练用户表id',
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：默认，1:完成，2：待使用,3:已入场，4:已赠送；5:已退款;；6：等候中',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `add_time` int(10) DEFAULT NULL,
  `pay_time` int(10) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `order_sn` varchar(32) DEFAULT NULL,
  `goods_name` varchar(300) DEFAULT NULL,
  `tags` varchar(300) DEFAULT NULL,
  `pay_id` int(10) DEFAULT '0' COMMENT '支付id',
  `pay_code` varchar(20) DEFAULT NULL,
  `pay_name` varchar(30) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `order_amount` decimal(10,2) DEFAULT '0.00',
  `coupon_price` decimal(10,2) DEFAULT '0.00',
  `people_num` tinyint(1) DEFAULT '0' COMMENT '人数',
  `applet_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT '小程序新学员',
  `coach_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT '教练新学员',
  `course_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT '课程新学员',
  `is_sign` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否签到 0 ：未签单，1：已签单',
  `visit_time` int(10) NOT NULL DEFAULT '0',
  `is_send` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发送课前通知',
  `gift_code` varchar(20) DEFAULT NULL COMMENT '赠送码',
  `send_id` int(10) NOT NULL DEFAULT '0' COMMENT '赠送订单id',
  `send_code` tinyint(1) NOT NULL DEFAULT '0' COMMENT '赠送状态 1：赠送方订单；2：接收方订单'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_league_order`
--

INSERT INTO `cmf_league_order` (`id`, `user_id`, `store_id`, `time_id`, `goods_id`, `coach_id`, `coach_user_id`, `order_status`, `pay_status`, `add_time`, `pay_time`, `start_time`, `end_time`, `order_sn`, `goods_name`, `tags`, `pay_id`, `pay_code`, `pay_name`, `coupon_id`, `total_amount`, `order_amount`, `coupon_price`, `people_num`, `applet_new`, `coach_new`, `course_new`, `is_sign`, `visit_time`, `is_send`, `gift_code`, `send_id`, `send_code`) VALUES
(1, 3, 1, 2, 4, 2, 2, 0, 0, 1623399068, NULL, 1623470400, 1623484800, 'A611990679686150', 'BODYABCD燃脂搏击 ', '1623399068', 4650, 'balance', '余额支付', NULL, '50.00', '50.00', '0.00', 1, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(2, 2, 1, 2, 4, 2, 2, 0, 0, 1623399841, NULL, 1623470400, 1623484800, 'A611998415048209', 'BODYABCD燃脂搏击 ', '1623399841', 4651, 'wxpay', '微信支付', NULL, '50.00', '50.00', '0.00', 1, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(3, 2, 1, 2, 4, 2, 2, 0, 1, 1623399857, 1623399857, 1623470400, 1623484800, 'A611998571429826', 'BODYABCD燃脂搏击 ', '1623399857', 4652, 'balance', '余额支付', NULL, '50.00', '50.00', '0.00', 1, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(4, 2, 1, 2, 4, 2, 2, 0, 1, 1623399933, 1623399934, 1623470400, 1623484800, 'A611999337217635', 'BODYABCD燃脂搏击 ', '1623399933', 4653, 'balance', '余额支付', NULL, '50.00', '50.00', '0.00', 1, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(5, 2, 1, 2, 4, 2, 2, 0, 0, 1623400275, NULL, 1623470400, 1623484800, 'A611002752381724', 'BODYABCD燃脂搏击 ', '1623400275', 4654, 'wxpay', '微信支付', NULL, '50.00', '50.00', '0.00', 1, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(6, 2, 1, 3, 4, 2, 2, 0, 0, 1623403628, NULL, 1623474000, 1623481200, 'A611036287228701', 'BODYABCD燃脂搏击 ', '1623403628', 4655, 'balance', '余额支付', NULL, '20.00', '20.00', '0.00', 1, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(7, 2, 1, 3, 4, 2, 2, 2, 1, 1623403657, 1623403657, 1623474000, 1623481200, 'A611036571620513', 'BODYABCD燃脂搏击 ', '1623403657', 4656, 'balance', '余额支付', NULL, '20.00', '20.00', '0.00', 1, 0, 0, 0, 0, 0, 1, NULL, 0, 0),
(8, 2, 1, 4, 5, 2, 2, 0, 0, 1623403680, NULL, 1623484800, 1623492000, 'A611036806297065', 'BODYABCD燃脂搏击 ', '1623403680', 4657, 'wxpay', '微信支付', NULL, '15.00', '15.00', '0.00', 1, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(9, 2, 1, 4, 5, 2, 2, 2, 1, 1623403683, 1623403684, 1623484800, 1623492000, 'A611036833197354', 'BODYABCD燃脂搏击 ', '1623403683', 4658, 'balance', '余额支付', NULL, '15.00', '15.00', '0.00', 1, 0, 0, 0, 1, 0, 1, NULL, 0, 0),
(10, 2, 1, 5, 4, 2, 2, 0, 0, 1623829898, NULL, 1624168800, 1624176000, 'A616298987321854', 'BODYABCD燃脂搏击 ', '1,2,3', 4659, 'balance', '余额支付', NULL, '12.00', '12.00', '0.00', 1, 0, 1, 0, 0, 0, 0, NULL, 0, 0),
(11, 2, 1, 5, 4, 2, 2, 2, 1, 1623830011, 1623830012, 1624168800, 1624176000, 'A616300112813944', 'BODYABCD燃脂搏击 ', '1,2,3', 4660, 'balance', '余额支付', NULL, '12.00', '12.00', '0.00', 1, 0, 1, 0, 1, 0, 1, NULL, 0, 0),
(12, 3, 1, 7, 1, 2, 2, 0, 0, 1624263005, NULL, 1624327200, 1624334400, 'A621630051276018', ' BODYABCD私教课', '1,2,3', 4662, 'wxpay', '微信支付', NULL, '10.00', '10.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(13, 3, 1, 7, 1, 2, 2, 0, 0, 1624263202, NULL, 1624327200, 1624334400, 'A621632028906595', ' BODYABCD私教课', '1,2,3', 4663, 'wxpay', '微信支付', NULL, '10.00', '10.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(14, 5, 1, 10, 5, 2, 2, 2, 1, 1624350790, 1624354934, 1624442400, 1624378800, 'A622507908793301', '零噪音减脂进阶', '1,2,3', 4664, 'wxpay', '微信支付', NULL, '5.00', '5.00', '0.00', 1, 1, 1, 1, 1, 0, 1, NULL, 0, 0),
(15, 4, 1, 10, 5, 2, 2, 0, 0, 1624358350, NULL, 1624442400, 1624378800, 'A622583506103864', '零噪音减脂进阶', '1,2,3', 4665, 'wxpay', '微信支付', NULL, '5.00', '5.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(16, 3, 1, 11, 6, 3, 5, 2, 1, 1624700085, 1624700342, 1624777200, 1624788000, 'A626000858476151', '搏击体验测试', '1,2', 4666, 'wxpay', '微信支付', NULL, '0.02', '0.02', '0.00', 2, 1, 1, 1, 0, 0, 1, NULL, 0, 0),
(17, 3, 1, 11, 6, 3, 5, 1, 1, 1624700262, 1624700338, 1624777200, 1624788000, 'A626002627286702', '搏击体验测试', '1,2', 4667, 'wxpay', '微信支付', NULL, '0.01', '0.01', '0.00', 1, 1, 1, 1, 1, 0, 1, NULL, 0, 0),
(18, 3, 1, 12, 4, 3, 5, 0, 0, 1624702199, NULL, 1624860000, 1624867200, 'A626021997711133', 'HIIT燃脂进阶', '1,2,3', 4668, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 0, 1, 0, 0, 0, NULL, 0, 0),
(19, 3, 1, 13, 5, 3, 5, 1, 1, 1624852559, 1624852572, 1625022000, 1625029200, 'A628525593369606', '零噪音减脂进阶', '1,2,3', 4669, 'wxpay', '微信支付', 4, '5.00', '0.10', '4.90', 1, 0, 0, 1, 1, 0, 1, NULL, 0, 0),
(20, 8, 1, 10, 5, 2, 2, 2, 1, 1624933986, 1624933996, 1624935600, 1624940400, 'A629339864903047', '零噪音减脂进阶', '1,2,3', 4670, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 1, 1, 1, 0, 0, 1, NULL, 0, 0),
(21, 8, 1, 11, 6, 3, 5, 2, 1, 1624934374, 1624934383, 1624935600, 1624942800, 'A629343747014719', '搏击体验测试', '1,2', 4671, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 1, 1, 0, 0, 1, NULL, 0, 0),
(22, 2, 1, 11, 6, 3, 5, 0, 0, 1624937040, NULL, 1624937400, 1624942800, 'A629370401498196', '搏击体验测试', '1,2', 4672, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 1, 1, 0, 0, 0, NULL, 0, 0),
(23, 3, 1, 14, 2, 3, 5, 1, 1, 1624937315, 1624937320, 1624939200, 1624950000, 'A629373156475419', 'BODYABCD晋级', '2,3,4', 4673, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 0, 1, 1, 0, 1, NULL, 0, 0),
(24, 8, 1, 8, 4, 2, 2, 2, 1, 1625019409, 1625019417, 1625021400, 1625025600, 'A630194090283563', 'HIIT燃脂进阶', '1,2,3', 4674, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 0, 1, 0, 0, 1, NULL, 0, 0),
(25, 8, 1, 6, 1, 2, 2, 2, 1, 1625025078, 1625025087, 1625026920, 1625036400, 'A630250785861992', ' BODYABCD', '1,2,3', 4675, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 0, 1, 0, 0, 1, NULL, 0, 0),
(26, 2, 1, 15, 4, 2, 2, 0, 0, 1625130584, NULL, 1625202000, 1625209200, 'A701305845543882', 'HIIT燃脂进阶', '1,2,3', 4676, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(27, 3, 1, 15, 4, 2, 2, 2, 1, 1625130605, 1625130610, 1625202000, 1625209200, 'A701306053065337', 'HIIT燃脂进阶', '1,2,3', 4677, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 1, 1, 1, 0, 1, NULL, 0, 0),
(28, 3, 1, 16, 6, 8, 8, 2, 1, 1625477961, 1625477978, 1625562000, 1625569200, 'A705779615224776', '搏击体验测试', '1,2', 4680, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 1, 0, 1, 0, 1, NULL, 0, 0),
(29, 5, 1, 16, 6, 8, 8, 2, 1, 1625551176, 1625551182, 1625562000, 1625569200, 'A706511765371387', '搏击体验测试', '1,2', 4682, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 1, 1, 0, 0, 1, NULL, 0, 0),
(30, 8, 1, 16, 6, 8, 8, 2, 1, 1625552373, 1625552393, 1625562000, 1625569200, 'A706523730018393', '搏击体验测试', '1,2', 4683, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 1, 0, 0, 0, 1, NULL, 0, 0),
(31, 5, 1, 17, 6, 2, 2, 2, 1, 1625553122, 1625553128, 1625555116, 1625562000, 'A706531224970510', '搏击体验测试', '1,2', 4684, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 0, 0, 0, 0, 1, NULL, 0, 0),
(32, 5, 1, 12, 4, 3, 5, 2, 1, 1625628494, 1625628500, 1625630400, 1625644800, 'A707284943835325', 'HIIT燃脂进阶', '1,2,3', 4685, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 1, 1, 0, 0, 1, NULL, 0, 0),
(33, 5, 1, 19, 6, 19, 5, 3, 1, 1625743123, 1625743129, 1625744040, 1625746500, 'A708431235658573', 'Dear Combat燃脂搏击', '1,2', 4689, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 0, 0, 0, 1625743166, 0, NULL, 0, 0),
(34, 2, 1, 18, 6, 24, 24, 0, 0, 1625824760, NULL, 1626091200, 1626094200, 'A709247602817660', 'Dear Combat燃脂搏击', '1,2,3', 4704, 'wxpay', '微信支付', 0, '159.00', '159.00', '0.00', 1, 0, 1, 1, 0, 0, 0, NULL, 0, 0),
(35, 4, 1, 18, 6, 24, 24, 0, 0, 1625838998, NULL, 1626091200, 1626094200, 'A709389985620311', 'Dear Combat燃脂搏击', '1,2,3', 4711, 'wxpay', '微信支付', 0, '159.00', '159.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(36, 4, 1, 18, 6, 24, 24, 0, 0, 1625839012, NULL, 1626091200, 1626094200, 'A709390126527490', 'Dear Combat燃脂搏击', '1,2,3', 4712, 'balance', '余额支付', 0, '159.00', '159.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(37, 5, 1, 20, 7, 27, 5, 2, 1, 1625889852, 1625889866, 1625900400, 1625907600, 'A710898527726451', '品牌发布会', '', 4713, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 0, 1, 0, 0, 0, NULL, 0, 0),
(38, 5, 1, 21, 7, 27, 5, 2, 1, 1625904454, 1625904467, 1625907600, 1625914800, 'A710044547971894', '品牌发布会', '1,2,3,4', 4714, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(39, 4, 1, 22, 1, 27, 5, 2, 1, 1625916906, 1625916911, 1625918400, 1625922000, 'A710169066617660', ' BODYABCD', '1,2,3', 4717, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(40, 5, 1, 22, 1, 27, 5, 2, 1, 1625916906, 1625916911, 1625918400, 1625922000, 'A710169067313017', ' BODYABCD', '1,2,3', 4718, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 0, 1, 0, 0, 0, NULL, 0, 0),
(41, 6, 1, 22, 1, 27, 5, 2, 1, 1625916946, 1625916951, 1625918400, 1625922000, 'A710169460974116', ' BODYABCD', '1,2,3', 4719, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(42, 30, 1, 22, 1, 27, 5, 3, 1, 1625917185, 1625917192, 1625918400, 1625922000, 'A710171858409442', ' BODYABCD', '1,2,3', 4721, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 1, 1, 1, 0, 1625918071, 0, NULL, 0, 0),
(43, 33, 1, 22, 1, 27, 5, 2, 1, 1625917186, 1625917191, 1625918400, 1625922000, 'A710171862203405', ' BODYABCD', '1,2,3', 4722, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(44, 3, 1, 1, 6, 28, 3, 5, 1, 1626076856, 1626076856, 1626084000, 1626091200, 'A712768566025746', 'Dear Combat燃脂搏击', '1,2,3', 4725, 'wxpay', '微信支付', 0, '0.01', '0.00', '0.00', 1, 0, 1, 0, 0, 0, 1, NULL, 0, 0),
(45, 3, 1, 23, 6, 28, 3, 4, 1, 1626077041, 1626077053, 1629104000, 1626091200, 'A712770415120875', 'Dear Combat燃脂搏击', '1,2,3', 4726, 'wxpay', '微信支付', 0, '0.02', '0.01', '0.00', 2, 0, 0, 0, 0, 0, 1, 'VV3GSCE5', 0, 1),
(46, 5, 1, 24, 6, 27, 5, 2, 1, 1626145989, 1626145990, 1626147900, 1626151500, 'A713459899016844', 'Dear Combat燃脂搏击', '1,2,3', 4727, 'wxpay', '微信支付', 0, '0.00', '0.00', '0.00', 1, 0, 0, 0, 0, 0, 1, NULL, 0, 0),
(47, 4, 1, 25, 6, 27, 5, 0, 0, 1626163643, NULL, 1626177600, 1626181200, 'A713636433638785', 'Dear Combat燃脂搏击', '1,2,3', 4732, 'wxpay', '微信支付', 0, '100.00', '30.00', '0.00', 1, 0, 0, 1, 0, 0, 0, NULL, 0, 0),
(48, 4, 1, 25, 6, 27, 5, 2, 1, 1626163647, 1626163648, 1626177600, 1626181200, 'A713636479567190', 'Dear Combat燃脂搏击', '1,2,3', 4733, 'balance', '余额支付', 0, '100.00', '30.00', '0.00', 1, 0, 0, 1, 0, 0, 1, NULL, 0, 0),
(49, 15, 1, 27, 10, 20, 19, 0, 0, 1626230708, NULL, 1626483600, 1626486300, 'A714307086610248', 'Mocha(舞动青春）', '1,2,3', 4734, 'wxpay', '微信支付', 0, '79.00', '79.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(50, 3, 1, 23, 6, 28, 3, 1, 1, 1626255535, NULL, 1629104000, 1626091200, NULL, 'Dear Combat燃脂搏击', '1,2,3', 0, NULL, NULL, NULL, '0.02', '0.01', '0.00', 2, 0, 0, 0, 1, 0, 0, NULL, 45, 2),
(51, 4, 1, 27, 10, 20, 19, 0, 0, 1626264075, NULL, 1626483600, 1626486300, 'A714640750904955', 'Mocha(舞动青春）', '1,2,3,4', 4738, 'wxpay', '微信支付', 0, '129.00', '38.70', '0.00', 1, 0, 1, 1, 0, 0, 0, NULL, 0, 0),
(52, 4, 1, 27, 10, 20, 19, 4, 1, 1626264111, 1626264111, 1626483600, 1626486300, 'A714641111393172', 'Mocha(舞动青春）', '1,2,3,4', 4739, 'balance', '余额支付', 0, '129.00', '38.70', '0.00', 1, 0, 1, 1, 0, 0, 0, 'H6SNMLCR', 0, 1),
(53, 5, 1, 27, 10, 20, 19, 2, 1, 1626273425, NULL, 1626483600, 1626486300, NULL, 'Mocha(舞动青春）', '1,2,3,4', 0, NULL, NULL, NULL, '129.00', '0.00', '0.00', 1, 0, 0, 0, 0, 0, 1, NULL, 52, 2),
(54, 37, 1, 37, 8, 29, 45, 0, 0, 1626328173, NULL, 1626523200, 1626525900, 'A715281731579284', 'Dear Pump（杠铃操）', '1,2,3,4', 4744, 'wxpay', '微信支付', 0, '129.00', '129.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(55, 63, 1, 37, 8, 29, 45, 2, 1, 1626424930, 1626424930, 1626523200, 1626525900, 'A716249301789188', 'Dear Pump（杠铃操）', '1,2,3,4', 4748, 'wxpay', '微信支付', 42, '129.00', '0.00', '129.00', 1, 1, 1, 1, 0, 0, 1, 'QNAANBVN', 0, 0),
(56, 35, 1, 28, 8, 26, 25, 1, 1, 1626426466, 1626426466, 1626490800, 1626493500, 'A716264667169394', 'Dear Pump（杠铃操）', '1,2,3,4', 4749, 'wxpay', '微信支付', 25, '129.00', '0.00', '129.00', 1, 1, 1, 1, 1, 0, 1, NULL, 0, 0),
(57, 66, 1, 37, 8, 29, 45, 1, 1, 1626430747, 1626430748, 1626523200, 1626525900, 'A716307478630725', 'Dear Pump（杠铃操）', '1,2,3,4', 4750, 'wxpay', '微信支付', 45, '129.00', '0.00', '129.00', 1, 1, 1, 1, 1, 0, 1, NULL, 0, 0),
(58, 45, 1, 38, 17, 29, 45, 0, 0, 1626430940, NULL, 1626526800, 1626529500, 'A716309408718934', 'Dear Zumba(尊巴）', '1,2,3,4', 4751, 'wxpay', '微信支付', 0, '129.00', '129.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(59, 66, 1, 38, 17, 29, 45, 0, 0, 1626431707, NULL, 1626526800, 1626529500, 'A716317077448555', 'Dear Zumba(尊巴）', '1,2,3,4', 4752, 'wxpay', '微信支付', 0, '129.00', '129.00', '0.00', 1, 0, 0, 1, 0, 0, 0, NULL, 0, 0),
(60, 68, 1, 37, 8, 29, 45, 2, 1, 1626437108, 1626437108, 1626523200, 1626525900, 'A716371086495318', 'Dear Pump（杠铃操）', '1,2,3,4', 4753, 'wxpay', '微信支付', 47, '129.00', '0.00', '129.00', 1, 1, 1, 1, 0, 0, 1, NULL, 0, 0),
(61, 37, 1, 37, 8, 29, 45, 2, 1, 1626437352, 1626437352, 1626523200, 1626525900, 'A716373520320889', 'Dear Pump（杠铃操）', '1,2,3,4', 4754, 'wxpay', '微信支付', 27, '129.00', '0.00', '129.00', 1, 1, 1, 1, 0, 0, 1, NULL, 0, 0),
(62, 5, 1, 42, 6, 30, 6, 1, 1, 1626440441, 1626440447, 1626440700, 1626441780, 'A716404414108198', 'Dear Combat（拳力出击）', '1,2,3,4', 4756, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 1, 0, 1, 0, 1, NULL, 0, 0),
(63, 4, 1, 42, 6, 30, 6, 0, 0, 1626440575, NULL, 1626440700, 1626441780, 'A716405755461931', 'Dear Combat（拳力出击）', '1,2,3,4', 4757, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 1, 0, 0, 0, 0, NULL, 0, 0),
(64, 4, 1, 42, 6, 30, 6, 1, 1, 1626440582, 1626440583, 1626440700, 1626441780, 'A716405827081937', 'Dear Combat（拳力出击）', '1,2,3,4', 4758, 'balance', '余额支付', 0, '0.01', '0.01', '0.00', 1, 0, 1, 0, 1, 0, 0, NULL, 0, 0),
(65, 15, 1, 27, 10, 20, 19, 0, 0, 1626440623, NULL, 1626483600, 1626486300, 'A716406232152838', 'Mocha(舞动青春）', '1,2,3,4', 4759, 'wxpay', '微信支付', 0, '129.00', '129.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(66, 71, 1, 28, 8, 26, 25, 2, 1, 1626443029, 1626443030, 1626490800, 1626493500, 'A716430298773776', 'Dear Pump（杠铃操）', '1,2,3,4', 4760, 'wxpay', '微信支付', 54, '129.00', '0.00', '129.00', 1, 1, 1, 1, 0, 0, 1, NULL, 0, 0),
(67, 72, 1, 37, 8, 29, 45, 0, 0, 1626443099, NULL, 1626523200, 1626525900, 'A716430992598196', 'Dear Pump（杠铃操）', '1,2,3,4', 4761, 'wxpay', '微信支付', 0, '129.00', '129.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(68, 72, 1, 37, 8, 29, 45, 1, 1, 1626443117, 1626443118, 1626523200, 1626525900, 'A716431174727022', 'Dear Pump（杠铃操）', '1,2,3,4', 4762, 'wxpay', '微信支付', 55, '129.00', '0.00', '129.00', 1, 1, 1, 1, 1, 0, 1, NULL, 0, 0),
(69, 75, 1, 29, 14, 25, 23, 0, 0, 1626445831, NULL, 1626498000, 1626500700, 'A716458313275220', 'Dear JP(Jazz Party)', '1,2,3,4', 4763, 'wxpay', '微信支付', 0, '129.00', '129.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(70, 75, 1, 29, 14, 25, 23, 1, 1, 1626445849, 1626445850, 1626498000, 1626500700, 'A716458497117746', 'Dear JP(Jazz Party)', '1,2,3,4', 4764, 'wxpay', '微信支付', 97, '129.00', '0.00', '129.00', 1, 1, 1, 1, 1, 0, 1, NULL, 0, 0),
(71, 73, 1, 27, 10, 20, 19, 1, 1, 1626447442, 1626447442, 1626483600, 1626486300, 'A716474420069999', 'Mocha(舞动青春）', '1,2,3,4', 4765, 'wxpay', '微信支付', 56, '129.00', '0.00', '129.00', 1, 1, 1, 1, 1, 1626482220, 1, NULL, 0, 0),
(72, 38, 1, 37, 8, 29, 45, 0, 0, 1626501585, NULL, 1626523200, 1626525900, 'A717015850537269', 'Dear Pump（杠铃操）', '1,2,3,4', 4766, 'wxpay', '微信支付', 15, '129.00', '50.00', '79.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(73, 38, 1, 37, 8, 29, 45, 1, 1, 1626502866, 1626502866, 1626523200, 1626525900, 'A717028663744256', 'Dear Pump（杠铃操）', '1,2,3,4', 4767, 'wxpay', '微信支付', 28, '129.00', '0.00', '129.00', 1, 1, 1, 1, 1, 0, 1, NULL, 0, 0),
(74, 83, 1, 30, 13, 24, 24, 1, 1, 1626511642, 1626511642, 1626512400, 1626515100, 'A717116425611275', 'Dear Step（活力踏板）', '1,2,3,4', 4768, 'wxpay', '微信支付', 109, '129.00', '0.00', '129.00', 1, 1, 1, 1, 1, 0, 1, NULL, 0, 0),
(75, 3, 1, 46, 6, 20, 19, 2, 1, 1626659296, 1626659301, 1627106400, 1627113600, 'A719592965185789', 'Dear Combat（拳力出击）', '1,2,3,4', 4772, 'wxpay', '微信支付', 0, '0.01', '0.01', '0.00', 1, 0, 1, 0, 0, 0, 1, '59OEP14M', 0, 0),
(76, 5, 1, 36, 6, 24, 24, 0, 0, 1626693305, NULL, 1626696000, 1626699000, 'A719933051909913', 'Dear Combat（拳力出击）', '1,2,3,4', 4775, 'wxpay', '微信支付', 0, '129.00', '64.50', '0.00', 1, 0, 1, 0, 0, 0, 0, NULL, 0, 0),
(77, 71, 1, 51, 9, 26, 25, 0, 0, 1626700851, NULL, 1626778800, 1626781800, 'A719008514053713', 'Dear Shbam', '1,2,3,4', 4776, 'wxpay', '微信支付', 0, '129.00', '129.00', '0.00', 1, 0, 0, 1, 0, 0, 0, NULL, 0, 0),
(78, 71, 1, 51, 9, 26, 25, 2, 1, 1626701491, 1626701491, 1626778800, 1626781800, 'A719014914242794', 'Dear Shbam', '1,2,3,4', 4777, 'wxpay', '微信支付', 125, '129.00', '0.00', '129.00', 1, 0, 0, 1, 0, 0, 1, NULL, 0, 0),
(79, 93, 1, 51, 9, 26, 25, 1, 1, 1626701798, 1626701799, 1626778800, 1626781800, 'A719017987719489', 'Dear Shbam', '1,2,3,4', 4778, 'wxpay', '微信支付', 126, '129.00', '0.00', '129.00', 1, 1, 1, 1, 1, 0, 1, NULL, 0, 0),
(80, 94, 1, 51, 9, 26, 25, 0, 0, 1626702406, NULL, 1626778800, 1626781800, 'A719024068130734', 'Dear Shbam', '1,2,3,4', 4779, 'wxpay', '微信支付', 0, '129.00', '129.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(81, 94, 1, 51, 9, 26, 25, 1, 1, 1626702420, 1626702420, 1626778800, 1626781800, 'A719024199961056', 'Dear Shbam', '1,2,3,4', 4780, 'wxpay', '微信支付', 127, '129.00', '0.00', '129.00', 1, 1, 1, 1, 1, 0, 1, NULL, 0, 0),
(82, 93, 1, 40, 8, 26, 25, 1, 1, 1626703089, 1626703090, 1626782400, 1626785400, 'A719030899874007', 'Dear Pump（杠铃操）', '1,2,3,4', 4781, 'wxpay', '微信支付', 130, '129.00', '0.00', '129.00', 1, 0, 0, 1, 1, 0, 1, NULL, 0, 0),
(83, 94, 1, 40, 8, 26, 25, 1, 1, 1626703211, 1626703211, 1626782400, 1626785400, 'A719032113133758', 'Dear Pump（杠铃操）', '1,2,3,4', 4782, 'wxpay', '微信支付', 129, '129.00', '0.00', '129.00', 1, 0, 0, 1, 1, 0, 1, NULL, 0, 0),
(84, 57, 1, 40, 8, 26, 25, 0, 0, 1626704853, NULL, 1626782400, 1626785400, 'A719048538713756', 'Dear Pump（杠铃操）', '1,2,3,4', 4783, 'wxpay', '微信支付', 0, '129.00', '129.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(85, 57, 1, 40, 8, 26, 25, 2, 1, 1626704866, 1626704866, 1626782400, 1626785400, 'A719048661661255', 'Dear Pump（杠铃操）', '1,2,3,4', 4784, 'wxpay', '微信支付', 35, '129.00', '0.00', '129.00', 1, 1, 1, 1, 0, 0, 1, NULL, 0, 0),
(86, 68, 1, 51, 9, 26, 25, 1, 1, 1626763630, 1626763630, 1626778800, 1626781800, 'A720636302733256', 'Dear Shbam', '1,2,3,4', 4785, 'balance', '余额支付', 131, '129.00', '0.00', '129.00', 1, 0, 1, 1, 1, 0, 1, NULL, 0, 0),
(87, 4, 1, 51, 9, 26, 25, 0, 0, 1626772719, NULL, 1626778800, 1626781800, 'A720727199310762', 'Dear Shbam', '1,2,3,4', 4786, 'wxpay', '微信支付', 0, '129.00', '64.50', '0.00', 1, 0, 1, 1, 0, 0, 0, NULL, 0, 0),
(88, 4, 1, 51, 9, 26, 25, 0, 0, 1626772726, NULL, 1626778800, 1626781800, 'A720727265671906', 'Dear Shbam', '1,2,3,4', 4787, 'balance', '余额支付', 0, '129.00', '64.50', '0.00', 1, 0, 1, 1, 0, 0, 0, NULL, 0, 0),
(89, 4, 1, 40, 8, 26, 25, 2, 1, 1626772753, 1626772753, 1626782400, 1626785400, 'A720727532266440', 'Dear Pump（杠铃操）', '1,2,3,4', 4788, 'balance', '余额支付', 0, '129.00', '0.00', '0.00', 1, 0, 1, 1, 0, 0, 1, NULL, 0, 0),
(90, 5, 1, 51, 9, 26, 25, 0, 0, 1626772795, NULL, 1626778800, 1626781800, 'A720727954629501', 'Dear Shbam', '1,2,3,4', 4789, 'wxpay', '微信支付', 0, '129.00', '64.50', '0.00', 1, 0, 1, 1, 0, 0, 0, NULL, 0, 0),
(91, 4, 1, 51, 9, 26, 25, 0, 0, 1626772867, NULL, 1626778800, 1626781800, 'A720728670454527', 'Dear Shbam', '1,2,3,4', 4790, 'balance', '余额支付', 0, '258.00', '129.00', '0.00', 2, 0, 0, 1, 0, 0, 0, NULL, 0, 0),
(92, 5, 1, 51, 9, 26, 25, 0, 0, 1626772964, NULL, 1626778800, 1626781800, 'A720729644753606', 'Dear Shbam', '1,2,3,4', 4791, 'balance', '余额支付', 0, '129.00', '64.50', '0.00', 1, 0, 1, 1, 0, 0, 0, NULL, 0, 0),
(93, 3, 1, 47, 6, 29, 45, 0, 0, 1626773414, NULL, 1626868800, 1626871800, 'A720734144374450', 'Dear Combat（拳力出击）', '1,2,3,4', 4792, 'wxpay', '微信支付', 0, '129.00', '64.50', '0.00', 1, 0, 1, 0, 0, 0, 0, NULL, 0, 0),
(94, 3, 1, 47, 6, 29, 45, 0, 0, 1626773419, NULL, 1626868800, 1626871800, 'A720734193460992', 'Dear Combat（拳力出击）', '1,2,3,4', 4793, 'balance', '余额支付', 0, '129.00', '64.50', '0.00', 1, 0, 1, 0, 0, 0, 0, NULL, 0, 0),
(95, 3, 1, 50, 6, 29, 45, 0, 0, 1626773525, NULL, 1627045200, 1627048200, 'A720735257196167', 'Dear Combat（拳力出击）', '1,2,3,4', 4794, 'balance', '余额支付', 0, '129.00', '64.50', '0.00', 1, 0, 1, 0, 0, 0, 0, NULL, 0, 0),
(96, 3, 1, 44, 14, 25, 23, 5, 1, 1626773825, 1626773885, 1626951600, 1626954600, 'A720738250923870', 'Dear JP(Jazz Party)', '1,2,3,4', 4795, 'balance', '余额支付', 0, '129.00', '64.50', '0.00', 1, 0, 1, 1, 0, 0, 0, NULL, 0, 0),
(97, 3, 1, 45, 9, 25, 23, 5, 1, 1626773996, 1626773996, 1626955200, 1626958200, 'A720739967102983', 'Dear Shbam', '1,2,3,4', 4796, 'balance', '余额支付', 0, '129.00', '64.50', '0.00', 1, 0, 0, 1, 0, 0, 0, NULL, 0, 0),
(98, 45, 1, 47, 6, 29, 45, 0, 0, 1626854619, NULL, 1626868800, 1626871800, 'A721546198906065', 'Dear Combat（拳力出击）', '1,2,3,4', 4798, 'wxpay', '微信支付', 0, '129.00', '129.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(99, 4, 1, 49, 8, 29, 45, 4, 1, 1626949768, 1626949769, 1627038000, 1627041000, 'A722497683692656', 'Dear Pump（杠铃操）', '1,2,3,4', 4800, 'balance', '余额支付', 0, '129.00', '0.00', '0.00', 1, 0, 1, 0, 0, 0, 0, 'DEQJQJ09', 0, 1),
(100, 101, 1, 49, 8, 29, 45, 2, 1, 1626950602, NULL, 1627038000, 1627041000, NULL, 'Dear Pump（杠铃操）', '1,2,3,4', 0, NULL, NULL, NULL, '129.00', '0.00', '0.00', 1, 0, 0, 0, 0, 0, 1, NULL, 99, 2),
(101, 5, 1, 49, 8, 29, 45, 5, 1, 1626955996, 1626955996, 1627038000, 1627041000, 'A722559965628843', 'Dear Pump（杠铃操）', '1,2,3,4', 4801, 'wxpay', '微信支付', 0, '129.00', '0.00', '0.00', 1, 0, 1, 1, 0, 0, 0, NULL, 0, 0),
(102, 67, 1, 49, 8, 29, 45, 0, 0, 1627020251, NULL, 1627038000, 1627041000, 'A723202517387458', 'Dear Pump（杠铃操）', '1,2,3,4', 4803, 'wxpay', '微信支付', 0, '129.00', '129.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(103, 67, 1, 49, 8, 29, 45, 2, 1, 1627020263, 1627020263, 1627038000, 1627041000, 'A723202631462017', 'Dear Pump（杠铃操）', '1,2,3,4', 4804, 'wxpay', '微信支付', 46, '129.00', '0.00', '129.00', 1, 1, 1, 1, 0, 0, 1, NULL, 0, 0),
(104, 95, 1, 49, 8, 29, 45, 2, 1, 1627020384, 1627020384, 1627038000, 1627041000, 'A723203848395736', 'Dear Pump（杠铃操）', '1,2,3,4', 4805, 'balance', '余额支付', 135, '129.00', '0.00', '129.00', 1, 1, 1, 1, 0, 0, 1, NULL, 0, 0),
(105, 35, 1, 61, 18, 27, 5, 2, 1, 1627030195, 1627030197, 1627092000, 1627095000, 'A723301955962500', 'Dear 燃脂', '1', 4807, 'wxpay', '微信支付', 29, '129.00', '0.00', '129.00', 1, 0, 1, 1, 0, 0, 1, NULL, 0, 0),
(106, 101, 1, 50, 6, 29, 45, 2, 1, 1627033613, 1627033613, 1627041600, 1627044600, 'A723336135169388', 'Dear Combat（拳力出击）', '1,2,3,4', 4808, 'wxpay', '微信支付', 148, '129.00', '0.00', '129.00', 1, 0, 1, 1, 0, 0, 1, NULL, 0, 0),
(107, 72, 1, 50, 6, 29, 45, 2, 1, 1627034711, 1627034711, 1627041600, 1627044600, 'A723347116049325', 'Dear Combat（拳力出击）', '1,2,3,4', 4809, 'wxpay', '微信支付', 94, '129.00', '0.00', '129.00', 1, 0, 0, 1, 0, 0, 1, NULL, 0, 0),
(108, 5, 1, 66, 19, 27, 5, 5, 1, 1627036008, 1627036008, 1627351200, 1627354200, 'A723360082395251', 'Dear 燃脂', '1,2,3,4', 4810, 'balance', '余额支付', 0, '129.00', '9.90', '0.00', 1, 0, 0, 1, 0, 0, 0, NULL, 0, 0),
(109, 107, 1, 61, 18, 27, 5, 2, 1, 1627043602, 1627043602, 1627092000, 1627095000, 'A723436025429974', 'Dear 燃脂', '1', 4811, 'wxpay', '微信支付', 155, '129.00', '0.00', '129.00', 1, 1, 1, 1, 0, 0, 1, NULL, 0, 0),
(110, 8, 1, 61, 18, 27, 5, 2, 1, 1627048139, 1627048139, 1627092000, 1627095000, 'A723481397280933', 'Dear 燃脂', '1', 4813, 'wxpay', '微信支付', 158, '129.00', '0.00', '129.00', 1, 0, 0, 1, 0, 0, 1, NULL, 0, 0),
(111, 109, 1, 62, 19, 27, 5, 0, 0, 1627048166, NULL, 1627124400, 1627127400, 'A723481662207175', 'Dear 燃脂', '1,2,3,4', 4814, 'wxpay', '微信支付', 0, '129.00', '129.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(112, 109, 1, 62, 19, 27, 5, 2, 1, 1627048186, 1627048186, 1627124400, 1627127400, 'A723481861074201', 'Dear 燃脂', '1,2,3,4', 4815, 'wxpay', '微信支付', 157, '129.00', '0.00', '129.00', 1, 1, 1, 1, 0, 0, 1, NULL, 0, 0),
(113, 35, 1, 63, 18, 27, 5, 2, 1, 1627127687, 1627127688, 1627178400, 1627181400, 'A724276879695795', 'Dear 翘臀', '1,2,3,4', 4816, 'wxpay', '微信支付', 153, '129.00', '0.00', '129.00', 1, 0, 0, 0, 0, 0, 1, NULL, 0, 0),
(114, 5, 1, 69, 19, 27, 5, 1, 1, 1627272229, 1627272230, 1627279200, 1627282200, 'A726722298664045', 'Dear 燃脂', '1,2,3,4', 4820, 'balance', '余额支付', 0, '129.00', '9.90', '0.00', 1, 0, 0, 0, 1, 0, 1, NULL, 0, 0),
(115, 35, 1, 56, 8, 26, 25, 2, 1, 1627294832, 1627294833, 1627383600, 1627386600, 'A726948328744724', 'Dear Pump（杠铃操）', '1,2,3,4', 4821, 'wxpay', '微信支付', 168, '129.00', '0.00', '129.00', 1, 0, 0, 0, 0, 0, 1, NULL, 0, 0),
(116, 15, 1, 56, 8, 26, 25, 0, 0, 1627380321, NULL, 1627383600, 1627386600, 'A727803212605544', 'Dear Pump（杠铃操）', '1,2,3,4', 4822, 'wxpay', '微信支付', 0, '129.00', '129.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(117, 15, 1, 56, 8, 26, 25, 2, 1, 1627380328, 1627380328, 1627383600, 1627386600, 'A727803285413374', 'Dear Pump（杠铃操）', '1,2,3,4', 4823, 'wxpay', '微信支付', 63, '129.00', '0.00', '129.00', 1, 1, 1, 1, 0, 0, 1, NULL, 0, 0),
(118, 5, 1, 56, 8, 26, 25, 2, 1, 1627381280, 1627381281, 1627383600, 1627386600, 'A727812808376388', 'Dear Pump（杠铃操）', '1,2,3,4', 4824, 'wxpay', '微信支付', 0, '129.00', '0.00', '0.00', 1, 0, 1, 0, 0, 0, 1, NULL, 0, 0),
(119, 4, 1, 56, 8, 26, 25, 2, 1, 1627381392, 1627381393, 1627383600, 1627386600, 'A727813927094810', 'Dear Pump（杠铃操）', '1,2,3,4', 4825, 'wxpay', '微信支付', 0, '129.00', '0.00', '0.00', 1, 0, 0, 0, 0, 0, 1, NULL, 0, 0),
(120, 15, 1, 57, 9, 26, 25, 2, 1, 1627381504, 1627381505, 1627387200, 1627390200, 'A727815049932558', 'Dear Shbam', '1,2,3,4', 4826, 'wxpay', '微信支付', 169, '129.00', '0.00', '129.00', 1, 0, 0, 1, 0, 0, 1, NULL, 0, 0),
(121, 62, 1, 58, 6, 29, 45, 2, 1, 1627386002, 1627386002, 1627470000, 1627473000, 'A727860026773377', 'Dear Combat（拳力出击）', '1,2,3,4', 4828, 'wxpay', '微信支付', 41, '129.00', '0.00', '129.00', 1, 1, 1, 1, 0, 0, 1, NULL, 0, 0),
(122, 62, 1, 71, 6, 29, 45, 5, 1, 1627386070, 1627386071, 1627646400, 1627649400, 'A727860709584224', 'Dear Combat（拳力出击）', '1,2,3,4', 4829, 'wxpay', '微信支付', 88, '129.00', '0.00', '129.00', 1, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(123, 119, 1, 57, 9, 26, 25, 2, 1, 1627386328, 1627386334, 1627387200, 1627390200, 'A727863285898711', 'Dear Shbam', '1,2,3,4', 4830, 'wxpay', '微信支付', 0, '129.00', '9.90', '0.00', 1, 1, 1, 1, 0, 0, 1, NULL, 0, 0),
(124, 122, 1, 59, 17, 29, 45, 0, 0, 1627449345, NULL, 1627473600, 1627476600, 'A728493453570371', 'Dear Zumba(尊巴）', '1,2,3,4', 4831, 'wxpay', '微信支付', 0, '129.00', '9.90', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(125, 123, 1, 59, 17, 29, 45, 2, 1, 1627449460, 1627449482, 1627473600, 1627476600, 'A728494607819500', 'Dear Zumba(尊巴）', '1,2,3,4', 4832, 'wxpay', '微信支付', 0, '129.00', '9.90', '0.00', 1, 1, 1, 1, 0, 0, 1, NULL, 0, 0),
(126, 122, 1, 59, 17, 29, 45, 2, 1, 1627449933, 1627449934, 1627473600, 1627476600, 'A728499338708535', 'Dear Zumba(尊巴）', '1,2,3,4', 4833, 'balance', '余额支付', 0, '129.00', '9.90', '0.00', 1, 1, 1, 1, 0, 0, 1, NULL, 0, 0),
(127, 121, 1, 58, 6, 29, 45, 2, 1, 1627464957, 1627464958, 1627470000, 1627473000, 'A728649579036810', 'Dear Combat（拳力出击）', '1,2,3,4', 4835, 'balance', '余额支付', 0, '129.00', '9.90', '0.00', 1, 1, 1, 1, 0, 0, 1, NULL, 0, 0),
(128, 119, 1, 59, 17, 29, 45, 2, 1, 1627473260, 1627473260, 1627473600, 1627476600, 'A728732604301053', 'Dear Zumba(尊巴）', '1,2,3,4', 4836, 'balance', '余额支付', 0, '129.00', '9.90', '0.00', 1, 0, 1, 1, 0, 0, 1, NULL, 0, 0),
(129, 127, 1, 72, 8, 29, 45, 0, 0, 1627522421, NULL, 1627642800, 1627645800, 'A729224213459875', 'Dear Pump（杠铃操）', '1,2,3,4', 4838, 'wxpay', '微信支付', 0, '129.00', '120.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(130, 119, 1, 67, 9, 25, 23, 1, 1, 1627559179, 1627559179, 1627560000, 1627563000, 'A729591796676642', 'Dear Shbam', '1,2,3,4', 4839, 'balance', '余额支付', 0, '99.00', '79.00', '0.00', 1, 0, 1, 0, 1, 0, 0, NULL, 0, 0),
(131, 133, 1, 73, 19, 27, 5, 0, 0, 1627638866, NULL, 1627696800, 1627699800, 'A730388663225451', 'Dear 燃脂', '1,2,3,4', 4840, 'balance', '余额支付', 0, '99.00', '79.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(132, 67, 1, 72, 8, 29, 45, 2, 1, 1627642570, 1627642570, 1627642800, 1627645800, 'A730425703620537', 'Dear Pump（杠铃操）', '1,2,3,4', 4841, 'wxpay', '微信支付', 92, '99.00', '0.00', '129.00', 1, 0, 0, 0, 0, 0, 1, NULL, 0, 0),
(133, 135, 1, 72, 8, 29, 45, 0, 0, 1627642648, NULL, 1627642800, 1627645800, 'A730426481967816', 'Dear Pump（杠铃操）', '1,2,3,4', 4842, 'wxpay', '微信支付', 0, '99.00', '79.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(134, 135, 1, 72, 8, 29, 45, 2, 1, 1627642700, 1627642705, 1627642800, 1627645800, 'A730427006305177', 'Dear Pump（杠铃操）', '1,2,3,4', 4844, 'wxpay', '微信支付', 0, '99.00', '9.90', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(135, 135, 1, 71, 6, 29, 45, 2, 1, 1627642715, 1627642723, 1627646400, 1627649400, 'A730427156502839', 'Dear Combat（拳力出击）', '1,2,3,4', 4845, 'wxpay', '微信支付', 0, '129.00', '9.90', '0.00', 1, 0, 0, 1, 0, 0, 1, NULL, 0, 0),
(136, 133, 1, 74, 18, 27, 5, 0, 0, 1627656398, NULL, 1627729200, 1627732200, 'A730563988881343', 'Dear 翘臀', '1,2,3,4', 4846, 'wxpay', '微信支付', 0, '99.00', '79.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(137, 133, 1, 74, 18, 27, 5, 0, 0, 1627656404, NULL, 1627729200, 1627732200, 'A730564045122616', 'Dear 翘臀', '1,2,3,4', 4847, 'balance', '余额支付', 0, '99.00', '79.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(138, 5, 1, 73, 19, 27, 5, 3, 1, 1627695733, 1627695733, 1627696800, 1627699800, 'A731957333236888', 'Dear 燃脂', '1,2,3,4', 4848, 'wxpay', '微信支付', 0, '99.00', '0.00', '0.00', 1, 0, 0, 0, 0, 1627695745, 0, NULL, 0, 0),
(139, 64, 1, 93, 6, 29, 45, 0, 0, 1627807882, NULL, 1627957800, 1627960800, 'A801078824524333', 'Dear Combat（拳力出击）', '1,2,3,4', 4851, 'wxpay', '微信支付', 0, '99.00', '99.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(140, 64, 1, 93, 6, 29, 45, 2, 1, 1627807950, 1627807950, 1627957800, 1627960800, 'A801079501900844', 'Dear Combat（拳力出击）', '1,2,3,4', 4852, 'wxpay', '微信支付', 43, '99.00', '0.00', '129.00', 1, 1, 1, 1, 0, 0, 1, '98U80GIR', 0, 0),
(141, 158, 1, 93, 6, 29, 45, 0, 0, 1627957673, NULL, 1627957800, 1627960800, 'A803576739621278', 'Dear Combat（拳力出击）', '1,2,3,4', 4856, 'wxpay', '微信支付', 0, '99.00', '79.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(142, 158, 1, 93, 6, 29, 45, 0, 0, 1627957683, NULL, 1627957800, 1627960800, 'A803576830303663', 'Dear Combat（拳力出击）', '1,2,3,4', 4857, 'balance', '余额支付', 0, '99.00', '79.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(143, 3, 1, 79, 9, 26, 25, 0, 0, 1627957869, NULL, 1627988400, 1627991400, 'A803578697996883', 'Dear Shbam（炫舞派对）', '1,2,3,4', 4858, 'wxpay', '微信支付', 0, '297.00', '29.70', '0.00', 3, 0, 1, 0, 0, 0, 0, NULL, 0, 0),
(144, 3, 1, 84, 6, 29, 45, 0, 0, 1627958133, NULL, 1628074800, 1628077800, 'A803581332476918', 'Dear Combat（拳力出击）', '1,2,3,4', 4859, 'wxpay', '微信支付', 0, '99.00', '9.90', '0.00', 1, 0, 1, 0, 0, 0, 0, NULL, 0, 0),
(145, 158, 1, 84, 6, 29, 45, 0, 0, 1627958394, NULL, 1628074800, 1628077800, 'A803583946237913', 'Dear Combat（拳力出击）', '1,2,3,4', 4860, 'wxpay', '微信支付', 0, '99.00', '79.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(146, 158, 1, 84, 6, 29, 45, 2, 1, 1627958494, 1627959648, 1628074800, 1628077800, 'A803584940440374', 'Dear Combat（拳力出击）', '1,2,3,4', 4861, 'balance', '余额支付', 0, '99.00', '79.00', '0.00', 1, 1, 1, 1, 0, 0, 0, NULL, 0, 0),
(147, 158, 1, 85, 17, 29, 45, 2, 1, 1627960103, 1627960103, 1628078400, 1628081400, 'A803601030708655', 'Dear Zumba(尊巴）', '1,2,3,4', 4862, 'balance', '余额支付', 0, '99.00', '79.00', '0.00', 1, 0, 0, 1, 0, 0, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_link`
--

CREATE TABLE `cmf_link` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='友情链接表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_meal_order`
--

CREATE TABLE `cmf_meal_order` (
  `order_id` mediumint(8) UNSIGNED NOT NULL COMMENT '订单id',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '订单编号',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '订单状态 0：待确认，1：已确认，2：已完成，3：取消，4：审核失败',
  `pay_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '支付状态1：已完成',
  `plat_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '平台  1：饿了么；2：美团',
  `prome_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：霸王餐；2：返利餐',
  `is_first` tinyint(1) NOT NULL DEFAULT '0' COMMENT '首次提交',
  `max_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '需要支付金额',
  `ret_price` decimal(10,2) DEFAULT '0.00' COMMENT '满返金额',
  `ret_vip_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员满返金额',
  `hire_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金',
  `sub_time` int(10) UNSIGNED DEFAULT NULL COMMENT '提交时间',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '开始时间',
  `con_time` int(11) UNSIGNED DEFAULT '0' COMMENT '确认时间',
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '厂区id',
  `user_note` varchar(255) NOT NULL DEFAULT '' COMMENT '用户备注',
  `admin_note` varchar(255) DEFAULT '' COMMENT '管理员备注',
  `supplier_name` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT '商家要求',
  `other_order_sn` varchar(50) DEFAULT NULL COMMENT '平台订单编号',
  `other_order_amount` decimal(10,2) DEFAULT '0.00' COMMENT '平台支付金额',
  `pay_img` varchar(2000) DEFAULT NULL COMMENT '订单截图',
  `com_img` varchar(2000) DEFAULT NULL COMMENT '订单评论截图',
  `year` int(5) NOT NULL DEFAULT '0' COMMENT '年',
  `month` int(3) NOT NULL DEFAULT '0' COMMENT '月',
  `day` int(3) NOT NULL DEFAULT '0' COMMENT '日'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_meal_order`
--

INSERT INTO `cmf_meal_order` (`order_id`, `order_sn`, `user_id`, `order_status`, `pay_status`, `plat_type`, `prome_type`, `is_first`, `max_price`, `ret_price`, `ret_vip_price`, `hire_money`, `sub_time`, `add_time`, `con_time`, `supplier_id`, `user_note`, `admin_note`, `supplier_name`, `thumbnail`, `description`, `other_order_sn`, `other_order_amount`, `pay_img`, `com_img`, `year`, `month`, `day`) VALUES
(1, 'A827557835706490', 2, 3, 0, 2, 2, 0, '20.00', '10.00', '18.00', '10.00', NULL, 1630055783, 0, 1, '', '', '淦烦人烧腊猪脚饭', 'goods/20210826/0c7ead1661d139e9466a1b37e5077e87.png', NULL, NULL, '0.00', NULL, NULL, 2021, 8, 27),
(2, 'A827583724116783', 2, 2, 0, 2, 2, 0, '20.00', '10.00', '18.00', '10.00', NULL, 1630058372, 1630319511, 1, '', '', '淦烦人烧腊猪脚饭', 'goods/20210826/0c7ead1661d139e9466a1b37e5077e87.png', NULL, NULL, '0.00', NULL, NULL, 2021, 8, 27),
(3, 'A830945861890959', 2, 4, 0, 1, 1, 0, '0.00', '0.00', '0.00', '0.00', 1630312858, 1630294586, 1631010188, 2, '', '123456', '翻滚吧炒饭君 ', 'goods/20210826/22f249048014093bbd148c883a9f0811.png', '', '12345678945', '36.20', 'default/20210830/163b154c5dbe388a66ba2126416a7eb5.jpg,default/20210830/9274ea6e220872bcae75452a7e4db9b3.jpg,default/20210830/77540c3c83fd86a07355412924104687.jpg,default/20210830/c44ad4a5a6094f6343afb88bf6d53b13.jpg,default/20210830/6372962314b3c55846f86f7ee3e28b6a.jpg', 'default/20210830/5b7c35061cdddadc5d2f55c4d0682322.gif', 2021, 8, 30),
(4, 'A901901037010605', 4, 1, 0, 1, 1, 0, '0.00', '0.00', '0.00', '0.00', 1630578813, 1630490103, 0, 2, '', '', '翻滚吧炒饭君 ', 'goods/20210826/22f249048014093bbd148c883a9f0811.png', '', '888', '3.00', 'default/20210902/a080714a95330f5d844a513f4f3c4708.jpg', 'default/20210902/a080714a95330f5d844a513f4f3c4708.jpg', 2021, 9, 1),
(5, 'A901901329486201', 4, 2, 0, 2, 2, 0, '20.00', '10.00', '18.00', '10.00', 1630578798, 1630490132, 1630579107, 1, '', '', '淦烦人烧腊猪脚饭', 'goods/20210826/0c7ead1661d139e9466a1b37e5077e87.png', '五星好评，2图20个文字', '555', '5.00', 'default/20210902/a080714a95330f5d844a513f4f3c4708.jpg', '', 2021, 9, 1),
(6, 'A902473946657972', 4, 2, 0, 2, 2, 0, '20.00', '10.00', '18.00', '10.00', 1630578786, 1630547394, 1630579101, 1, '', '', '淦烦人烧腊猪脚饭', 'goods/20210826/0c7ead1661d139e9466a1b37e5077e87.png', '五星好评，2图20个文字', '6666', '3.00', 'default/20210902/a080714a95330f5d844a513f4f3c4708.jpg', '', 2021, 9, 2),
(7, 'A902478508299676', 4, 2, 0, 1, 1, 0, '20.00', '15.00', '18.00', '15.00', 1630578770, 1630547850, 1630579096, 4, '', '', '水姐麻辣烫', 'goods/20210826/9c222571ddc717cef497f41d0f4825a7.png', '名额有限，优惠力度很大', '555', '11.00', 'default/20210902/a080714a95330f5d844a513f4f3c4708.jpg', 'default/20210902/a080714a95330f5d844a513f4f3c4708.jpg', 2021, 9, 2),
(8, 'A902478545301152', 4, 2, 0, 2, 1, 0, '18.00', '12.00', '15.00', '12.00', 1630578753, 1630547854, 1630579088, 3, '', '', '李家凉皮', 'goods/20210826/a8266316959f37d14f102daf4c2e9909.png', '加入会员可享更多特权', '3333', '1.00', 'default/20210902/a080714a95330f5d844a513f4f3c4708.jpg', 'default/20210902/a080714a95330f5d844a513f4f3c4708.jpg', 2021, 9, 2),
(9, 'A902478578679594', 4, 2, 0, 1, 1, 0, '20.00', '16.00', '18.00', '16.00', 1630578734, 1630547857, 1630578922, 2, '', '', '翻滚吧炒饭君 ', 'goods/20210826/22f249048014093bbd148c883a9f0811.png', '环境好，味道更好', '222222', '11.00', 'default/20210902/a080714a95330f5d844a513f4f3c4708.jpg', 'default/20210902/a080714a95330f5d844a513f4f3c4708.jpg', 2021, 9, 2),
(10, 'A902482063435916', 4, 2, 0, 1, 1, 0, '20.00', '15.00', '18.00', '15.00', 1630578716, 1630548206, 1630578856, 4, '', '', '水姐麻辣烫', 'goods/20210826/9c222571ddc717cef497f41d0f4825a7.png', '名额有限，优惠力度很大', '111111', '20.00', 'default/20210902/a080714a95330f5d844a513f4f3c4708.jpg', 'default/20210902/a080714a95330f5d844a513f4f3c4708.jpg', 2021, 9, 2),
(11, 'A902658393270457', 5, 2, 0, 2, 1, 0, '18.00', '12.00', '15.00', '12.00', 1630725617, 1630565839, 1630728529, 3, '', '', '李家凉皮', 'goods/20210826/a8266316959f37d14f102daf4c2e9909.png', '加入会员可享更多特权', '9214 9231 2306 0725 6', '25.00', 'default/20210904/87683c1c26a1d85fb9a235f1929cbbdc.jpg,default/20210904/1164cd4407192c3a39bc293bdb947d8a.jpg', 'default/20210904/0b6d581244ae0a0a6cf69a2041e03d2f.jpg,default/20210904/1164cd4407192c3a39bc293bdb947d8a.jpg', 2021, 9, 2),
(12, 'A902676686133715', 3, 3, 0, 2, 1, 0, '18.00', '12.00', '15.00', '12.00', NULL, 1630567668, 0, 3, '', '', '李家凉皮', 'goods/20210826/a8266316959f37d14f102daf4c2e9909.png', '加入会员可享更多特权', NULL, '0.00', NULL, NULL, 2021, 9, 2),
(13, 'A902759259451311', 6, 0, 0, 1, 1, 0, '20.00', '15.00', '18.00', '15.00', NULL, 1630575925, 0, 4, '', '', '水姐麻辣烫', 'goods/20210826/9c222571ddc717cef497f41d0f4825a7.png', '名额有限，优惠力度很大', NULL, '0.00', NULL, NULL, 2021, 9, 2),
(14, 'A902760133994491', 7, 3, 0, 1, 1, 0, '20.00', '15.00', '18.00', '15.00', NULL, 1630576013, 0, 4, '', '', '水姐麻辣烫', 'goods/20210826/9c222571ddc717cef497f41d0f4825a7.png', '名额有限，优惠力度很大', NULL, '0.00', NULL, NULL, 2021, 9, 2),
(15, 'A903510892165594', 7, 3, 0, 1, 1, 0, '20.00', '15.00', '18.00', '15.00', NULL, 1630651089, 0, 4, '', '', '水姐麻辣烫', 'goods/20210826/9c222571ddc717cef497f41d0f4825a7.png', '名额有限，优惠力度很大', NULL, '0.00', NULL, NULL, 2021, 9, 3),
(16, 'A903563180049060', 7, 3, 0, 2, 1, 0, '18.00', '12.00', '15.00', '12.00', NULL, 1630656318, 0, 3, '', '', '李家凉皮', 'goods/20210826/a8266316959f37d14f102daf4c2e9909.png', '加入会员可享更多特权', NULL, '0.00', NULL, NULL, 2021, 9, 3),
(17, 'A904250295424695', 8, 0, 0, 1, 1, 0, '20.00', '15.00', '18.00', '15.00', NULL, 1630725029, 0, 4, '', '', '水姐麻辣烫', 'goods/20210826/9c222571ddc717cef497f41d0f4825a7.png', '名额有限，优惠力度很大', NULL, '0.00', NULL, NULL, 2021, 9, 4),
(18, 'A904250607069601', 9, 0, 0, 1, 1, 0, '20.00', '15.00', '18.00', '15.00', NULL, 1630725060, 0, 4, '', '', '水姐麻辣烫', 'goods/20210826/9c222571ddc717cef497f41d0f4825a7.png', '名额有限，优惠力度很大', NULL, '0.00', NULL, NULL, 2021, 9, 4),
(19, 'A907944827789286', 3, 0, 0, 2, 1, 0, '18.00', '12.00', '15.00', '12.00', NULL, 1630994482, 0, 3, '', '', '李家凉皮', 'goods/20210907/4e39b2628275e2fe86f48483534dfdcb.png', '加入会员可享更多特权', NULL, '0.00', NULL, NULL, 2021, 9, 7),
(20, 'A907961398522384', 7, 3, 0, 2, 1, 0, '20.00', '10.00', '15.00', '10.00', NULL, 1630996139, 0, 5, '', '', '真心冒菜麻辣汤', 'goods/20210904/9410a886a204f46faf337ee72dbb6300.jpg', '五星2图，20字', NULL, '0.00', NULL, NULL, 2021, 9, 7),
(21, 'A907965466325368', 7, 3, 0, 1, 1, 0, '20.00', '16.00', '18.00', '16.00', NULL, 1630996546, 0, 2, '', '', '翻滚吧炒饭君 ', 'goods/20210907/18556f14dd4438d0c0ae881f85316f72.png', '环境好，味道更好', NULL, '0.00', NULL, NULL, 2021, 9, 7),
(22, 'A907965590057215', 7, 3, 0, 2, 1, 0, '18.00', '12.00', '15.00', '12.00', NULL, 1630996559, 0, 3, '', '', '李家凉皮', 'goods/20210907/4e39b2628275e2fe86f48483534dfdcb.png', '加入会员可享更多特权', NULL, '0.00', NULL, NULL, 2021, 9, 7),
(23, 'A907966900958657', 7, 3, 0, 2, 1, 0, '18.00', '12.00', '15.00', '12.00', NULL, 1630996690, 0, 3, '', '', '李家凉皮', 'goods/20210907/4e39b2628275e2fe86f48483534dfdcb.png', '加入会员可享更多特权', NULL, '0.00', NULL, NULL, 2021, 9, 7),
(24, 'A908719686221343', 4, 3, 0, 2, 1, 0, '18.00', '12.00', '15.00', '12.00', NULL, 1631071968, 0, 3, '', '', '李家凉皮', 'goods/20210907/4e39b2628275e2fe86f48483534dfdcb.png', '加入会员可享更多特权', NULL, '0.00', NULL, NULL, 2021, 9, 8),
(25, 'A908720738199106', 4, 3, 0, 2, 1, 0, '18.00', '12.00', '15.00', '12.00', NULL, 1631072073, 0, 3, '', '', '李家凉皮', 'goods/20210907/4e39b2628275e2fe86f48483534dfdcb.png', '加入会员可享更多特权', NULL, '0.00', NULL, NULL, 2021, 9, 8);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_nav`
--

CREATE TABLE `cmf_nav` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_main` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='前台导航位置表';

--
-- 转存表中的数据 `cmf_nav`
--

INSERT INTO `cmf_nav` (`id`, `is_main`, `name`, `remark`) VALUES
(1, 1, '主导航', '主导航'),
(2, 0, '底部导航', '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_nav_menu`
--

CREATE TABLE `cmf_nav_menu` (
  `id` int(11) NOT NULL,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='前台导航菜单表';

--
-- 转存表中的数据 `cmf_nav_menu`
--

INSERT INTO `cmf_nav_menu` (`id`, `nav_id`, `parent_id`, `status`, `list_order`, `name`, `target`, `href`, `icon`, `path`) VALUES
(1, 1, 0, 1, 0, '首页', '', 'home', '', '0-1');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_option`
--

CREATE TABLE `cmf_option` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `autoload` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='全站配置表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `cmf_option`
--

INSERT INTO `cmf_option` (`id`, `autoload`, `option_name`, `option_value`) VALUES
(1, 1, 'site_info', '{\"site_name\":\"饭有惠霸王餐\",\"site_seo_title\":\"网站管理\",\"site_seo_keywords\":\"网站管理\",\"site_seo_description\":\"网站管理\",\"site_service_phone\":\"\",\"site_icp\":\"\",\"site_analytics\":\"\"}'),
(2, 1, 'wxapp_settings', '{\"default\":{\"name\":\"霸王餐\",\"app_id\":\"wxa28549fc9910295d\",\"app_secret\":\"4d82470a905973238aa914017b1ca70e\",\"is_default\":\"1\",\"_plugin\":\"wxapp\",\"_controller\":\"admin_wxapp\",\"_action\":\"addpost\"},\"wxapps\":{\"wxa28549fc9910295d\":{\"name\":\"霸王餐\",\"app_id\":\"wxa28549fc9910295d\",\"app_secret\":\"4d82470a905973238aa914017b1ca70e\",\"_plugin\":\"wxapp\",\"_controller\":\"admin_wxapp\",\"_action\":\"addpost\"}}}'),
(3, 1, 'upload_setting', '{\"max_files\":\"20\",\"chunk_size\":\"512\",\"file_types\":{\"image\":{\"upload_max_filesize\":\"2048\",\"extensions\":\"jpg,jpeg,png,gif,bmp4\"},\"video\":{\"upload_max_filesize\":\"102400\",\"extensions\":\"mp4,avi,wmv,rm,rmvb,mkv\"},\"audio\":{\"upload_max_filesize\":\"10240\",\"extensions\":\"mp3,wma,wav\"},\"file\":{\"upload_max_filesize\":\"10240\",\"extensions\":\"txt,pdf,doc,docx,xls,xlsx,ppt,pptx,zip,rar\"}}}'),
(4, 1, 'cmf_settings', '{\"open_registration\":\"0\",\"banned_usernames\":\"\"}'),
(5, 1, 'cdn_settings', '{\"cdn_static_root\":\"\"}'),
(6, 1, 'admin_settings', '{\"admin_password\":\"\"}');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_order`
--

CREATE TABLE `cmf_order` (
  `order_id` mediumint(8) UNSIGNED NOT NULL COMMENT '订单id',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '订单编号',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '订单状态',
  `shipping_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发货状态',
  `pay_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '支付状态',
  `consignee` varchar(60) DEFAULT '' COMMENT '收货人',
  `country` varchar(100) DEFAULT '0' COMMENT '国家',
  `province` int(11) UNSIGNED DEFAULT '0' COMMENT '省份',
  `city` int(11) UNSIGNED DEFAULT '0' COMMENT '城市',
  `district` int(11) UNSIGNED DEFAULT '0' COMMENT '县区',
  `twon` int(11) DEFAULT '0' COMMENT '乡镇',
  `address` varchar(255) DEFAULT '' COMMENT '地址',
  `zipcode` varchar(60) DEFAULT '' COMMENT '邮政编码',
  `mobile` varchar(60) DEFAULT '' COMMENT '手机',
  `email` varchar(60) DEFAULT '' COMMENT '邮件',
  `shipping_code` varchar(32) DEFAULT '0' COMMENT '物流code',
  `shipping_name` varchar(120) DEFAULT '' COMMENT '物流名称',
  `delivery_no` varchar(255) DEFAULT NULL COMMENT '物流单号',
  `pay_code` varchar(32) NOT NULL DEFAULT '' COMMENT '支付code',
  `pay_name` varchar(120) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `invoice_title` varchar(256) DEFAULT '' COMMENT '发票抬头',
  `invoice_id` int(11) DEFAULT NULL COMMENT '发票id',
  `invoice_type` int(3) NOT NULL DEFAULT '1' COMMENT '发票类型0电子发票',
  `title_type` int(3) NOT NULL DEFAULT '1' COMMENT '抬头类型',
  `dutynum` varchar(50) CHARACTER SET armscii8 DEFAULT NULL COMMENT '税号',
  `bankname` varchar(100) DEFAULT NULL COMMENT '开户行',
  `banknum` varchar(30) CHARACTER SET armscii8 DEFAULT NULL COMMENT '银行账号',
  `businessaddress` varchar(100) CHARACTER SET armscii8 DEFAULT NULL COMMENT '企业地址',
  `businesstel` varchar(20) CHARACTER SET armscii8 DEFAULT NULL COMMENT '企业电话',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `shipping_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用余额',
  `coupon_price` decimal(10,2) DEFAULT '0.00' COMMENT '优惠券抵扣',
  `integral` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '使用积分',
  `integral_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用积分抵多少钱',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应付款金额',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单总价',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '下单时间',
  `shipping_time` int(11) DEFAULT '0' COMMENT '发货时间',
  `confirm_time` int(10) DEFAULT '0' COMMENT '收货确认时间',
  `pay_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '支付时间',
  `prom_id` int(11) DEFAULT NULL COMMENT '活动id',
  `prom_type` tinyint(6) NOT NULL DEFAULT '0' COMMENT '0 普通订单,1 限时秒杀, 2 团购 , 3 促销优惠',
  `order_prom_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活动优惠金额',
  `adjust_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格调整',
  `user_note` varchar(255) NOT NULL DEFAULT '' COMMENT '用户备注',
  `admin_note` varchar(255) DEFAULT '' COMMENT '管理员备注',
  `parent_sn` varchar(100) DEFAULT NULL COMMENT '父单单号',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `supplier_id` int(7) NOT NULL DEFAULT '0' COMMENT '商家id',
  `is_comment` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否评价',
  `is_coupon` smallint(1) NOT NULL DEFAULT '0' COMMENT '赠送红包',
  `coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠卷id',
  `refund_note` varchar(100) DEFAULT NULL,
  `refun_status` tinyint(1) DEFAULT '0' COMMENT '退款状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_order_log`
--

CREATE TABLE `cmf_order_log` (
  `action_id` mediumint(8) UNSIGNED NOT NULL COMMENT '表id',
  `order_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '订单ID',
  `action_user` varchar(30) DEFAULT NULL COMMENT '操作人 0 为管理员操作',
  `order_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '订单状态',
  `shipping_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '配送状态',
  `pay_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '支付状态',
  `action_note` varchar(255) NOT NULL DEFAULT '' COMMENT '操作备注',
  `log_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '操作时间',
  `status_desc` varchar(255) DEFAULT NULL COMMENT '状态描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_order_sub`
--

CREATE TABLE `cmf_order_sub` (
  `rec_id` mediumint(8) UNSIGNED NOT NULL COMMENT '表id自增',
  `order_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_img` varchar(200) DEFAULT NULL,
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_num` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT '购买数量',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价',
  `member_goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '会员折扣价',
  `give_integral` mediumint(8) DEFAULT '0' COMMENT '购买商品赠送积分',
  `spec_path` varchar(128) DEFAULT '' COMMENT '商品规格key',
  `spec_item_name` varchar(128) DEFAULT '' COMMENT '规格对应的中文名字',
  `bar_code` varchar(64) NOT NULL DEFAULT '' COMMENT '条码',
  `is_comment` tinyint(1) DEFAULT '0' COMMENT '是否评价',
  `prom_type` tinyint(1) DEFAULT '0' COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠',
  `prom_id` int(11) DEFAULT '0' COMMENT '活动id',
  `is_send` tinyint(1) DEFAULT '0' COMMENT '0未发货，1已发货，2已换货，3已退货',
  `delivery_id` int(11) DEFAULT '0' COMMENT '发货单ID',
  `goods_type` smallint(1) NOT NULL DEFAULT '0',
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `goods_sn` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_pay_log`
--

CREATE TABLE `cmf_pay_log` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：会员开通，2：商城支付，3:场地支付 place_order,4:预约超时补价-place_order_sub,5:充值，6：团课预约',
  `order_sn` varchar(35) DEFAULT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  `pay_code` varchar(20) DEFAULT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `pay_time` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_pay_log`
--

INSERT INTO `cmf_pay_log` (`id`, `user_id`, `amount`, `is_paid`, `type`, `order_sn`, `goods_name`, `pay_code`, `add_time`, `pay_time`) VALUES
(1, 4, '9.90', 0, 1, 'A902482360820110', '开通周卡', 'wxpay', 1630548236, 0),
(2, 4, '19.90', 0, 1, 'A902653753566015', '开通月卡', 'wxpay', 1630565375, 0),
(3, 3, '9.90', 0, 1, 'A902734777653677', '开通周卡', 'wxpay', 1630573477, 0),
(4, 3, '0.01', 1, 1, 'A902736977718619', '开通周卡', 'wxpay', 1630573697, 1630573708),
(5, 5, '9.90', 1, 1, 'A902748548037495', '开通周卡', 'wxpay', 1630574854, 1630574863),
(6, 7, '39.90', 0, 1, 'A903503653225498', '开通季卡', 'wxpay', 1630650365, 0),
(7, 5, '9.90', 0, 1, 'A904241466735208', '开通周卡', 'wxpay', 1630724146, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_plugin`
--

CREATE TABLE `cmf_plugin` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增id',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='插件表';

--
-- 转存表中的数据 `cmf_plugin`
--

INSERT INTO `cmf_plugin` (`id`, `type`, `has_admin`, `status`, `create_time`, `name`, `title`, `demo_url`, `hooks`, `author`, `author_url`, `version`, `description`, `config`) VALUES
(1, 1, 1, 1, 0, 'HzMsgBorad', '留言板', '', '', '懒懒', '', '1.0', '留言板', '[]'),
(2, 1, 1, 1, 0, 'Wxapp', '微信小程序', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', '1.0', '微信小程序管理工具', '[]'),
(3, 1, 0, 1, 0, 'ShangAdminLogin', '大气后台登录页面', '', '', 'lanlan', '', '1.0', '新版蓝色大气后台登录页面', '[]'),
(5, 1, 1, 1, 0, 'Modules', '内容模型', '', '', '', '', '1.0', '内容模型', '[]');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_plugin_guestbook`
--

CREATE TABLE `cmf_plugin_guestbook` (
  `id` int(11) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `project_id` int(10) DEFAULT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  `type` smallint(1) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '留言者邮箱',
  `phone` char(11) NOT NULL DEFAULT '' COMMENT '留言者手机',
  `title` varchar(255) DEFAULT '' COMMENT '留言标题',
  `ip` varchar(55) DEFAULT NULL,
  `msg` text COMMENT '留言内容',
  `huifu` text COMMENT '回复内容',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '留言时间',
  `is_hui` smallint(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

--
-- 转存表中的数据 `cmf_plugin_guestbook`
--

INSERT INTO `cmf_plugin_guestbook` (`id`, `user_id`, `project_id`, `type_name`, `type`, `name`, `email`, `phone`, `title`, `ip`, `msg`, `huifu`, `createtime`, `is_hui`, `address`) VALUES
(1, 2, NULL, '代运营', NULL, '老板', '', '1526565', '店铺名称', NULL, NULL, NULL, 1630380558, NULL, '地址'),
(2, 4, NULL, '霸王餐', NULL, '赵贤臣', '', '18691459300', '名远科技', NULL, NULL, NULL, 1630542675, NULL, '西安市高新区科技五路数字大厦');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_plugin_modules`
--

CREATE TABLE `cmf_plugin_modules` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `pinyin` varchar(100) NOT NULL DEFAULT '',
  `remark` varchar(255) DEFAULT NULL,
  `state` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1 正常 0 删除',
  `is_category` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否有分类,1:启动,0:关闭',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否可删除,1:启动,0:关闭',
  `cate_level` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '分类级别',
  `data` text COMMENT '编辑配置',
  `exts` text COMMENT '关联的扩展表',
  `list` text COMMENT '列表配置',
  `search` text COMMENT '搜索配置',
  `edit` text COMMENT '编辑配置',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '总数量',
  `version` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1是新版'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容模型模块管理表';

--
-- 转存表中的数据 `cmf_plugin_modules`
--

INSERT INTO `cmf_plugin_modules` (`id`, `name`, `pinyin`, `remark`, `state`, `is_category`, `is_del`, `cate_level`, `data`, `exts`, `list`, `search`, `edit`, `total_num`, `version`) VALUES
(3, '活动管理', 'activity', '', 1, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_plugin_modules_citys`
--

CREATE TABLE `cmf_plugin_modules_citys` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `level3` tinyint(2) NOT NULL DEFAULT '1' COMMENT '三级城市的类型:1是直辖市，2是省会行政中心，3是有分区的大城市，4是县城，5是城区',
  `pinyin` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(32) NOT NULL DEFAULT '',
  `areaname` varchar(16) DEFAULT NULL,
  `lat` double(11,8) DEFAULT NULL COMMENT '纬度',
  `lng` double(11,8) DEFAULT NULL COMMENT '经度'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市资源';

--
-- 转存表中的数据 `cmf_plugin_modules_citys`
--

INSERT INTO `cmf_plugin_modules_citys` (`id`, `code`, `pid`, `level`, `level3`, `pinyin`, `name`, `areaname`, `lat`, `lng`) VALUES
(1, 110000, 0, 1, 1, 'beijing', '北京', '市', 39.92998900, 116.39564600),
(2, 310000, 0, 1, 1, 'shanghai', '上海', '市', 31.24916210, 121.48789910),
(3, 120000, 0, 1, 1, 'tianjin', '天津', '市', 38.99757600, 117.39196000),
(4, 500000, 0, 1, 1, 'chongqing', '重庆', '市', 29.54460650, 106.53063550),
(5, 230000, 0, 1, 0, 'heilongjiang', '黑龙江', '省', 47.35659200, 128.04741400),
(6, 220000, 0, 1, 0, 'jilin', '吉林', '省', 43.90199500, 125.33253000),
(7, 210000, 0, 1, 0, 'liaoning', '辽宁', '省', 41.62160000, 122.75359200),
(8, 150000, 0, 1, 0, 'neimenggu', '内蒙古', '自治区', 43.46823800, 114.41586800),
(9, 130000, 0, 1, 0, 'hebei', '河北', '省', 40.98441210, 117.95051210),
(10, 140000, 0, 1, 0, 'shanxi', '山西', '省', 37.86656600, 112.51549600),
(11, 610000, 0, 1, 0, 'shanxi1', '陕西', '省', 35.86002600, 109.50378900),
(12, 370000, 0, 1, 0, 'shandong', '山东', '省', 36.09929000, 118.52766300),
(13, 650000, 0, 1, 0, 'xinjiang', '新疆', '自治区', 43.79911100, 87.63401700),
(14, 540000, 0, 1, 0, 'xicang', '西藏', '自治区', 31.36731500, 89.13798200),
(15, 630000, 0, 1, 0, 'qinghai', '青海', '省', 35.49976100, 96.20254400),
(16, 620000, 0, 1, 0, 'gansu', '甘肃', '省', 38.10326700, 102.45762500),
(17, 640000, 0, 1, 0, 'ningxia', '宁夏', '自治区', 37.32132300, 106.15548100),
(18, 410000, 0, 1, 0, 'henan', '河南', '省', 34.51139000, 101.55630700),
(19, 320000, 0, 1, 0, 'jiangsu', '江苏', '省', 33.01379700, 119.36848900),
(20, 420000, 0, 1, 0, 'hubei', '湖北', '省', 31.20931600, 112.41056200),
(21, 330000, 0, 1, 0, 'zhejiang', '浙江', '省', 29.15949400, 119.95720200),
(22, 340000, 0, 1, 0, 'anhui', '安徽', '省', 31.85925200, 117.21600500),
(23, 350000, 0, 1, 0, 'fujian', '福建', '省', 26.05011800, 117.98494300),
(24, 360000, 0, 1, 0, 'jiangxi', '江西', '省', 27.75725800, 115.67608200),
(25, 430000, 0, 1, 0, 'hunan', '湖南', '省', 27.69586400, 111.72066400),
(26, 520000, 0, 1, 0, 'guizhou', '贵州', '省', 26.90282600, 106.73499600),
(27, 510000, 0, 1, 0, 'sichuan', '四川', '省', 30.36748100, 102.89916000),
(28, 440000, 0, 1, 0, 'guangdong', '广东', '省', 23.40800400, 113.39481800),
(29, 530000, 0, 1, 0, 'yunnan', '云南', '省', 25.05156000, 102.71614700),
(30, 450000, 0, 1, 0, 'guangxi', '广西', '自治区', 23.55000000, 108.92420000),
(31, 460000, 0, 1, 0, 'hainan', '海南', '省', 20.02483000, 110.35525600),
(32, 810000, 0, 1, 0, 'xianggang', '香港', '特别行政区', 22.29358610, 114.18612410),
(33, 820000, 0, 1, 0, 'aomen', '澳门', '特别行政区', 22.20411800, 113.55751900),
(34, 710000, 0, 1, 0, 'taiwan', '台湾', '省', 24.08695710, 121.97387200),
(101, 110100, 1, 2, 1, 'beijing', '北京', '辖区', 39.92998600, 116.39564500),
(201, 310100, 2, 2, 1, 'shanghai', '上海', '辖区', 31.24916200, 121.48789900),
(301, 120100, 3, 2, 1, 'tianjin', '天津', '辖区', 39.14393000, 117.21081300),
(401, 500100, 4, 2, 1, 'chongqing', '重庆', '辖区', 29.54460600, 106.53063500),
(501, 230100, 5, 2, 2, 'haerbin', '哈尔滨', '市', 45.77322500, 126.65771700),
(502, 230200, 5, 2, 3, 'qiqihaer', '齐齐哈尔', '市', 47.34770000, 123.98728900),
(503, 231000, 5, 2, 3, 'mudanjiang', '牡丹江', '市', 44.58852100, 129.60803500),
(504, 230800, 5, 2, 3, 'jiamusi', '佳木斯', '市', 46.81378000, 130.28473500),
(505, 231200, 5, 2, 3, 'suihua', '绥化', '市', 46.64606400, 126.98909500),
(506, 231100, 5, 2, 3, 'heihe', '黑河', '市', 50.25069000, 127.50083000),
(507, 232700, 5, 2, 3, 'daxinganling', '大兴安岭', '区', 51.99178900, 124.19610400),
(508, 230700, 5, 2, 3, 'yichun', '伊春', '市', 47.74195900, 128.90058000),
(509, 230600, 5, 2, 3, 'daqing', '大庆', '市', 46.59670900, 125.02184000),
(510, 230900, 5, 2, 3, 'qitaihe', '七台河', '市', 45.77500500, 131.01904800),
(511, 230300, 5, 2, 3, 'jixi', '鸡西', '市', 45.32154000, 130.94176700),
(512, 230400, 5, 2, 3, 'hegang', '鹤岗', '市', 47.33866600, 130.29247200),
(513, 230500, 5, 2, 3, 'shuangyashan', '双鸭山', '市', 46.65510200, 131.17140200),
(601, 220100, 6, 2, 2, 'changchun', '长春', '市', 43.89833800, 125.31364200),
(602, 220200, 6, 2, 3, 'jilin', '吉林', '市', 43.91656200, 126.56852500),
(603, 222400, 6, 2, 3, 'yanbian', '延边朝鲜族', '自治州', 42.89641400, 129.48590200),
(604, 220300, 6, 2, 3, 'siping', '四平', '市', 43.17552500, 124.39138200),
(605, 220500, 6, 2, 3, 'tonghua', '通化', '市', 41.73639700, 125.94265000),
(606, 220800, 6, 2, 3, 'baicheng', '白城', '市', 45.62108600, 122.84077700),
(607, 220400, 6, 2, 3, 'liaoyuan', '辽源', '市', 42.92330300, 125.13368600),
(608, 220700, 6, 2, 3, 'songyuan', '松原', '市', 45.13604900, 124.83299500),
(609, 220600, 6, 2, 3, 'baishan', '白山', '市', 41.94585900, 126.43579800),
(701, 210100, 7, 2, 2, 'shenyang', '沈阳', '市', 41.80864500, 123.43279100),
(702, 210200, 7, 2, 3, 'dalian', '大连', '市', 38.94871000, 121.59347800),
(703, 210300, 7, 2, 3, 'anshan', '鞍山', '市', 41.11874400, 123.00776300),
(704, 210400, 7, 2, 3, 'fushun', '抚顺', '市', 41.87730400, 123.92982000),
(705, 210500, 7, 2, 3, 'benxi', '本溪', '市', 41.32583800, 123.77806200),
(706, 210600, 7, 2, 3, 'dandong', '丹东', '市', 40.12902300, 124.33854300),
(707, 210700, 7, 2, 3, 'jinzhou1', '锦州', '市', 41.13087900, 121.14774900),
(708, 210800, 7, 2, 3, 'yingkou', '营口', '市', 40.66865100, 122.23339100),
(709, 210900, 7, 2, 3, 'fuxin', '阜新', '市', 42.01925000, 121.66082200),
(710, 211000, 7, 2, 3, 'liaoyang', '辽阳', '市', 41.27333900, 123.17245100),
(711, 211200, 7, 2, 3, 'tieling', '铁岭', '市', 42.29975700, 123.85485000),
(712, 211300, 7, 2, 3, 'chaoyang1', '朝阳', '市', 41.57971700, 120.45621800),
(713, 211100, 7, 2, 3, 'panjin', '盘锦', '市', 41.14124800, 122.07322800),
(714, 211400, 7, 2, 3, 'huludao', '葫芦岛', '市', 40.74303000, 120.86075800),
(801, 150100, 8, 2, 2, 'huhehaote', '呼和浩特', '市', 40.82831900, 111.66035100),
(802, 150200, 8, 2, 3, 'baotou', '包头', '市', 40.64711900, 109.84623900),
(803, 150300, 8, 2, 3, 'wuhai', '乌海', '市', 39.68317700, 106.83199900),
(804, 150900, 8, 2, 3, 'wulanchabu', '乌兰察布', '市', 41.02236300, 113.11284600),
(805, 150500, 8, 2, 3, 'tongliao', '通辽', '市', 43.63375600, 122.26036300),
(806, 150400, 8, 2, 3, 'chifeng', '赤峰', '市', 42.29711200, 118.93076100),
(807, 150600, 8, 2, 3, 'eerduosi', '鄂尔多斯', '市', 39.81649000, 109.99370600),
(808, 150800, 8, 2, 3, 'bayanzhuoer', '巴彦淖尔', '市', 40.76918000, 107.42380700),
(809, 152500, 8, 2, 3, 'xilingguole', '锡林郭勒', '盟', 44.48976100, 116.11850100),
(810, 150700, 8, 2, 3, 'hulunbeier', '呼伦贝尔', '市', 49.21859800, 119.74257500),
(811, 152200, 8, 2, 3, 'xinganmeng', '兴安', '盟', 46.08883300, 122.04406500),
(812, 152900, 8, 2, 3, 'alashanmeng', '阿拉善', '盟', 38.84307500, 105.69568300),
(901, 130100, 9, 2, 2, 'shijiazhuang', '石家庄', '市', 38.04895800, 114.52208200),
(902, 130600, 9, 2, 3, 'baoding', '保定', '市', 38.88656500, 115.49481000),
(903, 130700, 9, 2, 3, 'zhangjiakou', '张家口', '市', 40.81118800, 114.89378200),
(904, 130800, 9, 2, 3, 'chengde', '承德', '市', 40.99252100, 117.93382200),
(905, 130200, 9, 2, 3, 'tangshan', '唐山', '市', 39.65053100, 118.18345100),
(906, 131000, 9, 2, 3, 'langfang', '廊坊', '市', 39.51861100, 116.70360200),
(907, 130900, 9, 2, 3, 'cangzhou', '沧州', '市', 38.29761500, 116.86380600),
(908, 131100, 9, 2, 3, 'hengshui', '衡水', '市', 37.74692900, 115.68622900),
(909, 130500, 9, 2, 3, 'xingtai', '邢台', '市', 37.06953100, 114.52048700),
(910, 130400, 9, 2, 3, 'handan', '邯郸', '市', 36.60930800, 114.48269400),
(911, 130300, 9, 2, 3, 'qinhuangdao', '秦皇岛', '市', 39.94546200, 119.60436800),
(1001, 140100, 10, 2, 2, 'taiyuan', '太原', '市', 37.89027700, 112.55086400),
(1002, 140200, 10, 2, 3, 'datong', '大同', '市', 46.07005100, 124.69907700),
(1003, 140300, 10, 2, 3, 'yangquan', '阳泉', '市', 37.86952900, 113.56923800),
(1004, 140700, 10, 2, 3, 'jinzhong', '晋中', '市', 37.69336200, 112.73851400),
(1005, 140400, 10, 2, 3, 'changzhi', '长治', '市', 36.20166400, 113.12029200),
(1006, 140500, 10, 2, 3, 'jincheng', '晋城', '市', 35.49983400, 112.86733300),
(1007, 141000, 10, 2, 3, 'linfen', '临汾', '市', 36.09974500, 111.53878800),
(1008, 140800, 10, 2, 3, 'yuncheng', '运城', '市', 35.03885900, 111.00685400),
(1009, 140600, 10, 2, 3, 'shuozhou', '朔州', '市', 39.33767200, 112.47992800),
(1010, 140900, 10, 2, 3, 'xinzhou', '忻州', '市', 38.46103100, 112.72793900),
(1011, 141100, 10, 2, 3, 'lvliang', '吕梁', '市', 37.52731600, 111.14315700),
(1101, 610100, 11, 2, 2, 'xian', '西安', '市', 42.98636500, 125.15014900),
(1102, 610400, 11, 2, 3, 'xianyang', '咸阳', '市', 34.34537300, 108.70750900),
(1103, 610600, 11, 2, 3, 'yanan', '延安', '市', 36.60332000, 109.50051000),
(1104, 610800, 11, 2, 3, 'yulin', '榆林', '市', 38.27943900, 109.74592600),
(1105, 610500, 11, 2, 3, 'weinan', '渭南', '市', 34.50235800, 109.48393300),
(1106, 611000, 11, 2, 3, 'shangluo', '商洛', '市', 33.87390700, 109.93420800),
(1107, 610900, 11, 2, 3, 'ankang', '安康', '市', 32.70437000, 109.03804500),
(1108, 610700, 11, 2, 3, 'hanzhong', '汉中', '市', 33.08156900, 107.04547800),
(1109, 610300, 11, 2, 3, 'baoji', '宝鸡', '市', 34.36408100, 107.17064500),
(1110, 610200, 11, 2, 3, 'tongchuan', '铜川', '市', 34.90836800, 108.96806700),
(1201, 370100, 12, 2, 2, 'jinan', '济南', '市', 36.67162100, 117.00131400),
(1202, 370200, 12, 2, 3, 'qingdao', '青岛', '市', 36.10521500, 120.38442800),
(1203, 370300, 12, 2, 3, 'zibo', '淄博', '市', 36.80468500, 118.05913400),
(1204, 371400, 12, 2, 3, 'dezhou', '德州', '市', 37.46082600, 116.32816100),
(1205, 370600, 12, 2, 3, 'yantai', '烟台', '市', 37.53656200, 121.30955500),
(1206, 370700, 12, 2, 3, 'weifang', '潍坊', '市', 36.71611500, 119.14263400),
(1207, 370800, 12, 2, 3, 'jining1', '济宁', '市', 35.40212200, 116.60079800),
(1208, 370900, 12, 2, 3, 'taian1', '泰安', '市', 36.18807800, 117.08941500),
(1209, 371300, 12, 2, 3, 'linyi2', '临沂', '市', 35.07240900, 118.34076800),
(1210, 371700, 12, 2, 3, 'heze', '菏泽', '市', 35.26244000, 115.46336000),
(1211, 371600, 12, 2, 3, 'binzhou', '滨州', '市', 37.40531400, 117.96829200),
(1212, 370500, 12, 2, 3, 'dongying', '东营', '市', 37.40866600, 118.61264300),
(1213, 371000, 12, 2, 3, 'weihai', '威海', '市', 37.52878700, 122.09395800),
(1214, 370400, 12, 2, 3, 'zaozhuang', '枣庄', '市', 34.81597700, 117.33015400),
(1215, 371100, 12, 2, 3, 'rizhao', '日照', '市', 35.42022500, 119.50718000),
(1216, 371200, 12, 2, 3, 'laiwu', '莱芜', '市', 36.23365400, 117.68466700),
(1217, 371500, 12, 2, 3, 'liaocheng', '聊城', '市', 36.45582900, 115.98686900),
(1301, 650100, 13, 2, 2, 'wulumuqi', '乌鲁木齐', '市', 43.84038000, 87.56498800),
(1302, 650200, 13, 2, 3, 'kelamayi', '克拉玛依', '市', 45.20391900, 84.92699000),
(1303, 659000, 13, 2, 4, 'shihezi', '石河子', '市', 44.30825900, 86.04186500),
(1304, 652300, 13, 2, 3, 'changji', '昌吉回族', '自治州', 44.17508300, 87.07361800),
(1305, 650400, 13, 2, 3, 'tulufan', '吐鲁番', '市', 42.67892500, 89.26602500),
(1306, 652800, 13, 2, 3, 'bayinguo', '巴音郭楞', '自治州', 31.78530300, 106.73926600),
(1307, 659000, 13, 2, 4, 'alaer', '阿拉尔', '市', 40.61568000, 81.29173700),
(1308, 652900, 13, 2, 4, 'akesu', '阿克苏', '区', 40.34944400, 81.15601300),
(1309, 653100, 13, 2, 0, 'kashi', '喀什', '区', 39.51311100, 76.01434300),
(1310, 654000, 13, 2, 3, 'yili', '伊犁', '自治州', 43.92224800, 81.29785400),
(1311, 654200, 13, 2, 4, 'tacheng', '塔城', '区', 46.81136700, 83.19012800),
(1312, 650500, 13, 2, 3, 'hami', '哈密', '市', 42.34446700, 93.52937300),
(1313, 653200, 13, 2, 3, 'hetian', '和田', '区', 37.15335000, 79.91581400),
(1314, 654300, 13, 2, 4, 'aletai', '阿勒泰', '区', 47.89013600, 87.92621400),
(1315, 653000, 13, 2, 3, 'kezhou', '克州', '自治州', 39.75034600, 76.13756400),
(1316, 652700, 13, 2, 3, 'bozhou', '博州', '自治州', 44.91224400, 82.07268600),
(1318, 659000, 13, 2, 4, 'tumushuke', '图木舒克', '市', 39.87187400, 79.07681300),
(1319, 659000, 13, 2, 4, 'wujiaqu', '五家渠', '市', 44.17230500, 87.54996700),
(1320, 659000, 13, 2, 4, 'tiemenguan', '铁门关', '市', 39.97894700, 119.80848500),
(1401, 540100, 14, 2, 2, 'lasa', '拉萨', '市', 29.66255700, 91.11189100),
(1402, 540200, 14, 2, 3, 'rikaze', '日喀则', '市', 29.26816200, 88.95606320),
(1403, 540500, 14, 2, 3, 'shannan', '山南', '市', 29.22902700, 91.75064400),
(1404, 540400, 14, 2, 3, 'linzhi', '林芝', '市', 29.66694100, 94.34998500),
(1405, 540300, 14, 2, 3, 'changdu', '昌都', '市', 31.14057600, 97.18558200),
(1406, 542400, 14, 2, 3, 'naqu', '那曲', '区', 31.48068000, 92.06701800),
(1407, 542500, 14, 2, 3, 'ali', '阿里', '区', 30.40455700, 81.10766900),
(1501, 630100, 15, 2, 2, 'xining', '西宁', '市', 36.64073900, 101.76792100),
(1502, 630200, 15, 2, 3, 'haidong', '海东', '市', 36.51761000, 102.08520700),
(1503, 632300, 15, 2, 3, 'huangnan', '黄南', '自治州', 35.52285200, 102.00760000),
(1504, 632500, 15, 2, 3, 'hainanzhou', '海南州', '自治州', 36.30216300, 100.62941100),
(1505, 632600, 15, 2, 3, 'guoluo', '果洛', '自治州', 34.48048500, 100.22372300),
(1506, 632700, 15, 2, 3, 'yushu1', '玉树', '自治州', 33.00624000, 97.01331600),
(1507, 632800, 15, 2, 3, 'haixi', '海西', '自治州', 37.37379900, 97.34262500),
(1508, 632200, 15, 2, 3, 'haibei', '海北', '自治州', 36.96065400, 100.87980200),
(1509, 632801, 15, 2, 3, 'geermu', '格尔木', '', 36.41283600, 94.93216000),
(1601, 620100, 16, 2, 2, 'lanzhou', '兰州', '市', 36.06422600, 103.82330500),
(1602, 621100, 16, 2, 3, 'dingxi', '定西', '市', 35.58605600, 104.62663800),
(1603, 620800, 16, 2, 3, 'pingliang', '平凉', '市', 35.55011000, 106.68891100),
(1604, 621000, 16, 2, 3, 'qingyang', '庆阳', '市', 35.74513210, 107.63883210),
(1605, 620600, 16, 2, 3, 'wuwei', '武威', '市', 37.93317200, 102.64014700),
(1606, 620300, 16, 2, 3, 'jinchang', '金昌', '市', 38.51607200, 102.20812600),
(1607, 620700, 16, 2, 3, 'zhangye', '张掖', '市', 38.93932000, 100.45989200),
(1608, 620900, 16, 2, 3, 'jiuquan', '酒泉', '市', 39.74147400, 98.50841500),
(1609, 620500, 16, 2, 3, 'tianshui', '天水', '市', 34.58431900, 105.73693200),
(1610, 621200, 16, 2, 3, 'longnan1', '陇南', '市', 33.40593600, 104.92887700),
(1611, 622900, 16, 2, 3, 'linxia', '临夏州', '自治州', 35.58583500, 103.20057600),
(1612, 623000, 16, 2, 3, 'gannan', '甘南州', '自治州', 34.98915000, 102.91756500),
(1613, 620400, 16, 2, 3, 'baiyin', '白银', '市', 36.50182200, 104.20564900),
(1614, 620200, 16, 2, 3, 'jiayuguan', '嘉峪关', '市', 39.80239700, 98.28163500),
(1701, 640100, 17, 2, 2, 'yinchuan', '银川', '市', 38.50262100, 106.20647900),
(1702, 640200, 17, 2, 3, 'shizuishan', '石嘴山', '市', 39.02022300, 106.37933700),
(1703, 640300, 17, 2, 3, 'wuzhong', '吴忠', '市', 37.99356100, 106.20825400),
(1704, 640400, 17, 2, 3, 'guyuan1', '固原', '市', 36.02152300, 106.28526800),
(1705, 640500, 17, 2, 3, 'zhongwei', '中卫', '市', 37.52112400, 105.19675400),
(1801, 410100, 18, 2, 2, 'zhengzhou', '郑州', '市', 34.75661000, 113.64964400),
(1802, 410500, 18, 2, 3, 'anyang', '安阳', '市', 36.11026700, 114.35180700),
(1803, 410700, 18, 2, 3, 'xinxiang', '新乡', '市', 35.30725800, 113.91269000),
(1804, 411000, 18, 2, 3, 'xuchang', '许昌', '市', 34.02674000, 113.83531200),
(1805, 410400, 18, 2, 3, 'pingdingshan', '平顶山', '市', 33.74530100, 113.30084900),
(1806, 411500, 18, 2, 3, 'xinyang', '信阳', '市', 32.12858200, 114.08549100),
(1807, 411300, 18, 2, 3, 'nanyang', '南阳', '市', 33.01142000, 112.54284200),
(1808, 410200, 18, 2, 3, 'kaifeng', '开封', '市', 34.80185400, 114.35164200),
(1809, 410300, 18, 2, 3, 'luoyang', '洛阳', '市', 34.65736800, 112.44752500),
(1810, 411400, 18, 2, 3, 'shangqiu', '商丘', '市', 34.43858900, 115.64188600),
(1811, 410800, 18, 2, 3, 'jiaozuo', '焦作', '市', 35.23460800, 113.21183600),
(1812, 410600, 18, 2, 3, 'hebi', '鹤壁', '市', 35.75542600, 114.29777000),
(1813, 410900, 18, 2, 3, 'puyang', '濮阳', '市', 35.75329800, 115.02662700),
(1814, 411600, 18, 2, 3, 'zhoukou', '周口', '市', 33.62374100, 114.65410200),
(1815, 411100, 18, 2, 3, 'luohe', '漯河', '市', 33.57627900, 114.04606100),
(1816, 411700, 18, 2, 3, 'zhumadian', '驻马店', '市', 32.98315800, 114.04915400),
(1817, 411200, 18, 2, 3, 'sanmenxia', '三门峡', '市', 34.78332000, 111.18126200),
(1818, 419000, 18, 2, 3, 'jiyuan', '济源', '市', 35.10536500, 112.40526800),
(1901, 320100, 19, 2, 2, 'nanjing', '南京', '市', 32.05723600, 118.77807400),
(1902, 320200, 19, 2, 3, 'wuxi1', '无锡', '市', 31.57003700, 120.30545600),
(1903, 321100, 19, 2, 3, 'zhenjiang', '镇江', '市', 32.20440900, 119.45583500),
(1904, 320500, 19, 2, 3, 'suzhou', '苏州', '市', 31.31798700, 120.61990700),
(1905, 320600, 19, 2, 3, 'nantong', '南通', '市', 32.01466500, 120.87380100),
(1906, 321000, 19, 2, 3, 'yangzhou', '扬州', '市', 32.40850500, 119.42777800),
(1907, 320900, 19, 2, 3, 'yancheng', '盐城', '市', 33.37986200, 120.14887200),
(1908, 320300, 19, 2, 3, 'xuzhou', '徐州', '市', 34.27155300, 117.18810700),
(1909, 320800, 19, 2, 3, 'huaian1', '淮安', '市', 33.60651300, 119.03018600),
(1910, 320700, 19, 2, 3, 'lianyungang', '连云港', '市', 34.60154900, 119.17387200),
(1911, 320400, 19, 2, 3, 'changzhou', '常州', '市', 31.77139700, 119.98186100),
(1912, 321200, 19, 2, 3, 'taizhou2', '泰州', '市', 32.47605300, 119.91960600),
(1913, 321300, 19, 2, 3, 'suqian', '宿迁', '市', 33.95205000, 118.29689300),
(2001, 420100, 20, 2, 2, 'wuhan', '武汉', '市', 30.58108400, 114.31620000),
(2002, 420600, 20, 2, 3, 'xiangyang', '襄阳', '市', 32.22916900, 112.25009300),
(2003, 420700, 20, 2, 3, 'ezhou', '鄂州', '市', 30.38443900, 114.89559400),
(2004, 420900, 20, 2, 3, 'xiaogan', '孝感', '市', 30.92795500, 113.93573400),
(2005, 421100, 20, 2, 3, 'huanggang', '黄冈', '市', 30.44610900, 114.90661800),
(2006, 420200, 20, 2, 3, 'huangshi', '黄石', '市', 30.21612700, 115.05068300),
(2007, 421200, 20, 2, 3, 'xianning', '咸宁', '市', 29.88065700, 114.30006100),
(2008, 421000, 20, 2, 3, 'jingzhou', '荆州', '市', 30.35900100, 112.19657400),
(2009, 420500, 20, 2, 3, 'yichang', '宜昌', '市', 30.73275800, 111.31098100),
(2010, 422800, 20, 2, 3, 'enshi', '恩施州', '自治州', 30.30897900, 109.51743300),
(2011, 420300, 20, 2, 3, 'shiyan', '十堰', '市', 32.63699400, 110.80122900),
(2012, 429000, 20, 2, 4, 'shennongjia', '神农架', '林区', 28.75921100, 104.65121400),
(2013, 421300, 20, 2, 3, 'suizhou', '随州', '市', 31.71785800, 113.37935800),
(2014, 420800, 20, 2, 3, 'jingmen', '荆门', '市', 31.04261100, 112.21733000),
(2015, 429000, 20, 2, 4, 'tianmen', '天门', '市', 30.64904700, 113.12623000),
(2016, 429000, 20, 2, 4, 'xiantao', '仙桃', '市', 30.29396600, 113.38744800),
(2017, 429000, 20, 2, 4, 'qianjiang1', '潜江', '市', 30.34311600, 112.76876800),
(2101, 330100, 21, 2, 2, 'hangzhou', '杭州', '市', 30.25924400, 120.21937500),
(2102, 330500, 21, 2, 3, 'huzhou', '湖州', '市', 30.87792500, 120.13724300),
(2103, 330400, 21, 2, 3, 'jiaxing', '嘉兴', '市', 30.77399200, 120.76042800),
(2104, 330200, 21, 2, 3, 'ningbo', '宁波', '市', 29.88525900, 121.57900600),
(2105, 330600, 21, 2, 3, 'shaoxing', '绍兴', '市', 30.00236500, 120.59246700),
(2106, 331000, 21, 2, 3, 'taizhou', '台州', '市', 28.66828300, 121.44061300),
(2107, 330300, 21, 2, 3, 'wenzhou', '温州', '市', 28.00283800, 120.69063500),
(2108, 331100, 21, 2, 3, 'lishui', '丽水', '市', 28.45630000, 119.92957600),
(2109, 330700, 21, 2, 3, 'jinhua', '金华', '市', 29.10289900, 119.65257600),
(2110, 330800, 21, 2, 3, 'quzhou1', '衢州', '市', 28.95691000, 118.87584200),
(2111, 330900, 21, 2, 3, 'zhoushan', '舟山', '市', 30.03601000, 122.16987200),
(2201, 340100, 22, 2, 2, 'hefei', '合肥', '市', 31.86694200, 117.28269900),
(2202, 340300, 22, 2, 3, 'bengbu', '蚌埠', '市', 32.92949900, 117.35708000),
(2203, 340200, 22, 2, 3, 'wuhu', '芜湖', '市', 31.36602000, 118.38410800),
(2204, 340400, 22, 2, 3, 'huainan', '淮南', '市', 32.64281200, 117.01863900),
(2205, 340500, 22, 2, 3, 'maanshan', '马鞍山', '市', 31.68852800, 118.51588200),
(2206, 340800, 22, 2, 3, 'anqing', '安庆', '市', 30.53789800, 117.05873900),
(2207, 341300, 22, 2, 3, 'suzhou1', '宿州', '市', 33.63677200, 116.98869200),
(2208, 341200, 22, 2, 3, 'fuyang1', '阜阳', '市', 32.90121100, 115.82093200),
(2209, 341600, 22, 2, 3, 'bozhou2', '亳州', '市', 33.87121100, 115.78792800),
(2210, 341000, 22, 2, 3, 'huangshan', '黄山', '市', 30.27774600, 118.07754600),
(2211, 341100, 22, 2, 3, 'chuzhou1', '滁州', '市', 32.31735100, 118.32457000),
(2212, 340600, 22, 2, 3, 'huaibei', '淮北', '市', 33.96002300, 116.79144700),
(2213, 340700, 22, 2, 3, 'tongling', '铜陵', '市', 30.94093000, 117.81942900),
(2214, 341800, 22, 2, 3, 'xuancheng', '宣城', '市', 30.95164200, 118.75209600),
(2215, 341500, 22, 2, 3, 'luan', '六安', '市', 31.75555800, 116.50525300),
(2216, 340100, 22, 2, 4, 'chaohu', '巢湖', '市', 31.60873300, 117.88049000),
(2217, 341700, 22, 2, 3, 'chizhou', '池州', '市', 30.66001900, 117.49447700),
(2301, 350100, 23, 2, 2, 'fuzhou', '福州', '市', 26.04712500, 119.33022100),
(2302, 350200, 23, 2, 3, 'xiamen', '厦门', '市', 24.48923100, 118.10388600),
(2303, 350900, 23, 2, 3, 'ningde', '宁德', '市', 26.65652700, 119.54208200),
(2304, 350300, 23, 2, 3, 'putian', '莆田', '市', 25.44845000, 119.07773100),
(2305, 350500, 23, 2, 3, 'quanzhou', '泉州', '市', 24.90165200, 118.60036200),
(2306, 350600, 23, 2, 3, 'zhangzhou', '漳州', '市', 24.51706500, 117.67620500),
(2307, 350800, 23, 2, 3, 'longyan', '龙岩', '市', 25.07868500, 117.01799700),
(2308, 350400, 23, 2, 3, 'sanming', '三明', '市', 26.27083500, 117.64219400),
(2309, 350700, 23, 2, 3, 'nanping', '南平', '市', 26.64362600, 118.18188300),
(2310, 350000, 23, 2, 4, 'diaoyudao', '钓鱼岛', '岛', 25.44600000, 123.28400000),
(2401, 360100, 24, 2, 2, 'nanchang', '南昌', '市', 28.68957800, 115.89352800),
(2402, 360400, 24, 2, 3, 'jiujiang', '九江', '市', 29.71964000, 115.99984800),
(2403, 361100, 24, 2, 3, 'shangrao', '上饶', '市', 28.45762300, 117.95546400),
(2404, 361000, 24, 2, 3, 'fuzhou1', '抚州', '市', 27.95454500, 116.36091900),
(2405, 360900, 24, 2, 3, 'yichun1', '宜春', '市', 27.81113000, 114.40003900),
(2406, 360800, 24, 2, 3, 'jian1', '吉安', '市', 27.11384800, 114.99203900),
(2407, 360700, 24, 2, 3, 'ganzhou', '赣州', '市', 25.84529600, 114.93590900),
(2408, 360200, 24, 2, 3, 'jingdezhen', '景德镇', '市', 29.30356300, 117.18652300),
(2409, 360300, 24, 2, 3, 'pingxiang1', '萍乡', '市', 27.63954400, 113.85991700),
(2410, 360500, 24, 2, 3, 'xinyu', '新余', '市', 27.82232200, 114.94711700),
(2411, 360600, 24, 2, 3, 'yingtan', '鹰潭', '市', 28.24131000, 117.03545000),
(2501, 430100, 25, 2, 2, 'changsha', '长沙', '市', 28.21347800, 112.97935300),
(2502, 430300, 25, 2, 3, 'xiangtan', '湘潭', '市', 27.83509500, 112.93555600),
(2503, 430200, 25, 2, 3, 'zhuzhou', '株洲', '市', 27.82743300, 113.13169500),
(2504, 430400, 25, 2, 3, 'hengyang', '衡阳', '市', 26.89816400, 112.58381900),
(2505, 431000, 25, 2, 3, 'chenzhou', '郴州', '市', 25.78226400, 113.03770400),
(2506, 430700, 25, 2, 3, 'changde', '常德', '市', 29.01214900, 111.65371800),
(2507, 430900, 25, 2, 3, 'yiyang1', '益阳', '市', 28.58808800, 112.36654700),
(2508, 431300, 25, 2, 3, 'loudi', '娄底', '市', 27.74107300, 111.99639600),
(2509, 430500, 25, 2, 3, 'shaoyang', '邵阳', '市', 27.23681100, 111.46152500),
(2510, 430600, 25, 2, 3, 'yueyang', '岳阳', '市', 29.37800700, 113.14619600),
(2511, 430800, 25, 2, 3, 'zhangjiajie', '张家界', '市', 29.12488900, 110.48162000),
(2512, 431200, 25, 2, 3, 'huaihua', '怀化', '市', 27.55748300, 109.98695900),
(2514, 431100, 25, 2, 3, 'yongzhou', '永州', '市', 26.43597200, 111.61464800),
(2515, 433100, 25, 2, 3, 'xiangxi', '湘西', '自治州', 28.31795100, 109.74574600),
(2601, 520100, 26, 2, 2, 'guiyang1', '贵阳', '市', 26.62990700, 106.70917700),
(2602, 520300, 26, 2, 3, 'zunyi', '遵义', '市', 27.69996100, 106.93126000),
(2603, 520400, 26, 2, 3, 'anshun', '安顺', '市', 26.22859500, 105.92827000),
(2604, 522700, 26, 2, 3, 'qiannan', '黔南州', '自治州', 26.26058800, 107.52865800),
(2605, 522600, 26, 2, 3, 'qiandongnan', '黔东南', '自治州', 26.58993100, 107.98933600),
(2606, 520600, 26, 2, 3, 'tongren', '铜仁', '市', 27.67490300, 109.16855800),
(2607, 520500, 26, 2, 3, 'bijie', '毕节', '市', 27.40856200, 105.33332300),
(2608, 520200, 26, 2, 3, 'liupanshui', '六盘水', '市', 26.59186600, 104.85208700),
(2609, 522300, 26, 2, 3, 'qianxinan', '黔西南', '自治州', 25.09597400, 104.91085800),
(2701, 510100, 27, 2, 2, 'chengdu', '成都', '市', 30.67994300, 104.06792300),
(2702, 510400, 27, 2, 3, 'panzhihua', '攀枝花', '市', 26.58757100, 101.72242300),
(2703, 510300, 27, 2, 3, 'zigong', '自贡', '市', 29.35915700, 104.77607100),
(2704, 510700, 27, 2, 3, 'mianyang', '绵阳', '市', 31.50470100, 104.70551900),
(2705, 511300, 27, 2, 3, 'nanchong', '南充', '市', 30.80096500, 106.10555400),
(2706, 511700, 27, 2, 3, 'dazhou', '达州', '市', 31.21419900, 107.49497300),
(2707, 510900, 27, 2, 3, 'suining1', '遂宁', '市', 30.55749100, 105.56488800),
(2708, 511600, 27, 2, 3, 'guangan', '广安', '市', 30.46196800, 106.63975200),
(2709, 511900, 27, 2, 3, 'bazhong', '巴中', '市', 31.86918900, 106.75791600),
(2710, 510500, 27, 2, 3, 'luzhou', '泸州', '市', 28.89593000, 105.44397000),
(2711, 511500, 27, 2, 3, 'yibin', '宜宾', '市', 28.76967500, 104.63301900),
(2712, 511000, 27, 2, 3, 'neijiang', '内江', '市', 29.59946200, 105.07305600),
(2713, 512000, 27, 2, 3, 'ziyang1', '资阳', '市', 30.12383200, 104.65862500),
(2714, 511100, 27, 2, 3, 'leshan', '乐山', '市', 29.60095800, 103.76082400),
(2715, 511400, 27, 2, 3, 'meishan', '眉山', '市', 30.06111500, 103.84143000),
(2716, 513400, 27, 2, 3, 'liangshan1', '凉山', '自治州', 27.89239300, 102.25959100),
(2717, 511800, 27, 2, 3, 'yaan', '雅安', '市', 29.99971600, 103.00935600),
(2718, 513300, 27, 2, 3, 'ganzi', '甘孜州', '自治州', 30.05514400, 101.96923200),
(2719, 513200, 27, 2, 3, 'aba', '阿坝州', '自治州', 31.90576300, 102.22856500),
(2720, 510600, 27, 2, 3, 'deyang', '德阳', '市', 31.13114000, 104.40239800),
(2721, 510800, 27, 2, 3, 'guangyuan', '广元', '市', 32.44104000, 105.81968700),
(2801, 440100, 28, 2, 2, 'guangzhou', '广州', '市', 23.12004900, 113.30765000),
(2802, 440200, 28, 2, 3, 'shaoguan', '韶关', '市', 24.80296000, 113.59446100),
(2803, 441300, 28, 2, 3, 'huizhou', '惠州', '市', 23.11354000, 114.41065800),
(2804, 441400, 28, 2, 3, 'meizhou', '梅州', '市', 24.30457100, 116.12640300),
(2805, 440500, 28, 2, 3, 'shantou', '汕头', '市', 23.38390800, 116.72865000),
(2806, 440300, 28, 2, 3, 'shenzhen', '深圳', '市', 22.54605400, 114.02597400),
(2807, 440400, 28, 2, 3, 'zhuhai', '珠海', '市', 22.25691500, 113.56244700),
(2808, 440600, 28, 2, 3, 'foshan', '佛山', '市', 23.03509500, 113.13402600),
(2809, 441200, 28, 2, 3, 'zhaoqing', '肇庆', '市', 23.07866300, 112.47965300),
(2810, 440800, 28, 2, 3, 'zhanjiang', '湛江', '市', 21.25746300, 110.36506700),
(2811, 440700, 28, 2, 3, 'jiangmen', '江门', '市', 22.57511700, 113.07812500),
(2812, 441600, 28, 2, 3, 'heyuan', '河源', '市', 23.75725100, 114.71372100),
(2813, 441800, 28, 2, 3, 'qingyuan3', '清远', '市', 23.69846900, 113.04077300),
(2814, 445300, 28, 2, 3, 'yunfu', '云浮', '市', 22.93797600, 112.05094600),
(2815, 445100, 28, 2, 3, 'chaozhou', '潮州', '市', 23.66181200, 116.63007600),
(2816, 441900, 28, 2, 3, 'dongguan', '东莞', '市', 23.04302400, 113.76343400),
(2817, 442000, 28, 2, 3, 'zhongshan', '中山', '市', 38.90043600, 121.67796600),
(2818, 441700, 28, 2, 3, 'yangjiang', '阳江', '市', 21.87151700, 111.97701000),
(2819, 445200, 28, 2, 3, 'jieyang', '揭阳', '市', 23.54799900, 116.37950100),
(2820, 440900, 28, 2, 3, 'maoming', '茂名', '市', 21.66822600, 110.93124500),
(2821, 441500, 28, 2, 3, 'shanwei', '汕尾', '市', 22.77873100, 115.37292400),
(2901, 530100, 29, 2, 2, 'kunming', '昆明', '市', 25.04915300, 102.71460100),
(2902, 532900, 29, 2, 3, 'dali1', '大理州', '自治州', 25.69396700, 100.21920900),
(2903, 532500, 29, 2, 3, 'honghe', '红河州', '自治州', 23.36771800, 103.38406500),
(2904, 530300, 29, 2, 3, 'qujing', '曲靖', '市', 25.52075800, 103.78253900),
(2905, 530500, 29, 2, 3, 'baoshan1', '保山', '市', 25.12048900, 99.17799600),
(2906, 532600, 29, 2, 3, 'wenshan', '文山州', '自治州', 23.41601000, 104.03094000),
(2907, 530400, 29, 2, 3, 'yuxi', '玉溪', '市', 24.37044700, 102.54506800),
(2908, 532300, 29, 2, 3, 'chuxiong', '楚雄州', '自治州', 24.88025200, 101.32863800),
(2909, 530800, 29, 2, 3, 'puer', '普洱', '市', 22.78877800, 100.98005800),
(2910, 530600, 29, 2, 3, 'zhaotong', '昭通', '市', 27.34063300, 103.72502100),
(2911, 530900, 29, 2, 3, 'lincang', '临沧', '市', 23.88780600, 100.09261300),
(2912, 533300, 29, 2, 3, 'nujiang', '怒江州', '自治州', 25.86067700, 98.85993200),
(2913, 533400, 29, 2, 3, 'diqing', '迪庆', '自治州', 27.83102900, 99.71368200),
(2914, 530700, 29, 2, 3, 'lijiang', '丽江', '市', 26.87535100, 100.22962800),
(2915, 533100, 29, 2, 3, 'dehong', '德宏', '自治州', 24.44124000, 98.58943400),
(2916, 532800, 29, 2, 3, 'xishuangbanna', '西双版纳', '自治州', 22.00943300, 100.80303800),
(3001, 450100, 30, 2, 2, 'nanning', '南宁', '市', 22.80649300, 108.29723400),
(3002, 451400, 30, 2, 3, 'chongzuo', '崇左', '市', 22.41545500, 107.35732200),
(3003, 450200, 30, 2, 3, 'liuzhou', '柳州', '市', 24.32905300, 109.42240200),
(3004, 451300, 30, 2, 3, 'laibin', '来宾', '市', 23.74116600, 109.23181700),
(3005, 450300, 30, 2, 3, 'guilin', '桂林', '市', 25.26290100, 110.26092000),
(3006, 450400, 30, 2, 3, 'wuzhou', '梧州', '市', 23.48539500, 111.30547200),
(3007, 451100, 30, 2, 3, 'hezhou', '贺州', '市', 24.41105400, 111.55259400),
(3008, 450800, 30, 2, 3, 'guigang', '贵港', '市', 23.10337300, 109.61370800),
(3009, 450900, 30, 2, 3, 'yulin1', '玉林', '市', 22.64397400, 110.15167600),
(3010, 451000, 30, 2, 3, 'baise', '百色', '市', 23.90151200, 106.63182100),
(3011, 450700, 30, 2, 3, 'qinzhou', '钦州', '市', 21.97335000, 108.63879800),
(3012, 451200, 30, 2, 3, 'hechi', '河池', '市', 24.69952100, 108.06994800),
(3013, 450500, 30, 2, 3, 'beihai', '北海', '市', 21.47271800, 109.12262800),
(3014, 450600, 30, 2, 3, 'fangchenggang', '防城港', '市', 21.61739800, 108.35179100),
(3101, 460100, 31, 2, 2, 'haikou', '海口', '市', 20.02207100, 110.33080200),
(3102, 460200, 31, 2, 3, 'sanya', '三亚', '市', 18.25777600, 109.52277100),
(3103, 469007, 31, 2, 3, 'dongfangshi', '东方', '市', 18.99816100, 108.85101000),
(3104, 469024, 31, 2, 4, 'lingao', '临高', '县', 19.80592200, 109.72410200),
(3105, 469023, 31, 2, 4, 'chengmai', '澄迈', '县', 19.69313500, 109.99673600),
(3106, 460400, 31, 2, 3, 'danzhou', '儋州', '市', 19.57115300, 109.41397300),
(3107, 469026, 31, 2, 4, 'changjiang', '昌江', '自治县', 29.27215500, 117.18620000),
(3108, 469025, 31, 2, 4, 'baisha', '白沙', '自治县', 19.21605600, 109.35858600),
(3109, 469000, 31, 2, 4, 'qiongzhong', '琼中', '自治县 ', 19.03977100, 109.86184900),
(3110, 469021, 31, 2, 4, 'dingan', '定安', '县', 19.49099100, 110.32009000),
(3111, 469022, 31, 2, 4, 'tunchang', '屯昌', '县', 19.34774900, 110.06336400),
(3112, 469002, 31, 2, 4, 'qionghai', '琼海', '市', 19.21483000, 110.41435900),
(3113, 469005, 31, 2, 4, 'wenchangshi', '文昌', '市', 19.75094700, 110.78090900),
(3114, 469029, 31, 2, 4, 'baoting', '保亭', '自治县 ', 18.59759200, 109.65611300),
(3115, 469006, 31, 2, 4, 'wanningshi', '万宁', '市', 18.83988600, 110.29250500),
(3116, 469000, 31, 2, 4, 'lingshui', '陵水', '自治县 ', 18.57598500, 109.94866100),
(3117, 469000, 31, 2, 4, 'xisha', '西沙', '', 39.29620900, 106.92539700),
(3118, 469000, 31, 2, 4, 'nanshadao', '南沙岛', '', 22.72989400, 113.58022400),
(3119, 469027, 31, 2, 4, 'ledong', '乐东', '自治县 ', 18.65861400, 109.06269800),
(3120, 469001, 31, 2, 4, 'wuzhishanshi', '五指山', '市', 18.83130600, 109.51775000),
(3121, 460300, 31, 2, 3, 'sansha', '三沙', '市', 16.49292500, 111.69665900),
(3201, 810000, 32, 2, 0, 'hongkong', '香港', '岛', 22.29358600, 114.18612400),
(3202, 810101, 32, 2, 5, 'zhongxi', '中西', '区', 22.28544500, 114.14878900),
(3203, 810102, 32, 2, 5, 'wanzai', '湾仔', '区', 22.27369500, 114.19476600),
(3204, 810103, 32, 2, 5, 'dongqu', '东区', '区', 22.29358600, 114.18612400),
(3205, 810104, 32, 2, 5, 'nanqu', '南区', '区', 22.23125700, 114.21879600),
(3206, 810201, 32, 2, 5, 'youjianwang', '油尖旺', '区', 22.30918200, 114.17681700),
(3207, 810202, 32, 2, 5, 'shenshuibu', '深水埗', '区', 22.33356200, 114.16476400),
(3208, 810203, 32, 2, 5, 'jiulong', '九龙', '区', 22.32009800, 114.20301800),
(3209, 810204, 32, 2, 5, 'huangdaxian', '黄大仙', '区', 22.34698100, 114.21427500),
(3210, 810205, 32, 2, 5, 'guantangqu', '观塘', '区', 22.31625300, 114.23678100),
(3211, 810304, 32, 2, 5, 'beiqu', '北区', '区', 22.52280300, 114.21879600),
(3212, 810305, 32, 2, 5, 'dapu', '大埔', '区', 22.48176500, 114.31628000),
(3213, 810307, 32, 2, 5, 'shatian', '沙田', '区', 22.39425800, 114.21321900),
(3214, 810306, 32, 2, 5, 'xigong', '西贡', '区', 22.30523200, 114.39445700),
(3215, 810301, 32, 2, 5, 'quanwan', '荃湾', '区', 22.36457500, 114.08303400),
(3216, 810302, 32, 2, 5, 'tunmen', '屯门', '区', 22.37857600, 113.96177700),
(3217, 810303, 32, 2, 5, 'yuanlang', '元朗', '区', 22.45393200, 114.03339100),
(3218, 810308, 32, 2, 5, 'caiqing', '葵青', '区', 22.33942000, 114.12097500),
(3219, 810309, 32, 2, 5, 'lidao', '离岛', '区', 22.22476700, 114.03079200),
(3301, 820100, 33, 2, 0, 'aomen', '澳门', '', 22.19292300, 113.54965600),
(3302, 820103, 33, 3, 5, 'datang', '大堂', '区', 22.18438000, 113.55818800),
(3303, 820101, 33, 3, 5, 'huadima', '花地玛', '区', 22.21020500, 113.55945200),
(3304, 820102, 33, 3, 5, 'shenganduoni', '圣安多尼', '区', 22.20200000, 113.54400000),
(3305, 820104, 33, 2, 5, 'wangde', '望德', '区', 22.20241300, 113.56054600),
(3306, 820105, 33, 2, 5, 'fengshun', '风顺', '区', 22.19149700, 113.54554100),
(3307, 820201, 33, 2, 5, 'jiamo', '嘉模', '区', 22.15530700, 113.57873400),
(3308, 820301, 33, 2, 5, 'shnegfangjige', '圣方济各', '区', 22.12705800, 113.58224400),
(3309, 820401, 33, 2, 5, 'ludangcheng', '路氹城', '区', 22.14589600, 113.57406900),
(3310, 820402, 33, 2, 5, 'aomenxinchneg', '澳门新城', '区', 34.27147400, 108.99153900),
(3401, 710100, 34, 2, 2, 'taibei', '台北', '市', 25.06303000, 121.52010900),
(3402, 710200, 34, 2, 3, 'gaoxiong', '高雄', '市', 32.03623700, 80.45048600),
(3404, 710300, 34, 2, 3, 'taizhong', '台中', '市', 26.09119400, 119.33763300),
(3405, 710500, 34, 2, 0, 'taiwan', '台湾', '', 24.08695700, 121.97387100),
(3406, 710400, 34, 2, 3, 'xinbei', '新北', '市', 31.93994600, 119.90315400),
(3407, 710600, 34, 2, 3, 'tainan', '台南', '市', 22.98000000, 120.19000000),
(3408, 710700, 34, 2, 4, 'jiayi', '嘉义', '市', 23.48000000, 120.46569940),
(3409, 710800, 34, 2, 3, 'taoyuan', '桃园', '市', 25.02226000, 121.21147500),
(3410, 710900, 34, 2, 4, 'jilong', '基隆', '市', 25.12210500, 121.74152600),
(3411, 710900, 34, 2, 4, 'xinzhu', '新竹', '市', 24.78492400, 120.99074500),
(3413, 710900, 34, 2, 4, 'miaoli', '苗栗', '县', 24.69676200, 120.88433700),
(3414, 710900, 34, 2, 4, 'zhanghua', '彰化', '县', 24.06852300, 120.55747900),
(3415, 710900, 34, 2, 4, 'nantou', '南投', '县', 23.91961900, 120.67000800),
(3416, 710900, 34, 2, 4, 'yunlin', '云林', '县', 23.66494300, 120.48073800),
(3418, 710900, 34, 2, 4, 'pingdong', '屏东', '县', 22.66671600, 120.49200500),
(3419, 710900, 34, 2, 4, 'yilan', '宜兰', '县', 24.75970700, 121.75444200),
(3420, 710900, 34, 2, 4, 'hualian', '花莲', '县', 24.00067400, 121.59729000),
(3421, 710900, 34, 2, 4, 'taidong', '台东', '县', 22.76436400, 121.11320700),
(3422, 710900, 34, 2, 4, 'penghu', '澎湖', '县', 23.55235100, 119.58457000),
(3423, 710900, 34, 2, 4, 'jinmen', '金门', '县', 24.43053000, 118.31167000),
(3424, 710900, 34, 2, 4, 'lianjiang', '连江', '县', 26.20576000, 119.53275000),
(101010100, 110100, 101, 3, 1, 'beijing', '北京', '市', 39.90245100, 116.42730100),
(101010200, 110108, 101, 3, 5, 'haidian', '海淀', '区', 39.95991200, 116.29805600),
(101010300, 220104, 101, 3, 5, 'chaoyang', '朝阳', '区', 39.92147000, 116.44310800),
(101010400, 110113, 101, 3, 5, 'shunyi', '顺义', '区', 40.12583200, 116.64508400),
(101010500, 110116, 101, 3, 5, 'huairou', '怀柔', '区', 40.32176600, 116.65265000),
(101010600, 320612, 101, 3, 5, 'tongzhou', '通州', '区', 39.90996500, 116.65643700),
(101010700, 110114, 101, 3, 5, 'changping', '昌平', '区', 40.22066000, 116.23120400),
(101010800, 110119, 101, 3, 4, 'yanqing', '延庆', '县', 40.43650300, 115.98467200),
(101010900, 110106, 101, 3, 5, 'fengtai', '丰台', '区', 39.85842700, 116.28714900),
(101011000, 110107, 101, 3, 5, 'shijingshan', '石景山', '区', 39.90661100, 116.22298200),
(101011100, 110115, 101, 3, 5, 'daxing', '大兴', '区', 39.72692900, 116.34139500),
(101011200, 110111, 101, 3, 5, 'fangshan', '房山', '区', 39.74914400, 116.14326700),
(101011300, 110118, 101, 3, 4, 'miyun', '密云', '区', 40.39713800, 116.86252200),
(101011400, 110109, 101, 3, 5, 'mentougou', '门头沟', '区', 39.94064600, 116.10200900),
(101011500, 110117, 101, 3, 5, 'pinggu', '平谷', '区', 40.14070100, 117.12138300),
(101011501, 110101, 101, 3, 5, 'dongchengqu', '东城', '区', 39.93857400, 116.42188500),
(101011502, 110102, 101, 3, 5, 'xichengqu', '西城', '区', 39.93428000, 116.37319000),
(101020100, 310100, 201, 3, 1, 'shanghai', '上海', '市', 31.25003300, 121.45571100),
(101020104, 310104, 201, 3, 5, 'xuhui', '徐汇', '区', 31.19627900, 121.44378400),
(101020106, 310106, 201, 3, 5, 'jinganqu', '静安', '区', 31.23433000, 121.45211300),
(101020110, 310110, 201, 3, 5, 'yangpuqu', '杨浦', '区', 31.26581900, 121.53188200),
(101020200, 310112, 201, 3, 5, 'minhang', '闵行', '区', 31.11281300, 121.38170900),
(101020300, 310113, 201, 3, 5, 'baoshan', '宝山', '区', 31.40545700, 121.48961200),
(101020500, 310114, 201, 3, 5, 'jiading', '嘉定', '区', 31.37560200, 121.26530000),
(101020600, 310100, 201, 3, 5, 'nanhui', '南汇', '区', 31.22981300, 121.45699600),
(101020700, 310116, 201, 3, 5, 'jinshan', '金山', '区', 30.74199100, 121.34197000),
(101020800, 310118, 201, 3, 5, 'qingpu', '青浦', '区', 31.15068100, 121.12417800),
(101020900, 310117, 201, 3, 5, 'songjiang', '松江', '区', 30.99960500, 121.22789700),
(101021000, 310120, 201, 3, 5, 'fengxian', '奉贤', '区', 30.91779500, 121.47404200),
(101021100, 310151, 201, 3, 5, 'chongming', '崇明', '区', 31.62358700, 121.39741700),
(101021200, 310104, 201, 3, 5, 'xujiahui', '徐家汇', '区', 31.19433900, 121.43621200),
(101021300, 310115, 201, 3, 5, 'pudong', '浦东', '区', 31.22151700, 121.54437900),
(101021302, 310105, 201, 3, 5, 'changningqu', '长宁', '区', 31.21330100, 121.38761600),
(101021303, 310109, 201, 3, 5, 'hongkou1', '虹口', '区', 31.28249700, 121.49191900),
(101021304, 310101, 201, 3, 5, 'huangpu1', '黄浦', '区', 31.22720300, 121.49607200),
(101030100, 120100, 301, 3, 1, 'tianjin', '天津', '市', 39.13625300, 117.20947900),
(101030200, 120114, 301, 3, 5, 'wuqing', '武清', '区', 39.37180200, 117.01598500),
(101030300, 120115, 301, 3, 5, 'baodi', '宝坻', '区', 39.71500400, 117.33562100),
(101030400, 120110, 301, 3, 5, 'dongli', '东丽', '区', 39.08656900, 117.31432400),
(101030500, 120111, 301, 3, 5, 'xiqing', '西青', '区', 39.14114500, 117.00887400),
(101030600, 120113, 301, 3, 5, 'beichen', '北辰', '区', 39.22148400, 117.13244000),
(101030700, 120117, 301, 3, 4, 'ninghe', '宁河', '区', 39.33061300, 117.82489800),
(101030800, 120120, 301, 3, 5, 'hangu', '汉沽', '区', 39.27284900, 117.80613100),
(101030900, 120118, 301, 3, 4, 'jinghai', '静海', '县', 38.93261200, 116.93053600),
(101031000, 120112, 301, 3, 5, 'jinnan', '津南', '区', 38.93792900, 117.35726000),
(101031100, 120121, 301, 3, 5, 'tanggu', '塘沽', '区', 39.02755300, 117.64171200),
(101031200, 120122, 301, 3, 5, 'dagang', '大港', '区', 38.86352200, 117.37343300),
(101031400, 120119, 301, 3, 4, 'tianjinjizhou', '蓟州', '区', 40.02702000, 117.39732200),
(101031401, 120106, 301, 3, 5, 'hongqiaoqu', '红桥', '区', 39.17062100, 117.16221700),
(101031402, 120103, 301, 3, 5, 'hexiqu', '河西', '区', 39.08449400, 117.23616500),
(101031403, 120102, 301, 3, 5, 'hedongqu', '河东', '区', 39.13502400, 117.25867500),
(101031404, 120105, 301, 3, 5, 'hebeiqu', '河北', '区', 39.15362100, 117.20333400),
(101031405, 120101, 301, 3, 5, 'hepingqu', '和平', '区', 39.12480900, 117.20281400),
(101031406, 120104, 301, 3, 5, 'nankaiqu', '南开', '区', 39.11698700, 117.16272800),
(101031500, 120116, 301, 3, 5, 'binhaixinqu', '滨海', '区', 39.01125000, 117.69241000),
(101040100, 500101, 401, 3, 1, 'chongqing', '重庆', '市', 29.54974700, 106.54766900),
(101040102, 500105, 401, 3, 5, 'jiangbei', '江北', '区', 29.61331300, 106.57667900),
(101040103, 500103, 401, 3, 5, 'yuzhongqu', '渝中', '区', 29.56239500, 106.57004200),
(101040104, 500104, 401, 3, 5, 'dadukou', '大渡口', '区', 29.46849200, 106.46148800),
(101040106, 500106, 401, 3, 5, 'shapingba', '沙坪坝', '区', 29.55549400, 106.46091400),
(101040107, 500107, 401, 3, 5, 'jiulongpo', '九龙坡', '区', 29.50207000, 106.51140000),
(101040108, 500108, 401, 3, 5, 'nananqu', '南岸', '区', 29.52935100, 106.57187200),
(101040154, 500154, 401, 3, 4, 'kaizhou', '开州', '区', 31.16655500, 108.40028100),
(101040200, 500118, 401, 3, 4, 'yongchuan', '永川', '区', 29.34096800, 105.90049500),
(101040300, 500117, 401, 3, 4, 'hechuan', '合川', '区', 29.95949000, 106.27717500),
(101040400, 500119, 401, 3, 4, 'nanchuan', '南川', '区', 29.15789100, 107.09926600),
(101040500, 500116, 401, 3, 4, 'jiangjin', '江津', '区', 29.26133300, 106.24088300),
(101040600, 500200, 401, 3, 4, 'wansheng', '万盛', '区', 28.94927300, 106.92626700),
(101040700, 500112, 401, 3, 5, 'yubei', '渝北', '区', 29.71856000, 106.63070700),
(101040800, 500109, 401, 3, 5, 'beibei', '北碚', '区', 29.80226300, 106.43197800),
(101040900, 500113, 401, 3, 5, 'banan', '巴南', '区', 29.40240800, 106.54025700),
(101041000, 500115, 401, 3, 4, 'changshou', '长寿', '区', 29.78894900, 106.96605900),
(101041100, 500114, 401, 3, 4, 'qianjiang', '黔江', '区', 29.44291100, 108.79050100),
(101041300, 500101, 401, 3, 4, 'wanzhou', '万州', '区', 30.75421700, 108.39996300),
(101041400, 500102, 401, 3, 4, 'fuling', '涪陵', '区', 29.69995000, 107.33334300),
(101041500, 500200, 401, 3, 4, 'kaixian', '开县', '县', 31.16071100, 108.39313500),
(101041600, 500229, 401, 3, 4, 'chengkou', '城口', '县', 31.94763300, 108.66421400),
(101041700, 500235, 401, 3, 4, 'yunyang', '云阳', '县', 30.93061300, 108.69732400),
(101041800, 500238, 401, 3, 4, 'wuxi', '巫溪', '县', 31.39860400, 109.57006200),
(101041900, 500236, 401, 3, 4, 'fengjie', '奉节', '县', 31.01849800, 109.46398700),
(101042000, 500237, 401, 3, 4, 'wushan', '巫山', '县', 31.07483400, 109.87915300),
(101042100, 500152, 401, 3, 4, 'tongnan', '潼南', '区', 30.21998200, 105.87780500),
(101042200, 500231, 401, 3, 4, 'dianjiang', '垫江', '县', 30.32771700, 107.33339000),
(101042300, 500228, 401, 3, 4, 'liangping', '梁平', '县', 30.71558700, 107.81699400),
(101042400, 500233, 401, 3, 4, 'zhongxian', '忠县', '县', 30.29956000, 108.03900200),
(101042500, 500240, 401, 3, 4, 'shizhu', '石柱', '自治县', 29.99928500, 108.11406900),
(101042600, 500111, 401, 3, 4, 'dazu', '大足', '区', 29.42882600, 105.74097500),
(101042700, 500153, 401, 3, 4, 'rongchang', '荣昌', '区', 29.39439800, 105.58083300),
(101042800, 500151, 401, 3, 4, 'tongliang', '铜梁', '区', 29.84481100, 106.05640400),
(101042900, 500120, 401, 3, 4, 'bishan', '璧山', '区', 29.59202400, 106.22730500),
(101043000, 500230, 401, 3, 4, 'fengdu', '丰都', '县', 29.84805100, 107.68595700),
(101043100, 500232, 401, 3, 4, 'wulong', '武隆', '县', 29.32577500, 107.77608200),
(101043200, 500243, 401, 3, 4, 'pengshui', '彭水', '自治县', 29.36190300, 108.23993700),
(101043300, 500110, 401, 3, 4, 'qijiang', '綦江', '区', 29.01695400, 106.66433800),
(101043400, 500242, 401, 3, 4, 'youyang', '酉阳', '自治县', 28.80873600, 108.96170400),
(101043600, 500241, 401, 3, 4, 'xiushan', '秀山', '自治县', 28.44494300, 109.01636100),
(101050101, 230101, 501, 3, 3, 'haerbin', '哈尔滨', '市', 45.76501500, 126.63489000),
(101050102, 230113, 501, 3, 5, 'shuangcheng', '双城', '区', 45.38326300, 126.31274500),
(101050103, 230111, 501, 3, 5, 'hulan', '呼兰', '区', 45.99831700, 126.64698600),
(101050104, 230112, 501, 3, 5, 'acheng', '阿城', '区', 45.55144200, 126.99695400),
(101050105, 230125, 501, 3, 4, 'binxian', '宾县', '县', 45.74512200, 127.46688800),
(101050106, 230123, 501, 3, 4, 'yilan', '依兰', '县', 46.32453400, 129.56798500),
(101050107, 230126, 501, 3, 4, 'bayan', '巴彦', '县', 46.08537900, 127.40318200),
(101050108, 230128, 501, 3, 4, 'tonghe', '通河', '县', 45.97242500, 128.74935200),
(101050109, 230124, 501, 3, 4, 'fangzheng', '方正', '县', 45.85169500, 128.82953600),
(101050110, 230129, 501, 3, 4, 'yanshou', '延寿', '县', 45.45189700, 128.33164400),
(101050111, 230183, 501, 3, 4, 'shangzhi', '尚志', '市', 45.20836900, 127.96233900),
(101050112, 230184, 501, 3, 4, 'wuchang', '五常', '市', 44.92220700, 127.14286200),
(101050113, 230127, 501, 3, 4, 'mulan', '木兰', '县', 45.95058200, 128.04346600),
(101050114, 230104, 501, 3, 5, 'daowaiqu', '道外', '区', 45.79910600, 126.79557500),
(101050115, 230102, 501, 3, 5, 'daoliqu', '道里', '区', 45.68613900, 126.36841800),
(101050116, 230110, 501, 3, 5, 'xiangfangqu', '香坊', '区', 45.71044900, 126.79204400),
(101050117, 230109, 501, 3, 5, 'songbeiqu', '松北', '区', 45.94145800, 126.45227100),
(101050118, 230108, 501, 3, 5, 'pingfangqu', '平房', '区', 39.95637200, 116.52516700),
(101050119, 230103, 501, 3, 5, 'nangangqu', '南岗', '区', 45.66612300, 126.59025500),
(101050201, 230201, 502, 3, 3, 'qiqihaer', '齐齐哈尔', '市', 47.33926500, 123.99572300),
(101050202, 230281, 502, 3, 4, 'nehe', '讷河', '市', 48.48409900, 124.88424400),
(101050203, 230221, 502, 3, 4, 'longjiang', '龙江', '县', 47.32903100, 123.17882300),
(101050204, 230225, 502, 3, 4, 'gannan1', '甘南', '县', 47.92240600, 123.50742900),
(101050205, 230227, 502, 3, 4, 'fuyu', '富裕', '县', 47.79686100, 124.46046100),
(101050206, 230223, 502, 3, 4, 'yian', '依安', '县', 47.87432500, 125.28706200),
(101050207, 230231, 502, 3, 4, 'baiquan', '拜泉', '县', 47.59585100, 126.10021300),
(101050208, 230229, 502, 3, 4, 'keshan', '克山', '县', 48.01569800, 125.85101100),
(101050209, 230230, 502, 3, 4, 'kedong', '克东', '县', 48.16091200, 126.21179600),
(101050210, 230224, 502, 3, 4, 'tailai', '泰来', '县', 46.39265800, 123.41105200),
(101050211, 230203, 502, 3, 5, 'jianhuaqu', '建华', '区', 47.40486600, 124.02127900),
(101050212, 230206, 502, 3, 5, 'fularjiqu', '富拉尔基', '区', 47.22895200, 123.57199800),
(101050213, 230205, 502, 3, 5, 'angangxiqu', '昂昂溪', '区', 47.10404800, 123.97293500),
(101050214, 230204, 502, 3, 5, 'tiefengqu', '铁锋', '区', 47.30348900, 124.26293100),
(101050215, 230207, 502, 3, 5, 'nianzishanqu', '碾子山', '区', 47.58586900, 122.93233500),
(101050216, 230208, 502, 3, 5, 'meilisidawoerzuqu', '梅里斯达斡尔族', '区', 47.58308000, 124.00548700),
(101050222, 230202, 502, 3, 5, 'longshaqv', '龙沙', '区', 47.32478000, 123.96113900),
(101050301, 231001, 503, 3, 3, 'mudanjiang', '牡丹江', '市', 44.59100300, 129.61269300),
(101050302, 231083, 503, 3, 4, 'hailin', '海林', '区', 44.56700800, 129.38775900),
(101050303, 231085, 503, 3, 4, 'muling', '穆棱', '市', 44.52744900, 130.26137200),
(101050304, 231025, 503, 3, 4, 'linkou', '林口', '县', 45.29556700, 130.27417000),
(101050305, 231081, 503, 3, 4, 'suifenhe', '绥芬河', '市', 44.39281900, 131.15635700),
(101050306, 231084, 503, 3, 4, 'ningan', '宁安', '市', 44.36023200, 129.46232200),
(101050307, 231086, 503, 3, 4, 'dongning', '东宁', '县', 44.06267200, 131.12580600),
(101050308, 231003, 503, 3, 5, 'yangmingqu', '阳明', '区', 44.58797500, 129.78391500),
(101050309, 231004, 503, 3, 5, 'aiminqu', '爱民', '区', 44.68592100, 129.54456600),
(101050312, 231002, 503, 3, 5, 'donganqu', '东安', '区', 44.58739400, 129.63335100),
(101050401, 230801, 504, 3, 3, 'jiamusi', '佳木斯', '市', 46.80397000, 130.38281900),
(101050402, 230828, 504, 3, 4, 'tangyuan', '汤原', '县', 46.74689000, 129.92530700),
(101050403, 230883, 504, 3, 4, 'fuyuan', '抚远', '市', 48.36987900, 134.28901900),
(101050404, 230826, 504, 3, 4, 'huachuan', '桦川', '县', 47.02300100, 130.71908100),
(101050405, 230822, 504, 3, 4, 'huanan', '桦南', '县', 46.23771300, 130.58154000),
(101050406, 230881, 504, 3, 4, 'tongjiang', '同江', '市', 47.64270700, 132.51091900),
(101050407, 230882, 504, 3, 4, 'fujin', '富锦', '市', 47.23720700, 132.04694800),
(101050408, 230803, 504, 3, 5, 'xiangyangqu', '向阳', '区', 46.81364600, 130.37199800),
(101050409, 230804, 504, 3, 5, 'qianjinqu', '前进', '区', 30.32231900, 120.59396400),
(101050410, 230805, 504, 3, 5, 'dongfengqu', '东风', '区', 23.08913500, 113.32655800),
(101050501, 231201, 505, 3, 3, 'suihua', '绥化', '市', 46.64535400, 127.01592000),
(101050502, 231282, 505, 3, 4, 'zhaodong', '肇东', '市', 46.07759100, 125.99881700),
(101050503, 231281, 505, 3, 4, 'anda', '安达', '市', 46.40213700, 125.32243500),
(101050504, 231283, 505, 3, 4, 'hailun', '海伦', '市', 47.46754800, 126.99486300),
(101050505, 231225, 505, 3, 4, 'mingshui', '明水', '县', 47.17342600, 125.90630100),
(101050506, 231221, 505, 3, 4, 'wangkui', '望奎', '县', 46.83271900, 126.48607600),
(101050507, 231222, 505, 3, 4, 'lanxi', '兰西', '县', 46.25244700, 126.28811300),
(101050508, 231223, 505, 3, 4, 'qinggang', '青冈', '县', 46.68967100, 126.11386000),
(101050509, 231224, 505, 3, 4, 'qingan', '庆安', '县', 46.88816200, 127.50322800),
(101050510, 231226, 505, 3, 4, 'suiling', '绥棱', '县', 47.24955900, 127.08210300),
(101050511, 231202, 505, 3, 5, 'beilinqu', '北林区', '区', 46.74753700, 126.95786300),
(101050601, 231101, 506, 3, 3, 'heihe', '黑河', '市', 50.23290600, 127.49988900),
(101050602, 231121, 506, 3, 4, 'nenjiang', '嫩江', '县', 49.18576600, 125.22119200),
(101050603, 231124, 506, 3, 4, 'sunwu', '孙吴', '县', 49.42685900, 127.32350800),
(101050604, 231123, 506, 3, 4, 'xunke', '逊克', '县', 49.56425200, 128.47875000),
(101050605, 231182, 506, 3, 4, 'wudalianchi', '五大连池', '市', 48.62936000, 126.61726000),
(101050606, 231181, 506, 3, 4, 'beian', '北安', '市', 48.23484000, 126.51229400),
(101050612, 231102, 506, 3, 5, 'aihui', '爱辉', '区', 50.25798900, 127.50740500),
(101050701, 232701, 507, 3, 3, 'daxinganling', '大兴安岭', '区', 50.42122800, 124.13272200),
(101050702, 232722, 507, 3, 4, 'tahe', '塔河', '县', 52.33394100, 124.69937600),
(101050703, 232723, 507, 3, 4, 'mohe', '漠河', '县', 52.98889300, 122.50792300),
(101050704, 232721, 507, 3, 4, 'huma', '呼玛', '县', 51.72563700, 126.66531900),
(101050706, 232711, 507, 3, 5, 'xinlin', '新林', '区', 51.68066500, 124.41280600),
(101050708, 232712, 507, 3, 5, 'jiagedaqi', '加格达奇', '区', 50.42003600, 124.12610000),
(101050801, 230701, 508, 3, 3, 'yichun', '伊春', '市', 47.72986500, 128.92688100),
(101050802, 230714, 508, 3, 5, 'wuyiling', '乌伊岭', '区', 48.59200900, 129.43373700),
(101050803, 230710, 508, 3, 5, 'wuying', '五营', '区', 48.11180900, 129.23793600),
(101050804, 230781, 508, 3, 4, 'tieli', '铁力', '市', 46.97424500, 128.05328600),
(101050805, 230722, 508, 3, 4, 'jiayin', '嘉荫', '县', 48.88896500, 130.40304300),
(101050806, 230703, 508, 3, 5, 'nanchaqu', '南岔', '区', 46.96415600, 129.53887400),
(101050807, 230704, 508, 3, 5, 'youhaoqu', '友好', '区', 48.12800200, 128.46596400),
(101050808, 230705, 508, 3, 5, 'xilinqu', '西林', '区', 47.50096200, 129.22725500),
(101050809, 230706, 508, 3, 5, 'cuiluanqu', '翠峦', '区', 47.58993400, 128.36541100),
(101050810, 230707, 508, 3, 5, 'xinqingqu', '新青', '区', 48.21612600, 129.78735700),
(101050811, 230708, 508, 3, 5, 'meixiqu', '美溪', '区', 47.76889200, 129.40940400),
(101050812, 230709, 508, 3, 5, 'jinshantunqu', '金山屯', '区', 47.49854400, 129.77190300),
(101050813, 230711, 508, 3, 5, 'wumahequ', '乌马河', '区', 47.54936800, 128.79469000),
(101050814, 230712, 508, 3, 5, 'tangwanghequ', '汤旺河', '区', 48.56326300, 129.53875400),
(101050815, 230713, 508, 3, 5, 'dailingqu', '带岭', '区', 47.09016200, 128.86147500),
(101050816, 230715, 508, 3, 5, 'hongxingqu', '红星', '区', 48.29802000, 129.25191900),
(101050817, 230716, 508, 3, 5, 'shangganlingqu', '上甘岭', '区', 48.03650900, 129.02239900),
(101050822, 230702, 508, 3, 5, 'yichunqu', '伊春', '区', 47.73422300, 128.91275100),
(101050901, 230601, 509, 3, 3, 'daqing', '大庆', '市', 46.59782600, 125.01241200),
(101050902, 230623, 509, 3, 4, 'lindian', '林甸', '县', 47.17171700, 124.86360300),
(101050903, 230621, 509, 3, 4, 'zhaozhou', '肇州', '县', 45.69906600, 125.26864300),
(101050904, 230622, 509, 3, 4, 'zhaoyuan', '肇源', '县', 45.51932000, 125.07822300),
(101050905, 230624, 509, 3, 4, 'duerbote', '杜尔伯特', '自治县', 46.86279100, 124.44261200),
(101050906, 230602, 509, 3, 5, 'saertuqu', '萨尔图', '区', 46.66331100, 125.04245200),
(101050907, 230603, 509, 3, 5, 'longfengqu', '龙凤', '区', 46.53556800, 125.14176700),
(101050908, 230604, 509, 3, 5, 'ranghuluqu', '让胡路', '区', 46.72916000, 124.83842700),
(101050909, 230605, 509, 3, 5, 'honggangqu', '红岗', '区', 46.42077900, 124.91428500),
(101050926, 230606, 509, 3, 5, 'daqingdatong', '大同', '区', 46.04694300, 124.82903400),
(101051002, 230901, 510, 3, 3, 'qitaihe', '七台河', '市', 45.81189900, 130.90237500),
(101051003, 230921, 510, 3, 4, 'boli', '勃利', '县', 45.75618500, 130.55877500),
(101051004, 230903, 510, 3, 5, 'taoshanqu', '桃山', '区', 45.77009300, 130.99250300),
(101051012, 230902, 510, 3, 5, 'xinxingqu', '新兴', '区', 45.82368600, 130.93790700),
(101051014, 230904, 510, 3, 5, 'qiezihequ', '茄子河', '区', 45.79232300, 131.07703700),
(101051101, 230301, 511, 3, 3, 'jixi', '鸡西', '市', 45.30380000, 130.97801000),
(101051102, 230381, 511, 3, 4, 'hulin', '虎林', '市', 45.76268600, 132.93721000);
INSERT INTO `cmf_plugin_modules_citys` (`id`, `code`, `pid`, `level`, `level3`, `pinyin`, `name`, `areaname`, `lat`, `lng`) VALUES
(101051103, 230382, 511, 3, 4, 'mishan', '密山', '市', 45.52977500, 131.84663600),
(101051104, 230321, 511, 3, 4, 'jidong', '鸡东', '县', 45.26041200, 131.12408000),
(101051105, 230302, 511, 3, 5, 'jiguanqu', '鸡冠', '区', 45.30761000, 130.95993700),
(101051106, 230303, 511, 3, 5, 'hengshanqu', '恒山', '区', 45.13857100, 130.91626700),
(101051107, 230304, 511, 3, 5, 'didaoqu', '滴道', '区', 45.35434200, 130.73483600),
(101051108, 230306, 511, 3, 5, 'chengzihequ', '城子河', '区', 45.37969000, 131.02770400),
(101051109, 230307, 511, 3, 5, 'mashanqu', '麻山', '区', 45.20582600, 130.56688700),
(101051110, 230305, 511, 3, 5, 'lishuqu', '梨树', '区', 45.09828200, 130.70233700),
(101051201, 230401, 512, 3, 3, 'hegang', '鹤岗', '市', 47.33493400, 130.28792000),
(101051202, 230422, 512, 3, 4, 'suibin', '绥滨', '县', 47.28911600, 131.85275900),
(101051203, 230421, 512, 3, 4, 'luobei', '萝北', '县', 47.57749500, 130.82862600),
(101051204, 230404, 512, 3, 5, 'hegangnansanqu', '南山', '区', 47.32100900, 130.29367900),
(101051205, 230402, 512, 3, 5, 'hegangxiangyang', '向阳', '区', 47.34869200, 130.30075000),
(101051206, 230406, 512, 3, 5, 'dongshanqu', '东山', '区', 47.34485700, 130.32265200),
(101051207, 230407, 512, 3, 5, 'xingshanqu', '兴山', '区', 47.39602300, 130.31632800),
(101051215, 230405, 512, 3, 5, 'xinganqu', '兴安', '区', 47.26043600, 130.24234400),
(101051223, 230403, 512, 3, 5, 'gongnongqu', '工农', '区', 47.33857900, 130.28984500),
(101051301, 230501, 513, 3, 3, 'shuangyashan', '双鸭山', '市', 46.64563400, 131.15109100),
(101051302, 230521, 513, 3, 4, 'jixian1', '集贤', '县', 46.72837700, 131.14048300),
(101051303, 230523, 513, 3, 4, 'baoqing', '宝清', '县', 46.32692500, 132.19724300),
(101051304, 230524, 513, 3, 4, 'raohe', '饶河', '县', 46.79816400, 134.01387200),
(101051305, 230522, 513, 3, 4, 'youyi', '友谊', '县', 46.76729900, 131.80806400),
(101051306, 230502, 513, 3, 5, 'jianshanqu', '尖山', '区', 46.65852500, 131.17851400),
(101051307, 230503, 513, 3, 5, 'lingdongqu', '岭东', '区', 46.45952200, 131.24602400),
(101051308, 230505, 513, 3, 5, 'sifangtaiqu', '四方台', '区', 46.66977500, 131.30870700),
(101060101, 220101, 601, 3, 3, 'changchun', '长春', '市', 43.91068600, 125.31972000),
(101060102, 220122, 601, 3, 4, 'nongan', '农安', '县', 44.43600300, 125.16107200),
(101060103, 220183, 601, 3, 4, 'dehui', '德惠', '市', 44.53374300, 125.71689300),
(101060104, 220113, 601, 3, 5, 'jiutai', '九台', '区', 44.14918300, 125.83770900),
(101060105, 220182, 601, 3, 4, 'yushu', '榆树', '市', 44.81659100, 126.53466100),
(101060106, 220112, 601, 3, 5, 'shuangyang', '双阳', '区', 43.52531100, 125.66466200),
(101060107, 220103, 601, 3, 5, 'kuanchengqu', '宽城', '区', 43.99825200, 125.34489900),
(101060108, 220105, 601, 3, 5, 'erdaoqu', '二道', '区', 43.87222300, 125.61148500),
(101060109, 220102, 601, 3, 5, 'nanguanqu', '南关', '区', 43.73219100, 125.41964900),
(101060110, 220106, 601, 3, 5, 'luyuanqu', '绿园', '区', 43.91216500, 125.19133100),
(101060111, 220104, 601, 3, 5, 'chaoyangqu', '朝阳', '区', 39.92643300, 116.44984900),
(101060201, 220201, 602, 3, 3, 'jilin', '吉林', '市', 43.86447500, 126.57715000),
(101060202, 220283, 602, 3, 4, 'shulan', '舒兰', '市', 44.40620400, 126.95511200),
(101060203, 220221, 602, 3, 4, 'yongji', '永吉', '县', 43.67184000, 126.49830400),
(101060204, 220281, 602, 3, 4, 'jiaohe', '蛟河', '市', 43.72655900, 127.35172300),
(101060205, 220284, 602, 3, 4, 'panshi', '磐石', '市', 42.92860100, 126.06796900),
(101060206, 220282, 602, 3, 4, 'huadian', '桦甸', '市', 42.97209700, 126.74631000),
(101060207, 220203, 602, 3, 5, 'longtan', '龙潭', '区', 44.10087400, 126.69508500),
(101060208, 220211, 602, 3, 5, 'fengmanqu', '丰满', '区', 43.65451500, 126.69820200),
(101060210, 220204, 602, 3, 5, 'chuanyingqu', '船营', '区', 43.88217200, 126.38908900),
(101060212, 220202, 602, 3, 5, 'changyiqu', '昌邑', '区', 44.02389800, 126.32651300),
(101060301, 222401, 603, 3, 4, 'yanji', '延吉', '市', 42.88637200, 129.49689800),
(101060302, 222403, 603, 3, 4, 'dunhua', '敦化', '市', 43.38095000, 128.24263300),
(101060303, 222426, 603, 3, 4, 'antu', '安图', '县', 43.11590400, 128.90924100),
(101060304, 222424, 603, 3, 4, 'wangqing', '汪清', '县', 43.33284300, 129.73949000),
(101060305, 222406, 603, 3, 4, 'helong', '和龙', '市', 42.55401700, 128.99541200),
(101060307, 222405, 603, 3, 4, 'longjing', '龙井', '市', 42.77974900, 129.43157800),
(101060308, 222404, 603, 3, 4, 'hunchun', '珲春', '市', 42.86282100, 130.36603600),
(101060309, 222402, 603, 3, 4, 'tumen', '图们', '市', 42.96383100, 129.84079600),
(101060401, 220301, 604, 3, 3, 'siping', '四平', '市', 43.90573200, 125.31348900),
(101060402, 220382, 604, 3, 4, 'shuangliao', '双辽', '市', 43.51830200, 123.50272400),
(101060403, 220322, 604, 3, 4, 'lishu', '梨树', '县', 43.30706000, 124.33539000),
(101060404, 220381, 604, 3, 4, 'gongzhuling', '公主岭', '市', 43.50967000, 124.81170500),
(101060405, 220323, 604, 3, 4, 'yitong', '伊通', '自治县', 43.34575400, 125.30539400),
(101060406, 220302, 604, 3, 5, 'tiexiqu', '铁西', '区', 43.15250100, 124.35215600),
(101060407, 220303, 604, 3, 5, 'tiedong', '铁东', '区', 43.16806300, 124.41594600),
(101060501, 220501, 605, 3, 3, 'tonghua', '通化', '市', 41.75374700, 125.97974300),
(101060502, 220581, 605, 3, 4, 'meihekou', '梅河口', '市', 42.53514000, 125.68406800),
(101060503, 220524, 605, 3, 4, 'liuhe', '柳河', '县', 42.28938800, 125.76491100),
(101060504, 220523, 605, 3, 4, 'huinan', '辉南', '县', 42.68499300, 126.04691200),
(101060505, 220582, 605, 3, 4, 'jian', '集安', '市', 41.12530700, 126.19403100),
(101060506, 220521, 605, 3, 4, 'tonghuaxian', '通化', '县', 41.67980800, 125.75925900),
(101060507, 220502, 605, 3, 5, 'dongchangqu', '东昌', '区', 41.67726200, 125.96012400),
(101060508, 220503, 605, 3, 5, 'erdaojiang', '二道江', '区', 41.77997200, 126.04921000),
(101060601, 220801, 606, 3, 3, 'baicheng', '白城', '市', 45.61250700, 122.85871000),
(101060602, 220881, 606, 3, 4, 'taonan', '洮南', '市', 45.33988800, 122.80949600),
(101060603, 220882, 606, 3, 4, 'daan', '大安', '市', 45.50699600, 124.29262600),
(101060604, 220821, 606, 3, 4, 'zhenlai', '镇赉', '县', 45.84743500, 123.19989000),
(101060605, 220822, 606, 3, 4, 'tongyu', '通榆', '县', 44.81291100, 123.08823900),
(101060606, 220802, 606, 3, 5, 'taobeiqu', '洮北', '区', 45.62330100, 122.78907400),
(101060701, 220401, 607, 3, 3, 'liaoyuan', '辽源', '市', 42.90493500, 125.12917300),
(101060702, 220421, 607, 3, 4, 'dongfeng', '东丰', '县', 42.65443300, 125.54619200),
(101060703, 220422, 607, 3, 4, 'dongliao', '东辽', '县', 42.92633100, 124.99152100),
(101060704, 231005, 607, 3, 5, 'xianqu', '西安', '区', 42.93336000, 125.15550300),
(101060705, 220402, 607, 3, 5, 'longshanqu', '龙山', '区', 42.90763100, 125.14343000),
(101060801, 220701, 608, 3, 3, 'songyuan', '松原', '县', 45.10883100, 124.81714100),
(101060802, 220723, 608, 3, 4, 'qianan', '乾安', '县', 45.09785400, 123.87078600),
(101060803, 220721, 608, 3, 4, 'qianguo', '前郭', '自治县', 45.12129300, 124.83672000),
(101060804, 220722, 608, 3, 4, 'changling', '长岭', '县', 44.27589500, 123.96748400),
(101060805, 220781, 608, 3, 4, 'fuyu1', '扶余', '市', 44.98765400, 126.02485500),
(101060806, 220702, 608, 3, 5, 'ningjiangqu', '宁江', '区', 45.29271000, 124.86757100),
(101060901, 220601, 609, 3, 3, 'baishan', '白山', '市', 41.94337100, 126.44753800),
(101060902, 220622, 609, 3, 4, 'jingyu', '靖宇', '县', 42.38876000, 126.81362500),
(101060903, 220681, 609, 3, 4, 'linjiang', '临江', '市', 41.81197900, 126.91808700),
(101060904, 220604, 609, 3, 4, 'donggang', '东岗', '镇', 42.14617400, 127.50118700),
(101060905, 220623, 609, 3, 4, 'changbai', '长白', '自治县', 41.42001800, 128.20078900),
(101060906, 220621, 609, 3, 4, 'fusong', '抚松', '县', 42.22120800, 127.44976400),
(101060907, 220605, 609, 3, 5, 'jiangyuan', '江源', '区', 42.04101000, 126.58254800),
(101060908, 220608, 609, 3, 5, 'baishanqu', '八道江', '区', 43.53136700, 125.65851700),
(101060909, 220602, 609, 3, 5, 'hunjiangqu', '浑江', '区', 41.79164200, 126.39664300),
(101070101, 210101, 701, 3, 3, 'shenyang', '沈阳', '市', 41.79834700, 123.39665000),
(101070103, 210115, 701, 3, 5, 'liaozhong', '辽中', '区', 41.55999500, 122.77109300),
(101070104, 210123, 701, 3, 4, 'kangping', '康平', '县', 42.74090300, 123.35568100),
(101070105, 210124, 701, 3, 4, 'faku', '法库', '县', 42.50397300, 123.40867900),
(101070106, 210181, 701, 3, 4, 'xinmin', '新民', '市', 42.00267000, 122.81752800),
(101070107, 210106, 701, 3, 5, 'shenyangtiexiqu', '沈阳铁西', '区', 41.80816300, 123.38387300),
(101070108, 210103, 701, 3, 5, 'shenhequ', '沈河', '区', 41.79830500, 123.45355200),
(101070109, 210104, 701, 3, 5, 'dadongqu', '大东', '区', 41.83527900, 123.49892700),
(101070110, 210105, 701, 3, 5, 'huangguqu', '皇姑', '区', 41.84891300, 123.41537600),
(101070111, 210111, 701, 3, 5, 'sujiatunqu', '苏家屯', '区', 41.58934500, 123.42628900),
(101070112, 210112, 701, 3, 5, 'hunnan', '浑南', '区', 41.72092000, 123.45598900),
(101070113, 210113, 701, 3, 5, 'shenbeixinqu', '沈北', '区', 42.04385000, 123.51869000),
(101070114, 210114, 701, 3, 5, 'yuhongqu', '于洪', '区', 41.84355100, 123.24284700),
(101070201, 210201, 702, 3, 3, 'dalian', '大连', '市', 38.92609000, 121.63784000),
(101070202, 210281, 702, 3, 3, 'wafangdian', '瓦房店', '市', 39.62546900, 122.00768000),
(101070203, 210213, 702, 3, 5, 'jinzhou', '金州', '区', 39.09154500, 121.73103000),
(101070204, 210214, 702, 3, 5, 'pulandian', '普兰店', '市', 39.40229100, 121.96031500),
(101070205, 210212, 702, 3, 5, 'lvshun', '旅顺', '区', 38.83348300, 121.40377900),
(101070206, 210224, 702, 3, 4, 'changhai', '长海', '县', 39.27272800, 122.58849400),
(101070207, 210283, 702, 3, 3, 'zhuanghe', '庄河', '市', 39.70473800, 122.95356700),
(101070208, 210202, 702, 3, 5, 'zhongshanqu1', '中山', '区', 38.92449200, 121.65156700),
(101070209, 210203, 702, 3, 5, 'xigangqu', '西岗', '区', 38.91337000, 121.62582300),
(101070210, 210204, 702, 3, 5, 'shahekouqu', '沙河口', '区', 38.92177800, 121.58261800),
(101070211, 210211, 702, 3, 5, 'ganjingziqu', '甘井子', '区', 38.95546200, 121.52850000),
(101070212, 210212, 702, 3, 5, 'lushunkouqu', '旅顺口', '区', 38.90829100, 121.29593600),
(101070301, 210301, 703, 3, 3, 'anshan', '鞍山', '市', 41.10874200, 122.98225000),
(101070302, 210321, 703, 3, 4, 'taian', '台安', '县', 41.44634800, 122.43050200),
(101070303, 210323, 703, 3, 4, 'xiuyan', '岫岩', '自治县', 40.29088000, 123.28093500),
(101070304, 210381, 703, 3, 3, 'haicheng', '海城', '市', 40.86513500, 122.74510000),
(101070305, 210302, 703, 3, 5, 'anshantiedong', '铁东', '区', 41.09619400, 122.99754900),
(101070306, 210303, 703, 3, 5, 'anshantiexiqu', '鞍山铁西', '区', 41.12546300, 122.97586800),
(101070307, 210304, 703, 3, 5, 'lishanqu', '立山', '区', 41.16417300, 123.04047400),
(101070308, 210311, 703, 3, 5, 'qianshanqu', '千山', '区', 41.06132900, 123.01400500),
(101070401, 210401, 704, 3, 3, 'fushun', '抚顺', '市', 41.86592800, 123.90794100),
(101070402, 210422, 704, 3, 4, 'xinbin', '新宾', '自治县', 41.73425600, 125.03997800),
(101070403, 210423, 704, 3, 4, 'qingyuan', '清原', '自治县', 42.10533100, 124.93650600),
(101070404, 210421, 704, 3, 4, 'fushunxian', '抚顺', '县', 41.89496200, 123.92539300),
(101070406, 210402, 704, 3, 5, 'xinfuqu1', '新抚', '区', 41.86979000, 123.91136900),
(101070407, 210404, 704, 3, 5, 'wanghuaqu', '望花', '区', 41.86040400, 123.78599600),
(101070409, 210411, 704, 3, 5, 'shunchengqu', '顺城', '区', 41.88918100, 123.95167900),
(101070501, 210501, 705, 3, 3, 'benxi', '本溪', '市', 41.29128600, 123.75710000),
(101070502, 210504, 705, 3, 5, 'mingshanqu', '明山', '区', 41.31545300, 123.82199600),
(101070504, 210522, 705, 3, 4, 'huanren', '桓仁', '自治县', 41.26712800, 125.36100700),
(101070505, 210502, 705, 3, 5, 'pingshanqu', '平山', '区', 41.24040100, 123.69257500),
(101070506, 210503, 705, 3, 5, 'xihuqu', '溪湖区', '区', 41.45615400, 123.71186600),
(101070507, 210505, 705, 3, 5, 'nanfenqu', '南芬', '区', 41.12271600, 123.82788000),
(101070521, 210521, 705, 3, 4, 'benximanzu', '本溪满族', '自治县', 41.30828100, 124.13025100),
(101070601, 210601, 706, 3, 3, 'dandong', '丹东', '市', 40.12381700, 124.38760200),
(101070602, 210682, 706, 3, 3, 'fengcheng', '凤城', '市', 40.45232200, 124.06689500),
(101070603, 210624, 706, 3, 4, 'kuandian', '宽甸', '自治县', 40.73131700, 124.78366000),
(101070604, 210681, 706, 3, 3, 'donggang1', '东港', '市', 39.86300800, 124.15270500),
(101070605, 210602, 706, 3, 5, 'yuanbaoqu', '元宝', '区', 40.17319700, 124.35032100),
(101070606, 210603, 706, 3, 5, 'zhenxingqu', '振兴', '区', 40.06703500, 124.35556300),
(101070607, 210604, 706, 3, 5, 'zhenanqu', '振安', '区', 40.21154700, 124.29219700),
(101070701, 210701, 707, 3, 3, 'jinzhou1', '锦州', '市', 41.12520200, 121.14128900),
(101070702, 210781, 707, 3, 3, 'linghai', '凌海', '市', 41.18164400, 121.36198500),
(101070704, 210727, 707, 3, 4, 'yixian', '义县', '县', 41.53414500, 121.22944000),
(101070705, 210726, 707, 3, 4, 'heishan', '黑山', '县', 41.69414700, 122.12090100),
(101070706, 210782, 707, 3, 3, 'beizhen', '北镇', '市', 41.59474400, 121.79868500),
(101070707, 210702, 707, 3, 5, 'gutaqu', '古塔', '区', 41.14138800, 121.12643400),
(101070708, 210703, 707, 3, 5, 'linghe', '凌河', '区', 41.13438000, 121.18266500),
(101070709, 210711, 707, 3, 5, 'taihequ', '太和', '区', 41.13683000, 121.11864500),
(101070801, 210801, 708, 3, 3, 'yingkou', '营口', '市', 40.68587500, 122.26500400),
(101070802, 210882, 708, 3, 3, 'dashiqiao', '大石桥', '市', 40.64580900, 122.50559000),
(101070803, 210881, 708, 3, 3, 'gaizhou', '盖州', '市', 40.41737000, 122.33335000),
(101070804, 210802, 708, 3, 5, 'zhanqianqu', '站前', '区', 40.70301000, 122.26559200),
(101070805, 210803, 708, 3, 5, 'xishiqu', '西市', '区', 40.66694900, 122.21012600),
(101070806, 210804, 708, 3, 5, 'bayuquanqu', '鲅鱼圈', '区', 40.25258400, 122.17689700),
(101070807, 210811, 708, 3, 5, 'laobianqu', '老边', '区', 40.67256500, 122.33090300),
(101070901, 210901, 709, 3, 3, 'fuxin', '阜新', '市', 41.98704300, 121.63815100),
(101070902, 210922, 709, 3, 4, 'zhangwu', '彰武', '县', 42.38752300, 122.52820700),
(101070903, 210902, 709, 3, 5, 'haizhouqu', '海州', '区', 42.02375000, 121.66908700),
(101070904, 210903, 709, 3, 5, 'xinqiuqu', '新邱', '区', 42.07462800, 121.82432100),
(101070905, 210904, 709, 3, 5, 'taipingqu', '太平', '区', 42.00945200, 121.73775300),
(101070906, 210905, 709, 3, 5, 'qinghemenqu', '清河门', '区', 41.75499800, 121.44683900),
(101070907, 210911, 709, 3, 5, 'xihequ', '细河', '区', 42.04325400, 121.62755700),
(101070908, 210403, 709, 3, 5, 'dongzhouqu', '东洲', '区', 41.83358800, 124.02924900),
(101070921, 210921, 709, 3, 4, 'fuxinmengguzu', '阜新蒙古族', '自治县', 41.94177500, 121.88258800),
(101071001, 211001, 710, 3, 3, 'liaoyang', '辽阳', '市', 41.28217000, 123.16881600),
(101071002, 211021, 710, 3, 4, 'liaoyangxian', '辽阳', '县', 41.20532900, 123.10569500),
(101071003, 211081, 710, 3, 3, 'dengta', '灯塔', '市', 41.42208900, 123.31528000),
(101071004, 211005, 710, 3, 5, 'gongchangling', '弓长岭', '区', 41.15184700, 123.41980400),
(101071005, 211002, 710, 3, 5, 'baita', '白塔', '区', 41.27928600, 123.17516300),
(101071006, 211003, 710, 3, 5, 'wensheng', '文圣', '区', 41.27112200, 123.20121600),
(101071007, 211004, 710, 3, 5, 'hongwei', '宏伟', '区', 41.22076400, 123.22051800),
(101071008, 211011, 710, 3, 5, 'taizihe', '太子河', '区', 41.27459300, 123.17837400),
(101071101, 211201, 711, 3, 3, 'tieling', '铁岭', '市', 42.29349500, 123.83518000),
(101071102, 211282, 711, 3, 3, 'kaiyuan', '开原', '市', 42.54643800, 124.03118500),
(101071103, 211224, 711, 3, 4, 'changtu', '昌图', '县', 42.77860400, 124.11742500),
(101071104, 211223, 711, 3, 4, 'xifeng', '西丰', '县', 42.73433500, 124.70699200),
(101071105, 211281, 711, 3, 3, 'diaobingshan', '调兵山', '市', 42.44987600, 123.54790700),
(101071106, 211202, 711, 3, 5, 'yinzhouqu', '银州区', '区', 42.24829500, 123.85851600),
(101071107, 211204, 711, 3, 5, 'qinghequ', '清河', '区', 42.50855700, 124.27578000),
(101071121, 211221, 711, 3, 4, 'tielingxian', '铁岭', '县', 42.22967400, 123.73541300),
(101071201, 211301, 712, 3, 3, 'chaoyang1', '朝阳', '市', 41.57959300, 120.44132800),
(101071203, 211382, 712, 3, 3, 'lingyuan', '凌源', '市', 41.23648400, 119.38394800),
(101071205, 211381, 712, 3, 3, 'beipiao', '北票', '市', 41.80068400, 120.77073000),
(101071207, 211322, 712, 3, 4, 'jianping', '建平', '县', 41.40312800, 119.64328000),
(101071208, 211302, 712, 3, 5, 'shuangtaqu', '双塔', '区', 41.60574000, 120.48407300),
(101071209, 211303, 712, 3, 5, 'longchengqu', '龙城', '区', 41.60622700, 120.40133300),
(101071221, 211321, 712, 3, 4, 'chaoyangxian', '朝阳', '县', 41.24037400, 120.25677700),
(101071224, 211324, 712, 3, 4, 'kazuo', '喀喇沁左翼', '自治县', 41.12665300, 119.75762200),
(101071301, 211101, 713, 3, 3, 'panjin', '盘锦', '市', 41.19816200, 122.06282500),
(101071302, 211104, 713, 3, 5, 'dawa', '大洼', '区', 41.00227900, 122.08257500),
(101071303, 211122, 713, 3, 4, 'panshan', '盘山', '县', 41.24287300, 121.99649900),
(101071304, 211102, 713, 3, 5, 'shuangtaiziqu', '双台子', '区', 41.19322500, 122.03203800),
(101071305, 211103, 713, 3, 5, 'xinglongtaiqu', '兴隆台', '区', 41.15583100, 121.96962900),
(101071401, 211401, 714, 3, 3, 'huludao', '葫芦岛', '市', 40.74956900, 120.86383000),
(101071402, 211422, 714, 3, 4, 'jianchang', '建昌', '县', 40.82436800, 119.83712400),
(101071403, 211421, 714, 3, 4, 'suizhong', '绥中', '县', 40.32148500, 120.35287500),
(101071404, 211481, 714, 3, 3, 'xingcheng', '兴城', '市', 40.62400400, 120.70163000),
(101071405, 211402, 714, 3, 5, 'lianshanqu', '连山', '区', 40.88853700, 120.68836100),
(101071406, 211403, 714, 3, 5, 'longgangqu', '龙港', '区', 40.75099300, 120.90458600),
(101071407, 211404, 714, 3, 5, 'nanpiaoqu', '南票', '区', 41.13703600, 120.66464500),
(101080101, 150101, 801, 3, 3, 'huhehaote', '呼和浩特', '市', 40.83154200, 111.66584400),
(101080102, 150103, 801, 3, 5, 'huiminqv', '回民', '区', 40.81455100, 111.62652100),
(101080103, 150101, 801, 3, 4, 'tuoketuo', '托克托', '县', 40.23793300, 111.26077300),
(101080104, 150123, 801, 3, 4, 'helin', '和林格尔', '县', 40.18774200, 111.68857900),
(101080105, 150124, 801, 3, 4, 'qingshuihe', '清水河', '县', 39.92109500, 111.64760900),
(101080106, 150101, 801, 3, 5, 'hushijiaoqu', '呼市', '区', 40.73558500, 111.68911700),
(101080107, 150125, 801, 3, 4, 'wuchuan', '武川', '县', 41.09647100, 111.45130300),
(101080108, 150102, 801, 3, 5, 'huhehaotexincheng', '新城', '区', 40.86433800, 111.67049400),
(101080109, 150104, 801, 3, 5, 'yuquanqu', '玉泉', '区', 40.74738700, 111.65855300),
(101080110, 150105, 801, 3, 5, 'saihanqu', '赛罕', '区', 40.78886400, 111.87633500),
(101080111, 150121, 801, 3, 4, 'tumotezuoqi', '土左旗', '旗', 40.73572400, 111.16359700),
(101080201, 150201, 802, 3, 3, 'baotou', '包头', '市', 40.60523800, 109.83597900),
(101080202, 150206, 802, 3, 5, 'baiyunebo', '白云鄂博', '区', 41.77330100, 109.95761100),
(101080203, 150223, 802, 3, 4, 'mandula', '满都拉', '镇', 42.52912100, 110.11603800),
(101080205, 150222, 802, 3, 4, 'guyang', '固阳', '县', 41.03410600, 110.06051400),
(101080207, 150223, 802, 3, 4, 'xilamuren', '希拉穆', '仁', 41.32506700, 111.23904200),
(101080208, 150202, 802, 3, 5, 'donghequ', '东河', '区', 40.58912400, 110.07014100),
(101080209, 150203, 802, 3, 5, 'kundulunqu', '昆都仑', '区', 40.65805700, 109.80683400),
(101080210, 150204, 802, 3, 5, 'qingshanqu', '青山', '区', 40.65877800, 109.90367500),
(101080211, 150205, 802, 3, 5, 'shiguaiqu', '石拐', '区', 40.71646400, 110.29921500),
(101080212, 150207, 802, 3, 5, 'jiuyuanqu', '九原', '区', 40.62720200, 109.94919700),
(101080213, 150221, 802, 3, 4, 'tumoteyouqi', '土右旗', '旗', 40.57515700, 110.53061000),
(101080214, 150223, 802, 3, 4, 'daerhanmaomingan', '达茂旗', '旗', 41.70795500, 110.43693400),
(101080301, 150301, 803, 3, 3, 'wuhai', '乌海', '市', 39.66450100, 106.80390000),
(101080302, 150302, 803, 3, 5, 'haibowanqu', '海勃湾', '区', 39.73483400, 106.86148200),
(101080303, 150303, 803, 3, 5, 'hainanqu', '海南', '区', 39.44698000, 106.89804400),
(101080304, 150304, 803, 3, 5, 'wudaqu', '乌达', '区', 39.53587800, 106.72585900),
(101080401, 150902, 804, 3, 5, 'jining', '集宁', '区', 40.99068900, 113.12377900),
(101080402, 150921, 804, 3, 4, 'zhuozi', '卓资', '县', 40.89469200, 112.57752800),
(101080403, 150922, 804, 3, 4, 'huade', '化德', '县', 41.89667300, 114.03922800),
(101080404, 150923, 804, 3, 4, 'shangdu', '商都', '县', 41.58037600, 113.55772400),
(101080406, 150924, 804, 3, 4, 'xinghe', '兴和', '县', 42.15562900, 114.61202900),
(101080407, 150925, 804, 3, 4, 'liangcheng', '凉城', '县', 40.53155500, 112.50397100),
(101080408, 150926, 804, 3, 4, 'cahaeryouqian', '察右前旗', '旗', 40.79236500, 113.21790300),
(101080409, 150927, 804, 3, 4, 'chahaeryouzhong', '察右中旗', '旗', 41.28353200, 112.63709300),
(101080410, 150928, 804, 3, 4, 'chahaeryouhou', '察右后旗', '旗', 41.44237000, 113.19150200),
(101080411, 150929, 804, 3, 4, 'siziwangqi', '四子王旗', '旗', 41.53346200, 111.70661800),
(101080412, 150981, 804, 3, 4, 'fengzhen', '丰镇', '市', 40.43491400, 113.16327900),
(101080413, 150901, 804, 3, 3, 'wulanchabu', '乌兰察布', '市', 41.02236310, 113.11284610),
(101080501, 150501, 805, 3, 3, 'tongliao', '通辽', '市', 43.60438600, 122.24967800),
(101080502, 150502, 805, 3, 4, 'shebotu', '舍伯吐', '镇', 44.02263900, 121.96173500),
(101080503, 150521, 805, 3, 4, 'kezuozhongqi', '科左中旗', '旗', 44.12395600, 123.31570100),
(101080504, 150522, 805, 3, 4, 'kezuohouqi', '科左后旗', '旗', 42.93528700, 122.35725000),
(101080505, 150505, 805, 3, 0, 'qinglongshan', '青龙山', '', 42.38896300, 121.06980200),
(101080506, 150523, 805, 3, 4, 'kailu', '开鲁', '县', 43.63332700, 121.28477900),
(101080507, 150524, 805, 3, 4, 'kulun', '库伦', '旗', 42.73977600, 121.83239700),
(101080508, 150525, 805, 3, 4, 'naiman', '奈曼', '旗', 42.84136000, 120.67792700),
(101080509, 150526, 805, 3, 4, 'zhalute', '扎鲁特', '旗', 44.65120900, 121.24031900),
(101080510, 150510, 805, 3, 4, 'gaoliban', '高力板', '镇', 44.88764900, 121.82383500),
(101080511, 150511, 805, 3, 4, 'bayaertuhushuo', '巴雅尔吐胡硕', '镇', 45.07549600, 120.33942000),
(101080519, 150502, 805, 3, 5, 'horqinqu', '科尔沁', '区', 43.65829000, 122.29129400),
(101080521, 150581, 805, 3, 4, 'huolinguole', '霍林郭勒', '市', 45.53421300, 119.66835800),
(101080601, 150401, 806, 3, 3, 'chifeng', '赤峰', '市', 42.25641600, 118.95977100),
(101080603, 150422, 806, 3, 4, 'aluqi', '阿旗', '旗', 43.87229900, 120.06570000),
(101080604, 150422, 806, 3, 4, 'haoertu', '浩尔吐', '乡', 44.73055800, 119.33211400),
(101080605, 150422, 806, 3, 4, 'balinzuoqi', '巴林左旗', '旗', 43.97112600, 119.37949000),
(101080606, 150423, 806, 3, 4, 'balinyouqi', '巴林右旗', '旗', 43.53441400, 118.66518000),
(101080607, 150424, 806, 3, 4, 'linxi', '林西', '县', 43.59294900, 118.08158800),
(101080608, 150425, 806, 3, 4, 'keshiketeng', '克什克腾', '旗', 43.26498900, 117.54579800),
(101080609, 150426, 806, 3, 4, 'wengniute', '翁牛特', '旗', 42.93161900, 119.03024600),
(101080610, 150401, 806, 3, 4, 'gangzi', '岗子', '乡', 42.56465300, 118.42989700),
(101080611, 150428, 806, 3, 4, 'kalaqin', '喀喇沁', '旗', 41.92736400, 118.70193800),
(101080612, 150429, 806, 3, 4, 'balihan', '八里罕', '镇', 41.51586100, 118.75476000),
(101080613, 150429, 806, 3, 4, 'ningcheng', '宁城', '县', 41.59414600, 119.34283600),
(101080614, 150430, 806, 3, 4, 'aohan', '敖汉', '旗', 42.29078200, 119.92160400),
(101080615, 150401, 806, 3, 4, 'baoguotu', '宝国吐', '乡', 42.32176900, 120.69590000),
(101080616, 150402, 806, 3, 5, 'hongshanqu', '红山', '区', 42.28623200, 118.99810300),
(101080617, 150403, 806, 3, 5, 'yuanbaoshanqu', '元宝山', '区', 42.18413100, 119.26816900),
(101080618, 150404, 806, 3, 5, 'songshanqu', '松山', '区', 42.26875300, 118.75710600),
(101080619, 150422, 806, 3, 4, 'alukeer', '阿鲁科尔沁旗', '旗', 43.87809100, 120.07217500),
(101080701, 150601, 807, 3, 3, 'eerduosi', '鄂尔多斯', '市', 38.35894600, 106.66851800),
(101080703, 150621, 807, 3, 4, 'dalate', '达拉特', '县', 40.41243800, 110.03383300),
(101080704, 150622, 807, 3, 4, 'zhungeer', '准格尔', '县', 39.86436200, 111.24017100),
(101080707, 150607, 807, 3, 4, 'yikewusu', '伊克乌素', '镇', 38.35237800, 107.39727400),
(101080708, 150623, 807, 3, 4, 'etuoke', '鄂托克前', '旗', 39.08965000, 107.97616100),
(101080709, 150625, 807, 3, 4, 'hangjinqi', '杭锦旗', '县', 40.27000100, 107.03561700),
(101080710, 150626, 807, 3, 4, 'wushenqi', '乌审', '旗', 38.60413600, 108.81760700),
(101080711, 150627, 807, 3, 4, 'yijinhuoluo', '伊金霍洛', '旗', 39.56466000, 109.74774000),
(101080712, 150603, 807, 3, 5, 'kangbashen', '康巴什', '区', 39.61821300, 109.80205600),
(101080713, 150602, 807, 3, 5, 'dongsheng', '东胜', '区', 39.82250700, 109.96333900),
(101080714, 150624, 807, 3, 4, 'etuokeqi', '鄂托克', '旗', 39.09574900, 107.97949200),
(101080801, 150802, 808, 3, 5, 'linhe', '临河', '区', 40.74306400, 107.42922600),
(101080802, 150821, 808, 3, 4, 'wuyuan', '五原', '县', 40.91112000, 108.04990900),
(101080803, 150822, 808, 3, 4, 'dengkou', '磴口', '县', 40.33052400, 107.00824800),
(101080804, 150823, 808, 3, 4, 'wulateqianqi', '乌前旗', '旗', 40.71783900, 108.65635600),
(101080805, 150824, 808, 3, 4, 'wulatezhongqi', '乌中旗', '旗', 41.59310100, 108.51181400),
(101080806, 150825, 808, 3, 4, 'wulatehouqi', '乌后旗', '旗', 41.08922500, 107.08450700),
(101080807, 150825, 808, 3, 4, 'wuhouqi', '乌后旗', '县', 41.42786000, 106.99470900),
(101080808, 150825, 808, 3, 4, 'hailisu', '海力素', '', 40.74321300, 107.38765700),
(101080809, 150801, 808, 3, 4, 'narenbaolige', '那仁宝力格', '', 41.07924100, 107.07240000),
(101080810, 150826, 808, 3, 4, 'hangjinhouqi', '杭锦后旗', '旗', 40.88589600, 107.15090900),
(101080811, 150801, 808, 3, 3, 'bayanzhuoer', '巴彦淖尔', '市', 40.76918010, 107.42380710),
(101080901, 152502, 809, 3, 4, 'xilinhaote', '锡林浩特', '市', 43.91865900, 116.02677400),
(101080903, 152501, 809, 3, 4, 'erlianhaote', '二连浩特', '市', 43.65317000, 111.97794300),
(101080904, 152522, 809, 3, 4, 'abaga', '阿巴嘎', '县', 44.02299500, 114.95024800),
(101080905, 152523, 809, 3, 4, 'sunitezuoqi', '苏左旗', '旗', 43.86697100, 113.67095300),
(101080906, 152524, 809, 3, 4, 'suniteyouqi', '苏右旗', '旗', 42.74885900, 112.64959300),
(101080907, 152525, 809, 3, 4, 'dongwuzhumuqinqi', '东乌旗', '旗', 45.51592500, 116.97068800),
(101080908, 152526, 809, 3, 4, 'xiwuzhumuqinqi', '西乌旗', '旗', 44.59232200, 117.61535200),
(101080909, 152525, 809, 3, 4, 'dongwuqi', '东乌旗', '县', 45.52470600, 116.98419600),
(101080910, 152526, 809, 3, 4, 'xiwuqi', '西乌旗', '县', 44.02714400, 114.95257800),
(101080911, 152527, 809, 3, 4, 'taibusiqi', '太仆寺', '旗', 41.87713600, 115.28298600),
(101080912, 152528, 809, 3, 4, 'xianghuang', '镶黄旗', '旗', 42.23237100, 113.84728700),
(101080913, 152529, 809, 3, 4, 'zhengxiangbaiqi', '正镶白旗', '旗', 42.28124700, 115.04132200),
(101080914, 152530, 809, 3, 4, 'zhenglanqi', '正蓝旗', '旗', 42.57637200, 115.41695900),
(101080915, 152531, 809, 3, 4, 'duolun', '多伦', '县', 42.20359100, 116.48555600),
(101080916, 150782, 809, 3, 4, 'boketu', '博克图', '镇', 43.93345400, 116.04822200),
(101080917, 152501, 809, 3, 4, 'wulagai', '乌拉盖', '区', 45.51198800, 116.97647300),
(101080918, 152501, 809, 3, 3, 'xilingguole', '锡林郭勒', '市', 43.93952500, 116.05414100),
(101081001, 150702, 810, 3, 5, 'hailaer', '海拉尔', '区', 49.22838300, 119.74071600),
(101081002, 150723, 810, 3, 4, 'xiaoergou', '小二沟', '', 49.19827400, 123.73260000),
(101081003, 150721, 810, 3, 4, 'arongqi', '阿荣旗', '旗', 48.12658500, 123.45905000),
(101081004, 150722, 810, 3, 4, 'molidawa', '莫力达瓦', '旗', 48.47772900, 124.51902300),
(101081005, 150723, 810, 3, 4, 'elunchunqi', '鄂伦春旗', '旗', 50.59184200, 123.72620100),
(101081006, 150724, 810, 3, 4, 'ewenkeqi', '鄂温克旗', '旗', 49.14881800, 119.75294100),
(101081007, 150725, 810, 3, 4, 'chenqi', '陈旗', '旗', 49.32116900, 119.38749000),
(101081008, 150726, 810, 3, 4, 'xinbaerhuzuoqi', '新左旗', '旗', 48.22438300, 118.27355900),
(101081009, 150727, 810, 3, 4, 'xinyouqi', '新右旗', '旗', 48.67210100, 116.82369000),
(101081010, 150781, 810, 3, 4, 'manzhouli', '满洲里', '市', 49.58638600, 117.45062000),
(101081011, 150782, 810, 3, 4, 'yakeshi', '牙克石', '市', 49.27894300, 120.73663900),
(101081012, 150783, 810, 3, 4, 'zhalantun', '扎兰屯', '市', 48.01770700, 122.74421500),
(101081014, 150784, 810, 3, 4, 'eerguna', '额尔古纳', '市', 50.24310200, 120.18050600),
(101081015, 150785, 810, 3, 4, 'genhe', '根河', '市', 50.77633400, 121.50963500),
(101081016, 150703, 810, 3, 5, 'zhalainuoer', '扎赉诺尔', '区', 49.49266800, 117.79933100),
(101081017, 150701, 810, 3, 3, 'hulunbeier', '呼伦贝尔', '市', 49.21859810, 119.74257510),
(101081018, 150723, 810, 3, 4, 'elunchun', '鄂伦春', '', 50.58681600, 123.73529600),
(101081019, 150724, 810, 3, 4, 'ewenke', '鄂温克', '', 49.15365100, 119.75878900),
(101081020, 150725, 810, 3, 4, 'chenbaerhu', '陈巴尔虎旗', '', 49.33472900, 119.42305300),
(101081101, 152201, 811, 3, 4, 'wulanhaote', '乌兰浩特', '市', 46.07088500, 122.06289000),
(101081102, 152202, 811, 3, 4, 'aershan', '阿尔山', '市', 47.17744000, 119.94357500),
(101081103, 152222, 811, 3, 4, 'keyouzhongqi', '科右中旗', '旗', 45.05905200, 121.47246600),
(101081104, 152223, 811, 3, 4, 'huerle', '胡尔勒', '镇', 46.71963900, 122.09367400),
(101081105, 152223, 811, 3, 4, 'zhalaite', '扎赉特', '旗', 46.72323700, 122.89965600),
(101081106, 152221, 811, 3, 4, 'keermiyouqian', '科右前旗', '旗', 46.08202300, 121.95901800),
(101081107, 152224, 811, 3, 4, 'tuquan', '突泉', '县', 45.38193000, 121.59379900),
(101081109, 152222, 811, 3, 4, 'keermiyouzhong', '科右中旗', '旗', 45.06709000, 121.48658300),
(101081110, 152201, 811, 3, 3, 'xinganmeng', '兴安盟', '', 46.08883310, 122.04406510),
(101081111, 150521, 805, 3, 4, 'keerxinzuoyizhongqi', '科尔沁左翼中旗', '旗', 44.13234600, 123.31873800),
(101081112, 150522, 805, 3, 4, 'keerxinzuoyihouqi', '科尔沁左翼后旗', '旗', 42.93998200, 122.35957700),
(101081201, 152921, 812, 3, 4, 'alashanzuoqi', '阿拉善左旗', '旗', 38.83973600, 105.67235600),
(101081202, 152922, 812, 3, 4, 'alashanyouqi', '阿拉善右旗', '旗', 39.22197900, 101.67466700),
(101081203, 152923, 812, 3, 4, 'ejina', '额济纳', '旗', 41.90851800, 101.02009000),
(101081204, 152921, 812, 3, 4, 'guanzihu', '拐子湖', '县', 30.24180600, 111.98064900),
(101081205, 152921, 812, 3, 4, 'jilantai', '吉兰泰', '镇', 39.41491000, 106.65551800),
(101081206, 152921, 812, 3, 4, 'xilingaole', '锡林高勒', '市', 39.34185500, 105.70740700),
(101081207, 152921, 812, 3, 4, 'toudaohu', '头道湖', '', 38.84188000, 105.68675500),
(101081208, 152921, 812, 3, 4, 'zhongquanzi', '中泉子', '', 39.32235400, 102.67299700),
(101081209, 152921, 812, 3, 4, 'nuoergong', '诺尔贡', '', 40.16482400, 104.80405300),
(101081210, 152921, 812, 3, 4, 'yabulai', '雅布赖', '镇', 39.42959300, 102.77937000),
(101081211, 152921, 812, 3, 4, 'wusitai', '乌斯太', '', 40.81739000, 111.76629000),
(101081212, 152921, 812, 3, 4, 'luanjingtan', '孪井滩', '区', 38.85189200, 105.72896900),
(101090101, 130101, 901, 3, 3, 'shijiazhuang', '石家庄', '市', 38.02141600, 114.48674000),
(101090102, 130121, 901, 3, 4, 'jingxing', '井陉', '县', 38.03519800, 114.13674500),
(101090103, 130123, 901, 3, 4, 'zhengding', '正定', '县', 38.14644500, 114.57094100),
(101090104, 130111, 901, 3, 5, 'luancheng', '栾城', '区', 37.90020000, 114.64831800),
(101090105, 130125, 901, 3, 4, 'xingtang', '行唐', '县', 38.43841100, 114.55269200),
(101090106, 130126, 901, 3, 4, 'lingshou', '灵寿', '县', 38.30862800, 114.38264500),
(101090107, 130127, 901, 3, 4, 'gaoyi', '高邑', '县', 37.60511100, 114.59730700),
(101090108, 130128, 901, 3, 4, 'shenze', '深泽', '县', 38.18407200, 115.20091000),
(101090109, 130129, 901, 3, 4, 'zanhuang', '赞皇', '县', 37.66560000, 114.38618300),
(101090110, 130130, 901, 3, 4, 'wuji', '无极', '县', 38.17914100, 114.97633700),
(101090111, 130131, 901, 3, 4, 'pingshan', '平山', '县', 38.26572800, 113.97920700),
(101090112, 130132, 901, 3, 4, 'yuanshi', '元氏', '县', 37.75965900, 114.54453900),
(101090113, 130133, 901, 3, 4, 'zhaoxian', '赵县', '县', 37.75643000, 114.77618500),
(101090114, 139002, 901, 3, 4, 'xinji', '辛集', '市', 37.90588900, 115.21315700),
(101090115, 130109, 901, 3, 5, 'gaocheng', '藁城', '区', 38.02716700, 114.83277700),
(101090116, 130183, 901, 3, 4, 'jinzhou2', '晋州', '市', 38.02083100, 115.03212800),
(101090117, 130184, 901, 3, 4, 'xinle', '新乐', '市', 38.34329600, 114.68401400),
(101090118, 130110, 901, 3, 5, 'luquan1', '鹿泉', '区', 38.08595800, 114.31372400),
(101090120, 130102, 901, 3, 5, 'changanqu', '长安', '区', 38.07687500, 114.59262200),
(101090121, 130502, 901, 3, 5, 'shijiazhuangqiaodongqu', '石家庄桥东', '区', 38.04867300, 114.50498200),
(101090122, 130104, 901, 3, 5, 'qiaoxiqu', '桥西', '区', 38.01030300, 114.46755900),
(101090123, 130105, 901, 3, 5, 'xinhuaqu', '新华', '区', 38.05710400, 114.46970300),
(101090124, 130107, 901, 3, 5, 'jingxingkuangqu', '井陉矿', '区', 38.08109800, 114.05074400),
(101090125, 130108, 901, 3, 5, 'yuhuaqu', '裕华', '区', 38.01462100, 114.58638300),
(101090201, 130601, 902, 3, 3, 'baoding', '保定', '市', 38.86310800, 115.48009700),
(101090202, 130607, 902, 3, 5, 'mancheng', '满城', '区', 38.94895500, 115.32235100),
(101090203, 130624, 902, 3, 4, 'fuping', '阜平', '县', 38.84915200, 114.19510500),
(101090204, 130609, 902, 3, 5, 'xushui', '徐水', '区', 39.01854700, 115.65586200),
(101090205, 130627, 902, 3, 4, 'tangxian', '唐县', '县', 38.74820400, 114.98297200),
(101090206, 130628, 902, 3, 4, 'gaoyang', '高阳', '县', 38.68989700, 115.78062600),
(101090207, 130629, 902, 3, 4, 'rongcheng', '容城', '县', 39.04278400, 115.86165700),
(101090208, 130606, 902, 3, 5, 'lianchi', '莲池', '区', 38.88911900, 115.50377900),
(101090209, 130630, 902, 3, 4, 'laiyuan', '涞源', '县', 39.36024700, 114.69428400),
(101090210, 130631, 902, 3, 4, 'wangdu', '望都', '县', 38.69573600, 115.15451100),
(101090211, 130632, 902, 3, 4, 'anxin', '安新', '县', 38.93536900, 115.93560300),
(101090212, 130633, 902, 3, 4, 'yixian1', '易县', '县', 39.34939300, 115.49745700),
(101090214, 130634, 902, 3, 4, 'quyang', '曲阳', '县', 38.62224400, 114.74492600),
(101090215, 130635, 902, 3, 4, 'lixian', '蠡县', '县', 38.49014100, 115.57587700),
(101090216, 130636, 902, 3, 4, 'shunping', '顺平', '县', 38.84455200, 115.13261700),
(101090217, 130638, 902, 3, 4, 'xiongxian', '雄县', '县', 38.99455000, 116.10865000),
(101090218, 130681, 902, 3, 4, 'zhuozhou', '涿州', '市', 39.48098200, 115.98401500),
(101090219, 139001, 902, 3, 4, 'dingzhou', '定州', '市', 38.53050000, 114.97330500),
(101090220, 130683, 902, 3, 4, 'anguo', '安国', '市', 38.41844000, 115.32664700),
(101090221, 130684, 902, 3, 4, 'gaobeidian', '高碑店', '市', 39.32918900, 115.85831900),
(101090222, 130623, 902, 3, 4, 'laishui', '涞水', '县', 39.39431700, 115.71390500),
(101090223, 130626, 902, 3, 4, 'dingxing', '定兴', '县', 39.26301800, 115.80817500),
(101090224, 130608, 902, 3, 5, 'qingyuan1', '清苑', '区', 38.77186300, 115.49428700),
(101090225, 130637, 902, 3, 4, 'boye', '博野', '县', 38.45736400, 115.46438000),
(101090226, 130602, 902, 3, 5, 'jingxiu', '竞秀', '区', 38.88391800, 115.46530500),
(101090227, 0, 902, 3, 5, 'beishiqu', '北市', '区', 38.89751100, 115.53291200),
(101090228, 0, 902, 3, 5, 'nanshiqu', '南市', '区', 38.82187700, 115.48478400),
(101090301, 130701, 903, 3, 3, 'zhangjiakou', '张家口', '市', 40.75137600, 114.88279600),
(101090302, 130705, 903, 3, 5, 'xuanhua', '宣化', '区', 40.59701900, 115.06015000),
(101090303, 130722, 903, 3, 4, 'zhangbei', '张北', '县', 41.15855700, 114.72008600),
(101090304, 130723, 903, 3, 4, 'kangbao', '康保', '县', 41.85236800, 114.60040400),
(101090305, 130724, 903, 3, 4, 'guyuan', '沽源', '县', 41.66966800, 115.68869200),
(101090306, 130725, 903, 3, 4, 'shangyi', '尚义', '县', 41.07622700, 113.96961900),
(101090307, 130726, 903, 3, 4, 'yuxian1', '蔚县', '县', 39.84084300, 114.58890300),
(101090308, 130727, 903, 3, 4, 'yangyuan', '阳原', '县', 40.10374200, 114.15038800),
(101090309, 130728, 903, 3, 4, 'huaian', '怀安', '县', 40.67419300, 114.38579200),
(101090310, 130708, 903, 3, 5, 'wanquan', '万全', '区', 40.76689800, 114.74056000),
(101090311, 130730, 903, 3, 4, 'huailai', '怀来', '县', 40.41534300, 115.51786200),
(101090312, 130731, 903, 3, 4, 'zhuolu', '涿鹿', '县', 40.37956300, 115.20534500),
(101090313, 130732, 903, 3, 4, 'chicheng', '赤城', '县', 40.91292100, 115.83149900),
(101090314, 130709, 903, 3, 5, 'chongli', '崇礼', '区', 40.97467600, 115.28266900),
(101090315, 130702, 903, 3, 5, 'zhangjiakouqiaodong', '张家口桥东', '区', 40.79416700, 114.90096600),
(101090316, 130703, 903, 3, 5, 'zhangjiakouqiaoxiqu', '张家口桥西', '区', 40.82557700, 114.87588200),
(101090318, 130706, 903, 3, 5, 'xiahuayuanqu', '下花园', '区', 40.56883700, 115.35049800),
(101090402, 130801, 904, 3, 3, 'chengde', '承德', '市', 40.96756400, 117.95064000),
(101090403, 130821, 904, 3, 4, 'chengdexian', '承德', '县', 40.76823800, 118.17382500),
(101090404, 130822, 904, 3, 4, 'xinglong', '兴隆', '县', 40.41735800, 117.50055800),
(101090405, 130823, 904, 3, 4, 'pingquan', '平泉', '县', 40.99895900, 118.70046800),
(101090406, 130824, 904, 3, 4, 'luanping', '滦平', '县', 40.92348900, 117.31603300),
(101090407, 130825, 904, 3, 4, 'longhua', '隆化', '县', 41.32009500, 117.74909000),
(101090408, 130826, 904, 3, 4, 'fengning', '丰宁', '自治县', 41.20889900, 116.64593200),
(101090409, 130827, 904, 3, 4, 'kuanchengmanzu', '宽城满族', '自治县', 40.61139100, 118.48531300),
(101090410, 130828, 904, 3, 4, 'weichang', '围场', '县', 41.93852900, 117.76015900),
(101090411, 130802, 904, 3, 5, 'shuangqiaoqu', '双桥', '区', 40.97140600, 117.94835500),
(101090412, 130803, 904, 3, 5, 'shuangluanqu', '双滦', '区', 41.05145300, 117.80933600),
(101090414, 130804, 904, 3, 5, 'yingshouying', '鹰手营子矿', '区', 40.55362700, 117.66926700),
(101090501, 130201, 905, 3, 3, 'tangshan', '唐山', '市', 39.62572400, 118.11847000),
(101090502, 130207, 905, 3, 5, 'fengnan', '丰南', '区', 39.57603100, 118.08516900),
(101090503, 130208, 905, 3, 5, 'fengrun', '丰润', '区', 39.83258200, 118.16221600),
(101090504, 130223, 905, 3, 4, 'luanxian', '滦县', '县', 39.75886800, 118.70574000),
(101090505, 130224, 905, 3, 4, 'luannan', '滦南', '县', 39.51899700, 118.68237900),
(101090506, 130225, 905, 3, 4, 'laoting', '乐亭', '县', 39.42560800, 118.91257100),
(101090507, 130227, 905, 3, 4, 'qianxi', '迁西', '县', 40.14150000, 118.31471500),
(101090508, 130229, 905, 3, 4, 'yutian', '玉田', '县', 39.90040100, 117.73865800),
(101090509, 0, 905, 3, 5, 'tanghai', '唐海', '县', 39.27920900, 118.45918000),
(101090510, 130281, 905, 3, 4, 'zunhua', '遵化', '市', 40.18920200, 117.96589200),
(101090511, 130283, 905, 3, 4, 'qianan1', '迁安', '市', 39.92553000, 118.69317900),
(101090512, 130209, 905, 3, 5, 'caofeidian', '曹妃甸', '区', 39.27307000, 118.46037900),
(101090513, 0, 905, 3, 4, 'jingtanggang', '京唐港', '', 39.21071900, 119.00364100),
(101090514, 130202, 905, 3, 5, 'lunan', '路南', '区', 39.61298700, 118.20604000),
(101090515, 130204, 905, 3, 5, 'guyequ', '古冶', '区', 39.72304500, 118.46223200),
(101090516, 130205, 905, 3, 5, 'kaipingqu', '开平', '区', 39.69212300, 118.25784800),
(101090523, 130203, 905, 3, 5, 'lubei', '路北', '区', 39.63131000, 118.20516600),
(101090601, 131001, 906, 3, 3, 'langfang', '廊坊', '市', 39.51053500, 116.70864900),
(101090602, 131022, 906, 3, 4, 'guan', '固安', '县', 39.43821400, 116.29865700),
(101090603, 131023, 906, 3, 4, 'yongqing', '永清', '县', 39.32179400, 116.49902800),
(101090604, 131024, 906, 3, 4, 'xianghe', '香河', '县', 39.76142400, 117.00609300),
(101090605, 131025, 906, 3, 4, 'dacheng', '大城', '县', 38.70544900, 116.65379400),
(101090606, 131026, 906, 3, 4, 'wenan', '文安', '县', 38.87328100, 116.45785800),
(101090607, 131028, 906, 3, 4, 'dachang', '大厂', '自治县', 39.88654800, 116.98957400),
(101090608, 131081, 906, 3, 4, 'bazhou', '霸州', '市', 39.12225300, 116.37543500),
(101090609, 131082, 906, 3, 4, 'sanhe', '三河', '市', 39.98271800, 117.07829500),
(101090701, 130901, 907, 3, 3, 'cangzhou', '沧州', '市', 38.30926000, 116.87835800),
(101090702, 130922, 907, 3, 4, 'qingxian', '青县', '县', 38.57810700, 116.83906500),
(101090703, 130923, 907, 3, 4, 'dongguang', '东光', '县', 37.89288800, 116.53088700),
(101090704, 130924, 907, 3, 4, 'haixing', '海兴', '县', 38.14316900, 117.49765100),
(101090705, 130925, 907, 3, 4, 'yanshan', '盐山', '县', 38.05808800, 117.23060200),
(101090706, 130926, 907, 3, 4, 'suning', '肃宁', '县', 38.41434000, 115.85048100),
(101090707, 130927, 907, 3, 4, 'nanpi', '南皮', '县', 38.03858400, 116.70810400),
(101090708, 130928, 907, 3, 4, 'wuqiao', '吴桥', '县', 37.62730300, 116.38604600),
(101090709, 130929, 907, 3, 4, 'xianxian', '献县', '县', 38.19014400, 116.12280200),
(101090710, 130930, 907, 3, 4, 'mengcun', '孟村', '自治县', 38.05340900, 117.10429800),
(101090711, 130981, 907, 3, 4, 'botou', '泊头', '市', 38.06146200, 116.58709700),
(101090712, 130982, 907, 3, 4, 'renqiu', '任丘', '市', 38.69395300, 116.14513100),
(101090713, 130983, 907, 3, 4, 'huanghua', '黄骅', '市', 38.37138300, 117.33004800),
(101090714, 130984, 907, 3, 4, 'hejian', '河间', '市', 38.44662400, 116.09951800),
(101090716, 130921, 907, 3, 4, 'cangxian', '沧县', '县', 38.21985600, 117.00747800),
(101090717, 130902, 907, 3, 5, 'cangzhouxinhuaqu', '沧州新华', '区', 38.32041000, 116.87255000),
(101090718, 130903, 907, 3, 5, 'yunhequ', '运河', '区', 38.31444600, 116.84485400),
(101090801, 131101, 908, 3, 3, 'hengshui', '衡水', '市', 37.74463200, 115.69097800),
(101090802, 131121, 908, 3, 4, 'zaoqiang', '枣强', '县', 37.50471100, 115.73949100),
(101090803, 131122, 908, 3, 4, 'wuyi', '武邑', '县', 37.80165800, 115.88765500),
(101090804, 131123, 908, 3, 4, 'wuqiang', '武强', '县', 38.04136800, 115.98246100),
(101090805, 131124, 908, 3, 4, 'raoyang', '饶阳', '县', 38.23768600, 115.71664100),
(101090806, 131125, 908, 3, 4, 'anping', '安平', '县', 38.23451000, 115.51921600),
(101090807, 131126, 908, 3, 4, 'gucheng', '故城', '县', 37.34741000, 115.96587400),
(101090808, 131127, 908, 3, 4, 'jingxian', '景县', '县', 37.69229000, 116.27064800),
(101090809, 131128, 908, 3, 4, 'fucheng', '阜城', '县', 37.86887200, 116.14441800),
(101090810, 131103, 908, 3, 5, 'jizhou', '冀州', '区', 37.55082100, 115.57933400),
(101090811, 131182, 908, 3, 4, 'shenzhou', '深州', '市', 38.01127800, 115.61404300),
(101090812, 131102, 908, 3, 5, 'taochengqu', '桃城', '区', 37.72421800, 115.66665700),
(101090901, 130521, 909, 3, 4, 'xingtai', '邢台', '县', 37.07021900, 114.49205300),
(101090902, 130522, 909, 3, 4, 'lincheng', '临城', '县', 37.44449900, 114.49876200),
(101090904, 130523, 909, 3, 4, 'neiqiu', '内丘', '县', 37.28666900, 114.51212800),
(101090905, 130524, 909, 3, 4, 'baixiang', '柏乡', '县', 37.48242300, 114.69342600),
(101090906, 130525, 909, 3, 4, 'longyao', '隆尧', '县', 37.35017300, 114.77041900),
(101090907, 130527, 909, 3, 4, 'nanhe', '南和', '县', 37.00504100, 114.68376200),
(101090908, 130528, 909, 3, 4, 'ningjin', '宁晋', '县', 37.61988600, 114.91930100),
(101090909, 130529, 909, 3, 4, 'julu', '巨鹿', '县', 37.22111200, 115.03747800),
(101090910, 130530, 909, 3, 4, 'xinhe', '新河', '县', 37.52871900, 115.24207000),
(101090911, 130531, 909, 3, 4, 'guangzong', '广宗', '县', 37.07466000, 115.14260700),
(101090912, 130532, 909, 3, 4, 'pingxiang', '平乡', '县', 37.06314800, 115.03007600),
(101090913, 130533, 909, 3, 4, 'weixian1', '威县', '县', 36.97537700, 115.26678000),
(101090914, 130534, 909, 3, 4, 'qinghe', '清河', '县', 37.03999100, 115.66720900),
(101090915, 130535, 909, 3, 4, 'linxi1', '临西', '县', 36.92844400, 115.71414300),
(101090916, 130581, 909, 3, 4, 'nangong', '南宫', '县', 37.35926400, 115.40874800),
(101090917, 130582, 909, 3, 4, 'shahe', '沙河', '市', 36.85492200, 114.50333500),
(101090918, 130526, 909, 3, 4, 'renxian', '任县', '县', 37.12098300, 114.67193600),
(101090919, 130702, 909, 3, 5, 'qiaodongqu', '桥东', '区', 37.28330000, 114.51670000),
(101090920, 130503, 909, 3, 5, 'xingtaiqiaoxiqu', '邢台桥西', '区', 37.06619800, 114.47485200),
(101091001, 130421, 910, 3, 4, 'handan', '邯郸', '县', 36.60313500, 114.47549400),
(101091002, 130406, 910, 3, 5, 'fengfeng', '峰峰', '区', 36.41973900, 114.21280300),
(101091003, 130423, 910, 3, 4, 'linzhang', '临漳', '市', 36.33502600, 114.61953600),
(101091004, 130424, 910, 3, 4, 'chengan', '成安', '县', 36.44264300, 114.69018400),
(101091005, 130425, 910, 3, 4, 'daming', '大名', '县', 36.28561600, 115.14781400),
(101091006, 130426, 910, 3, 4, 'shexian', '涉县', '县', 36.57760700, 113.66867300),
(101091007, 130427, 910, 3, 4, 'cixian', '磁县', '县', 36.36034900, 114.37195600),
(101091008, 130428, 910, 3, 4, 'feixiang', '肥乡', '县', 36.55041100, 114.81409500),
(101091009, 130429, 910, 3, 4, 'yongnian', '永年', '县', 36.77774000, 114.49105200),
(101091010, 130430, 910, 3, 4, 'qiuxian', '邱县', '县', 36.81113300, 115.18679200),
(101091011, 130431, 910, 3, 4, 'jize', '鸡泽', '县', 36.92035000, 114.87829900),
(101091012, 130432, 910, 3, 4, 'guangping', '广平', '县', 36.48348400, 114.94860700),
(101091013, 130433, 910, 3, 4, 'guantao', '馆陶', '县', 36.53553700, 115.29952400),
(101091014, 130434, 910, 3, 4, 'weixian', '魏县', '县', 36.35498800, 114.93862200),
(101091015, 130435, 910, 3, 4, 'quzhou', '曲周', '县', 36.78017500, 114.94511300),
(101091016, 130481, 910, 3, 4, 'wuan', '武安', '市', 36.67644200, 114.21203400),
(101091017, 130402, 910, 3, 5, 'hanshanqu', '邯山', '区', 36.53615300, 114.46929000),
(101091018, 130403, 910, 3, 5, 'congtaiqu', '丛台', '区', 36.63721500, 114.51106800),
(101091019, 130404, 910, 3, 5, 'fuxingqu', '复兴', '区', 36.61036900, 114.44809500),
(101091101, 130301, 911, 3, 3, 'qinhuangdao', '秦皇岛', '市', 39.96578500, 119.59202400),
(101091102, 130321, 911, 3, 4, 'qinglong', '青龙', '自治县', 40.40757800, 118.94968400),
(101091103, 130322, 911, 3, 4, 'changli', '昌黎', '县', 39.70381500, 119.16801400),
(101091104, 130306, 911, 3, 5, 'funing', '抚宁', '县', 39.89439200, 119.24930400),
(101091105, 130324, 911, 3, 4, 'lulong', '卢龙', '县', 39.95273300, 118.98296200),
(101091106, 130304, 911, 3, 5, 'beidaihe', '北戴河', '区', 39.85248000, 119.42132100),
(101091107, 130302, 911, 3, 5, 'haigangqu', '海港', '区', 39.98878000, 119.57761700),
(101091108, 130303, 911, 3, 5, 'shanhaiguanqu', '山海关', '区', 40.03290000, 119.71361600),
(101100101, 140101, 1001, 3, 3, 'taiyuan', '太原', '市', 37.86055800, 112.58799700),
(101100102, 140121, 1001, 3, 4, 'qingxu', '清徐', '县', 37.55814500, 112.32783900),
(101100103, 140122, 1001, 3, 4, 'yangqu', '阳曲', '县', 38.05769100, 112.68225600),
(101100104, 140123, 1001, 3, 4, 'loufan', '娄烦', '县', 38.06764700, 111.79742800),
(101100105, 140181, 1001, 3, 4, 'gujiao', '古交', '市', 37.91821900, 112.16474900),
(101100106, 140108, 1001, 3, 5, 'jiancaopingqu', '尖草坪', '区', 37.94038700, 112.48669100),
(101100107, 140105, 1001, 3, 5, 'xiaodianqu', '小店', '区', 37.73600900, 112.56599200),
(101100108, 140106, 1001, 3, 5, 'yingzequ', '迎泽', '区', 37.86573700, 112.66320300),
(101100109, 140107, 1001, 3, 5, 'xinghualing', '杏花岭', '区', 37.91555600, 112.62983600),
(101100110, 140109, 1001, 3, 5, 'wanbolinqu', '万柏林', '区', 37.89469300, 112.40285700),
(101100111, 140110, 1001, 3, 5, 'jinyuanqu', '晋源', '区', 37.74867500, 112.48158700),
(101100201, 140201, 1002, 3, 3, 'datong', '大同', '市', 40.11660400, 113.30612000),
(101100202, 140221, 1002, 3, 4, 'yanggao', '阳高', '县', 40.36596700, 113.73908500),
(101100203, 140227, 1002, 3, 4, 'datongxian', '大同', '县', 40.04029500, 113.61244000),
(101100204, 140222, 1002, 3, 4, 'tianzhen', '天镇', '县', 40.45244400, 114.06578900),
(101100205, 140223, 1002, 3, 4, 'guangling', '广灵', '县', 39.76028100, 114.28275800),
(101100206, 140224, 1002, 3, 4, 'lingqiu', '灵丘', '县', 39.46244600, 114.22254500),
(101100207, 140225, 1002, 3, 4, 'hunyuan', '浑源', '县', 39.69340700, 113.69947500),
(101100208, 140226, 1002, 3, 4, 'zuoyun', '左云', '县', 40.01344200, 112.70300800),
(101100209, 140212, 1002, 3, 5, 'xinrongqu', '新荣', '区', 40.26712700, 113.23689400),
(101100210, 140211, 1002, 3, 5, 'nanjiaoqu', '南郊', '区', 40.05189100, 113.22645700),
(101100301, 140301, 1003, 3, 3, 'yangquan', '阳泉', '市', 37.85773900, 113.59224500),
(101100302, 140322, 1003, 3, 4, 'yuxian', '盂县', '县', 38.08562000, 113.41233000),
(101100303, 140321, 1003, 3, 4, 'pingding', '平定', '县', 37.78665300, 113.65784100),
(101100304, 140303, 1003, 3, 5, 'kuangqu', '矿区', '区', 37.89080400, 113.54077100),
(101100305, 140302, 1003, 3, 5, 'yangquanjiaoqu', '城区', '区', 37.95038400, 113.60078200),
(101100306, 1403011, 1003, 3, 5, 'jiaoqu', '郊区', '区', 37.47000000, 113.19000000),
(101100401, 140701, 1004, 3, 3, 'jinzhong', '晋中', '市', 37.68450900, 112.74424700),
(101100402, 140702, 1004, 3, 5, 'yuci', '榆次', '区', 37.69652400, 112.73108600),
(101100403, 140721, 1004, 3, 4, 'yushe', '榆社', '县', 37.05206700, 112.96918100),
(101100404, 140722, 1004, 3, 4, 'zuoquan', '左权', '县', 37.08268100, 113.37937200),
(101100405, 140723, 1004, 3, 4, 'heshun', '和顺', '县', 37.32966300, 113.57043800),
(101100406, 140724, 1004, 3, 4, 'xiyang', '昔阳', '县', 37.61121000, 113.70687500),
(101100407, 140725, 1004, 3, 4, 'shouyang', '寿阳', '县', 37.88195400, 113.19060300),
(101100408, 140726, 1004, 3, 4, 'taigu', '太谷', '县', 37.42177100, 112.57011900),
(101100409, 140727, 1004, 3, 4, 'qixian', '祁县', '县', 37.34636600, 112.33135400),
(101100410, 140728, 1004, 3, 4, 'pingyao', '平遥', '县', 37.20755200, 112.16826500),
(101100411, 140729, 1004, 3, 4, 'lingshi', '灵石', '县', 36.86195700, 111.77081800),
(101100412, 140781, 1004, 3, 4, 'jiexiu', '介休', '市', 37.01769400, 111.91929200),
(101100501, 140401, 1005, 3, 3, 'changzhi', '长治', '市', 36.18451700, 113.06755000),
(101100502, 140426, 1005, 3, 4, 'licheng', '黎城', '县', 36.51353500, 113.38915000),
(101100503, 140424, 1005, 3, 4, 'tunliu', '屯留', '县', 36.31566300, 112.89199800),
(101100504, 140481, 1005, 3, 4, 'lucheng', '潞城', '市', 36.32045800, 113.22225400),
(101100505, 140423, 1005, 3, 4, 'xiangyuan', '襄垣', '区', 36.50617500, 113.03534100),
(101100506, 140425, 1005, 3, 4, 'pingshun', '平顺', '县', 36.20017900, 113.43596100),
(101100507, 140429, 1005, 3, 4, 'wuxiang', '武乡', '县', 36.84504300, 112.85964000),
(101100508, 140430, 1005, 3, 4, 'qinxian', '沁县', '县', 36.75895100, 112.70542100),
(101100509, 140428, 1005, 3, 4, 'zhangzi', '长子', '县', 36.06649600, 112.96277200),
(101100510, 140431, 1005, 3, 4, 'qinyuan', '沁源', '县', 36.50020000, 112.33744600),
(101100511, 140427, 1005, 3, 4, 'huguan', '壶关', '县', 36.11544900, 113.20704900),
(101100512, 140411, 1005, 3, 5, 'changzhijiaoqu', '长治郊', '区', 36.31583100, 113.11947500),
(101100513, 140421, 1005, 3, 4, 'changzhixian', '长治', '县', 36.06046500, 113.05751100),
(101100601, 140501, 1006, 3, 3, 'jincheng', '晋城', '市', 35.47521100, 112.87370000),
(101100602, 140521, 1006, 3, 4, 'qinshui', '沁水', '县', 35.69014100, 112.18673900),
(101100603, 140522, 1006, 3, 4, 'yangcheng', '阳城', '县', 35.49315700, 112.49242800),
(101100604, 140524, 1006, 3, 4, 'lingchuan', '陵川', '县', 35.77568500, 113.28068800),
(101100605, 140581, 1006, 3, 4, 'gaoping', '高平', '市', 35.80610300, 112.91587000),
(101100606, 140525, 1006, 3, 4, 'zezhou', '泽州', '县', 35.61722100, 112.89913700),
(101100701, 141001, 1007, 3, 3, 'linfen', '临汾', '市', 36.08698400, 111.53772700),
(101100702, 141021, 1007, 3, 4, 'quwo', '曲沃', '县', 35.64108700, 111.47586100),
(101100703, 141032, 1007, 3, 4, 'yonghe', '永和', '县', 36.75950700, 110.63200700),
(101100704, 141031, 1007, 3, 4, 'xixian', '隰县', '县', 36.69333100, 110.94063800),
(101100705, 141030, 1007, 3, 4, 'daning', '大宁', '县', 36.46513300, 110.75290300),
(101100706, 141028, 1007, 3, 4, 'jixian', '吉县', '', 36.09818800, 110.68176300),
(101100707, 141023, 1007, 3, 4, 'xiangfen', '襄汾', '县', 35.88038000, 111.44218700),
(101100708, 141033, 1007, 3, 4, 'puxian', '蒲县', '县', 36.41182700, 111.09643900),
(101100709, 141034, 1007, 3, 4, 'fenxi', '汾西', '县', 36.65285500, 111.56395100),
(101100710, 141024, 1007, 3, 4, 'hongtong', '洪洞', '县', 36.26228000, 111.67150300),
(101100711, 141082, 1007, 3, 4, 'huozhou', '霍州', '市', 36.58622900, 111.72037500),
(101100712, 141029, 1007, 3, 4, 'xiangning', '乡宁', '县', 35.97038900, 110.84702100),
(101100713, 141022, 1007, 3, 4, 'yicheng', '翼城', '县', 35.73857600, 111.71895100),
(101100714, 141081, 1007, 3, 4, 'houma', '侯马', '市', 35.60722400, 111.35580000),
(101100715, 141027, 1007, 3, 4, 'fushan', '浮山', '县', 35.96812400, 111.84888300),
(101100716, 141026, 1007, 3, 4, 'anze', '安泽', '县', 36.14778700, 112.25014400),
(101100717, 141025, 1007, 3, 4, 'guxian', '古县', '县', 36.26691400, 111.92046600),
(101100718, 141002, 1007, 3, 5, 'yaodu', '尧都', '区', 36.12593700, 111.47466500),
(101100801, 140801, 1008, 3, 3, 'yuncheng', '运城', '市', 35.02676300, 110.99086300);
INSERT INTO `cmf_plugin_modules_citys` (`id`, `code`, `pid`, `level`, `level3`, `pinyin`, `name`, `areaname`, `lat`, `lng`) VALUES
(101100802, 140821, 1008, 3, 4, 'linyi', '临猗', '县', 35.14427700, 110.77454700),
(101100803, 140824, 1008, 3, 4, 'jishan', '稷山', '县', 35.61265300, 110.99553300),
(101100804, 140822, 1008, 3, 4, 'wanrong', '万荣', '县', 35.41525400, 110.83802400),
(101100805, 140882, 1008, 3, 4, 'hejin', '河津', '市', 35.58708400, 110.72560500),
(101100806, 140825, 1008, 3, 4, 'xinjiang', '新绛', '县', 35.61007700, 111.21066100),
(101100807, 140826, 1008, 3, 4, 'jiangxian', '绛县', '县', 35.49119000, 111.56823600),
(101100808, 140823, 1008, 3, 4, 'wenxi', '闻喜', '县', 35.35628300, 111.21652500),
(101100809, 140827, 1008, 3, 4, 'yuanqu', '垣曲', '县', 35.29738600, 111.66992800),
(101100810, 140881, 1008, 3, 4, 'yongji1', '永济', '市', 34.87023500, 110.45412900),
(101100811, 140830, 1008, 3, 4, 'ruicheng', '芮城', '县', 34.69358000, 110.69436900),
(101100812, 140828, 1008, 3, 4, 'xiaxian', '夏县', '县', 35.14136300, 111.22045600),
(101100813, 140829, 1008, 3, 4, 'pinglu', '平陆', '县', 34.82926000, 111.19413300),
(101100814, 140802, 1008, 3, 5, 'yanhuqu', '盐湖', '区', 35.06367700, 110.96193100),
(101100901, 140601, 1009, 3, 3, 'shuozhou', '朔州', '市', 39.31523500, 112.44955500),
(101100902, 140603, 1009, 3, 5, 'pinglu1', '平鲁', '区', 39.51215500, 112.28833100),
(101100903, 140621, 1009, 3, 4, 'shanyin', '山阴', '县', 39.52622700, 112.81660000),
(101100904, 140623, 1009, 3, 4, 'youyu', '右玉', '县', 39.98906400, 112.46698900),
(101100905, 140622, 1009, 3, 4, 'yingxian', '应县', '县', 39.55424700, 113.19109900),
(101100906, 140624, 1009, 3, 4, 'huairen', '怀仁', '县', 39.82827500, 113.09398100),
(101100907, 140602, 1009, 3, 5, 'shuocheng', '朔城', '区', 39.32600300, 112.43856300),
(101101001, 140901, 1010, 3, 3, 'xinzhou', '忻州', '市', 38.41932900, 112.74830000),
(101101002, 140921, 1010, 3, 4, 'dingxiang', '定襄', '县', 38.47852400, 112.96042600),
(101101003, 140922, 1010, 3, 4, 'wutai', '五台', '县', 38.72831500, 113.25530900),
(101101004, 140930, 1010, 3, 4, 'hequ', '河曲', '县', 39.38448200, 111.13847200),
(101101005, 140932, 1010, 3, 4, 'pianguan', '偏关', '县', 39.43630600, 111.50883100),
(101101006, 140927, 1010, 3, 4, 'shenchi', '神池', '县', 39.08285700, 112.19934400),
(101101007, 140925, 1010, 3, 4, 'ningwu', '宁武', '县', 39.00085800, 112.31529000),
(101101008, 140923, 1010, 3, 4, 'daixian', '代县', '县', 39.07662000, 112.98414800),
(101101009, 140924, 1010, 3, 4, 'fanshi', '繁峙', '县', 39.16317500, 113.27453300),
(101101010, 0, 1010, 3, 0, 'wutaishan', '五台山', '县', 39.26603800, 113.56599500),
(101101011, 140931, 1010, 3, 4, 'bode', '保德', '县', 39.02248800, 111.08656400),
(101101012, 140926, 1010, 3, 4, 'jingle', '静乐', '县', 38.35903600, 111.93944000),
(101101013, 140929, 1010, 3, 4, 'kelan', '岢岚', '县', 38.72463200, 111.58724900),
(101101014, 140928, 1010, 3, 4, 'wuzhai', '五寨', '县', 38.91738600, 111.83393000),
(101101015, 140981, 1010, 3, 4, 'yuanping', '原平', '市', 38.72758100, 112.72768000),
(101101016, 140902, 1010, 3, 5, 'xinfuqu', '忻府', '区', 38.43783200, 112.60520000),
(101101100, 141101, 1011, 3, 3, 'lvliang', '吕梁', '市', 37.52520500, 111.15102500),
(101101101, 141102, 1011, 3, 5, 'lvlianglishi', '吕梁离石', '区', 37.52344700, 111.15712000),
(101101102, 141124, 1011, 3, 4, 'linxian', '临县', '县', 37.95075800, 110.99209400),
(101101103, 141123, 1011, 3, 4, 'xingxian', '兴县', '县', 38.46239000, 111.12766800),
(101101104, 141127, 1011, 3, 4, 'lanxian', '岚县', '县', 38.27929900, 111.67191700),
(101101105, 141125, 1011, 3, 4, 'liulin', '柳林', '县', 37.42983200, 110.88907100),
(101101106, 141126, 1011, 3, 4, 'shilou', '石楼', '县', 36.99849400, 110.83450500),
(101101107, 141128, 1011, 3, 4, 'fangshan1', '方山', '县', 37.89463100, 111.24409800),
(101101108, 141130, 1011, 3, 4, 'jiaokou', '交口', '县', 36.98218600, 111.18115100),
(101101109, 141129, 1011, 3, 4, 'zhongyang', '中阳', '县', 37.35705800, 111.17965700),
(101101110, 141181, 1011, 3, 4, 'xiaoyi', '孝义', '市', 37.14629400, 111.77881800),
(101101111, 141182, 1011, 3, 4, 'fenyang', '汾阳', '市', 37.37139200, 111.90800100),
(101101112, 141121, 1011, 3, 4, 'wenshui', '文水', '县', 37.43915300, 112.07831700),
(101101113, 141122, 1011, 3, 4, 'jiaocheng', '交城', '县', 37.53679600, 112.23539000),
(101110101, 610101, 1101, 3, 3, 'xian', '西安', '市', 34.27791600, 108.96281700),
(101110102, 610116, 1101, 3, 5, 'changan', '长安', '区', 34.15889200, 108.90693400),
(101110103, 610115, 1101, 3, 5, 'lintong', '临潼', '区', 34.36728700, 109.21423600),
(101110104, 610122, 1101, 3, 4, 'lantian', '蓝田', '县', 34.15130600, 109.32340800),
(101110105, 610124, 1101, 3, 4, 'zhouzhi', '周至', '县', 34.16331400, 108.22197300),
(101110106, 610125, 1101, 3, 4, 'huxian', '户县', '县', 34.10860800, 108.60525800),
(101110107, 610117, 1101, 3, 5, 'gaoling', '高陵', '区', 34.53483500, 109.08829200),
(101110108, 610102, 1101, 3, 5, 'xincheng', '新城', '区', 34.27147400, 108.99153900),
(101110109, 610103, 1101, 3, 5, 'beilin', '碑林', '区', 34.25548500, 108.96625900),
(101110110, 610104, 1101, 3, 5, 'lianhuqu', '莲湖', '区', 34.27319200, 108.91554700),
(101110111, 610111, 1101, 3, 5, 'baqiaoqu', '灞桥', '区', 34.30391500, 109.10875500),
(101110112, 610112, 1101, 3, 5, 'weiyangqu', '未央', '区', 34.33133100, 108.92646200),
(101110113, 610113, 1101, 3, 5, 'yantaqu', '雁塔', '区', 34.22141500, 108.93879000),
(101110114, 610114, 1101, 3, 5, 'yanliangqu', '阎良', '区', 34.68637300, 109.31341700),
(101110200, 610401, 1102, 3, 3, 'xianyang', '咸阳', '市', 34.34392200, 108.73894000),
(101110201, 610422, 1102, 3, 4, 'sanyuan', '三原', '市', 34.60491500, 108.94772700),
(101110202, 610425, 1102, 3, 4, 'liquan', '礼泉', '县', 34.48176400, 108.42501800),
(101110203, 610426, 1102, 3, 4, 'yongshou', '永寿', '县', 34.69197900, 108.14231100),
(101110204, 610430, 1102, 3, 4, 'chunhua', '淳化', '县', 34.79925000, 108.58068100),
(101110205, 610423, 1102, 3, 4, 'jingyang', '泾阳', '县', 34.52711400, 108.84262300),
(101110206, 610431, 1102, 3, 4, 'wugong', '武功', '县', 34.25791100, 108.20506300),
(101110207, 610424, 1102, 3, 4, 'qianxian', '乾县', '县', 34.52755100, 108.23947300),
(101110208, 610427, 1102, 3, 4, 'binxian1', '彬县', '县', 35.04391100, 108.07765800),
(101110209, 610428, 1102, 3, 4, 'changwu', '长武', '县', 35.20588600, 107.79875700),
(101110210, 610429, 1102, 3, 4, 'xunyi', '旬邑', '县', 35.11197800, 108.33398600),
(101110211, 610481, 1102, 3, 4, 'xingping', '兴平', '市', 34.28828900, 108.48915100),
(101110212, 610402, 1102, 3, 5, 'qinduqu', '秦都', '区', 34.35428500, 108.68341500),
(101110213, 610403, 1102, 3, 4, 'yangling', '杨陵', '区', 34.29019900, 108.05873800),
(101110214, 610404, 1102, 3, 5, 'weicheng', '渭城', '区', 34.42385300, 108.81731200),
(101110300, 610601, 1103, 3, 3, 'yanan', '延安', '市', 36.55677200, 109.48158000),
(101110301, 610621, 1103, 3, 4, 'yanchang', '延长', '县', 36.57931300, 110.01233400),
(101110302, 610622, 1103, 3, 4, 'yanchuan', '延川', '县', 36.87811700, 110.19351400),
(101110303, 610623, 1103, 3, 4, 'zichang', '子长', '县', 37.15063100, 109.74880100),
(101110304, 610630, 1103, 3, 4, 'yichuan', '宜川', '县', 36.05017800, 110.16896300),
(101110305, 610628, 1103, 3, 4, 'fuxian', '富县', '县', 36.01054500, 109.38270000),
(101110306, 610625, 1103, 3, 4, 'zhidan', '志丹', '县', 36.82219400, 108.76843200),
(101110307, 610603, 1103, 3, 5, 'ansai', '安塞', '区', 36.86385400, 109.32884200),
(101110308, 610627, 1103, 3, 4, 'ganquan', '甘泉', '县', 36.27652600, 109.35102000),
(101110309, 610629, 1103, 3, 4, 'luochuan', '洛川', '县', 35.76197500, 109.43236900),
(101110310, 610632, 1103, 3, 4, 'huangling', '黄陵', '县', 35.59651800, 109.26496000),
(101110311, 610631, 1103, 3, 4, 'huanglong', '黄龙', '县', 35.58446700, 109.84037300),
(101110312, 610626, 1103, 3, 4, 'wuqi', '吴起', '县', 36.92721600, 108.17593300),
(101110313, 610602, 1103, 3, 5, 'baotaqu', '宝塔', '区', 36.57599200, 109.64860200),
(101110401, 610801, 1104, 3, 3, 'yulin', '榆林', '市', 38.29088600, 109.74119500),
(101110402, 610822, 1104, 3, 4, 'fugu', '府谷', '县', 39.02811600, 111.06727600),
(101110403, 610821, 1104, 3, 4, 'shenmu', '神木', '县', 38.86211900, 110.48769000),
(101110404, 610828, 1104, 3, 4, 'jiaxian', '佳县', '县', 38.01951100, 110.49134500),
(101110405, 610825, 1104, 3, 4, 'dingbian', '定边', '县', 37.56899200, 107.57942000),
(101110406, 610824, 1104, 3, 4, 'jingbian', '靖边', '县', 37.61978600, 108.75573000),
(101110407, 610803, 1104, 3, 5, 'hengshan', '横山', '区', 37.96220900, 109.29434600),
(101110408, 610827, 1104, 3, 4, 'mizhi', '米脂', '县', 37.74831200, 110.17389300),
(101110409, 610831, 1104, 3, 4, 'zizhou', '子洲', '县', 37.60907100, 109.95352500),
(101110410, 610826, 1104, 3, 4, 'suide', '绥德', '县', 37.54803400, 110.26233500),
(101110411, 610829, 1104, 3, 4, 'wubu', '吴堡', '县', 37.45942600, 110.74102500),
(101110412, 610830, 1104, 3, 4, 'qingjian', '清涧', '县', 37.08887800, 110.12120900),
(101110413, 610802, 1104, 3, 5, 'yuyang', '榆阳', '区', 38.28249600, 109.72779000),
(101110414, 0, 1104, 3, 5, 'yuyangqu', '榆阳', '区', 38.38640700, 109.64269200),
(101110501, 610501, 1105, 3, 3, 'weinan', '渭南', '市', 34.48414700, 109.49379800),
(101110502, 0, 1105, 3, 4, 'huaxian', '华县', '县', 34.51271100, 109.77200300),
(101110503, 610522, 1105, 3, 4, 'tongguan', '潼关', '县', 34.53518400, 110.24775800),
(101110504, 610523, 1105, 3, 4, 'dali', '大荔', '县', 34.79718400, 109.94165800),
(101110505, 610527, 1105, 3, 4, 'baishui', '白水', '县', 35.17745200, 109.59067100),
(101110506, 610528, 1105, 3, 4, 'fuping1', '富平', '县', 34.75108600, 109.18033100),
(101110507, 610526, 1105, 3, 4, 'pucheng', '蒲城', '县', 34.93455700, 109.56006200),
(101110508, 610525, 1105, 3, 4, 'chengcheng', '澄城', '县', 35.19024500, 109.93235000),
(101110509, 610524, 1105, 3, 4, 'heyang', '合阳', '县', 35.19623900, 110.09021100),
(101110510, 610581, 1105, 3, 4, 'hancheng', '韩城', '市', 35.48470200, 110.44182000),
(101110511, 610582, 1105, 3, 4, 'huayin', '华阴', '市', 34.56609600, 110.09230100),
(101110512, 610502, 1105, 3, 5, 'linweiqu', '临渭', '区', 34.55352000, 109.56474600),
(101110513, 610503, 1105, 3, 5, 'huazhouqu', '华州', '区', 34.51750200, 109.77350800),
(101110601, 611001, 1106, 3, 3, 'shangluo', '商洛', '市', 33.82226400, 110.01868900),
(101110602, 611021, 1106, 3, 4, 'luonan', '洛南', '县', 34.09083800, 110.14850900),
(101110603, 611026, 1106, 3, 4, 'zhashui', '柞水', '县', 33.63882800, 109.14639200),
(101110604, 611002, 1106, 3, 5, 'shangzhou', '商州', '区', 33.86907400, 109.94753200),
(101110605, 611025, 1106, 3, 4, 'zhenan', '镇安', '县', 33.42127500, 109.17016700),
(101110606, 611022, 1106, 3, 4, 'danfeng', '丹凤', '县', 33.67906100, 110.35451400),
(101110607, 611023, 1106, 3, 4, 'shangnan', '商南', '县', 33.52665700, 110.90134900),
(101110608, 611024, 1106, 3, 4, 'shanyang', '山阳', '县', 33.53217200, 109.88229000),
(101110701, 610901, 1107, 3, 3, 'ankang', '安康', '市', 32.71337900, 109.01737700),
(101110702, 610924, 1107, 3, 4, 'ziyang', '紫阳', '县', 32.52472700, 108.55067800),
(101110703, 610922, 1107, 3, 4, 'shiquan', '石泉', '县', 33.03840800, 108.24788700),
(101110704, 610921, 1107, 3, 4, 'hanyin', '汉阴', '县', 32.87683400, 108.50620600),
(101110705, 610928, 1107, 3, 4, 'xunyang', '旬阳', '县', 32.83643000, 109.35342600),
(101110706, 610925, 1107, 3, 4, 'langao', '岚皋', '县', 32.30700100, 108.90204900),
(101110707, 610926, 1107, 3, 4, 'pingli', '平利', '县', 32.38885400, 109.36186400),
(101110708, 610929, 1107, 3, 4, 'baihe', '白河', '县 ', 32.80902600, 110.11262900),
(101110709, 610927, 1107, 3, 4, 'zhenping', '镇坪', '县', 31.88367200, 109.52687300),
(101110710, 610923, 1107, 3, 4, 'ningshan', '宁陕', '县', 33.31052700, 108.31428300),
(101110711, 610902, 1107, 3, 5, 'hanbinqu', '汉滨', '区', 32.81446400, 108.89624300),
(101110801, 610701, 1108, 3, 3, 'hanzhong', '汉中', '市', 33.09075000, 107.02999200),
(101110802, 610727, 1108, 3, 4, 'lueyang', '略阳', '县', 33.33041600, 106.14567000),
(101110803, 610725, 1108, 3, 4, 'mianxian', '勉县', '县', 33.17010500, 106.69268100),
(101110804, 610729, 1108, 3, 4, 'liuba', '留坝', '县', 33.61757100, 106.92080800),
(101110805, 610723, 1108, 3, 4, 'yangxian', '洋县', '县', 33.22273900, 107.54583700),
(101110806, 610722, 1108, 3, 4, 'chenggu', '城固', '县', 33.13892000, 107.32280100),
(101110807, 610724, 1108, 3, 4, 'xixiang', '西乡', '县', 32.99430600, 107.76094700),
(101110808, 610730, 1108, 3, 4, 'fuoping', '佛坪', '县', 33.52435900, 107.99053900),
(101110809, 610726, 1108, 3, 4, 'ningqiang', '宁强', '县', 32.82969400, 106.25717100),
(101110810, 610721, 1108, 3, 4, 'nanzheng', '南郑', '县', 32.99933400, 106.93623000),
(101110811, 610728, 1108, 3, 4, 'zhenba', '镇巴', '县', 32.53670400, 107.89503500),
(101110812, 610702, 1108, 3, 5, 'hantaiqu', '汉台', '区', 33.18720400, 107.04616700),
(101110901, 610301, 1109, 3, 3, 'baoji', '宝鸡', '市', 34.37365600, 107.15325200),
(101110903, 610328, 1109, 3, 4, 'qianyang', '千阳', '县', 34.63492900, 107.11581500),
(101110904, 610329, 1109, 3, 4, 'linyou', '麟游', '县', 34.67790200, 107.79352500),
(101110905, 610323, 1109, 3, 4, 'qishan', '岐山', '县', 34.27565300, 107.60869100),
(101110906, 610322, 1109, 3, 4, 'fengxiang', '凤翔', '县', 34.46160700, 107.25000800),
(101110907, 610324, 1109, 3, 4, 'fufeng', '扶风', '县', 34.37541100, 107.90021900),
(101110908, 610326, 1109, 3, 4, 'meixian', '眉县', '县', 34.27424700, 107.74976700),
(101110909, 610331, 1109, 3, 4, 'taibai', '太白', '县', 34.05840100, 107.31911600),
(101110910, 610330, 1109, 3, 4, 'fengxian1', '凤县', '县', 33.90496400, 106.50691100),
(101110911, 610327, 1109, 3, 4, 'longxian', '陇县', '县', 34.87061100, 106.85056000),
(101110912, 610304, 1109, 3, 5, 'chencang', '陈仓', '区', 34.35445600, 107.38743600),
(101110913, 610302, 1109, 3, 5, 'weibin', '渭滨', '区', 34.31102700, 107.10824400),
(101110914, 610303, 1109, 3, 5, 'jintaiqu', '金台', '区', 34.40317500, 107.11761400),
(101111001, 610201, 1110, 3, 3, 'tongchuan', '铜川', '市', 35.06170000, 109.07462800),
(101111002, 0, 1110, 3, 4, 'yaoxian', '耀县', '县', 34.89879900, 108.95656300),
(101111003, 610222, 1110, 3, 4, 'yijun', '宜君', '县', 35.39857700, 109.11693200),
(101111004, 610204, 1110, 3, 5, 'yaozhou', '耀州', '区', 34.90891600, 108.98051400),
(101111005, 610202, 1110, 3, 5, 'wangyiqu', '王益', '区', 35.07004100, 109.06850400),
(101111006, 610203, 1110, 3, 5, 'yintaiqu', '印台', '区', 35.16093400, 109.18538600),
(101120101, 370101, 1201, 3, 3, 'jinan', '济南', '市', 36.67162110, 117.00131410),
(101120102, 370113, 1201, 3, 5, 'changqing', '长清', '区', 36.55357100, 116.75193700),
(101120103, 370126, 1201, 3, 4, 'shanghe', '商河', '县', 37.30904500, 117.15718300),
(101120104, 370181, 1201, 3, 4, 'zhangqiu', '章丘', '市', 36.72184400, 117.49907700),
(101120105, 370124, 1201, 3, 4, 'pingyin', '平阴', '县', 36.28926500, 116.45618700),
(101120106, 370125, 1201, 3, 4, 'jiyang', '济阳', '市', 36.97853700, 117.17352500),
(101120107, 511102, 1201, 3, 5, 'jinanshizhong', '济南市中', '区', 36.65736700, 117.00419100),
(101120108, 370102, 1201, 3, 5, 'lixiaqu', '历下', '区', 36.65933900, 117.10158600),
(101120109, 0, 1201, 3, 5, 'kuaiyinqu', '槐荫 ', '区', 36.68278500, 117.02496700),
(101120110, 370105, 1201, 3, 5, 'tianqiaoqu', '天桥', '区', 36.77807800, 116.98315700),
(101120112, 370112, 1201, 3, 5, 'jinanlicheng', '历城', '区', 36.71399500, 117.08484400),
(101120114, 370104, 1201, 3, 5, 'jinanhuaiyin', '槐荫', '区', 36.65737800, 116.90639900),
(101120201, 370201, 1202, 3, 3, 'qingdao', '青岛', '市', 36.06356400, 120.31255000),
(101120202, 370212, 1202, 3, 5, 'laoshan', '崂山', '市', 36.10753800, 120.46895600),
(101120204, 370282, 1202, 3, 4, 'jimo', '即墨', '市', 36.38940200, 120.44716100),
(101120205, 370281, 1202, 3, 4, 'jiaozhou', '胶州', '市', 36.29843500, 119.99947200),
(101120206, 370281, 1202, 3, 4, 'jiaonan', '胶南', '市', 36.83203700, 120.53074300),
(101120207, 370285, 1202, 3, 4, 'laixi', '莱西', '市', 36.88908400, 120.51769000),
(101120208, 370283, 1202, 3, 4, 'pingdu', '平度', '市', 36.77635800, 119.98842000),
(101120209, 370211, 1202, 3, 5, 'huangdao', '黄岛', '区', 36.00501900, 120.16954100),
(101120210, 370203, 1202, 3, 5, 'shibeiqu', '市北', '区', 36.10005800, 120.37849500),
(101120212, 370202, 1202, 3, 5, 'shinan', '市南', '区', 36.07533100, 120.42350000),
(101120213, 370213, 1202, 3, 5, 'licangqu', '李沧', '区', 36.19289700, 120.43114600),
(101120214, 370214, 1202, 3, 5, 'chengyangqu', '城阳', '区', 36.28424700, 120.34632600),
(101120301, 370301, 1203, 3, 3, 'zibo', '淄博', '市', 36.78728900, 118.05711000),
(101120302, 370302, 1203, 3, 5, 'zichuan', '淄川', '市', 36.64345200, 117.96672300),
(101120303, 370304, 1203, 3, 5, 'boshan', '博山', '区', 36.49471500, 117.86165700),
(101120304, 370322, 1203, 3, 4, 'gaoqing', '高青', '区', 37.17106300, 117.82691600),
(101120305, 370306, 1203, 3, 5, 'zhoucun', '周村', '区', 36.80307200, 117.86988600),
(101120306, 370323, 1203, 3, 4, 'yiyuan', '沂源', '县', 36.18503800, 118.17085600),
(101120307, 370321, 1203, 3, 4, 'huantai', '桓台', '县', 36.95980400, 118.09792300),
(101120308, 370305, 1203, 3, 5, 'linzi', '临淄', '区', 36.82698100, 118.30911800),
(101120309, 370303, 1203, 3, 5, 'zhangdianqu', '张店', '区', 36.81609700, 118.07715100),
(101120401, 371401, 1204, 3, 3, 'dezhou', '德州', '市', 37.45998800, 116.28717000),
(101120402, 371428, 1204, 3, 4, 'wucheng', '武城', '县', 37.21331100, 116.06930200),
(101120403, 371424, 1204, 3, 4, 'linyi1', '临邑', '县', 37.18979800, 116.86680000),
(101120404, 371403, 1204, 3, 5, 'lingxian', '陵城', '区', 37.33579400, 116.57609200),
(101120405, 371425, 1204, 3, 4, 'qihe', '齐河', '县', 36.78341500, 116.76281000),
(101120406, 371481, 1204, 3, 4, 'leling', '乐陵', '市', 37.72990700, 117.23193500),
(101120407, 371423, 1204, 3, 4, 'qingyun', '庆云', '县', 37.77535000, 117.38525700),
(101120408, 371426, 1204, 3, 4, 'pingyuan', '平原', '县', 37.16987900, 116.44040900),
(101120409, 371422, 1204, 3, 4, 'ningjin1', '宁津', '县', 37.65219000, 116.80030600),
(101120410, 371427, 1204, 3, 4, 'xiajin', '夏津', '县', 36.94837100, 116.00172600),
(101120411, 371482, 1204, 3, 4, 'yucheng', '禹城', '市', 36.92402300, 116.63332900),
(101120412, 371402, 1204, 3, 5, 'decheng', '德城', '区', 37.45722800, 116.30592600),
(101120501, 370601, 1205, 3, 3, 'yantai', '烟台', '市', 37.54855800, 121.38278300),
(101120502, 370683, 1205, 3, 4, 'laizhou', '莱州', '市', 37.17701700, 119.94232700),
(101120503, 370634, 1205, 3, 4, 'changdao', '长岛', '县', 37.92136800, 120.73658000),
(101120504, 370684, 1205, 3, 4, 'penglai', '蓬莱', '市', 37.81066100, 120.75884800),
(101120505, 370681, 1205, 3, 4, 'longkou', '龙口', '县', 37.64606400, 120.47783600),
(101120506, 370685, 1205, 3, 4, 'zhaoyuan1', '招远', '市', 37.35546900, 120.43407200),
(101120507, 370686, 1205, 3, 4, 'qixia', '栖霞', '市', 37.33512300, 120.84967500),
(101120508, 370611, 1205, 3, 5, 'fushan1', '福山', '区', 37.49824600, 121.26774100),
(101120509, 370612, 1205, 3, 5, 'muping', '牟平', '区', 37.38690100, 121.60051200),
(101120510, 370682, 1205, 3, 4, 'laiyang', '莱阳', '市', 36.97894100, 120.71167300),
(101120511, 370687, 1205, 3, 4, 'haiyang', '海阳', '市', 37.08054700, 120.99767800),
(101120512, 370602, 1205, 3, 5, 'zhifuqu', '芝罘', '区', 37.52093300, 121.36415600),
(101120513, 370613, 1205, 3, 5, 'laishanqu', '莱山', '区', 37.40747600, 121.45153500),
(101120601, 370701, 1206, 3, 3, 'weifang', '潍坊', '市', 36.69646000, 119.09788900),
(101120602, 370781, 1206, 3, 4, 'qingzhou', '青州', '市', 36.68452800, 118.47962200),
(101120603, 370783, 1206, 3, 4, 'shouguang', '寿光', '市', 36.85548000, 118.79065200),
(101120604, 370724, 1206, 3, 4, 'linqu', '临朐', '县', 36.51250600, 118.54298200),
(101120605, 370725, 1206, 3, 4, 'changle', '昌乐', '县', 36.71108400, 118.83904000),
(101120606, 370786, 1206, 3, 4, 'changyi', '昌邑', '市', 36.85882000, 119.39852500),
(101120607, 370784, 1206, 3, 4, 'anqiu', '安丘', '市', 36.47849400, 119.21897800),
(101120608, 370785, 1206, 3, 4, 'gaomi', '高密', '市', 36.39308900, 119.76809800),
(101120609, 370782, 1206, 3, 4, 'zhucheng', '诸城', '市', 36.06314000, 119.38901400),
(101120610, 131002, 1206, 3, 5, 'anciqu', '安次', '区', 39.34531200, 116.79612300),
(101120611, 131003, 1206, 3, 5, 'guangyangqu', '广阳', '区', 39.53368600, 116.69423600),
(101120612, 370702, 1206, 3, 5, 'weichengqu', '潍城', '区', 36.70198200, 119.03430500),
(101120613, 370703, 1206, 3, 5, 'hantingququ', '寒亭', '区', 36.90836600, 119.17913500),
(101120614, 370704, 1206, 3, 5, 'fangziqu', '坊子', '区', 36.62567400, 119.25846500),
(101120615, 370705, 1206, 3, 5, 'kuiwenqu', '奎文', '区', 36.69122700, 119.19697200),
(101120701, 370801, 1207, 3, 3, 'jining1', '济宁', '市', 35.39211900, 116.60145400),
(101120702, 370829, 1207, 3, 4, 'jiaxiang', '嘉祥', '县', 35.39226400, 116.35848300),
(101120703, 370826, 1207, 3, 4, 'weishan', '微山', '县', 34.80713900, 117.12881400),
(101120704, 370827, 1207, 3, 4, 'yutai', '鱼台', '县', 35.01274900, 116.65060800),
(101120705, 370812, 1207, 3, 5, 'yanzhou', '兖州', '区', 35.56702400, 116.83744000),
(101120706, 370828, 1207, 3, 4, 'jinxiang', '金乡', '县', 35.06662000, 116.31153200),
(101120707, 370830, 1207, 3, 4, 'wenshang', '汶上', '县', 35.73279900, 116.48904300),
(101120708, 370831, 1207, 3, 4, 'sishui', '泗水', '县', 35.63595800, 117.26152800),
(101120709, 370832, 1207, 3, 4, 'liangshan', '梁山', '县', 35.81931400, 115.93665400),
(101120710, 370881, 1207, 3, 4, 'qufu', '曲阜', '市', 35.58270600, 117.03062900),
(101120711, 370883, 1207, 3, 4, 'zoucheng', '邹城', '市', 35.40040000, 116.95787900),
(101120712, 370811, 1207, 3, 5, 'renchengqu', '任城', '区', 35.38013500, 116.57219900),
(101120801, 370901, 1208, 3, 3, 'taian1', '泰安', '市', 36.17186700, 117.03424500),
(101120802, 370982, 1208, 3, 4, 'xintai', '新泰', '市', 35.90903200, 117.76795300),
(101120804, 370983, 1208, 3, 4, 'feicheng', '肥城', '市', 36.18257100, 116.76835800),
(101120805, 370923, 1208, 3, 4, 'dongping', '东平', '县', 35.93710200, 116.47030400),
(101120806, 370921, 1208, 3, 4, 'ningyang', '宁阳', '县', 35.75878700, 116.80579700),
(101120807, 370902, 1208, 3, 5, 'taishanqu', '泰山', '区', 36.21545700, 117.18390200),
(101120808, 370911, 1208, 3, 5, 'daiyuequ', '岱岳', '区', 36.14810100, 117.19048700),
(101120901, 371301, 1209, 3, 3, 'linyi2', '临沂', '市', 35.03619100, 118.34406300),
(101120902, 371327, 1209, 3, 4, 'junan', '莒南', '县', 35.18378000, 118.84771000),
(101120903, 371321, 1209, 3, 4, 'yinan', '沂南', '县', 35.48721000, 118.61996500),
(101120904, 0, 1209, 3, 0, 'cangshan', '苍山', '', 34.89792800, 118.11897300),
(101120905, 371329, 1209, 3, 4, 'linshu', '临沭', '县', 34.91985200, 118.65078200),
(101120906, 371322, 1209, 3, 4, 'tancheng', '郯城', '县', 34.60213200, 118.37751400),
(101120907, 371328, 1209, 3, 4, 'mengyin', '蒙阴', '县', 35.71003200, 117.94508500),
(101120908, 371326, 1209, 3, 4, 'pingyi', '平邑', '县', 35.51697400, 117.64400700),
(101120909, 371325, 1209, 3, 4, 'feixian', '费县', '县', 35.27828700, 117.97996900),
(101120910, 371323, 1209, 3, 4, 'yishui', '沂水', '县', 35.64326000, 118.72786200),
(101120911, 371302, 1209, 3, 5, 'lanshanqu', '兰山', '区', 35.17484500, 118.31224300),
(101120912, 371311, 1209, 3, 5, 'luozhuangqu', '罗庄', '区', 34.96434300, 118.29727900),
(101120913, 371312, 1209, 3, 5, 'lingyihedong', '临沂河东', '区', 35.09583000, 118.40963400),
(101120924, 371324, 1209, 3, 4, 'lanling', '兰陵', '县', 34.74416800, 117.85813500),
(101121001, 371701, 1210, 3, 3, 'heze', '菏泽', '市', 35.23063700, 115.50780600),
(101121002, 371726, 1210, 3, 4, 'juancheng', '鄄城', '县', 35.42221200, 115.67021900),
(101121003, 371725, 1210, 3, 4, 'yuncheng1', '郓城', '县', 35.60184300, 115.90074600),
(101121004, 371728, 1210, 3, 4, 'dongming', '东明', '县', 35.28936800, 115.08990500),
(101121005, 371703, 1210, 3, 5, 'dingtao', '定陶', '区', 35.06480500, 115.59607000),
(101121006, 371724, 1210, 3, 4, 'juye', '巨野', '县', 35.37866100, 116.08792300),
(101121007, 371721, 1210, 3, 4, 'caoxian', '曹县', '县', 34.82603500, 115.58253300),
(101121008, 371723, 1210, 3, 4, 'chengwu', '成武', '县', 34.95245900, 115.88976500),
(101121009, 371722, 1210, 3, 4, 'shanxian', '单县', '县', 34.77880800, 116.10742800),
(101121010, 371702, 1210, 3, 5, 'mudanqu', '牡丹', '区', 35.28353700, 115.47002500),
(101121101, 371601, 1211, 3, 3, 'binzhou', '滨州', '市', 37.41081400, 118.06893400),
(101121102, 371625, 1211, 3, 4, 'boxing', '博兴', '县', 37.14733900, 118.14116000),
(101121103, 371623, 1211, 3, 4, 'wudi', '无棣', '县', 37.77026100, 117.62569600),
(101121104, 371622, 1211, 3, 4, 'yangxin', '阳信', '县', 37.64110600, 117.57826200),
(101121105, 371621, 1211, 3, 4, 'huimin', '惠民', '市', 37.48976900, 117.51045100),
(101121106, 371603, 1211, 3, 5, 'zhanhua', '沾化', '区', 37.69828100, 118.13219900),
(101121107, 371626, 1211, 3, 4, 'zouping', '邹平', '县', 36.86298900, 117.74310900),
(101121108, 371602, 1211, 3, 5, 'binxianqu', '滨城', '区', 37.42489100, 117.98121100),
(101121201, 370501, 1212, 3, 3, 'dongying', '东营', '市', 37.45518900, 118.47223100),
(101121202, 370503, 1212, 3, 5, 'hekou', '河口', '区', 37.88616200, 118.52554300),
(101121203, 370505, 1212, 3, 5, 'kenli', '垦利', '县', 37.57235600, 118.57540900),
(101121204, 370522, 1212, 3, 4, 'lijin', '利津', '县', 37.49026000, 118.25527300),
(101121205, 370523, 1212, 3, 4, 'guangrao', '广饶', '县', 37.05355500, 118.40710700),
(101121212, 370502, 1212, 3, 5, 'dongyingqu', '东营', '区', 37.45416100, 118.58428000),
(101121301, 371001, 1213, 3, 3, 'weihai', '威海', '市', 37.42417000, 122.14381200),
(101121302, 371003, 1213, 3, 5, 'wendeng', '文登', '区', 37.17953600, 121.99072900),
(101121303, 371082, 1213, 3, 4, 'rongcheng2', '荣成', '市', 37.16516000, 122.48665800),
(101121304, 371083, 1213, 3, 4, 'rushan', '乳山', '市', 36.99666100, 121.50713400),
(101121305, 0, 1213, 3, 0, 'chengshantou', '成山头', '', 37.41218300, 122.69682200),
(101121306, 0, 1213, 3, 0, 'shidao', '石岛', '区', 36.88943200, 122.42876900),
(101121307, 371002, 1213, 3, 5, 'huancuiqu', '环翠', '区', 37.39934400, 122.15207500),
(101121401, 370401, 1214, 3, 3, 'zaozhuang', '枣庄', '市', 34.81597710, 117.33015410),
(101121402, 370403, 1214, 3, 5, 'xuecheng', '薛城', '区', 34.80114100, 117.26965900),
(101121403, 370404, 1214, 3, 5, 'yicheng1', '峄城', '区', 34.77326300, 117.59081600),
(101121404, 370405, 1214, 3, 5, 'taierzhuang', '台儿庄', '区', 34.56252800, 117.73383200),
(101121405, 370481, 1214, 3, 4, 'tengzhou', '滕州', '市', 35.07991000, 117.15340000),
(101121406, 511102, 1214, 3, 5, 'shizhongqu', '枣庄市中', '区', 34.87112400, 117.56521900),
(101121407, 370406, 1214, 3, 5, 'shantingququ', '山亭', '区', 35.09315000, 117.48403600),
(101121501, 371101, 1215, 3, 3, 'rizhao', '日照', '市', 35.40506300, 119.53254200),
(101121502, 371121, 1215, 3, 4, 'wulian', '五莲', '县', 35.80573500, 119.20716900),
(101121503, 371122, 1215, 3, 4, 'juxian', '莒县', '县', 35.65226300, 118.84051500),
(101121504, 371102, 1215, 3, 5, 'donggangqu', '东港', '区', 35.46937700, 119.37785200),
(101121505, 371103, 1215, 3, 5, 'rizhaolanshan', '岚山', '区', 35.29271400, 119.25182500),
(101121601, 371201, 1216, 3, 3, 'laiwu', '莱芜', '市', 36.22956500, 117.69409700),
(101121602, 371202, 1216, 3, 5, 'laicheng', '莱城', '区', 36.20809800, 117.66645500),
(101121603, 371203, 1216, 3, 5, 'gangchengqu', '钢城', '区', 36.09283600, 117.82753700),
(101121701, 371501, 1217, 3, 3, 'liaocheng', '聊城', '市', 36.45705100, 115.94289500),
(101121702, 371525, 1217, 3, 4, 'guanxian', '冠县', '县', 36.48400900, 115.44274000),
(101121703, 371521, 1217, 3, 4, 'yanggu', '阳谷', '县', 36.10111300, 115.80991200),
(101121704, 371526, 1217, 3, 4, 'gaotang', '高唐', '县', 36.86582800, 116.23141600),
(101121705, 371523, 1217, 3, 4, 'chiping', '茌平', '县', 36.58068900, 116.25527000),
(101121706, 371524, 1217, 3, 4, 'donge', '东阿', '县', 36.33491700, 116.24758000),
(101121707, 371581, 1217, 3, 4, 'linqing', '临清', '市', 36.84208000, 115.73804700),
(101121709, 371522, 1217, 3, 4, 'shenxian', '莘县', '县', 36.23359900, 115.67119100),
(101121712, 371502, 1217, 3, 5, 'dongchangfu', '东昌府', '区', 36.44039100, 115.99533100),
(101130101, 650101, 1301, 3, 3, 'wulumuqi', '乌鲁木齐', '市', 43.76479300, 87.58277900),
(101130103, 650104, 1301, 3, 0, 'xiaoquzi', '小渠子', '', 43.52097800, 87.12405200),
(101130105, 650107, 1301, 3, 5, 'dabancheng', '达坂城', '区', 43.36366800, 88.31109900),
(101130108, 650104, 1301, 3, 4, 'wulumuqimushizhan', '乌市牧试站', '', 43.86788100, 87.56238700),
(101130109, 650104, 1301, 3, 0, 'tianchi', '天池', '', 43.78538000, 87.61492300),
(101130110, 650101, 1301, 3, 0, 'baiyanggou', '白杨沟', '', 43.66603900, 88.02339200),
(101130111, 650104, 1301, 3, 5, 'xinshiqu', '新市', '区', 38.88118300, 115.41224500),
(101130112, 650102, 1301, 3, 5, 'tianshan', '天山', '区', 43.78386000, 87.63290300),
(101130113, 650103, 1301, 3, 5, 'saybaghqu', '沙依巴克', '区', 43.80788600, 87.54563100),
(101130114, 650105, 1301, 3, 5, 'shuimogouqu', '水磨沟', '区', 43.84390700, 87.66801400),
(101130115, 650106, 1301, 3, 5, 'toutunhequ', '头屯河', '区', 43.92578900, 87.42504900),
(101130116, 650109, 1301, 3, 5, 'midongqu', '米东', '区', 44.07055400, 87.69118600),
(101130121, 650121, 1301, 3, 4, 'wulumuqixian', '乌鲁木齐', '县', 43.47648600, 87.41143000),
(101130201, 650201, 1302, 3, 3, 'kelamayi', '克拉玛依', '市', 45.52756900, 84.89512200),
(101130202, 650205, 1302, 3, 5, 'wuerhe', '乌尔禾', '区', 46.08914800, 85.69374200),
(101130203, 650204, 1302, 3, 5, 'baijiantan', '白碱滩', '区', 45.68785500, 85.13169600),
(101130204, 650202, 1302, 3, 5, 'dushanziqu', '独山子', '区', 44.30233800, 84.89991700),
(101130213, 650203, 1302, 3, 5, 'kelamayiqu', '克拉玛依', '区', 45.59674200, 84.85969900),
(101130301, 659001, 1303, 3, 3, 'shihezi', '石河子', '市', 44.31077300, 86.08718700),
(101130302, 0, 1303, 3, 4, 'paotai', '炮台', '', 47.31360700, 123.99265000),
(101130303, 0, 1303, 3, 4, 'mosuowan', '莫索湾', '市', 44.59995800, 86.09884400),
(101130401, 652301, 1304, 3, 4, 'changji', '昌吉', '市', 44.01267700, 87.30249300),
(101130402, 652323, 1304, 3, 4, 'hutubi', '呼图壁', '县', 44.19142800, 86.89890200),
(101130403, 0, 1304, 3, 4, 'miquan', '米泉', '市', 43.99718600, 87.30774600),
(101130404, 652302, 1304, 3, 4, 'fukang', '阜康', '市', 44.15702500, 87.98729100),
(101130405, 652327, 1304, 3, 4, 'jimusaer', '吉木萨尔', '县', 44.00049700, 89.18043700),
(101130406, 652325, 1304, 3, 4, 'qitai', '奇台', '县', 44.02206600, 89.59396700),
(101130407, 652324, 1304, 3, 4, 'manasi', '玛纳斯', '县', 44.30389300, 86.21399700),
(101130408, 652328, 1304, 3, 4, 'mulei', '木垒', '自治县', 43.83468900, 90.28602800),
(101130409, 0, 1304, 3, 4, 'caijiahu', '蔡家湖', '镇', 44.01118300, 87.30822500),
(101130501, 650401, 1305, 3, 3, 'tulufan', '吐鲁番', '市', 43.15101100, 88.87479300),
(101130502, 650422, 1305, 3, 4, 'tuokexun', '托克逊', '县', 42.79251900, 88.65377900),
(101130504, 650421, 1305, 3, 4, 'shanshan', '鄯善', '县', 43.09868000, 90.48353300),
(101130512, 650402, 1305, 3, 5, 'gaochang', '高昌', '区', 42.94574200, 89.19187400),
(101130601, 652801, 1306, 3, 4, 'kuerle', '库尔勒', '市', 41.74765600, 86.19522600),
(101130602, 652822, 1306, 3, 4, 'luntai', '轮台', '县', 41.77770200, 84.25215600),
(101130603, 652823, 1306, 3, 4, 'yuli', '尉犁', '县', 41.34393400, 86.26132100),
(101130604, 652824, 1306, 3, 4, 'ruoqiang', '若羌', '县', 39.02324200, 88.16715200),
(101130605, 652825, 1306, 3, 4, 'qiemo', '且末', '县', 38.14548600, 85.52970200),
(101130606, 652827, 1306, 3, 4, 'hejing', '和静', '县', 42.31092300, 86.37219900),
(101130607, 652826, 1306, 3, 4, 'yanqi', '焉耆', '自治县', 42.07638700, 86.54617800),
(101130608, 652828, 1306, 3, 4, 'heshuo', '和硕', '县', 42.26837100, 86.86396300),
(101130610, 652810, 1306, 3, 4, 'bayinbuluke', '巴音布鲁克', '镇', 43.00372200, 84.13455500),
(101130611, 652811, 1306, 3, 4, 'tieganlike', '铁干里克', '', 39.02878300, 88.17604700),
(101130612, 652829, 1306, 3, 4, 'bohu', '博湖', '县', 41.98015200, 86.63199800),
(101130613, 652813, 1306, 3, 4, 'tazhong', '塔中', '', 39.04754900, 83.64001400),
(101130614, 652814, 1306, 3, 4, 'baluntai', '巴仑台', '镇', 42.75534100, 86.32007100),
(101130616, 652800, 1306, 3, 3, 'bazhou1', '巴州', NULL, 41.74765600, 86.19522600),
(101130701, 659002, 1307, 3, 4, 'alaer', '阿拉尔', '市', 40.54765300, 81.28052700),
(101130801, 652901, 1308, 3, 4, 'akesu', '阿克苏', '市', 41.14420100, 80.30732000),
(101130802, 652927, 1308, 3, 4, 'wushi', '乌什', '县', 41.21465200, 79.22444500),
(101130803, 652922, 1308, 3, 4, 'wensu', '温宿', '县', 41.27668800, 80.23895900),
(101130804, 652926, 1308, 3, 4, 'baicheng1', '拜城', '县', 41.79691000, 81.87415600),
(101130805, 652925, 1308, 3, 4, 'xinhe1', '新和', '县', 41.57523900, 82.61976400),
(101130806, 652924, 1308, 3, 4, 'shaya', '沙雅', '县', 41.22166700, 82.78181900),
(101130807, 652923, 1308, 3, 4, 'kuche', '库车', '县', 41.69404200, 83.01663500),
(101130808, 652929, 1308, 3, 4, 'keping', '柯坪', '县', 40.39809800, 79.18208500),
(101130809, 652928, 1308, 3, 4, 'awati', '阿瓦提', '县', 40.64452900, 80.37313700),
(101130810, 0, 1308, 3, 4, 'awat', '阿瓦提', '县', 40.06078800, 80.43993200),
(101130901, 653101, 1309, 3, 3, 'kashi', '喀什', '区', 39.49195800, 76.05003100),
(101130902, 653123, 1309, 3, 4, 'yingjisha', '英吉沙', '县', 38.96810100, 76.16517700),
(101130903, 653131, 1309, 3, 4, 'tashikuergan', '塔什库尔干', '自治县', 37.77888800, 75.23493400),
(101130904, 653127, 1309, 3, 4, 'maigaiti', '麦盖提', '县', 38.90495700, 77.65268700),
(101130905, 653125, 1309, 3, 4, 'shache', '莎车', '县', 38.37443600, 77.23195400),
(101130906, 653126, 1309, 3, 4, 'yecheng', '叶城', '县', 37.89097700, 77.47148700),
(101130907, 653124, 1309, 3, 4, 'zepu', '泽普', '县', 38.17583500, 77.30205600),
(101130908, 653130, 1309, 3, 4, 'bachu', '巴楚', '县', 39.83620400, 78.54973100),
(101130909, 653128, 1309, 3, 4, 'yuepuhu', '岳普湖', '县', 39.22420000, 76.77316300),
(101130910, 653129, 1309, 3, 4, 'jiashi', '伽师', '县', 39.48818200, 76.72372000),
(101130911, 653121, 1309, 3, 4, 'shufu', '疏附', '县 ', 39.37504400, 75.86281400),
(101130912, 653122, 1309, 3, 4, 'shule', '疏勒', '县', 39.38239400, 75.99419600),
(101130921, 653101, 1309, 3, 4, 'tashishi', '喀什', '市', 39.46827600, 75.97026000),
(101131001, 654002, 1310, 3, 4, 'yining', '伊宁', '市', 43.96838000, 81.27800900),
(101131002, 654022, 1310, 3, 4, 'chabuchaer', '察布查尔', '自治县', 43.83538400, 81.16115100),
(101131003, 654028, 1310, 3, 4, 'nileke', '尼勒克', '县', 43.96715800, 82.04955000),
(101131004, 654021, 1310, 3, 4, 'yiningxian', '伊宁', '县', 43.97713800, 81.52745400),
(101131005, 654024, 1310, 3, 4, 'gongliu', '巩留', '县', 43.48262800, 82.23171800),
(101131006, 654025, 1310, 3, 4, 'xinyuan', '新源', '县', 43.42993000, 83.26077000),
(101131007, 654026, 1310, 3, 4, 'zhaosu', '昭苏', '县', 43.15729300, 81.13097500),
(101131008, 654027, 1310, 3, 4, 'tekesi', '特克斯', '县', 43.21718400, 81.83620600),
(101131009, 654023, 1310, 3, 4, 'huocheng', '霍城', '县', 44.05359200, 80.87418100),
(101131010, 654004, 1310, 3, 4, 'huoerguosi', '霍尔果斯', '市', 44.19119900, 80.42130900),
(101131011, 654003, 1310, 3, 4, 'kuitunshi', '奎屯', '市', 44.40310000, 84.90058700),
(101131101, 654201, 1311, 3, 3, 'tacheng', '塔城', '市', 46.74852300, 82.97892800),
(101131102, 654225, 1311, 3, 4, 'yumin', '裕民', '县', 46.20110400, 82.98266800),
(101131103, 654221, 1311, 3, 4, 'emin', '额敏', '县', 46.52467300, 83.62830300),
(101131104, 654226, 1311, 3, 4, 'hebukesaier', '和布克赛尔', '自治县', 46.79323500, 85.72832800),
(101131105, 654224, 1311, 3, 4, 'tuoli', '托里', '县', 45.94763800, 83.60695100),
(101131106, 654202, 1311, 3, 4, 'wusu', '乌苏', '市', 44.43550800, 84.67854900),
(101131107, 654223, 1311, 3, 4, 'shawan', '沙湾', '县', 44.32638800, 85.61941600),
(101131201, 650501, 1312, 3, 3, 'hami', '哈密', '市', 42.82725500, 93.51479700),
(101131202, 650502, 1312, 3, 5, 'hamiyizhou', '伊州', '区', 42.84985700, 93.50864500),
(101131203, 650521, 1312, 3, 4, 'balikun', '巴里坤', '自治县', 43.59876300, 93.01662500),
(101131204, 650522, 1312, 3, 4, 'yiwu', '伊吾', '县', 43.25497800, 94.69707400),
(101131301, 653201, 1313, 3, 3, 'hetian', '和田', '市', 37.12003100, 79.81907000),
(101131302, 653223, 1313, 3, 4, 'pishan', '皮山', '县', 37.56674100, 78.28537800),
(101131303, 653225, 1313, 3, 4, 'cele', '策勒', '县', 36.99833500, 80.80615900),
(101131304, 653222, 1313, 3, 4, 'moyu', '墨玉', '县', 37.22225500, 79.73266100),
(101131305, 653224, 1313, 3, 4, 'luopu', '洛浦', '县', 37.07366700, 80.18898600),
(101131306, 653227, 1313, 3, 4, 'mingfeng', '民丰', '县', 37.06408000, 82.69586200),
(101131307, 653226, 1313, 3, 4, 'yutian1', '于田', '县', 36.85708100, 81.67741800),
(101131321, 653221, 1313, 3, 4, 'ketian', '和田', '县', 37.09008200, 79.86506000),
(101131401, 654301, 1314, 3, 3, 'aletai', '阿勒泰', '市', 47.82730900, 88.13184200),
(101131402, 654324, 1314, 3, 4, 'habahe', '哈巴河', '县', 48.06084600, 86.41862100),
(101131405, 654326, 1314, 3, 4, 'jimunai', '吉木乃', '县', 47.44310100, 85.87409600),
(101131406, 654321, 1314, 3, 4, 'buerjin', '布尔津', '县', 47.70185000, 86.87489700),
(101131407, 654323, 1314, 3, 4, 'fuhai', '福海', '县', 47.12283600, 87.46244400),
(101131408, 654322, 1314, 3, 4, 'fuyun', '富蕴', '县', 46.99411500, 89.52550400),
(101131409, 654325, 1314, 3, 4, 'qinghe1', '青河', '县', 46.67420500, 90.38296100),
(101131501, 653001, 1315, 3, 4, 'atushi', '阿图什', '市', 39.71994600, 76.22269800),
(101131502, 653024, 1315, 3, 4, 'wuqia', '乌恰', '县', 39.71931000, 75.25922800),
(101131503, 653022, 1315, 3, 4, 'aketao', '阿克陶', '县', 39.15334000, 75.98268400),
(101131504, 653023, 1315, 3, 4, 'aheqi', '阿合奇', '县', 40.93693600, 78.44625300),
(101131505, 653000, 1315, 3, 3, 'kezhou', '克州', '自治州', 36.06457000, 103.84993100),
(101131601, 652701, 1316, 3, 4, 'bole', '博乐', '市', 44.93239000, 82.65137200),
(101131602, 652723, 1316, 3, 4, 'wenquan', '温泉', '县', 44.96885700, 81.02481600),
(101131603, 652722, 1316, 3, 4, 'jinghe', '精河', '县', 44.63662000, 83.02528200),
(101131606, 652702, 1316, 3, 4, 'alashankou', '阿拉山口', '市', 45.17040200, 82.57560900),
(101131607, 652700, 1316, 3, 3, 'bozhou', '博州', '', 27.67098100, 104.74976200),
(101131802, 659003, 1318, 3, 4, 'tumushuke', '图木舒克', '市', 39.88922300, 79.19815500),
(101131903, 659004, 1319, 3, 4, 'wujiaqu', '五家渠', '市', 44.17230510, 87.54996710),
(101132006, 659006, 1320, 3, 4, 'tiemenguan', '铁门关', '市', 39.97894710, 119.80848510),
(101140101, 540101, 1401, 3, 3, 'lasa', '拉萨', '市', 29.65004000, 91.12088900),
(101140102, 540122, 1401, 3, 4, 'dangxiong', '当雄', '县', 30.47162600, 91.10641500),
(101140103, 540123, 1401, 3, 4, 'nimu', '尼木', '县', 29.43183200, 90.16452400),
(101140104, 540121, 1401, 3, 4, 'linzhou1', '林周', '县', 29.89310600, 91.26295700),
(101140105, 540103, 1401, 3, 5, 'duilongdeqing', '堆龙德庆', '县', 29.62242200, 91.07054600),
(101140106, 540124, 1401, 3, 4, 'qushui', '曲水', '县', 29.35305900, 90.74385300),
(101140107, 540126, 1401, 3, 4, 'dazi', '达孜', '县', 29.66941000, 91.34986700),
(101140108, 540127, 1401, 3, 4, 'mozhugongka', '墨竹工卡', '县', 29.83413200, 91.73086600),
(101140109, 620102, 1401, 3, 5, 'lasachengguanqu', '拉萨城关', '区', 29.66046100, 91.14709200),
(101140110, 542401, 1401, 3, 5, 'nagqu', '那曲地', '区', 31.48068010, 92.06701810),
(101140201, 540201, 1402, 3, 3, 'rikaze', '日喀则', '', 29.27038900, 88.88727000),
(101140202, 540225, 1402, 3, 4, 'lazi', '拉孜', '县', 29.08166000, 87.63704100),
(101140203, 540221, 1402, 3, 4, 'nanmulin', '南木林', '县', 29.68233100, 89.09924300),
(101140204, 540235, 1402, 3, 4, 'nielamu', '聂拉木', '县', 28.15518600, 85.98223700),
(101140205, 540223, 1402, 3, 4, 'dingri', '定日', '县', 28.65874300, 87.12612000),
(101140206, 540222, 1402, 3, 4, 'jiangzi', '江孜', '县', 28.91165900, 89.60557400),
(101140207, 0, 1402, 3, 4, 'pali', '帕里', '', 27.71535000, 89.15763200),
(101140208, 540232, 1402, 3, 4, 'zhongba', '仲巴', '县', 29.77027900, 84.03153000),
(101140209, 540236, 1402, 3, 4, 'saga', '萨嘎', '县', 29.32881800, 85.23294100),
(101140210, 540234, 1402, 3, 4, 'jilong', '吉隆', '县', 28.85239400, 85.29753500),
(101140211, 540226, 1402, 3, 4, 'angren', '昂仁', '县', 29.29480200, 87.23605100),
(101140212, 540231, 1402, 3, 4, 'dingjie', '定结', '县', 28.36415900, 87.76587200),
(101140213, 540224, 1402, 3, 4, 'sajia', '萨迦', '县', 28.89966400, 88.02167400),
(101140214, 540227, 1402, 3, 4, 'xietongmen', '谢通门', '县', 29.43264100, 88.26162000),
(101140216, 540237, 1402, 3, 4, 'gangba', '岗巴', '县', 28.27460100, 88.52003100),
(101140217, 540228, 1402, 3, 4, 'bailang', '白朗', '县', 29.10768800, 89.26197700),
(101140218, 540233, 1402, 3, 4, 'yadong', '亚东', '县', 27.48481900, 88.90703000),
(101140219, 540230, 1402, 3, 4, 'kangma', '康马', '县', 28.55562700, 89.68166300),
(101140220, 540229, 1402, 3, 4, 'renbu', '仁布', '县', 29.23093300, 89.84198400),
(101140221, 0, 1402, 3, 5, 'shigatsequ', '日喀则地', '区', 29.26816000, 88.95606300),
(101140222, 540202, 1402, 3, 5, 'sangzhuzi', '桑珠孜', '区', 29.24275700, 88.90119500),
(101140301, 540501, 1403, 3, 3, 'shannan', '山南', '区', 29.23159800, 91.75967000),
(101140302, 540522, 1403, 3, 4, 'gongga', '贡嘎', '县', 29.28945500, 90.98414000),
(101140303, 540521, 1403, 3, 4, 'zhanang', '扎囊', '县', 29.33914800, 91.50968300),
(101140304, 540528, 1403, 3, 4, 'jiacha', '加查', '县', 29.14029000, 92.59399300),
(101140305, 540531, 1403, 3, 4, 'langkazi', '浪卡子', '县', 28.96803100, 90.39797700),
(101140306, 540530, 1403, 3, 4, 'cuona', '错那', '县', 27.99109200, 91.95716600),
(101140307, 540529, 1403, 3, 4, 'longzi', '隆子', '县', 28.40680900, 92.46166200),
(101140308, 0, 1403, 3, 4, 'zedang', '泽当', '县', 29.24048200, 91.78578200),
(101140309, 540502, 1403, 3, 5, 'naidong', '乃东', '区', 29.22490400, 91.76153900),
(101140310, 540523, 1403, 3, 4, 'sangri', '桑日', '县', 29.25918900, 92.01581800),
(101140311, 540527, 1403, 3, 4, 'luozha', '洛扎', '县', 28.38571300, 90.85999200),
(101140312, 540526, 1403, 3, 4, 'cuomei', '措美', '县', 28.43820200, 91.43350900),
(101140313, 540524, 1403, 3, 4, 'qiongjie', '琼结', '县', 29.02462500, 91.68388100),
(101140314, 540525, 1403, 3, 4, 'qusong', '曲松', '县', 29.06282600, 92.20373900),
(101140401, 540401, 1404, 3, 3, 'linzhi', '林芝', '市', 29.63657600, 94.36109500),
(101140402, 540424, 1404, 3, 4, 'bomi', '波密', '县', 29.85902800, 95.76791300),
(101140403, 540422, 1404, 3, 4, 'milin', '米林', '县', 29.21583300, 94.21348600),
(101140404, 540425, 1404, 3, 4, 'chayu', '察隅', '县', 28.66128000, 97.46691900),
(101140405, 540421, 1404, 3, 4, 'gongbujiangda', '工布江达', '县', 29.88528000, 93.24607700),
(101140406, 540426, 1404, 3, 4, 'langxian', '朗县', '县', 29.04633700, 93.07470200),
(101140407, 540423, 1404, 3, 4, 'motuo', '墨脱', '县', 29.32529800, 95.33319700),
(101140412, 540402, 1404, 3, 5, 'bayiqu', '巴宜', '区', 29.63512100, 94.37097900),
(101140501, 540301, 1405, 3, 3, 'changdu', '昌都', '市', 31.13850700, 97.18043700),
(101140502, 540324, 1405, 3, 4, 'dingqing', '丁青', '县', 31.41240500, 95.59576200),
(101140503, 540330, 1405, 3, 4, 'bianba', '边坝', '县', 30.93365200, 94.70780000),
(101140504, 540329, 1405, 3, 4, 'luolong', '洛隆', '县', 30.74152300, 95.82460100),
(101140505, 540327, 1405, 3, 4, 'zuogong', '左贡', '县', 29.67106900, 97.84102200),
(101140506, 540328, 1405, 3, 4, 'mangkang', '芒康', '县', 29.67990800, 98.59311300),
(101140507, 540323, 1405, 3, 4, 'leiwuqi', '类乌齐', '县', 31.21160100, 96.60024600),
(101140508, 540326, 1405, 3, 4, 'basu', '八宿', '县', 30.05320900, 96.91783600),
(101140509, 540321, 1405, 3, 4, 'jiangda', '江达', '县', 31.49920200, 98.21843000),
(101140510, 540325, 1405, 3, 4, 'chaya', '察雅', '县', 30.65394300, 97.56875200),
(101140511, 540322, 1405, 3, 4, 'gongjue', '贡觉', '县', 30.86009900, 98.27097000),
(101140512, 540302, 1405, 3, 5, 'keruoqu', '卡若', '区', 31.14840900, 97.17846800),
(101140601, 542421, 1406, 3, 4, 'naqu', '那曲', '县', 31.44326700, 91.99037300),
(101140602, 542430, 1406, 3, 4, 'nima', '尼玛', '县', 31.78470100, 87.23677200),
(101140603, 542422, 1406, 3, 4, 'jiali', '嘉黎', '县', 30.64081500, 93.23252800),
(101140604, 542428, 1406, 3, 4, 'bange', '班戈', '县', 31.39241100, 90.00995700),
(101140605, 542425, 1406, 3, 4, 'anduo', '安多', '县', 32.24988200, 91.66673000),
(101140606, 542427, 1406, 3, 4, 'suoxian', '索县', '县', 31.88691800, 93.78563100),
(101140607, 542424, 1406, 3, 4, 'nierong', '聂荣', '县', 32.10777200, 92.30334600),
(101140608, 542429, 1406, 3, 4, 'baqing', '巴青', '县', 31.91856300, 94.05346300),
(101140609, 542423, 1406, 3, 4, 'biru', '比如', '县', 31.48025000, 93.67963900),
(101140610, 542431, 1406, 3, 4, 'shuanghu', '双湖', '县', 31.48000000, 92.07000000),
(101140701, 542501, 1407, 3, 3, 'ali', '阿里', '区', 32.03373500, 80.34883700),
(101140702, 542526, 1407, 3, 4, 'gaize', '改则', '县', 32.30271300, 84.06259000),
(101140703, 542426, 1407, 3, 4, 'shenzha', '申扎', '县', 29.64692300, 91.11721200),
(101140704, 0, 1407, 3, 0, 'shiquanhe', '狮泉河', '镇', 32.49399000, 80.10160700),
(101140705, 542521, 1407, 3, 4, 'pulan', '普兰', '县', 30.29440200, 81.17623700),
(101140706, 542522, 1407, 3, 4, 'zhada', '札达', '县', 31.47921700, 79.80270600),
(101140707, 542523, 1407, 3, 4, 'gaer', '噶尔', '县', 32.49148800, 80.09641900),
(101140708, 542524, 1407, 3, 4, 'ritu', '日土', '县', 33.38135900, 79.73242700),
(101140709, 542525, 1407, 3, 4, 'geji', '革吉', '县', 32.38723300, 81.14543300),
(101140710, 542527, 1407, 3, 4, 'cuoqin', '措勤', '县', 31.01676900, 85.15949400),
(101150101, 630101, 1501, 3, 3, 'xining', '西宁', '市', 36.65830500, 101.69016300),
(101150102, 630121, 1501, 3, 4, 'datonghuizu', '大通回族', '自治县', 36.92695500, 101.68564300),
(101150103, 630123, 1501, 3, 4, 'huangyuan', '湟源', '县', 36.69266600, 101.24267800),
(101150104, 630122, 1501, 3, 4, 'huangzhong', '湟中', '县', 36.50087900, 101.57166700),
(101150105, 630102, 1501, 3, 5, 'chengdongqu', '城东', '区', 36.60211700, 101.83186500),
(101150106, 630104, 1501, 3, 5, 'chengxiqu', '城西', '区', 36.63163600, 101.72760300),
(101150107, 630105, 1501, 3, 5, 'chengbeiqu', '城北', '区', 36.68636800, 101.71266400),
(101150113, 630103, 1501, 3, 5, 'xiningchengzhongqu', '西宁城中', '区', 36.55130600, 101.71213000),
(101150201, 630201, 1502, 3, 3, 'haidong', '海东', '市', 36.49819700, 102.10617000),
(101150202, 630202, 1502, 3, 5, 'ledu', '乐都', '区', 36.47767200, 102.43204500),
(101150203, 630222, 1502, 3, 4, 'minhe', '民和', '自治县', 36.32032100, 102.83089200),
(101150204, 630223, 1502, 3, 4, 'huzhu', '互助', '自治县', 36.84424900, 101.95927100),
(101150205, 630224, 1502, 3, 4, 'hualong', '化隆', '自治县', 36.09490800, 102.26414300),
(101150206, 630225, 1502, 3, 4, 'xunhua', '循化', '自治县', 35.84858600, 102.48564600),
(101150207, 0, 1502, 3, 4, 'lenghu', '冷湖', '区', 36.63537500, 101.74479600),
(101150208, 630203, 1502, 3, 5, 'pingan', '平安', '区', 36.50056300, 102.10883500),
(101150301, 632301, 1503, 3, 3, 'huangnan', '黄南', '市', 35.51813400, 102.01880000),
(101150302, 632322, 1503, 3, 4, 'jianzha', '尖扎', '县', 35.93829900, 102.03118300),
(101150303, 632323, 1503, 3, 4, 'zeku', '泽库', '县', 35.03531300, 101.46668900),
(101150304, 410101, 1503, 3, 4, 'henan1', '河南', '县', 34.73477300, 101.61630800),
(101150305, 632321, 1503, 3, 4, 'tongren1', '同仁', '县', 35.51606300, 102.01832300),
(101150324, 632324, 1503, 3, 4, 'henanmengguzu', '河南蒙古族', '自治县', 34.74440300, 101.62277200),
(101150401, 150303, 1504, 3, 5, 'hainan', '海南', '州', 36.28680000, 100.61378900),
(101150404, 632523, 1504, 3, 4, 'guide', '贵德', '县', 36.04015000, 101.43329800),
(101150406, 632524, 1504, 3, 4, 'xinghai', '兴海', '县', 35.58861300, 99.98796600),
(101150407, 632525, 1504, 3, 4, 'guinan', '贵南', '县', 35.58671500, 100.74750300),
(101150408, 632522, 1504, 3, 4, 'tongde', '同德', '县', 35.25479100, 100.57805200),
(101150409, 632521, 1504, 3, 4, 'gonghe', '共和', '县', 36.28410700, 100.62003100),
(101150501, 632601, 1505, 3, 3, 'guoluo', '果洛', '市', 33.30000000, 101.10000000),
(101150502, 632622, 1505, 3, 4, 'banma', '班玛', '县', 32.93272300, 100.73713800),
(101150503, 632623, 1505, 3, 4, 'gande', '甘德', '县', 33.96921900, 99.90090500),
(101150504, 632624, 1505, 3, 4, 'dari', '达日', '县', 33.74892100, 99.65139200),
(101150505, 632625, 1505, 3, 4, 'jiuzhi', '久治', '县', 33.42947100, 101.48283100),
(101150506, 632626, 1505, 3, 4, 'madu', '玛多', '县', 34.92082800, 98.21592400),
(101150507, 0, 1505, 3, 4, 'duoxian1', '多县', '县', 40.98441200, 117.95051200),
(101150508, 632621, 1505, 3, 4, 'maqin', '玛沁', '县', 34.47743300, 100.23888800),
(101150601, 632701, 1506, 3, 3, 'yushu1', '玉树', '市', 32.99310700, 97.00878500),
(101150602, 632723, 1506, 3, 4, 'chenduo', '称多', '县', 33.36921800, 97.11083200),
(101150603, 632724, 1506, 3, 4, 'zhiduo', '治多', '县', 33.85275100, 95.61308000),
(101150604, 632722, 1506, 3, 4, 'zaduo', '杂多', '县', 32.89318500, 95.30072300),
(101150605, 632725, 1506, 3, 4, 'nangqian', '囊谦', '县', 32.20324600, 96.48065000),
(101150606, 632726, 1506, 3, 4, 'qumacai', '曲麻莱', '县', 34.12642900, 95.79736700),
(101150701, 632801, 1507, 3, 3, 'haixi', '海西', '市', 37.37623600, 97.36909900),
(101150712, 0, 1507, 3, 4, 'mangai', '茫崖', '镇', 38.34777500, 90.15501500),
(101150713, 0, 1507, 3, 4, 'dachaidan', '大柴旦', '行政区', 37.85509300, 95.35577300),
(101150801, 632201, 1508, 3, 3, 'haibei', '海北', '市', 36.96138700, 100.89813000),
(101150802, 632221, 1508, 3, 4, 'menyuan', '门源', '自治县', 37.37644900, 101.62236400),
(101150803, 632222, 1508, 3, 4, 'qilian', '祁连', '县', 38.17711200, 100.25321100),
(101150804, 632223, 1508, 3, 4, 'haiman', '海晏', '县', 36.87120400, 100.98565600),
(101150806, 632224, 1508, 3, 4, 'gangcha', '刚察', '县', 37.24410300, 100.09700400),
(101150901, 632801, 1509, 3, 3, 'geermu', '格尔木', '市', 36.38187300, 94.90675000),
(101150902, 632822, 1509, 3, 4, 'dulan', '都兰', '县', 36.44412900, 95.75327800),
(101150908, 632823, 1509, 3, 4, 'tianjun', '天峻', '县', 37.22681100, 99.02105400),
(101150909, 632821, 1509, 3, 4, 'wulan', '乌兰', '县', 36.95395400, 98.46716900),
(101150916, 632802, 1509, 3, 4, 'delingha', '德令哈', '市', 37.31476500, 97.38411800),
(101160101, 620101, 1601, 3, 3, 'lanzhou', '兰州', '市', 36.03394200, 103.85110800),
(101160102, 620122, 1601, 3, 4, 'gaolan', '皋兰', '县', 36.33679600, 103.94272900),
(101160103, 620121, 1601, 3, 4, 'yongdeng', '永登', '县', 36.72075100, 103.27398600),
(101160104, 620123, 1601, 3, 4, 'yuzhong', '榆中', '县', 35.84305600, 104.11252700),
(101160105, 620102, 1601, 3, 5, 'chengguan', '城关', '区', 36.06316700, 103.83174600),
(101160106, 620103, 1601, 3, 5, 'qilihe', '七里河', '区', 35.99249500, 103.77199400),
(101160107, 620104, 1601, 3, 5, 'xiguqu', '西固', '区', 36.10647200, 103.56268000),
(101160108, 620105, 1601, 3, 5, 'anningqu', '安宁', '区', 36.11552300, 103.71915600),
(101160109, 620111, 1601, 3, 5, 'honggu', '红古', '区', 36.30348800, 103.06027500),
(101160201, 621101, 1602, 3, 3, 'dingxi', '定西', '市', 35.58685300, 104.63247000),
(101160202, 621121, 1602, 3, 4, 'tongwei', '通渭', '县', 35.21083100, 105.24206100),
(101160203, 621122, 1602, 3, 4, 'longxi', '陇西', '县', 34.95343900, 104.70650800),
(101160204, 621123, 1602, 3, 4, 'weiyuan', '渭源', '县', 35.13675500, 104.21546700),
(101160205, 621124, 1602, 3, 4, 'lintao', '临洮', '县', 35.39498900, 103.85956500),
(101160206, 621125, 1602, 3, 4, 'zhangxian', '漳县', '县', 34.84844400, 104.47157200),
(101160207, 621126, 1602, 3, 4, 'minxian', '岷县', '县', 34.43807600, 104.03688000),
(101160208, 621102, 1602, 3, 5, 'anding', '安定', '区', 35.58695900, 104.61708600),
(101160301, 620801, 1603, 3, 3, 'pingliang', '平凉', '市', 35.54801500, 106.67255800),
(101160302, 620821, 1603, 3, 4, 'jingchuan', '泾川', '县', 35.33266600, 107.36785000),
(101160303, 620822, 1603, 3, 4, 'lingtai', '灵台', '县', 35.06539900, 107.62112400),
(101160304, 620823, 1603, 3, 4, 'chongxin', '崇信', '县', 35.30212300, 107.03540900),
(101160305, 620824, 1603, 3, 4, 'huating', '华亭', '县', 35.21829200, 106.65315800),
(101160306, 620825, 1603, 3, 4, 'zhuanglang', '庄浪', '县', 35.20238500, 106.03668700),
(101160307, 620826, 1603, 3, 4, 'jingning', '静宁', '县', 35.52197700, 105.73255600),
(101160308, 620802, 1603, 3, 5, 'kongtong', '崆峒', '区', 35.54894400, 106.68119100),
(101160401, 621002, 1604, 3, 5, 'xifeng1', '西峰', '区', 36.01303200, 107.88458100),
(101160402, 621001, 1604, 3, 3, 'qingyang', '庆阳', '市', 35.74513200, 107.63883200),
(101160403, 621022, 1604, 3, 4, 'huanxian', '环县', '县', 36.56843500, 107.30850100),
(101160404, 621023, 1604, 3, 4, 'huachi', '华池', '县', 36.46135500, 107.99003500),
(101160405, 621024, 1604, 3, 4, 'heshui', '合水', '县', 35.81924300, 108.01953000),
(101160406, 621025, 1604, 3, 4, 'zhengning', '正宁', '县', 35.49189000, 108.35997600),
(101160407, 621026, 1604, 3, 4, 'ningxian', '宁县', '县', 35.50217700, 107.92836900);
INSERT INTO `cmf_plugin_modules_citys` (`id`, `code`, `pid`, `level`, `level3`, `pinyin`, `name`, `areaname`, `lat`, `lng`) VALUES
(101160408, 621027, 1604, 3, 4, 'zhenyuan', '镇原', '县', 35.67746200, 107.20083200),
(101160409, 621021, 1604, 3, 4, 'qingcheng', '庆城', '县', 36.01629900, 107.88180200),
(101160501, 620601, 1605, 3, 3, 'wuwei', '武威', '市', 37.90342600, 102.62365300),
(101160502, 620621, 1605, 3, 4, 'minqin', '民勤', '县', 38.62435100, 103.09379200),
(101160503, 620622, 1605, 3, 4, 'gulang', '古浪', '县', 37.51750500, 102.90208700),
(101160505, 620623, 1605, 3, 4, 'tianzhu', '天祝', '自治县', 36.98056000, 103.13657300),
(101160506, 620602, 1605, 3, 5, 'liangzhouqu', '凉州', '区', 37.91627200, 102.75947700),
(101160601, 620301, 1606, 3, 3, 'jinchang', '金昌', '市', 38.52591900, 102.20031700),
(101160602, 620321, 1606, 3, 4, 'yongchang', '永昌', '县', 38.25308100, 101.97946400),
(101160603, 620302, 1606, 3, 5, 'jinchuanqu', '金川', '区', 38.49217200, 102.32868000),
(101160701, 620701, 1607, 3, 3, 'zhangye', '张掖', '市', 38.97415500, 100.51943300),
(101160702, 620721, 1607, 3, 4, 'sunan', '肃南', '自治县', 38.83693200, 99.61560100),
(101160703, 620722, 1607, 3, 4, 'minle', '民乐', '县', 38.43079400, 100.81286000),
(101160704, 620723, 1607, 3, 4, 'linze', '临泽', '县', 39.15711300, 100.15992300),
(101160705, 620724, 1607, 3, 4, 'gaotai', '高台', '县', 39.26875100, 99.78927500),
(101160706, 620725, 1607, 3, 4, 'shandan', '山丹', '县', 38.81363100, 101.07535300),
(101160707, 620702, 1607, 3, 5, 'ganzhouqu', '甘州', '区', 39.01062100, 100.52207900),
(101160801, 620901, 1608, 3, 3, 'jiuquan', '酒泉', '市', 39.64518800, 98.45158700),
(101160803, 620921, 1608, 3, 4, 'jinta', '金塔', '县', 39.98359900, 98.90327000),
(101160804, 620924, 1608, 3, 4, 'akesai', '阿克塞', '自治县', 39.63394300, 94.34020400),
(101160805, 620922, 1608, 3, 4, 'guazhou', '瓜州', '县', 40.56782000, 95.77353900),
(101160806, 620923, 1608, 3, 4, 'subei', '肃北', '自治县', 39.51245000, 94.87657900),
(101160807, 620981, 1608, 3, 4, 'yumen', '玉门', '市', 39.81452800, 97.92772000),
(101160808, 620982, 1608, 3, 4, 'dunhuang', '敦煌', '市', 40.16908500, 94.78450200),
(101160809, 620902, 1608, 3, 5, 'suzhouqu', '肃州', '区', 39.59837400, 98.80261600),
(101160901, 620501, 1609, 3, 3, 'tianshui', '天水', '市', 34.58716200, 105.73127600),
(101160903, 620521, 1609, 3, 4, 'qingshui', '清水', '县', 34.74986500, 106.13729300),
(101160904, 620522, 1609, 3, 4, 'qinan', '秦安', '县', 34.85891600, 105.67498300),
(101160905, 620523, 1609, 3, 4, 'gangu', '甘谷', '县', 34.76314300, 105.33188300),
(101160906, 620524, 1609, 3, 4, 'wushan1', '武山', '县', 34.72073900, 104.91949700),
(101160907, 620525, 1609, 3, 4, 'zhangjiachuan', '张家川', '自治县', 34.98803700, 106.20451800),
(101160908, 620503, 1609, 3, 5, 'maiji', '麦积', '区', 34.57664300, 105.89601800),
(101160909, 620502, 1609, 3, 5, 'qinzhouqu', '秦州', '区', 34.34444800, 105.58117100),
(101161001, 621202, 1610, 3, 5, 'wudu', '武都', '区', 33.39221100, 104.92633700),
(101161002, 621221, 1610, 3, 4, 'chengxian', '成县', '县', 33.75047700, 105.74220300),
(101161003, 621222, 1610, 3, 4, 'wenxian', '文县', '县', 32.94381500, 104.68343400),
(101161004, 621223, 1610, 3, 4, 'dangchang', '宕昌', '县', 34.04726100, 104.39338500),
(101161005, 621224, 1610, 3, 4, 'kangxian', '康县', '县', 33.32913600, 105.60916900),
(101161006, 621225, 1610, 3, 4, 'xihe', '西和', '县', 34.01070100, 105.30122900),
(101161007, 621226, 1610, 3, 4, 'lixian1', '礼县', '县', 34.18934500, 105.17864000),
(101161008, 621227, 1610, 3, 4, 'huixian', '徽县', '县', 33.70097700, 106.19860700),
(101161009, 621228, 1610, 3, 4, 'liangdang', '两当', '县', 33.77284600, 106.30857000),
(101161010, 621201, 1610, 3, 3, 'longnan1', '陇南', '市', 33.40593610, 104.92887710),
(101161101, 622901, 1611, 3, 3, 'linxia', '临夏', '市', 35.60437600, 103.24302100),
(101161102, 622922, 1611, 3, 4, 'kangle', '康乐', '县', 35.37050500, 103.70835400),
(101161103, 622923, 1611, 3, 4, 'yongjing', '永靖', '县', 35.95830600, 103.28585400),
(101161104, 622924, 1611, 3, 4, 'guanghe', '广河', '县', 35.48805200, 103.57583400),
(101161105, 622925, 1611, 3, 4, 'hezheng', '和政', '县', 35.42460300, 103.35099700),
(101161106, 361029, 1611, 3, 4, 'dongxiang', '东乡', '县', 35.44850900, 103.30792300),
(101161107, 622927, 1611, 3, 4, 'jishishan', '积石山', '自治县', 35.71766100, 102.87584300),
(101161121, 622921, 1611, 3, 4, 'linxiaxian', '临夏', '县', 35.49765300, 102.99933900),
(101161201, 623001, 1612, 3, 4, 'hezuo', '合作', '市', 35.00039900, 102.91088200),
(101161202, 623021, 1612, 3, 4, 'lintan', '临潭', '县', 34.69274700, 103.35391900),
(101161203, 623022, 1612, 3, 4, 'zhuoni', '卓尼', '县', 34.58958800, 103.50710900),
(101161204, 623023, 1612, 3, 4, 'zhouqu', '舟曲', '县', 33.78525900, 104.37158600),
(101161205, 623024, 1612, 3, 4, 'diebu', '迭部', '县', 34.05593900, 103.22187000),
(101161206, 623025, 1612, 3, 4, 'maqu', '玛曲', '县', 33.99771200, 102.07269800),
(101161207, 623026, 1612, 3, 4, 'luqu', '碌曲', '县', 34.59094400, 102.48732700),
(101161208, 623027, 1612, 3, 4, 'xiahe', '', '县', 35.20250300, 102.52180700),
(101161209, 623001, 1612, 3, 3, 'gannan', '甘南', '州', 34.98915010, 102.91756510),
(101161301, 620401, 1613, 3, 3, 'baiyin', '白银', '市', 36.53539800, 104.14855600),
(101161302, 620421, 1613, 3, 4, 'jingyuan', '靖远', '县', 36.55166400, 104.67406400),
(101161303, 620422, 1613, 3, 4, 'huining', '会宁', '县', 35.69282300, 105.05335800),
(101161304, 620403, 1613, 3, 5, 'pingchuan', '平川', '区', 36.72830400, 104.82520800),
(101161305, 620423, 1613, 3, 4, 'jingtai', '', '县', 37.19445200, 104.05570800),
(101161312, 620402, 1613, 3, 5, 'baiyinqu', '白银', '区', 36.53471000, 104.15872500),
(101161401, 620201, 1614, 3, 3, 'jiayuguan', '嘉峪关', '市', 39.75650800, 98.25801800),
(101170101, 640101, 1701, 3, 3, 'yinchuan', '银川', '市', 38.49240100, 106.17345900),
(101170102, 640121, 1701, 3, 4, 'yongning', '永宁', '县', 38.27737300, 106.25314500),
(101170103, 640181, 1701, 3, 4, 'lingwu', '灵武', '市', 38.15798800, 106.36725400),
(101170104, 640122, 1701, 3, 4, 'helan', '贺兰', '县', 38.55434400, 106.34982800),
(101170105, 640104, 1701, 3, 5, 'xingqingqu', '兴庆', '区', 38.46426600, 106.38212100),
(101170106, 640105, 1701, 3, 5, 'xixiaqu', '西夏', '区', 38.55328100, 106.05555600),
(101170107, 640106, 1701, 3, 5, 'jinfengqu', '金凤', '区', 38.47859100, 106.24265000),
(101170201, 640201, 1702, 3, 3, 'shizuishan', '石嘴山', '市', 38.96030500, 106.46499500),
(101170202, 640205, 1702, 3, 5, 'huinong', '惠农', '区', 39.26196900, 106.72765200),
(101170203, 640221, 1702, 3, 4, 'pingluo', '平罗', '县', 38.91939300, 106.52962000),
(101170204, 0, 1702, 3, 4, 'taole', '陶乐', '县', 38.81191700, 106.69680200),
(101170205, 640202, 1702, 3, 5, 'dawukouqu', '大武口', '区', 38.96753400, 106.38721600),
(101170301, 640301, 1703, 3, 3, 'wuzhong', '吴忠', '市', 37.98787200, 106.21141400),
(101170302, 640324, 1703, 3, 4, 'tongxin', '同心', '县', 36.98057500, 105.91445800),
(101170303, 640323, 1703, 3, 4, 'yanchi', '盐池', '县', 37.73101000, 107.34145600),
(101170306, 640381, 1703, 3, 4, 'qingtongxia', '青铜峡', '市', 37.91885000, 105.93117300),
(101170307, 640302, 1703, 3, 5, 'litongqu', '利通', '区', 37.76788200, 106.21901200),
(101170308, 640303, 1703, 3, 5, 'hongsipuqu', '红寺堡', '区', 37.37413600, 106.16687900),
(101170401, 640401, 1704, 3, 3, 'guyuanguyuan', '固原', '市', 36.02084700, 106.30521100),
(101170402, 640422, 1704, 3, 4, 'xiji', '西吉', '县', 35.96391300, 105.72908500),
(101170403, 640423, 1704, 3, 4, 'longde', '隆德', '县', 35.62591500, 106.11159500),
(101170404, 640424, 1704, 3, 4, 'jinyuan1', '泾源', '县', 35.49816000, 106.33064600),
(101170406, 640425, 1704, 3, 4, 'pengyang', '彭阳', '县', 35.84956500, 106.63834000),
(101170412, 640402, 1704, 3, 5, 'yuanzhou', '原州', '区', 36.00866500, 106.29714400),
(101170501, 640501, 1705, 3, 3, 'zhongwei', '中卫', '市', 37.52259700, 105.19028600),
(101170502, 640521, 1705, 3, 4, 'zhongning', '中宁', '县', 37.55595200, 105.66710000),
(101170504, 640522, 1705, 3, 4, 'haiyuan', '海原', '县', 36.56503300, 105.64348700),
(101170505, 640502, 1705, 3, 5, 'shapotouqu', '沙坡头', '区', 37.36063900, 105.11127800),
(101180101, 410101, 1801, 3, 3, 'zhengzhou', '郑州', '市', 34.74122200, 113.66245000),
(101180102, 410181, 1801, 3, 4, 'gongyi', '巩义', '市', 34.76417900, 112.98575000),
(101180103, 410182, 1801, 3, 4, 'xingyang', '荥阳', '市', 34.78737500, 113.38322100),
(101180104, 410185, 1801, 3, 4, 'dengfeng', '登封', '市', 34.45366700, 113.05049200),
(101180105, 410183, 1801, 3, 4, 'xinmi', '新密', '市', 34.53944300, 113.39089100),
(101180106, 410184, 1801, 3, 4, 'xinzheng', '新郑', '市', 34.39556200, 113.74052900),
(101180107, 410122, 1801, 3, 4, 'zhongmou', '中牟', '县', 34.71893700, 113.97625400),
(101180108, 410106, 1801, 3, 5, 'shangjie', '上街', '区', 34.80279400, 113.30896900),
(101180109, 410102, 1801, 3, 5, 'zhongyuanqu', '中原', '区', 34.77947400, 113.55728100),
(101180110, 410103, 1801, 3, 5, 'erqiqu', '二七', '区', 34.69806600, 113.61648200),
(101180111, 410104, 1801, 3, 5, 'guanchengqu', '管城回族', '区', 34.70900400, 113.72186100),
(101180112, 410105, 1801, 3, 5, 'jinshuiqu', '金水', '区', 34.79740600, 113.70801100),
(101180113, 410108, 1801, 3, 5, 'huijiqu', '惠济', '区', 34.86944700, 113.62834100),
(101180201, 410501, 1802, 3, 3, 'anyang', '安阳', '市', 36.11147700, 114.33968000),
(101180202, 410523, 1802, 3, 4, 'tangyin', '汤阴', '县', 35.92141000, 114.34763000),
(101180203, 410526, 1802, 3, 4, 'huaxian1', '滑县', '县', 35.57541800, 114.51931100),
(101180204, 410527, 1802, 3, 4, 'neihuang', '内黄', '县', 35.97165300, 114.90149200),
(101180205, 410581, 1802, 3, 4, 'linzhou', '林州', '市', 36.08304700, 113.82013000),
(101180206, 410502, 1802, 3, 5, 'wenfengqu', '文峰', '区', 36.03414800, 114.41852200),
(101180207, 410503, 1802, 3, 5, 'beiguanqu', '北关', '区', 36.14169600, 114.39143600),
(101180208, 410505, 1802, 3, 5, 'yinduqu', '殷都', '区', 36.13557300, 114.29713000),
(101180209, 410506, 1802, 3, 5, 'longanqu', '龙安', '区', 36.05602500, 114.25660400),
(101180222, 410522, 1802, 3, 4, 'anyangxian', '安阳', '县', 36.21956900, 114.23302800),
(101180301, 410701, 1803, 3, 3, 'xinxiang', '新乡', '市', 35.30632000, 113.85887300),
(101180302, 410724, 1803, 3, 4, 'huojia', '获嘉', '县', 35.25552100, 113.64910500),
(101180303, 410725, 1803, 3, 4, 'yuanyang', '原阳', '县', 35.05276100, 113.96790700),
(101180304, 410782, 1803, 3, 4, 'huixian1', '辉县', '市', 35.46214000, 113.80535900),
(101180305, 410781, 1803, 3, 4, 'weihui', '卫辉', '市', 35.43220300, 114.06184600),
(101180306, 410726, 1803, 3, 4, 'yanjin', '延津', '县', 35.23007600, 114.27096600),
(101180307, 410727, 1803, 3, 4, 'fengqiu', '封丘', '县', 35.22528200, 114.40699600),
(101180308, 410728, 1803, 3, 4, 'changyuan', '长垣', '县', 35.21134700, 114.65948600),
(101180309, 410702, 1803, 3, 5, 'hongqiqu', '红旗', '区', 35.28615000, 113.91461900),
(101180310, 410703, 1803, 3, 5, 'weibinqu', '卫滨', '区', 35.29483200, 113.86463800),
(101180311, 410704, 1803, 3, 5, 'fengquanqu', '凤泉', '区', 35.39931800, 113.86418900),
(101180312, 410711, 1803, 3, 5, 'muyequ', '牧野', '区', 35.33889000, 113.89672200),
(101180321, 410721, 1803, 3, 4, 'xinxiangxian', '新乡', '县', 35.19675800, 113.79329900),
(101180401, 411001, 1804, 3, 3, 'xuchang', '许昌', '市', 34.02016800, 113.82044100),
(101180402, 411024, 1804, 3, 4, 'yanling', '鄢陵', '县', 34.10233200, 114.17740000),
(101180403, 411025, 1804, 3, 4, 'xiangcheng', '襄城', '县', 33.84636900, 113.48245300),
(101180404, 411082, 1804, 3, 4, 'changge', '长葛', '市', 34.21374700, 113.77944300),
(101180405, 411081, 1804, 3, 4, 'yuzhou1', '禹州', '市', 34.14070100, 113.48847800),
(101180406, 411002, 1804, 3, 5, 'weidu', '魏都', '区', 34.04347700, 113.82531600),
(101180423, 411023, 1804, 3, 4, 'xuchangxian', '许昌', '县', 34.13260700, 113.82715500),
(101180501, 410401, 1805, 3, 3, 'pingdingshan', '平顶山', '市', 33.71862500, 113.30413300),
(101180502, 410425, 1805, 3, 4, 'jiaxian1', '郏县', '县', 33.97178700, 113.21260900),
(101180503, 410421, 1805, 3, 4, 'baofeng', '宝丰', '县', 33.86844100, 113.05475400),
(101180504, 410482, 1805, 3, 4, 'ruzhou', '汝州', '市', 34.16895100, 112.82714400),
(101180505, 410422, 1805, 3, 4, 'yexian', '叶县', '县', 33.62673100, 113.35723900),
(101180506, 410481, 1805, 3, 4, 'wugang', '舞钢', '市', 33.30777600, 113.52479400),
(101180507, 410423, 1805, 3, 4, 'lushan', '鲁山', '县', 33.74863000, 112.90354300),
(101180508, 410404, 1805, 3, 5, 'shilong', '石龙', '县', 33.89871300, 112.89881800),
(101180509, 410403, 1805, 3, 5, 'weidongqu', '卫东', '区', 33.76910800, 113.36538800),
(101180510, 410411, 1805, 3, 5, 'zhanhequ', '湛河', '区', 33.71234100, 113.27818900),
(101180512, 410402, 1805, 3, 5, 'pingdingxinhua', '平顶新华', '区', 33.74343300, 113.30089600),
(101180601, 411501, 1806, 3, 3, 'xinyang', '信阳', '市', 32.12935500, 114.08267300),
(101180602, 411528, 1806, 3, 4, 'xixian1', '息县', '县', 32.34279200, 114.74045600),
(101180603, 411521, 1806, 3, 4, 'luoshan', '罗山', '县', 32.16506000, 114.55050900),
(101180604, 411522, 1806, 3, 4, 'guangshan', '光山', '县', 32.00999500, 114.91925000),
(101180605, 411523, 1806, 3, 4, 'xinxian1', '新县', '县', 31.64245500, 114.88896100),
(101180606, 411527, 1806, 3, 4, 'huaibin', '淮滨', '县', 32.50133200, 115.41209200),
(101180607, 411526, 1806, 3, 4, 'huangchuan', '潢川', '县', 32.11114200, 115.10344300),
(101180608, 411525, 1806, 3, 4, 'gushi', '固始', '县', 31.91510200, 115.67042400),
(101180609, 411524, 1806, 3, 4, 'shangcheng', '商城', '县', 31.95342800, 115.44258300),
(101180610, 411502, 1806, 3, 5, 'shihequ', '浉河', '区', 32.03134000, 113.96277700),
(101180611, 411503, 1806, 3, 5, 'pingqiaoqu', '平桥', '区', 32.30784000, 114.13908600),
(101180701, 411301, 1807, 3, 3, 'nanyang', '南阳', '市', 32.99921200, 112.51134500),
(101180702, 411321, 1807, 3, 4, 'nanzhao', '南召', '县', 33.43900900, 112.74191300),
(101180703, 411322, 1807, 3, 4, 'fangcheng', '方城', '县', 33.25439100, 113.01249400),
(101180704, 411327, 1807, 3, 4, 'sheqi', '社旗', '县', 33.05610900, 112.94824500),
(101180705, 411323, 1807, 3, 4, 'xixia', '西峡', '县', 33.27051500, 111.51190200),
(101180706, 411325, 1807, 3, 4, 'neixiang', '内乡', '县', 33.06829300, 111.86634400),
(101180707, 411324, 1807, 3, 4, 'zhenping1', '镇平', '县', 33.05383000, 112.22461500),
(101180708, 411326, 1807, 3, 4, 'xichuan', '淅川', '县', 33.13782000, 111.49096400),
(101180709, 411329, 1807, 3, 4, 'xinye', '新野', '县', 32.52080500, 112.36002600),
(101180710, 411328, 1807, 3, 4, 'tanghe', '唐河', '县', 32.66586400, 112.85076500),
(101180711, 411381, 1807, 3, 4, 'dengzhou', '邓州', '市', 32.68311600, 112.07090900),
(101180712, 411330, 1807, 3, 4, 'tongbai', '桐柏', '县', 32.38978200, 113.43647700),
(101180713, 411302, 1807, 3, 5, 'wanchengqu', '宛城', '区', 32.93470300, 112.61390800),
(101180714, 411303, 1807, 3, 5, 'wolongqu', '卧龙', '区', 33.00983900, 112.48426700),
(101180801, 410201, 1808, 3, 3, 'kaifeng', '开封', '市', 34.77075600, 114.35279500),
(101180802, 410221, 1808, 3, 4, 'qixian1', '杞县', '县', 34.54916600, 114.78304100),
(101180803, 410223, 1808, 3, 4, 'weishi', '尉氏', '县', 34.41149400, 114.19308100),
(101180804, 410222, 1808, 3, 4, 'tongxu', '通许', '县', 34.48043300, 114.46746700),
(101180805, 410225, 1808, 3, 4, 'lankao', '兰考', '县', 34.81443300, 114.81948600),
(101180806, 410202, 1808, 3, 5, 'longting', '龙亭', '区', 34.82201400, 114.36102400),
(101180807, 410203, 1808, 3, 5, 'shunhehuizu', '顺河回族', '区', 34.81777100, 114.42852700),
(101180808, 410204, 1808, 3, 5, 'kaifenggulouqu', '开封鼓楼', '区', 34.79433300, 114.35327000),
(101180809, 410205, 1808, 3, 5, 'yuwangtaiqu', '禹王台', '区', 34.75102900, 114.38561000),
(101180810, 410211, 1808, 3, 5, 'jinmingqu', '金明', '区', 34.82364700, 114.33028400),
(101180812, 410212, 1808, 3, 5, 'xiangfuqu', '祥符', '区', 34.76152100, 114.44735000),
(101180901, 410301, 1809, 3, 3, 'luoyang', '洛阳', '市', 34.68648100, 112.43608300),
(101180902, 410323, 1809, 3, 4, 'xinan', '新安', '县', 34.72826600, 112.13237800),
(101180903, 410322, 1809, 3, 4, 'mengjin', '孟津', '县', 34.79590000, 112.59990200),
(101180904, 410327, 1809, 3, 4, 'yiyang', '宜阳', '县', 34.51477000, 112.17924300),
(101180905, 410328, 1809, 3, 4, 'luoning', '洛宁', '县', 34.38941400, 111.65303900),
(101180906, 410329, 1809, 3, 4, 'yichuan1', '伊川', '县', 34.42134900, 112.42564000),
(101180907, 410325, 1809, 3, 4, 'songxian', '嵩县', '县', 34.13451700, 112.08563500),
(101180908, 410381, 1809, 3, 4, 'yanshi1', '偃师', '市', 34.72913700, 112.79431100),
(101180909, 410324, 1809, 3, 4, 'luanchuan', '栾川', '县', 33.78569800, 111.61576900),
(101180910, 410326, 1809, 3, 4, 'ruyang', '汝阳', '县', 34.30291000, 112.56375100),
(101180911, 410306, 1809, 3, 5, 'jili', '吉利', '区', 34.90088900, 112.58905200),
(101180912, 410311, 1809, 3, 5, 'luolongqu', '洛龙', '区', 34.62563200, 112.47054400),
(101180913, 410302, 1809, 3, 5, 'laochengqu', '老城', '区', 34.70403300, 112.45917300),
(101180914, 410303, 1809, 3, 5, 'xigongqu', '西工', '区', 34.68969400, 112.40712600),
(101180915, 410304, 1809, 3, 5, 'chanhequ', '瀍河回族', '区', 34.70293200, 112.50509400),
(101180916, 410305, 1809, 3, 5, 'jianxiqu', '涧西', '区', 34.67166800, 112.39075300),
(101181001, 411401, 1810, 3, 3, 'shangqiu', '商丘', '市', 34.44434800, 115.65716100),
(101181003, 411422, 1810, 3, 4, 'suixian', '睢县', '县', 34.44533500, 115.07184900),
(101181004, 411421, 1810, 3, 4, 'minquan', '民权', '县', 34.64433600, 115.13989700),
(101181005, 411425, 1810, 3, 4, 'yucheng1', '虞城', '县', 34.39757700, 115.86494200),
(101181006, 411424, 1810, 3, 4, 'zhecheng', '柘城', '县', 34.09104500, 115.30584300),
(101181007, 411423, 1810, 3, 4, 'ningling', '宁陵', '县', 34.46023200, 115.31369000),
(101181008, 411426, 1810, 3, 4, 'xiayi', '夏邑', '县', 34.23755400, 116.13144700),
(101181009, 411481, 1810, 3, 4, 'yongcheng', '永城', '市', 33.92929100, 116.44950000),
(101181010, 411402, 1810, 3, 5, 'liangyuanqu', '梁园', '区', 34.50304000, 115.63773100),
(101181011, 411403, 1810, 3, 5, 'suiyangqo', '睢阳', '区', 34.28675500, 115.58978400),
(101181101, 410801, 1811, 3, 3, 'jiaozuo', '焦作', '市', 35.22229700, 113.23509300),
(101181102, 410821, 1811, 3, 4, 'xiuwu', '修武', '县', 35.24299900, 113.43906800),
(101181103, 410823, 1811, 3, 4, 'wuzhi', '武陟', '县', 35.09937800, 113.40167900),
(101181104, 410882, 1811, 3, 4, 'qinyang', '沁阳', '市', 35.20017800, 112.94939400),
(101181106, 410822, 1811, 3, 4, 'boai', '博爱', '县', 35.17103900, 113.06433200),
(101181107, 410825, 1811, 3, 4, 'wenxian1', '温县', '县', 34.94018900, 113.08053000),
(101181108, 410883, 1811, 3, 4, 'mengzhou', '孟州', '市', 34.90731500, 112.79140200),
(101181109, 410802, 1811, 3, 5, 'jiefangqu', '解放', '区', 35.24171200, 113.23080400),
(101181110, 410803, 1811, 3, 5, 'zhongzhanqu', '中站', '区', 35.25702400, 113.16153600),
(101181111, 410811, 1811, 3, 5, 'shanyangqu', '山阳', '区', 35.24116000, 113.27635100),
(101181112, 410804, 1811, 3, 5, 'macunqu', '马村', '区', 35.30417100, 113.36732100),
(101181201, 410601, 1812, 3, 3, 'hebi', '鹤壁', '市', 35.76027700, 114.27349000),
(101181202, 410621, 1812, 3, 4, 'xunxian', '浚县', '县', 35.67624000, 114.55081300),
(101181203, 410622, 1812, 3, 4, 'qixian2', '淇县', '县', 35.60776200, 114.19765100),
(101181204, 410602, 1812, 3, 5, 'heshanqu1', '鹤山', '区', 35.97334600, 114.09845400),
(101181205, 410603, 1812, 3, 5, 'shanchengqu', '山城', '区', 35.92745400, 114.25302900),
(101181206, 410611, 1812, 3, 5, 'qibinqu', '淇滨', '区', 35.81241900, 114.19951400),
(101181301, 410901, 1813, 3, 3, 'puyang', '濮阳', '市', 35.71219300, 115.02907900),
(101181302, 410927, 1813, 3, 4, 'taiqian', '台前', '县', 35.96908200, 115.85908000),
(101181303, 410923, 1813, 3, 4, 'nanle', '南乐', '县', 36.06960200, 115.20474000),
(101181304, 410922, 1813, 3, 4, 'qingfeng', '清丰', '县', 35.88518000, 115.10438900),
(101181305, 410926, 1813, 3, 4, 'fanxian', '范县', '县', 35.85190700, 115.50420100),
(101181306, 410902, 1813, 3, 5, 'hualongqu', '华龙', '区', 35.77193400, 115.04809700),
(101181328, 410928, 1813, 3, 4, 'puyangxian', '濮阳', '县', 35.70142100, 115.03625300),
(101181401, 411601, 1814, 3, 3, 'zhoukou', '周口', '市', 33.60204300, 114.65587500),
(101181402, 411621, 1814, 3, 4, 'fugou', '扶沟', '县', 34.05986200, 114.39491500),
(101181403, 411627, 1814, 3, 4, 'taikang', '太康', '县', 34.06379800, 114.83788700),
(101181404, 411626, 1814, 3, 4, 'huaiyang', '淮阳', '县', 33.73156100, 114.88615400),
(101181405, 411622, 1814, 3, 4, 'xihua', '西华', '县', 33.76740800, 114.52975600),
(101181406, 411623, 1814, 3, 4, 'shangshui', '商水', '县', 33.54248000, 114.61159600),
(101181407, 411681, 1814, 3, 4, 'xiangcheng1', '项城', '市', 33.46583800, 114.87533300),
(101181408, 411625, 1814, 3, 4, 'dancheng', '郸城', '县', 33.64474300, 115.17718900),
(101181409, 411628, 1814, 3, 4, 'luyi', '鹿邑', '县', 33.86000000, 115.48445400),
(101181410, 411624, 1814, 3, 4, 'shenqiu', '沈丘', '县', 33.40936900, 115.09858300),
(101181411, 411602, 1814, 3, 5, 'chuanhuiqu', '川汇', '区', 33.63087600, 114.65795000),
(101181501, 411101, 1815, 3, 3, 'luohe', '漯河', '市', 33.55586600, 114.04220000),
(101181502, 411122, 1815, 3, 4, 'linying', '临颍', '县', 33.80654700, 113.91947300),
(101181503, 411121, 1815, 3, 4, 'wuyang', '舞阳', '县', 33.43787700, 113.60928700),
(101181504, 411102, 1815, 3, 5, 'yuanhuiqu', '源汇', '区', 33.84720000, 113.94610000),
(101181505, 411103, 1815, 3, 5, 'yanchengqu', '郾城', '区', 33.67070400, 113.94136200),
(101181506, 411104, 1815, 3, 5, 'shaolingqu', '召陵', '区', 33.57799000, 114.18514200),
(101181601, 411701, 1816, 3, 3, 'zhumadian', '驻马店', '市', 32.98658800, 114.04328000),
(101181602, 411721, 1816, 3, 4, 'xiping', '西平', '县', 33.37756200, 114.03971900),
(101181603, 411728, 1816, 3, 4, 'suiping', '遂平', '县', 33.14400400, 114.03606000),
(101181604, 411722, 1816, 3, 4, 'shangcai', '上蔡', '县', 33.26243900, 114.26438100),
(101181605, 411727, 1816, 3, 4, 'runan', '汝南', '县', 33.00672900, 114.36237900),
(101181606, 411726, 1816, 3, 4, 'biyang', '泌阳', '县', 32.72397500, 113.32714400),
(101181607, 411723, 1816, 3, 4, 'pingyu', '平舆', '县', 32.96271000, 114.61915900),
(101181608, 411729, 1816, 3, 4, 'xincai', '新蔡', '县', 32.74485500, 114.96546900),
(101181609, 411725, 1816, 3, 4, 'queshan', '确山', '县', 32.80187200, 114.03698600),
(101181610, 411724, 1816, 3, 4, 'zhengyang', '正阳', '县', 32.60569700, 114.39277400),
(101181611, 411702, 1816, 3, 5, 'yichengqu', '驿城', '区', 32.96835700, 114.00829000),
(101181701, 411201, 1817, 3, 3, 'sanmenxia', '三门峡', '市', 34.76087000, 111.23358300),
(101181702, 411282, 1817, 3, 4, 'lingbao', '灵宝', '市', 34.50954400, 110.89787500),
(101181703, 411221, 1817, 3, 4, 'mianchi', '渑池', '县', 34.75237900, 111.78586100),
(101181704, 411224, 1817, 3, 4, 'lushi', '卢氏', '县', 34.05419900, 111.04791100),
(101181705, 411281, 1817, 3, 4, 'yima', '义马', '市', 34.72022700, 111.91211000),
(101181706, 0, 1817, 3, 4, 'shanxian1', '陕县', '县', 34.72054800, 111.10356300),
(101181707, 411202, 1817, 3, 5, 'hubinqu', '湖滨', '区', 34.77177800, 111.28129500),
(101181713, 411203, 1817, 3, 5, 'xiazhouqu', '陕州', '区', 34.72715400, 111.10386700),
(101181801, 419001, 1818, 3, 3, 'jiyuan', '济源', '市', 35.11037800, 112.57301500),
(101190101, 320101, 1901, 3, 3, 'nanjing', '南京', '市', 32.08672700, 118.79683400),
(101190102, 320117, 1901, 3, 5, 'lishui2', '溧水', '区', 31.67911700, 119.09632100),
(101190103, 320118, 1901, 3, 5, 'gaochun', '高淳', '区', 31.32753200, 118.89240200),
(101190104, 320115, 1901, 3, 5, 'jiangning', '江宁', '区', 31.93547400, 118.89863600),
(101190105, 320116, 1901, 3, 5, 'luhe1', '六合', '区', 32.32224700, 118.82140100),
(101190106, 0, 1901, 3, 4, 'jiangpu', '江浦', '县', 32.06749100, 118.63902800),
(101190107, 320111, 1901, 3, 5, 'pukou', '浦口', '区 ', 32.05909300, 118.62789500),
(101190108, 320106, 1901, 3, 5, 'nanjinggulou', '鼓楼', '区', 32.07315700, 118.77664200),
(101190109, 320113, 1901, 3, 5, 'qixiaqu', '栖霞', '区', 32.16942400, 118.96372500),
(101190110, 320102, 1901, 3, 5, 'xuanwuqu', '玄武', '区', 32.07176600, 118.84893700),
(101190111, 0, 1901, 3, 5, 'baixiaqu', '白下', '区', 32.03036900, 118.82988400),
(101190112, 320104, 1901, 3, 5, 'qinhuaiqu', '秦淮', '区', 32.00796900, 118.81722100),
(101190113, 320105, 1901, 3, 5, 'jianyequ', '建邺', '区', 32.01251800, 118.71334200),
(101190114, 0, 1901, 3, 5, 'xiaguanqu', '下关', '区', 32.10922900, 118.77255300),
(101190115, 320114, 1901, 3, 5, 'yuhuataiqu', '雨花台', '区', 31.95455200, 118.72197900),
(101190201, 320201, 1902, 3, 3, 'wuxi1', '无锡', '市', 31.58794500, 120.30579300),
(101190202, 320281, 1902, 3, 4, 'jiangyin', '江阴', '市', 31.92065800, 120.28493900),
(101190203, 320282, 1902, 3, 4, 'yixing', '宜兴', '市', 31.31266100, 119.81357400),
(101190204, 320205, 1902, 3, 5, 'xishan', '锡山', '区', 31.58971500, 120.35785800),
(101190205, 0, 1902, 3, 5, 'chonganqu', '崇安', '区', 31.59734100, 120.32890300),
(101190206, 0, 1902, 3, 5, 'nanchangqu', '南长', '区', 31.54286600, 120.31579800),
(101190207, 0, 1902, 3, 5, 'beitangqu', '北塘', '区', 31.60936900, 120.28212600),
(101190208, 320206, 1902, 3, 5, 'huishanqu', '惠山', '区', 31.65637600, 120.21529400),
(101190209, 320211, 1902, 3, 5, 'binhuqu', '滨湖', '区', 31.46657900, 120.24850200),
(101190213, 320213, 1902, 3, 5, 'liangxiqu', '梁溪', '区', 31.57094600, 120.30653900),
(101190214, 320214, 1902, 3, 5, 'xinwuqu', '新吴', '区', 31.49716000, 120.37094900),
(101190301, 321101, 1903, 3, 3, 'zhenjiang', '镇江', '市', 32.19809800, 119.43306800),
(101190302, 321181, 1903, 3, 4, 'danyang', '丹阳', '市', 32.00168700, 119.59236200),
(101190303, 321182, 1903, 3, 4, 'yangzhong', '扬中', '市', 32.23482700, 119.79740900),
(101190304, 321183, 1903, 3, 4, 'jurong', '句容', '市', 31.94499900, 119.16869500),
(101190305, 321112, 1903, 3, 5, 'dantu', '丹徒', '区', 32.11582200, 119.52121700),
(101190306, 321102, 1903, 3, 5, 'jingkou', '京口', '区', 32.20199600, 119.58482200),
(101190307, 321111, 1903, 3, 5, 'runzhouqu', '润州', '区', 32.19664700, 119.43092000),
(101190401, 320501, 1904, 3, 3, 'suzhou', '苏州', '市', 31.32909300, 120.61087700),
(101190402, 320581, 1904, 3, 4, 'changshu', '常熟', '市', 31.65368600, 120.75250300),
(101190403, 320582, 1904, 3, 4, 'zhangjiagang', '张家港', '市', 31.87569700, 120.55567800),
(101190404, 320583, 1904, 3, 4, 'kunshan', '昆山', '市', 31.36590200, 120.95818000),
(101190405, 320506, 1904, 3, 5, 'wuzhong1', '吴中', '区', 31.26279100, 120.63197800),
(101190407, 320509, 1904, 3, 5, 'wujiang', '吴江', '区', 31.13907100, 120.64513500),
(101190408, 320585, 1904, 3, 4, 'taicang', '太仓', '市', 31.45773500, 121.13055000),
(101190409, 0, 1904, 3, 5, 'canglangqu', '沧浪', '区', 31.29572700, 120.61679300),
(101190410, 0, 1904, 3, 5, 'pingjiangqu', '平江', '区', 31.33230600, 120.63087800),
(101190411, 0, 1904, 3, 5, 'jinchangqu', '金阊', '区', 31.34452800, 120.58162500),
(101190412, 320505, 1904, 3, 5, 'huqiuqu', '虎丘', '区', 31.35186900, 120.47842400),
(101190413, 320507, 1904, 3, 5, 'xiangchengqu', '相城', '区', 31.45077500, 120.64685300),
(101190418, 320508, 1904, 3, 5, 'gusuqu', '姑苏', '区', 31.34186700, 120.62388000),
(101190501, 320601, 1905, 3, 3, 'nantong', '南通', '市', 32.06858700, 120.86040500),
(101190502, 320621, 1905, 3, 4, 'haian', '海安', '县', 32.53357300, 120.46734300),
(101190503, 320682, 1905, 3, 4, 'rugao', '如皋', '市', 32.38339200, 120.60647500),
(101190504, 320623, 1905, 3, 4, 'rudong', '如东', '县', 32.44778700, 121.17275700),
(101190507, 320681, 1905, 3, 4, 'qidong', '启东', '市', 31.80802600, 121.65744100),
(101190508, 320684, 1905, 3, 4, 'haimen', '海门', '市', 31.87117300, 121.18161500),
(101190509, 0, 1905, 3, 5, 'tongzhou1', '通州', '区', 32.06417000, 121.07504600),
(101190510, 320602, 1905, 3, 5, 'chongchuanqu', '崇川', '区', 31.96266100, 120.88759900),
(101190511, 320611, 1905, 3, 5, 'gangzhaqu', '港闸', '区', 32.07125600, 120.82387500),
(101190601, 321001, 1906, 3, 3, 'yangzhou', '扬州', '市', 32.40067900, 119.42006100),
(101190602, 321023, 1906, 3, 4, 'baoying', '宝应', '县', 33.24039200, 119.36072900),
(101190603, 321081, 1906, 3, 4, 'yizheng', '仪征', '市', 32.27225800, 119.18476600),
(101190604, 321084, 1906, 3, 4, 'gaoyou', '高邮', '市', 32.78165900, 119.45916100),
(101190605, 321012, 1906, 3, 5, 'jiangdu', '江都', '区', 32.45900100, 119.57782100),
(101190606, 321003, 1906, 3, 5, 'hanjiang1', '邗江', '区', 32.38287200, 119.40455500),
(101190607, 321002, 1906, 3, 5, 'guanglingqu', '广陵', '区', 32.39567000, 119.48667800),
(101190608, 0, 1906, 3, 5, 'weiyang', '维扬', '区', 32.43202600, 119.41273100),
(101190701, 320901, 1907, 3, 3, 'yancheng', '盐城', '市', 33.38258300, 120.17442800),
(101190702, 320921, 1907, 3, 4, 'xiangshui', '响水', '县', 34.19947900, 119.57836400),
(101190703, 320922, 1907, 3, 4, 'binhai', '滨海', '县', 33.99033400, 119.82083100),
(101190704, 320923, 1907, 3, 4, 'funing1', '阜宁', '县', 33.59514700, 119.61647700),
(101190705, 320924, 1907, 3, 4, 'sheyang', '射阳', '县', 33.77480600, 120.25805300),
(101190706, 320925, 1907, 3, 4, 'jianhu', '建湖', '县', 33.50573000, 119.79863800),
(101190707, 320981, 1907, 3, 4, 'dongtai', '东台', '市', 32.87460000, 120.34476900),
(101190708, 320904, 1907, 3, 5, 'dafeng', '大丰', '区', 33.19869700, 120.50110100),
(101190709, 320903, 1907, 3, 5, 'yandu', '盐都', '区', 33.33811000, 120.15388800),
(101190710, 320902, 1907, 3, 5, 'tinghuqu', '亭湖', '区', 33.37894800, 120.20635100),
(101190801, 320301, 1908, 3, 3, 'xuzhou', '徐州', '市', 34.27334200, 117.20703000),
(101190802, 320312, 1908, 3, 5, 'tongshan1', '铜山', '区', 34.18070000, 117.16942100),
(101190803, 320321, 1908, 3, 4, 'fengxian2', '丰县', '县', 34.69390600, 116.59539100),
(101190804, 320322, 1908, 3, 4, 'peixian', '沛县', '县', 34.75965000, 116.93985300),
(101190805, 320382, 1908, 3, 4, 'pizhou', '邳州', '市', 34.31747400, 117.95881500),
(101190806, 320324, 1908, 3, 4, 'suining2', '睢宁', '县', 33.91259800, 117.94156300),
(101190807, 320381, 1908, 3, 4, 'xinyi', '新沂', '市', 34.38151600, 118.35069000),
(101190808, 320302, 1908, 3, 5, 'gulouqu', '徐州鼓楼', '区', 34.29496500, 117.19144900),
(101190809, 320303, 1908, 3, 5, 'yunlongqu', '云龙', '区', 34.22248700, 117.27617600),
(101190810, 320305, 1908, 3, 5, 'jiawangqu', '贾汪', '区', 34.41052800, 117.49824600),
(101190811, 320311, 1908, 3, 5, 'quanshanqu', '泉山', '区', 34.24194700, 117.17558400),
(101190901, 320801, 1909, 3, 3, 'huaian1', '淮安', '市', 33.60548400, 119.01456000),
(101190902, 320831, 1909, 3, 4, 'jinhu', '金湖', '县', 33.02543300, 119.02058500),
(101190903, 320830, 1909, 3, 4, 'xuyi', '盱眙', '县', 33.01197100, 118.54436100),
(101190904, 320813, 1909, 3, 4, 'hongze', '洪泽', '区', 33.29422300, 118.87313800),
(101190905, 320826, 1909, 3, 4, 'lianshui', '涟水', '县', 33.78096000, 119.26033500),
(101190906, 320804, 1909, 3, 5, 'huaiyinqu', '淮阴', '区', 33.63810000, 119.04132200),
(101190908, 0, 1909, 3, 5, 'chuzhou', '楚州', '区', 33.50286900, 119.14109900),
(101190909, 0, 1909, 3, 5, 'qingpuqu', '清浦', '区', 33.48864200, 119.02532500),
(101190912, 320812, 1909, 3, 5, 'qingjiangpu', '清江浦', '区', 33.55935000, 119.03303100),
(101190913, 320803, 1909, 3, 5, 'huaianqu', '淮安', '区', 33.51864400, 119.15738000),
(101191001, 320701, 1910, 3, 3, 'lianyungang', '连云港', '市', 34.60975500, 119.16325900),
(101191002, 320722, 1910, 3, 4, 'donghai', '东海', '县', 34.54230900, 118.75284200),
(101191003, 320707, 1910, 3, 4, 'ganyu', '赣榆', '区', 34.84134900, 119.17333100),
(101191004, 320723, 1910, 3, 4, 'guanyun', '灌云', '县', 34.28438100, 119.23938100),
(101191005, 320724, 1910, 3, 4, 'guannan', '灌南', '县', 34.08713500, 119.31565100),
(101191006, 320703, 1910, 3, 5, 'lianyun', '连云', '区', 34.63892200, 119.46701700),
(101191007, 0, 1910, 3, 5, 'xinpu', '新浦', '区', 34.65680100, 119.26057400),
(101191008, 320706, 1910, 3, 5, 'lianyunganghaizhou', '连云港海州', '区', 34.57838500, 119.16988800),
(101191101, 320401, 1911, 3, 3, 'changzhou', '常州', '市', 31.78996800, 119.96845000),
(101191102, 320481, 1911, 3, 4, 'liyang', '溧阳', '市', 31.38612600, 119.50259000),
(101191103, 320413, 1911, 3, 4, 'jintan', '金坛', '区', 31.72324800, 119.59789700),
(101191104, 320412, 1911, 3, 5, 'wujin', '武进', '区', 31.70118800, 119.94243700),
(101191105, 320402, 1911, 3, 5, 'tianningqu', '天宁', '区', 31.77780300, 120.00176600),
(101191106, 320404, 1911, 3, 5, 'zhonglouqu', '钟楼', '区', 31.79851100, 119.91243900),
(101191107, 0, 1911, 3, 5, 'qishuyanqu', '戚墅堰', '区', 31.75689800, 120.05635900),
(101191108, 320411, 1911, 3, 5, 'changzhouxinbeiqu', '常州新北', '区', 31.83659300, 119.97854200),
(101191201, 321201, 1912, 3, 3, 'taizhou2', '泰州', '市', 32.52955900, 119.98051900),
(101191202, 321281, 1912, 3, 4, 'xinghua', '兴化', '市', 32.91045900, 119.85254100),
(101191203, 321283, 1912, 3, 4, 'taixing', '泰兴', '市', 32.17185400, 120.05174400),
(101191204, 321204, 1912, 3, 5, 'jiangyan', '姜堰', '区', 32.53465500, 120.11959000),
(101191205, 321282, 1912, 3, 4, 'jingjiang2', '靖江', '市', 31.98275100, 120.27713800),
(101191206, 321202, 1912, 3, 5, 'hailingqu', '海陵', '区', 32.48825800, 119.92117400),
(101191207, 321203, 1912, 3, 5, 'gaogangqu', '高港', '区', 32.33007500, 119.92574400),
(101191301, 321301, 1913, 3, 3, 'suqian', '宿迁', '市', 33.94973800, 118.29466700),
(101191302, 321322, 1913, 3, 4, 'shuyang', '沭阳', '县', 34.11134000, 118.76408000),
(101191303, 321323, 1913, 3, 4, 'siyang', '泗阳', '县', 33.72314000, 118.70303800),
(101191304, 321324, 1913, 3, 4, 'sihong', '泗洪', '县', 33.47605100, 118.22359100),
(101191305, 321311, 1913, 3, 5, 'suyu', '宿豫', '区', 33.94682200, 118.33078200),
(101191306, 321302, 1913, 3, 5, 'suchengqu', '宿城', '区', 33.86282900, 118.27464000),
(101200101, 420101, 2001, 3, 3, 'wuhan', '武汉', '市', 30.60748500, 114.42426800),
(101200102, 420114, 2001, 3, 5, 'caidian', '蔡甸', '区', 30.58215100, 114.02923000),
(101200103, 420116, 2001, 3, 5, 'huangpi', '黄陂', '区', 30.88128900, 114.37583700),
(101200104, 420117, 2001, 3, 5, 'xinzhou1', '新洲', '区', 30.84150800, 114.80126400),
(101200105, 420115, 2001, 3, 5, 'jiangxia', '江夏', '区', 30.37572300, 114.32163200),
(101200106, 420112, 2001, 3, 5, 'dongxihu', '东西湖', '区', 30.62006600, 114.13709500),
(101200107, 420103, 2001, 3, 5, 'jianghanqu', '江汉', '区', 30.61095100, 114.26638400),
(101200108, 420102, 2001, 3, 5, 'jianganqu', '江岸', '区', 30.65609100, 114.33286800),
(101200109, 420111, 2001, 3, 5, 'hongshan', '洪山', '区', 30.54362300, 114.43389600),
(101200110, 420105, 2001, 3, 5, 'hanyangqu', '汉阳', '区', 30.54726500, 114.21759200),
(101200111, 420113, 2001, 3, 5, 'hannanqu', '汉南', '区', 30.28714000, 113.96273200),
(101200112, 420106, 2001, 3, 5, 'wuchangqu', '武昌', '区', 30.56486000, 114.35362200),
(101200113, 420104, 2001, 3, 5, 'qiaokouqu', '硚口', '区', 30.60389100, 114.21975700),
(101200201, 420601, 2002, 3, 3, 'xiangyang', '襄阳', '市', 32.05705900, 112.15594600),
(101200202, 420607, 2002, 3, 5, 'xiangzhou1', '襄州', '区', 32.08716400, 112.21201700),
(101200203, 420626, 2002, 3, 4, 'baokang', '保康', '县', 31.87831000, 111.26130900),
(101200204, 420624, 2002, 3, 4, 'nanzhang', '南漳', '县', 31.77463600, 111.83890500),
(101200205, 420684, 2002, 3, 4, 'yicheng2', '宜城', '市', 31.62981600, 112.18347900),
(101200206, 420682, 2002, 3, 4, 'laohekou', '老河口', '市', 32.38676000, 111.67492800),
(101200207, 420625, 2002, 3, 4, 'gucheng1', '谷城', '县', 32.26447200, 111.60227600),
(101200208, 420683, 2002, 3, 4, 'zaoyang', '枣阳', '市', 32.06966700, 112.76167300),
(101200209, 420606, 2002, 3, 5, 'fanchengqu', '樊城', '区', 32.15395300, 111.92852800),
(101200210, 420602, 2002, 3, 5, 'xiangyangxiangcheng', '襄阳襄城', '区', 31.93536000, 112.01708300),
(101200301, 420701, 2003, 3, 3, 'ezhou', '鄂州', '市', 30.36987700, 114.86566000),
(101200302, 420702, 2003, 3, 5, 'liangzihu', '梁子湖', '区', 30.23197600, 114.51238400),
(101200303, 420704, 2003, 3, 5, 'echengqu', '鄂城', '区', 30.32060300, 114.90101600),
(101200401, 420901, 2004, 3, 3, 'xiaogan', '孝感', '市', 30.95567900, 113.92937200),
(101200402, 420982, 2004, 3, 4, 'anlu', '安陆', '市', 31.24967000, 113.69607000),
(101200403, 420923, 2004, 3, 4, 'yunmeng', '云梦', '县', 31.02107700, 113.73809400),
(101200404, 420922, 2004, 3, 4, 'dawu', '大悟', '县', 31.56116500, 114.12702200),
(101200405, 420981, 2004, 3, 4, 'yingcheng', '应城', '市', 30.92212100, 113.57293000),
(101200406, 420984, 2004, 3, 4, 'hanchuan', '汉川', '市', 30.54422200, 113.80706000),
(101200407, 420921, 2004, 3, 4, 'xiaochang', '孝昌', '县', 31.25815900, 113.99801000),
(101200408, 420902, 2004, 3, 5, 'xiaonanqu', '孝南', '区', 30.94461700, 114.01614200),
(101200501, 421101, 2005, 3, 3, 'huanggang', '黄冈', '市', 30.20728800, 115.09283200),
(101200502, 421122, 2005, 3, 4, 'hongan', '红安', '县', 31.28815300, 114.61823600),
(101200503, 421181, 2005, 3, 4, 'macheng', '麻城', '市', 31.14514300, 114.96277700),
(101200504, 421123, 2005, 3, 4, 'luotian', '罗田', '县', 30.78312100, 115.39922100),
(101200505, 421124, 2005, 3, 4, 'yingshan', '英山', '县', 30.73495900, 115.68125900),
(101200506, 421125, 2005, 3, 4, 'xishui', '浠水', '县', 30.43297900, 115.24126700),
(101200507, 421126, 2005, 3, 4, 'qichun', '蕲春', '县', 30.24206100, 115.44700600),
(101200508, 421127, 2005, 3, 4, 'huangmei', '黄梅', '县', 30.09414500, 115.94246300),
(101200509, 421182, 2005, 3, 4, 'wuxue', '武穴', '市', 29.96930900, 115.63813700),
(101200510, 421121, 2005, 3, 4, 'tuanfeng', '团风', '县', 30.64356900, 114.87219100),
(101200511, 421102, 2005, 3, 5, 'huangzhouqu', '黄州', '区', 30.51880200, 114.94956900),
(101200601, 420201, 2006, 3, 3, 'huangshi', '黄石', '市', 30.20533600, 115.04543300),
(101200602, 420281, 2006, 3, 4, 'daye', '大冶', '市', 30.10168100, 114.98620500),
(101200603, 420222, 2006, 3, 4, 'yangxin1', '阳新', '县', 29.83803100, 115.20278700),
(101200604, 420205, 2006, 3, 5, 'tieshan', '铁山', '区', 30.20659200, 114.90141200),
(101200605, 420204, 2006, 3, 5, 'xialu', '下陆', '区', 30.17391300, 114.96132700),
(101200606, 420203, 2006, 3, 5, 'xisaishan', '西塞山', '区', 30.20492400, 115.10995500),
(101200607, 420202, 2006, 3, 5, 'huangshigangqu', '黄石港', '区', 30.23376500, 115.07315900),
(101200701, 421201, 2007, 3, 3, 'xianning', '咸宁', '市', 29.88023200, 114.28850900),
(101200702, 421281, 2007, 3, 4, 'chibi', '赤壁', '市', 29.72046400, 113.93009100),
(101200703, 421221, 2007, 3, 4, 'jiayu', '嘉鱼', '县', 29.97073700, 113.93927700),
(101200704, 421223, 2007, 3, 4, 'chongyang', '崇阳', '县', 29.55560500, 114.03982800),
(101200705, 421222, 2007, 3, 4, 'tongcheng', '通城', '县', 29.24526900, 113.81696600),
(101200706, 421224, 2007, 3, 4, 'tongshan', '通山', '县', 29.60537600, 114.48260600),
(101200707, 421202, 2007, 3, 5, 'xianan', '咸安', '区', 29.85465000, 114.39186700),
(101200801, 421001, 2008, 3, 3, 'jingzhou', '荆州', '市', 30.36817100, 112.21311200),
(101200802, 421024, 2008, 3, 4, 'jiangling', '江陵', '县', 30.04182200, 112.42466400),
(101200803, 421022, 2008, 3, 4, 'gongan', '公安', '县', 30.05833600, 112.22964800),
(101200804, 421081, 2008, 3, 4, 'shishou', '石首', '市', 29.72093800, 112.42545400),
(101200805, 421023, 2008, 3, 4, 'jianli', '监利', '县', 29.81157400, 112.89746500),
(101200806, 421083, 2008, 3, 4, 'honghu', '洪湖', '市', 29.82545800, 113.47598000),
(101200807, 421087, 2008, 3, 4, 'songzi', '松滋', '市', 30.17294500, 111.60677800),
(101200808, 420703, 2008, 3, 5, 'huarongqu', '华容', '区', 30.47306800, 114.70147200),
(101200812, 421002, 2008, 3, 5, 'shashi', '沙市', '区', 30.31105600, 112.25558300),
(101200813, 421003, 2008, 3, 5, 'jingzhouqu', '荆州', '区', 30.35900110, 112.19657410),
(101200901, 420501, 2009, 3, 3, 'yichang', '宜昌', '市', 30.70155300, 111.29914700),
(101200902, 420525, 2009, 3, 4, 'yuanan', '远安', '县', 31.06086900, 111.64050800),
(101200903, 420527, 2009, 3, 4, 'zigui', '秭归', '县', 30.82589700, 110.97771100),
(101200904, 420526, 2009, 3, 4, 'xingshan', '兴山', '县', 31.34819600, 110.74680500),
(101200906, 420529, 2009, 3, 4, 'wufeng', '五峰', '自治县', 30.19968800, 110.67470600),
(101200907, 420582, 2009, 3, 4, 'dangyang', '当阳', '市', 30.84790400, 111.81214000),
(101200908, 420528, 2009, 3, 4, 'changyang', '长阳', '自治县', 30.61158100, 110.83872200),
(101200909, 420581, 2009, 3, 4, 'yidu', '宜都', '市', 30.37832700, 111.45000600),
(101200910, 420583, 2009, 3, 4, 'zhijiang', '枝江', '市', 30.42594000, 111.76053100),
(101200911, 0, 2009, 3, 4, 'sanxia', '三峡', '镇', 30.16286700, 110.27843200),
(101200912, 420506, 2009, 3, 5, 'yiling', '夷陵', '区', 30.77002200, 111.32634800),
(101200913, 420504, 2009, 3, 5, 'dianjunqu', '点军', '区', 30.62538500, 111.21627900),
(101200914, 420505, 2009, 3, 5, 'xiaoting', '猇亭', '区', 30.55184900, 111.45521500),
(101200915, 420502, 2009, 3, 5, 'xilingqu', '西陵', '区', 30.74082800, 111.31370600),
(101200916, 420503, 2009, 3, 5, 'wujiagang', '伍家岗', '区', 30.67865900, 111.38092200),
(101201001, 422801, 2010, 3, 4, 'enshi', '恩施', '市', 30.34931900, 109.48487500),
(101201002, 422802, 2010, 3, 4, 'lichuan', '利川', '市', 30.27793500, 108.94013600),
(101201003, 422822, 2010, 3, 4, 'jianshi', '建始', '县', 30.56803300, 109.72625000),
(101201004, 422826, 2010, 3, 4, 'xianfeng', '咸丰', '县', 29.66520300, 109.13972600),
(101201005, 422825, 2010, 3, 4, 'xuanen', '宣恩', '县', 29.98689900, 109.49148500),
(101201006, 422828, 2010, 3, 4, 'hefeng1', '鹤峰', '县', 29.89017100, 110.03366200),
(101201007, 422827, 2010, 3, 4, 'laifeng', '来凤', '县', 29.49348500, 109.40782800),
(101201008, 422823, 2010, 3, 4, 'badong', '巴东', '县', 30.61590000, 110.33000000),
(101201101, 420301, 2011, 3, 3, 'shiyan', '十堰', '市', 32.60414800, 110.78192500),
(101201102, 420324, 2011, 3, 4, 'zhuxi', '竹溪', '县', 32.31825500, 109.71530400),
(101201103, 420322, 2011, 3, 4, 'yunxi', '郧西', '县', 32.99318200, 110.42598300),
(101201104, 420304, 2011, 3, 5, 'yunyangqu', '郧阳', '区', 32.84130500, 110.81567100),
(101201105, 420323, 2011, 3, 4, 'zhushan', '竹山', '县', 32.22487500, 110.22869400),
(101201106, 420325, 2011, 3, 4, 'fangxian', '房县', '县', 32.05554200, 110.74109300),
(101201107, 420381, 2011, 3, 4, 'danjiangkou', '丹江口', '市', 32.54015700, 111.51312700),
(101201108, 420302, 2011, 3, 5, 'maojian', '茅箭', '区', 32.59752200, 110.82027100),
(101201109, 420303, 2011, 3, 5, 'zhangwan', '张湾', '区', 32.65229400, 110.76913600),
(101201201, 429021, 2012, 3, 4, 'shennongjia', '神农架', '区', 31.33518000, 110.57242200),
(101201301, 421301, 2013, 3, 3, 'suizhou', '随州', '市', 31.72142300, 113.41784300),
(101201302, 421381, 2013, 3, 4, 'guangshui', '广水', '市', 31.61765900, 114.01208800),
(101201303, 421303, 2013, 3, 5, 'zengduqu', '曾都', '区', 31.60798100, 113.46768100),
(101201321, 421321, 2013, 3, 4, 'suizhousuixian', '随县', '县', 31.86115100, 113.30653000),
(101201401, 420801, 2014, 3, 3, 'jingmen', '荆门', '市', 31.05086100, 112.21248000),
(101201402, 420881, 2014, 3, 4, 'zhongxiang', '钟祥', '市', 31.17597100, 112.61644100),
(101201403, 420821, 2014, 3, 4, 'jingshan', '京山', '县', 31.03661700, 113.13695200),
(101201404, 420804, 2014, 3, 5, 'duodao', '掇刀', '区', 30.97343100, 112.20783300),
(101201405, 420822, 2014, 3, 4, 'shayang', '沙洋', '县', 30.70922100, 112.58858100),
(101201412, 420802, 2014, 3, 5, 'dongbaoqu', '东宝', '区', 31.12983500, 112.08731100),
(101201501, 429006, 2015, 3, 4, 'tianmen', '天门', '市', 30.86572000, 113.31698900),
(101201601, 429004, 2016, 3, 4, 'xiantao', '仙桃', '市', 30.36088200, 113.42348200),
(101201701, 429005, 2017, 3, 4, 'qianjiang1', '潜江', '市', 30.38737700, 112.94020900),
(101210101, 330101, 2101, 3, 3, 'hangzhou', '杭州', '市', 30.24348700, 120.18287500),
(101210102, 330109, 2101, 3, 5, 'xiaoshan', '萧山', '区', 30.18380600, 120.26425300),
(101210103, 330122, 2101, 3, 4, 'tonglu', '桐庐', '县', 29.79353100, 119.69143400),
(101210104, 330127, 2101, 3, 4, 'chunan', '淳安', '县', 29.60877200, 119.04186400),
(101210105, 330182, 2101, 3, 4, 'jiande', '建德', '市', 29.47487700, 119.28116300),
(101210106, 330110, 2101, 3, 5, 'yuhang', '余杭', '区', 30.38017400, 120.29567800),
(101210107, 330185, 2101, 3, 4, 'linan', '临安', '市', 30.23387300, 119.72473300),
(101210108, 330111, 2101, 3, 5, 'fuyang', '富阳', '区', 30.04873500, 119.96010900),
(101210109, 330102, 2101, 3, 5, 'shangchengqu', '上城', '区', 30.23235800, 120.18012600),
(101210110, 330103, 2101, 3, 5, 'xiachengqu', '下城', '区', 30.31028800, 120.18653500),
(101210111, 330104, 2101, 3, 5, 'jiangganqu', '江干', '区', 30.31583200, 120.30382300),
(101210112, 330105, 2101, 3, 5, 'gongshuqu', '拱墅', '区', 30.34473200, 120.15884500),
(101210113, 360103, 2101, 3, 5, 'xihu', '西湖', '区', 28.65732600, 115.89894800),
(101210114, 330108, 2101, 3, 5, 'binjianqu', '滨江', '区', 30.18758800, 120.19237000),
(101210201, 330501, 2102, 3, 3, 'huzhou', '湖州', '市', 30.86344000, 120.02218800),
(101210202, 330522, 2102, 3, 4, 'changxing', '长兴', '县', 30.99006600, 119.90392600),
(101210203, 330523, 2102, 3, 4, 'anji', '安吉', '县', 30.63867500, 119.68035300),
(101210204, 330521, 2102, 3, 4, 'deqing', '德清', '县', 30.53535500, 119.95795000),
(101210205, 330503, 2102, 3, 5, 'nanxun', '南浔', '区', 30.76683100, 120.30914700),
(101210206, 330502, 2102, 3, 5, 'wuxingqu', '吴兴', '区', 30.80854500, 120.08891900),
(101210301, 330401, 2103, 3, 3, 'jiaxing', '嘉兴', '市', 30.76417100, 120.76359600),
(101210302, 330421, 2103, 3, 4, 'jiashan', '嘉善', '县', 30.85038600, 120.91833200),
(101210303, 330481, 2103, 3, 4, 'haining', '海宁', '市', 30.53412400, 120.68522500),
(101210304, 330483, 2103, 3, 4, 'tongxiang', '桐乡', '市', 30.53663000, 120.56768900),
(101210305, 330482, 2103, 3, 4, 'pinghu', '平湖', '市', 30.67723300, 121.01514200),
(101210306, 330424, 2103, 3, 4, 'haiyan1', '海盐', '县', 30.52643600, 120.94626300),
(101210307, 330402, 2103, 3, 5, 'nanhuqu', '南湖', '区', 30.71635800, 120.84453500),
(101210308, 330411, 2103, 3, 5, 'xiuzhouqu', '秀洲', '区', 30.77767900, 120.69190700),
(101210401, 330201, 2104, 3, 3, 'ningbo', '宁波', '市', 29.86319500, 121.53586500),
(101210403, 330282, 2104, 3, 4, 'cixi', '慈溪', '市', 30.17078000, 121.26659500),
(101210404, 330281, 2104, 3, 4, 'yuyao', '余姚', '市', 30.05475600, 121.16115700),
(101210405, 330283, 2104, 3, 4, 'fenghua', '奉化', '市', 29.62770400, 121.46452000),
(101210406, 330225, 2104, 3, 4, 'xiangshan', '象山', '县', 29.47670500, 121.86933900),
(101210408, 330226, 2104, 3, 4, 'ninghai', '宁海', '县', 29.33683700, 121.41982600),
(101210410, 330206, 2104, 3, 5, 'beilun', '北仑', '区', 29.89890800, 121.84474600),
(101210411, 330212, 2104, 3, 5, 'yinzhou', '鄞州', '区', 29.81651100, 121.54660300),
(101210412, 330211, 2104, 3, 5, 'zhenhai', '镇海', '区', 29.94898000, 121.71638000),
(101210413, 330203, 2104, 3, 5, 'haishuqu', '海曙', '区', 29.87680100, 121.53539500),
(101210414, 330204, 2104, 3, 5, 'jiangdongqu', '江东', '区', 29.87539200, 121.59800100),
(101210415, 500105, 2104, 3, 5, 'ningbojiangbei', '宁波江北', '区', 29.96639200, 121.49329900),
(101210501, 330601, 2105, 3, 3, 'shaoxing', '绍兴', '市', 30.01458000, 120.58038800),
(101210502, 330681, 2105, 3, 4, 'zhuji', '诸暨', '市', 29.72768200, 120.18482100),
(101210503, 330604, 2105, 3, 5, 'shangyu', '上虞', '区', 30.00187800, 120.85706500),
(101210504, 330624, 2105, 3, 4, 'xinchang', '新昌', '县', 29.49983200, 120.90386600),
(101210505, 330683, 2105, 3, 4, 'shengzhou', '嵊州', '市', 29.56141000, 120.83102600),
(101210506, 330602, 2105, 3, 5, 'yuechengqu', '越城', '区', 30.08190000, 120.49470000),
(101210507, 330603, 2105, 3, 5, 'keqiaoqv', '柯桥', '区', 30.08814400, 120.50117800),
(101210601, 331001, 2106, 3, 3, 'taizhou', '台州', '市', 28.66231700, 121.42700600),
(101210603, 331021, 2106, 3, 4, 'yuhuan', '玉环', '县', 28.13593000, 121.23180500),
(101210604, 331022, 2106, 3, 4, 'sanmen', '三门', '县', 29.10487300, 121.39577700),
(101210605, 331023, 2106, 3, 4, 'tiantai', '天台', '县', 29.14407900, 121.00672500),
(101210606, 331024, 2106, 3, 4, 'xianju', '仙居', '县', 28.84696600, 120.72880200),
(101210607, 331081, 2106, 3, 4, 'wenling', '温岭', '市', 28.47919900, 121.32491700),
(101210609, 0, 2106, 3, 4, 'hongjia', '洪家', '镇', 28.46531700, 121.42545800),
(101210610, 331082, 2106, 3, 4, 'linhai', '临海', '市', 28.87948800, 121.24699000),
(101210611, 331002, 2106, 3, 5, 'jiaojiang', '椒江', '区', 28.67372600, 121.44267600),
(101210612, 331003, 2106, 3, 5, 'huangyan', '黄岩', '区', 28.65548300, 121.26847600),
(101210613, 331004, 2106, 3, 5, 'luqiao', '路桥', '县', 28.58261400, 121.36512500),
(101210701, 330301, 2107, 3, 3, 'wenzhou', '温州', '市', 27.98049700, 120.68505600),
(101210702, 330329, 2107, 3, 4, 'taishun', '泰顺', '县', 27.55688400, 119.71764900),
(101210703, 330328, 2107, 3, 4, 'wencheng', '文成', '县', 27.78700100, 120.09149600),
(101210704, 330326, 2107, 3, 4, 'pingyang', '平阳', '县', 27.66191800, 120.56579300),
(101210705, 330381, 2107, 3, 4, 'ruian', '瑞安', '市', 27.76701700, 120.58071600),
(101210706, 330305, 2107, 3, 5, 'dongtou', '洞头', '区', 27.83615400, 121.15724900),
(101210707, 330382, 2107, 3, 4, 'yueqing', '乐清', '县', 28.08471700, 120.85964200),
(101210708, 330324, 2107, 3, 4, 'yongjia', '永嘉', '县', 28.06884200, 120.69532400),
(101210709, 330327, 2107, 3, 4, 'cangnan', '苍南', '县', 27.52842400, 120.41163700),
(101210710, 330302, 2107, 3, 5, 'luchengqu', '鹿城', '区', 28.06786500, 120.56579900),
(101210711, 330303, 2107, 3, 5, 'longwanqu', '龙湾', '区', 27.91334100, 120.81107800),
(101210712, 330304, 2107, 3, 5, 'ouhaiqu', '瓯海', '区', 27.97217700, 120.55840400),
(101210801, 331101, 2108, 3, 3, 'lishui', '丽水', '市', 28.44117700, 119.95434400),
(101210802, 331123, 2108, 3, 4, 'suichang', '遂昌', '县', 28.59211900, 119.27610400),
(101210803, 331181, 2108, 3, 4, 'longquan', '龙泉', '县', 28.07462300, 119.14146100),
(101210804, 331122, 2108, 3, 4, 'jinyun', '缙云', '县', 28.66076400, 120.09561700),
(101210805, 331121, 2108, 3, 4, 'qingtian', '青田', '县', 28.13666400, 120.27945400),
(101210806, 331125, 2108, 3, 4, 'yunhe', '云和', '县', 28.11579000, 119.57339700),
(101210807, 331126, 2108, 3, 4, 'qingyuan2', '庆元', '县', 27.61922000, 119.06259000),
(101210808, 331124, 2108, 3, 4, 'songyang', '松阳', '县', 28.44917100, 119.48201500),
(101210809, 331127, 2108, 3, 4, 'jingning1', '景宁', '自治县', 27.97331200, 119.63569700),
(101210810, 331102, 2108, 3, 5, 'liandu', '莲都', '区', 28.44736100, 119.84995200),
(101210811, 530702, 2108, 3, 5, 'guchengqu', '古城', '区', 26.85930000, 100.32859600),
(101210901, 330701, 2109, 3, 3, 'jinhua', '金华', '市', 29.10950300, 119.62990000),
(101210902, 330726, 2109, 3, 4, 'pujiang', '浦江', '县', 29.45247700, 119.89222200),
(101210903, 330781, 2109, 3, 4, 'lanxi1', '兰溪', '市', 29.21375700, 119.48003500),
(101210904, 330782, 2109, 3, 4, 'yiwu1', '义乌', '县', 29.37877400, 120.04288300),
(101210905, 330783, 2109, 3, 4, 'dongyang', '东阳', '县', 29.28964800, 120.24156600),
(101210906, 330723, 2109, 3, 4, 'wuyi1', '武义', '县', 28.90885900, 119.83108300),
(101210907, 330784, 2109, 3, 4, 'yongkang', '永康', '市', 28.90989900, 120.02123700),
(101210908, 330727, 2109, 3, 4, 'panan', '磐安', '县', 29.05404500, 120.45018600),
(101210909, 0, 2109, 3, 4, 'hengdian', '横店', '镇', 29.15970800, 120.32228600),
(101210910, 330702, 2109, 3, 5, 'wuchengqu', '婺城', '区', 28.98454000, 119.51757200),
(101210911, 330703, 2109, 3, 5, 'jindongqu', '金东', '区', 29.15552600, 119.80922700),
(101211001, 330801, 2110, 3, 3, 'quzhou1', '衢州', '市', 28.92257000, 118.88136000),
(101211002, 330822, 2110, 3, 4, 'changshan', '常山', '县', 28.90134300, 118.51128700),
(101211003, 330824, 2110, 3, 4, 'kaihua', '开化', '县', 29.13733700, 118.41549500),
(101211004, 330825, 2110, 3, 4, 'longyou', '龙游', '县', 29.00244200, 119.16689800),
(101211005, 330881, 2110, 3, 4, 'jiangshan', '江山', '市', 28.77219400, 118.64356300),
(101211006, 330803, 2110, 3, 5, 'qujiang1', '衢江', '县', 28.97978000, 118.95946000),
(101211007, 330802, 2110, 3, 5, 'kechengqu', '柯城', '区', 28.99853500, 118.81300300),
(101211101, 330901, 2111, 3, 3, 'zhoushan', '舟山', '市', 29.90162000, 121.98804300),
(101211102, 330922, 2111, 3, 4, 'shengsi', '嵊泗', '县', 30.72568600, 122.45138200),
(101211104, 330921, 2111, 3, 4, 'daishan', '岱山', '县', 30.26413900, 122.22623700),
(101211105, 330903, 2111, 3, 5, 'putuo', '普陀', '县', 29.97176000, 122.32386700),
(101211106, 330902, 2111, 3, 5, 'dinghai', '定海', '区', 30.01985800, 122.10677300),
(101220101, 340101, 2201, 3, 3, 'hefei', '合肥', '市', 31.88589700, 117.31733400),
(101220102, 340121, 2201, 3, 5, 'changfeng', '长丰', '县', 32.47801800, 117.16756400),
(101220103, 340122, 2201, 3, 5, 'feidong', '肥东', '县', 31.86170100, 117.48595000),
(101220104, 340123, 2201, 3, 5, 'feixi', '肥西', '县', 31.70683900, 117.15794800),
(101220105, 340103, 2201, 3, 5, 'luyang', '庐阳', '区', 31.88481700, 117.27143900);
INSERT INTO `cmf_plugin_modules_citys` (`id`, `code`, `pid`, `level`, `level3`, `pinyin`, `name`, `areaname`, `lat`, `lng`) VALUES
(101220106, 0, 2201, 3, 5, 'juchaoqu', '居巢', '区', 31.60489000, 117.86809800),
(101220107, 340102, 2201, 3, 5, 'yaohai', '瑶海', '区', 31.90537500, 117.33122400),
(101220108, 340111, 2201, 3, 5, 'baohequ', '包河', '区', 31.79072400, 117.35391300),
(101220109, 340104, 2201, 3, 5, 'shushanqu', '蜀山', '区', 31.83818500, 117.23128000),
(101220201, 340301, 2202, 3, 3, 'bengbu', '蚌埠', '市', 32.94303900, 117.37744900),
(101220202, 340321, 2202, 3, 4, 'huaiyuan', '怀远', '县', 32.97003100, 117.20523400),
(101220203, 340323, 2202, 3, 4, 'guzhen', '固镇', '县', 33.31646000, 117.30684200),
(101220204, 340322, 2202, 3, 4, 'wuhe', '五河', '县', 33.12782300, 117.87948600),
(101220205, 340302, 2202, 3, 5, 'longzihu', '龙子湖', '区', 32.92634300, 117.47832600),
(101220206, 340304, 2202, 3, 5, 'yuhuiqu', '禹会', '区', 32.88969600, 117.30551500),
(101220207, 340311, 2202, 3, 5, 'huaishangqu', '淮上', '区', 33.02381500, 117.38818400),
(101220208, 340303, 2202, 3, 5, 'bengshanqu', '蚌山', '区', 32.88152300, 117.35635600),
(101220301, 340201, 2203, 3, 3, 'wuhu', '芜湖', '市', 31.34063700, 118.39271000),
(101220302, 340222, 2203, 3, 4, 'fanchang', '繁昌', '县', 31.08294000, 118.19948300),
(101220303, 340221, 2203, 3, 4, 'wuhuxian', '芜湖', '县', 31.13480900, 118.57612400),
(101220304, 340223, 2203, 3, 4, 'nanling', '南陵', '县', 30.91493000, 118.33426000),
(101220305, 340207, 2203, 3, 5, 'jiujiangqu', '鸠江', '区', 31.37584900, 118.39800700),
(101220306, 340202, 2203, 3, 5, 'jinghuqu', '镜湖', '区', 31.35196600, 118.38724500),
(101220307, 340203, 2203, 3, 5, 'yijiangqu', '弋江', '区', 31.21667700, 118.33597000),
(101220308, 340208, 2203, 3, 5, 'sanshanqu', '三山', '区', 31.21282500, 118.31179800),
(101220401, 340401, 2204, 3, 3, 'huainan', '淮南', '市', 32.63037700, 117.01958300),
(101220402, 340421, 2204, 3, 4, 'fengtai1', '凤台', '县', 32.70944500, 116.71105100),
(101220403, 340406, 2204, 3, 4, 'panji', '潘集', '区', 32.77208000, 116.83471600),
(101220404, 340402, 2204, 3, 5, 'datongqu', '大通', '区', 32.64353600, 117.11713800),
(101220405, 340404, 2204, 3, 5, 'xiejiajiqu', '谢家集', '区', 32.54440000, 116.90877200),
(101220406, 340403, 2204, 3, 5, 'tianjiaanqu', '田家庵', '区', 32.56436400, 117.01468700),
(101220407, 340405, 2204, 3, 5, 'bagong-mountainqu', '八公山', '区', 32.65239000, 116.82552100),
(101220501, 340501, 2205, 3, 3, 'maanshan', '马鞍山', '市', 31.70563300, 118.50040000),
(101220502, 340521, 2205, 3, 4, 'dangtu', '当涂', '县', 31.57121300, 118.49797200),
(101220503, 340504, 2205, 3, 5, 'yushanqu', '雨山', '区', 31.63170000, 118.01080000),
(101220504, 0, 2205, 3, 5, 'jinjiazhuangqu', '金家庄', '区', 31.68060000, 118.27030000),
(101220505, 340503, 2205, 3, 5, 'huashanqu', '花山', '区', 31.71162700, 118.57834800),
(101220506, 340506, 2205, 3, 5, 'bowang', '博望', '区', 31.55738400, 118.82460600),
(101220601, 340801, 2206, 3, 3, 'anqing', '安庆', '市', 30.54971700, 117.06556400),
(101220602, 340722, 2206, 3, 4, 'zongyang', '枞阳', '县', 30.70073300, 117.22020000),
(101220603, 340825, 2206, 3, 4, 'taihu', '太湖', '县', 30.45984900, 116.29981800),
(101220604, 340824, 2206, 3, 4, 'qianshan', '潜山', '县', 30.63112900, 116.58127000),
(101220605, 340822, 2206, 3, 4, 'huaining', '怀宁', '县', 30.73382500, 116.82947500),
(101220606, 340826, 2206, 3, 4, 'susong', '宿松', '县', 30.22950300, 116.10399900),
(101220607, 340827, 2206, 3, 4, 'wangjiang', '望江', '县', 30.12442800, 116.69418300),
(101220608, 340828, 2206, 3, 4, 'yuexi', '岳西', '县', 30.84944200, 116.35992100),
(101220609, 340881, 2206, 3, 4, 'tongcheng1', '桐城', '市', 31.05036300, 116.97908400),
(101220610, 340802, 2206, 3, 5, 'yingjiangqu', '迎江', '区', 30.54145800, 117.15254200),
(101220611, 340811, 2206, 3, 5, 'yixiuqu', '宜秀', '区', 30.61434000, 117.05613000),
(101220612, 340803, 2206, 3, 5, 'daguanqu', '大观', '区', 30.53248700, 116.98096800),
(101220701, 341301, 2207, 3, 3, 'suzhou1', '宿州', '市', 33.63824600, 116.99494800),
(101220702, 341321, 2207, 3, 4, 'dangshan', '砀山', '县', 34.41548000, 116.33002500),
(101220703, 341323, 2207, 3, 4, 'lingbi', '灵璧', '县', 33.54201200, 117.55789000),
(101220704, 341324, 2207, 3, 5, 'sixian', '泗县', '县', 33.48298200, 117.91062900),
(101220705, 341322, 2207, 3, 5, 'xiaoxian', '萧县', '县', 34.18872800, 116.94729000),
(101220706, 341302, 2207, 3, 5, 'yongqiaoqu', '埇桥', '区', 33.72603200, 117.15907600),
(101220801, 341201, 2208, 3, 3, 'fuyang1', '阜阳', '市', 32.92248900, 115.86996000),
(101220802, 341225, 2208, 3, 4, 'funan', '阜南', '县', 32.63823000, 115.55406700),
(101220803, 341226, 2208, 3, 4, 'yingshang', '颍上', '县', 32.65325500, 116.25678900),
(101220804, 341221, 2208, 3, 4, 'linquan', '临泉', '县', 33.04026100, 115.26147300),
(101220805, 341282, 2208, 3, 4, 'jieshou', '界首', '市', 33.25701300, 115.37456400),
(101220806, 341222, 2208, 3, 4, 'taihe', '太和', '县', 33.16032600, 115.62193400),
(101220807, 341202, 2208, 3, 5, 'yingzhouqu', '颍州', '区', 32.86768900, 115.72772700),
(101220808, 341204, 2208, 3, 5, 'yingquanqu', '颍泉', '区', 33.07351000, 115.73402600),
(101220809, 341203, 2208, 3, 5, 'yingdongqu', '颍东', '区', 32.94158500, 116.03998500),
(101220901, 341601, 2209, 3, 3, 'bozhou2', '亳州', '市', 33.84778200, 115.79807100),
(101220902, 341621, 2209, 3, 4, 'guoyang', '涡阳', '县', 33.48875000, 116.24050200),
(101220903, 341623, 2209, 3, 4, 'lixin', '利辛', '县', 33.14472400, 116.20863500),
(101220904, 341622, 2209, 3, 4, 'mengcheng', '蒙城', '县', 33.26583100, 116.56424800),
(101220905, 341602, 2209, 3, 5, 'qiaochengqu', '谯城', '区', 33.78292400, 115.81281400),
(101221001, 341001, 2210, 3, 3, 'huangshan', '黄山', '', 29.72259400, 118.32209700),
(101221002, 341003, 2210, 3, 5, 'huangshanqu', '黄山', '区', 30.27294200, 118.14156800),
(101221003, 341002, 2210, 3, 5, 'tunxi', '屯溪', '区', 29.70233400, 118.32144800),
(101221004, 341024, 2210, 3, 4, 'qimen', '祁门', '县', 29.84613000, 117.72973200),
(101221005, 341023, 2210, 3, 4, 'yixian2', '黟县', '县', 29.92481100, 117.93826200),
(101221006, 341021, 2210, 3, 4, 'shexian2', '歙县', '县', 29.86688800, 118.41146900),
(101221007, 341022, 2210, 3, 4, 'xiuning', '休宁', '县', 29.78909500, 118.19917900),
(101221008, 0, 2210, 3, 5, 'huangshanfengjingqu', '黄山风景', '区', 30.13241300, 118.12991500),
(101221009, 341004, 2210, 3, 5, 'huizhouqu', '徽州', '区', 29.90214000, 118.27859100),
(101221101, 341101, 2211, 3, 3, 'chuzhou1', '滁州', '市', 32.30821300, 118.32335300),
(101221102, 341126, 2211, 3, 4, 'fengyang', '凤阳', '县', 32.90494600, 117.62861900),
(101221103, 341182, 2211, 3, 4, 'mingguang', '明光', '市', 32.76950300, 117.98805300),
(101221104, 341125, 2211, 3, 4, 'dingyuan', '定远', '县', 32.57481200, 117.84305900),
(101221105, 341124, 2211, 3, 4, 'quanjiao', '全椒', '县', 32.09110200, 118.27989700),
(101221106, 341122, 2211, 3, 4, 'laian', '来安', '县', 32.45217200, 118.43579200),
(101221107, 341181, 2211, 3, 4, 'tianchang', '天长', '市', 32.66757100, 119.00481700),
(101221108, 341102, 2211, 3, 5, 'langyaqu', '琅琊', '区', 32.33845800, 118.33756900),
(101221109, 341103, 2211, 3, 5, 'nanqiaoqu', '南谯', '区', 32.31020900, 118.27082800),
(101221201, 340601, 2212, 3, 3, 'huaibei', '淮北', '市', 33.96783900, 116.80257200),
(101221202, 340621, 2212, 3, 4, 'suixi', '濉溪', '县', 33.91547700, 116.76629900),
(101221203, 340604, 2212, 3, 5, 'lieshan', '烈山', '区', 33.84405400, 116.90818200),
(101221204, 340602, 2212, 3, 5, 'dujiqu', '杜集', '区', 34.11325100, 116.95496700),
(101221205, 340603, 2212, 3, 5, 'xiangshanqu', '相山', '区', 33.98833500, 116.72896200),
(101221301, 340701, 2213, 3, 3, 'tongling', '铜陵', '市', 30.94329100, 117.81718200),
(101221302, 0, 2213, 3, 5, 'tongguanshanqu', '铜官山', '区', 30.92941900, 117.81073700),
(101221303, 0, 2213, 3, 5, 'shizishanqu', '狮子山', '区', 30.94477200, 117.88974900),
(101221304, 340711, 2213, 3, 5, 'tonglingjiaoqu', '铜陵', '区', 30.82729100, 117.77448900),
(101221305, 340705, 2213, 3, 5, 'tongguanqu', '铜官', '区', 30.94250900, 117.86259200),
(101221306, 340706, 2213, 3, 5, 'yianqu', '义安', '区', 30.95983300, 117.79856500),
(101221401, 341801, 2214, 3, 3, 'xuancheng', '宣城', '市', 30.94972200, 118.77143000),
(101221402, 341823, 2214, 3, 4, 'jingxian1', '泾县', '县', 30.68857800, 118.41986400),
(101221403, 341825, 2214, 3, 4, 'jingde', '旌德', '县', 30.28635000, 118.54048700),
(101221404, 341881, 2214, 3, 4, 'ningguo', '宁国', '市', 30.63540600, 118.99265100),
(101221405, 341824, 2214, 3, 4, 'jixi1', '绩溪', '县', 30.06753300, 118.57851900),
(101221406, 341822, 2214, 3, 4, 'guangde', '广德', '县', 30.91216700, 119.40926900),
(101221407, 341821, 2214, 3, 4, 'langxi', '郎溪', '县', 31.12641200, 119.17965700),
(101221408, 341802, 2214, 3, 5, 'xuanzhouqu', '宣州', '区', 30.94363100, 118.79780300),
(101221501, 341501, 2215, 3, 3, 'luan', '六安', '市', 31.71410700, 116.50080000),
(101221502, 341522, 2215, 3, 4, 'huoqiu', '霍邱', '县', 32.35303800, 116.27791200),
(101221503, 340422, 2215, 3, 4, 'shouxian', '寿县', '县', 32.57323400, 116.78714400),
(101221504, 341504, 2215, 3, 5, 'yejiqu', '叶集', '区', 31.88531900, 115.96580900),
(101221505, 341524, 2215, 3, 4, 'jinzhai', '金寨', '县', 31.62531400, 115.97646200),
(101221506, 341525, 2215, 3, 4, 'huoshan', '霍山', '县', 31.39278600, 116.33295100),
(101221507, 341523, 2215, 3, 4, 'shucheng', '舒城', '县', 31.50941200, 117.15997300),
(101221508, 341503, 2215, 3, 5, 'yuan', '裕安', '区', 31.75303900, 116.30257300),
(101221509, 341502, 2215, 3, 5, 'jinanqu', '金安', '区', 31.63125800, 116.66194100),
(101221601, 340181, 2216, 3, 3, 'chaohu', '巢湖', '市', 31.62959100, 117.89565600),
(101221602, 340124, 2216, 3, 4, 'lujiang', '庐江', '县', 31.26232500, 117.29463900),
(101221603, 340225, 2216, 3, 4, 'wuwei1', '无为', '县', 31.30881500, 117.90881800),
(101221604, 340522, 2216, 3, 4, 'hanshan', '含山', '县', 31.74159500, 118.10788300),
(101221605, 340523, 2216, 3, 4, 'hexian', '和县', '县', 31.71521100, 118.35646400),
(101221701, 341701, 2217, 3, 3, 'chizhou', '池州', '市', 30.61867100, 117.52234500),
(101221702, 341721, 2217, 3, 4, 'dongzhi', '东至', '县', 30.17216900, 117.02840900),
(101221703, 341723, 2217, 3, 4, 'qingyang1', '青阳', '县', 30.63923000, 117.84736200),
(101221704, 0, 2217, 3, 4, 'jiuhuashan', '九华山', '县', 30.46695700, 117.80734000),
(101221705, 341722, 2217, 3, 4, 'shitai', '石台', '县', 30.21031300, 117.48630600),
(101221706, 341702, 2217, 3, 5, 'guichiqu', '贵池', '区', 30.51408600, 117.50847800),
(101230101, 350101, 2301, 3, 3, 'fuzhou', '福州', '市', 26.11359200, 119.31987600),
(101230102, 350124, 2301, 3, 4, 'minqing', '闽清', '县', 26.21277600, 118.90820900),
(101230103, 350121, 2301, 3, 4, 'minhou', '闽侯', '县', 26.15004700, 119.13172500),
(101230104, 350123, 2301, 3, 4, 'luoyuan', '罗源', '县', 26.45569500, 119.57627700),
(101230105, 350122, 2301, 3, 4, 'lianjiang', '连江', '县', 26.19450300, 119.56763200),
(101230107, 350125, 2301, 3, 4, 'yongtai', '永泰', '县', 25.84869900, 118.93442400),
(101230108, 350128, 2301, 3, 4, 'pingtan', '平潭', '县', 25.49872000, 119.79016800),
(101230110, 350182, 2301, 3, 4, 'changle1', '长乐', '市', 25.96288800, 119.52326600),
(101230111, 350181, 2301, 3, 4, 'fuqing', '福清', '市', 25.67611000, 119.38413800),
(101230112, 350111, 2301, 3, 5, 'jinan1', '晋安', '区', 26.22175200, 119.31492300),
(101230113, 350104, 2301, 3, 5, 'cangshanqu', '仓山', '区', 26.01966400, 119.33493600),
(101230114, 350103, 2301, 3, 5, 'taijiangqu', '台江', '区', 26.06215400, 119.32406300),
(101230115, 350105, 2301, 3, 5, 'maweiqu', '马尾', '区', 26.08265000, 119.51080200),
(101230201, 350201, 2302, 3, 3, 'xiamen', '厦门', '市', 24.63616900, 118.07406400),
(101230202, 350212, 2302, 3, 5, 'tongan', '同安', '区', 24.72274700, 118.15214900),
(101230203, 350211, 2302, 3, 5, 'jimeiqu', '集美', '区', 24.64097300, 118.02941200),
(101230204, 350206, 2302, 3, 5, 'huli', '湖里', '区', 24.52197400, 118.14467600),
(101230205, 350205, 2302, 3, 5, 'haicangqu', '海沧', '区', 24.53619000, 117.98395600),
(101230206, 350203, 2302, 3, 5, 'simingqu', '思明', '区', 24.46872800, 118.13453500),
(101230213, 350213, 2302, 3, 5, 'xianganqu', '翔安', '区', 24.62343100, 118.25292500),
(101230301, 350901, 2303, 3, 3, 'ningde', '宁德', '市', 26.66911500, 119.58436100),
(101230302, 350922, 2303, 3, 4, 'gutian', '古田', '县', 26.42872700, 118.62319800),
(101230303, 350921, 2303, 3, 4, 'xiapu', '霞浦', '县', 26.90973600, 120.03309700),
(101230304, 350924, 2303, 3, 4, 'shouning', '寿宁', '县', 27.45447900, 119.51498700),
(101230305, 350925, 2303, 3, 4, 'zhouning', '周宁', '县', 27.10459100, 119.33902500),
(101230306, 350981, 2303, 3, 4, 'fuan', '福安', '市', 26.83831800, 119.71622100),
(101230307, 350926, 2303, 3, 4, 'zherong', '柘荣', '县', 27.23393300, 119.90060900),
(101230308, 350982, 2303, 3, 4, 'fuding', '福鼎', '市', 27.28341700, 120.18791000),
(101230309, 350923, 2303, 3, 4, 'pingnan', '屏南', '县', 26.90827600, 118.98589500),
(101230310, 350902, 2303, 3, 5, 'jiaochengqu', '蕉城', '区', 26.76386500, 119.45455900),
(101230401, 350301, 2304, 3, 3, 'putian', '莆田', '市', 25.46455900, 119.12286600),
(101230402, 350322, 2304, 3, 4, 'xianyou', '仙游', '县', 25.36209400, 118.69160100),
(101230403, 0, 2304, 3, 5, 'xiuyugang', '秀屿港', '区', 25.28352800, 119.11845200),
(101230404, 350303, 2304, 3, 5, 'hanjiang', '涵江', '区', 25.49217200, 119.17576400),
(101230405, 350305, 2304, 3, 5, 'xiuyu', '秀屿', '区', 25.32443500, 119.11174200),
(101230406, 350304, 2304, 3, 5, 'licheng1', '荔城', '区', 25.43197900, 119.01512300),
(101230407, 350302, 2304, 3, 5, 'chengxiang', '城厢', '区', 25.41931900, 118.99388500),
(101230501, 350501, 2305, 3, 3, 'quanzhou', '泉州', '市', 24.97379700, 118.56800300),
(101230502, 350524, 2305, 3, 4, 'anxi', '安溪', '县', 25.05756800, 118.20150700),
(101230504, 350525, 2305, 3, 4, 'yongchun', '永春', '县', 25.32156500, 118.29404800),
(101230505, 350526, 2305, 3, 4, 'dehua', '德化', '县', 25.49149400, 118.24109400),
(101230506, 350583, 2305, 3, 4, 'nanan', '南安', '市', 24.98855400, 118.39794500),
(101230507, 0, 2305, 3, 4, 'chongwu', '崇武', '县', 24.89316400, 118.91800800),
(101230508, 350521, 2305, 3, 4, 'huian', '惠安', '县', 25.03078100, 118.79660500),
(101230509, 350582, 2305, 3, 4, 'jinjiang', '晋江', '市', 24.79474200, 118.45843100),
(101230510, 350581, 2305, 3, 4, 'shishi', '石狮', '市', 24.73224600, 118.64794000),
(101230512, 350502, 2305, 3, 5, 'lichengqu', '鲤城', '区', 24.90574500, 118.56845500),
(101230513, 350503, 2305, 3, 5, 'fengzequ', '丰泽', '区', 24.93627500, 118.60743200),
(101230514, 350505, 2305, 3, 5, 'quangangqu', '泉港', '区', 25.17347900, 118.81901700),
(101230515, 350504, 2305, 3, 5, 'luojiangqu1', '洛江', '区', 25.13341400, 118.64345300),
(101230527, 350527, 2305, 3, 4, 'jinmen', '金门', '县', 24.56867200, 118.33757000),
(101230601, 350601, 2306, 3, 3, 'zhangzhou', '漳州', '市', 24.45696100, 117.65394500),
(101230602, 350625, 2306, 3, 4, 'changtai', '长泰', '县', 24.62544900, 117.75915300),
(101230603, 350627, 2306, 3, 4, 'nanjing2', '南靖', '县', 24.58172500, 117.44423200),
(101230604, 350628, 2306, 3, 4, 'pinghe', '平和', '县', 24.36343700, 117.31489100),
(101230605, 350681, 2306, 3, 4, 'longhai', '龙海', '市', 24.45211400, 117.82092600),
(101230606, 350623, 2306, 3, 4, 'zhangpu', '漳浦', '县', 24.09924900, 117.55842600),
(101230607, 350624, 2306, 3, 4, 'zhaoan', '诏安', '县', 23.77441100, 117.09277800),
(101230608, 350626, 2306, 3, 4, 'dongshan', '东山', '县', 23.70126200, 117.43006100),
(101230609, 350622, 2306, 3, 4, 'yunxiao', '云霄', '县', 23.89367200, 117.35685800),
(101230610, 350629, 2306, 3, 4, 'huaan', '华安', '县', 25.00442500, 117.53410300),
(101230611, 350603, 2306, 3, 5, 'longwen', '龙文', '区', 24.53717700, 117.70403700),
(101230612, 350602, 2306, 3, 5, 'zhangzhouxiangcheng', '芗城', '区', 24.57508900, 117.63336600),
(101230701, 350801, 2307, 3, 3, 'longyan', '龙岩', '市', 25.09665700, 117.00657300),
(101230702, 350821, 2307, 3, 4, 'changting', '长汀', '县', 25.82883400, 116.34373600),
(101230703, 350825, 2307, 3, 4, 'liancheng', '连城', '县', 25.71053900, 116.75447300),
(101230704, 350824, 2307, 3, 4, 'wuping', '武平', '县', 25.09527700, 116.10034200),
(101230705, 350823, 2307, 3, 4, 'shanghang', '上杭', '县', 25.18245500, 116.73703100),
(101230706, 430802, 2307, 3, 5, 'yongding', '永定', '区', 24.73461300, 116.74417200),
(101230707, 350881, 2307, 3, 4, 'zhangping', '漳平', '市', 25.30693700, 117.42062200),
(101230708, 350802, 2307, 3, 5, 'xinluoqu', '新罗', '区', 25.22220600, 117.08632200),
(101230801, 350401, 2308, 3, 3, 'sanming', '三明', '市', 26.24239000, 117.61223000),
(101230802, 350424, 2308, 3, 4, 'ninghua', '宁化', '县', 26.26175400, 116.65436500),
(101230803, 350423, 2308, 3, 4, 'qingliu', '清流', '县', 26.17779700, 116.81690900),
(101230804, 350429, 2308, 3, 4, 'taining', '泰宁', '县', 26.92680000, 117.15300000),
(101230805, 350428, 2308, 3, 4, 'jiangle', '将乐', '县', 26.69570000, 117.47900000),
(101230806, 350430, 2308, 3, 4, 'jianning', '建宁', '县', 26.83090200, 116.84608400),
(101230807, 350421, 2308, 3, 4, 'mingxi', '明溪', '县', 26.35585700, 117.20222600),
(101230808, 350427, 2308, 3, 4, 'shaxian1', '沙县', '县', 26.39730000, 117.79245000),
(101230809, 350426, 2308, 3, 4, 'youxi', '尤溪', '县', 26.16690000, 118.14200000),
(101230810, 350481, 2308, 3, 4, 'yongan', '永安', '市', 25.97502500, 117.37864500),
(101230811, 350425, 2308, 3, 4, 'datian', '大田', '县', 25.69269900, 117.84711500),
(101230812, 350403, 2308, 3, 5, 'sanyuanqu', '三元', '区', 26.17396700, 117.51689600),
(101230813, 350402, 2308, 3, 5, 'meiliequ', '梅列', '区', 26.30744900, 117.63050100),
(101230901, 350701, 2309, 3, 3, 'nanping', '南平', '市', 26.62204700, 118.17798900),
(101230902, 350721, 2309, 3, 4, 'shunchang', '顺昌', '县', 26.80023900, 117.81586400),
(101230903, 350723, 2309, 3, 4, 'guangze', '光泽', '县', 27.55046600, 117.35186700),
(101230904, 350781, 2309, 3, 4, 'shaowu', '邵武', '市', 27.35063800, 117.48071700),
(101230905, 350782, 2309, 3, 4, 'wuyishan', '武夷山', '市', 27.72940000, 118.03109900),
(101230906, 350722, 2309, 3, 4, 'pucheng1', '浦城', '县', 27.91726300, 118.54125600),
(101230907, 350703, 2309, 3, 5, 'jianyang', '建阳', '区', 27.35501700, 118.11435300),
(101230908, 350724, 2309, 3, 4, 'songxi', '松溪', '县', 27.52623200, 118.78546800),
(101230909, 350725, 2309, 3, 4, 'zhenghe', '政和', '县', 27.36610400, 118.85764200),
(101230910, 350783, 2309, 3, 4, 'jianou', '建瓯', '市', 27.02421100, 118.29461700),
(101230911, 350702, 2309, 3, 5, 'yanping', '延平', '区', 26.59015500, 118.25473700),
(101231001, 350000, 2310, 3, 3, 'diaoyudao', '钓鱼岛', '', 26.10078000, 119.29514400),
(101240101, 360101, 2401, 3, 3, 'nanchang', '南昌', '市', 28.65422200, 115.91901000),
(101240102, 360112, 2401, 3, 5, 'xinjian', '新建', '区', 28.69244500, 115.81527200),
(101240103, 360121, 2401, 3, 4, 'nanchangxian', '南昌', '县', 28.54545900, 115.94416200),
(101240104, 360123, 2401, 3, 4, 'anyi', '安义', '县', 28.84450700, 115.54924800),
(101240105, 360124, 2401, 3, 4, 'jinxian', '进贤', '县', 28.35402500, 116.24592000),
(101240106, 360102, 2401, 3, 5, 'donghuqu', '东湖', '区', 28.54764300, 115.94694000),
(101240107, 360104, 2401, 3, 5, 'qingyunpuqu', '青云谱', '区', 28.63660100, 115.92195400),
(101240108, 360105, 2401, 3, 5, 'wanliqu', '湾里', '区', 28.80055700, 115.75048000),
(101240109, 360111, 2401, 3, 5, 'qingshanhuqu', '青山湖', '区', 28.70084900, 115.93090600),
(101240201, 360401, 2402, 3, 3, 'jiujiang', '九江', '市', 29.70383300, 116.00649100),
(101240202, 360481, 2402, 3, 4, 'ruichang', '瑞昌', '市', 29.68857000, 115.67179200),
(101240203, 360483, 2402, 3, 4, 'lushan1', '庐山', '市', 29.60882800, 115.87977000),
(101240204, 360423, 2402, 3, 4, 'wuning', '武宁', '县', 29.25632300, 115.10057900),
(101240205, 360426, 2402, 3, 4, 'dean', '德安', '县', 29.30966800, 115.76662700),
(101240206, 360425, 2402, 3, 4, 'yongxiu', '永修', '县', 29.01998900, 115.81599300),
(101240207, 360429, 2402, 3, 4, 'hukou', '湖口', '县', 29.72888500, 116.28496500),
(101240208, 360430, 2402, 3, 4, 'pengze', '彭泽', '县', 29.90215000, 116.55562000),
(101240209, 0, 2402, 3, 4, 'xingzi', '星子', '县', 29.44812800, 116.04506000),
(101240210, 360428, 2402, 3, 4, 'duchang', '都昌', '县', 29.27319400, 116.20409900),
(101240212, 360424, 2402, 3, 4, 'xiushui', '修水', '县', 29.02602200, 114.54670200),
(101240213, 360482, 2402, 3, 4, 'gongqingcheng', '共青城', '市', 29.25475700, 115.81511200),
(101240214, 360403, 2402, 3, 5, 'xunyangqu', '浔阳', '区', 29.71784900, 116.00276800),
(101240221, 360421, 2402, 3, 4, 'jiujiangxian', '九江', '县', 29.61455300, 115.91444300),
(101240222, 360402, 2402, 3, 5, 'lianxi', '濂溪', '区', 29.67725100, 115.99343400),
(101240301, 361101, 2403, 3, 3, 'shangrao', '上饶', '市', 28.49165600, 118.00640000),
(101240302, 361128, 2403, 3, 4, 'poyang', '鄱阳', '县', 29.01169900, 116.69974600),
(101240303, 361130, 2403, 3, 4, 'wuyuan1', '婺源', '县', 29.24808600, 117.86179800),
(101240305, 361127, 2403, 3, 4, 'yugan', '余干', '县', 28.70230200, 116.69564700),
(101240306, 361129, 2403, 3, 4, 'wannian', '万年', '县', 28.68548300, 117.08019800),
(101240307, 361181, 2403, 3, 4, 'dexing', '德兴', '市', 28.94646400, 117.57871300),
(101240308, 361121, 2403, 3, 4, 'shangraoxian', '上饶', '县', 28.44898300, 117.90785000),
(101240309, 361126, 2403, 3, 4, 'yiyang2', '弋阳', '县', 28.37804400, 117.44958800),
(101240310, 361125, 2403, 3, 4, 'hengfeng', '横峰', '县', 28.41317600, 117.60200700),
(101240311, 361124, 2403, 3, 4, 'yanshan2', '铅山', '县', 28.31521700, 117.70945100),
(101240312, 361123, 2403, 3, 4, 'yushan', '玉山', '县', 28.65964300, 118.23641000),
(101240313, 361103, 2403, 3, 5, 'guangfeng', '广丰', '区', 28.43628600, 118.19124000),
(101240314, 361102, 2403, 3, 5, 'xinzhouqu', '信州', '区', 28.49722300, 118.05057800),
(101240401, 361001, 2404, 3, 3, 'fuzhou1', '抚州', '市', 27.91990000, 116.35400000),
(101240402, 361030, 2404, 3, 4, 'guangchang', '广昌', '县', 26.83726700, 116.32575700),
(101240403, 361025, 2404, 3, 4, 'lean', '乐安', '县', 27.42876500, 115.83048100),
(101240404, 361024, 2404, 3, 4, 'chongren', '崇仁', '县', 27.76439400, 116.06110100),
(101240405, 361027, 2404, 3, 4, 'jinxi', '金溪', '县', 27.91895900, 116.75505800),
(101240406, 361028, 2404, 3, 4, 'zixi', '资溪', '县', 27.72152200, 117.07892500),
(101240407, 361026, 2404, 3, 4, 'yihuang', '宜黄', '县', 27.54614600, 116.22212800),
(101240408, 361021, 2404, 3, 4, 'nancheng', '南城', '县', 27.56740800, 116.61293900),
(101240409, 361023, 2404, 3, 4, 'nanfeng', '南丰', '县', 27.27405700, 116.57684200),
(101240410, 361022, 2404, 3, 4, 'lichuan1', '黎川', '县', 27.28233300, 116.90768100),
(101240411, 622926, 2404, 3, 4, 'dongxiang1', '东乡族', '自治县', 28.22599000, 116.62583300),
(101240412, 361002, 2404, 3, 5, 'linchuanqu', '临川', '区', 27.94080800, 116.31801800),
(101240501, 360901, 2405, 3, 3, 'yichun1', '宜春', '市', 27.78528200, 114.38899800),
(101240502, 360926, 2405, 3, 4, 'tonggu', '铜鼓', '县', 28.52077000, 114.37117200),
(101240503, 360924, 2405, 3, 4, 'yifeng', '宜丰', '县', 28.39361000, 114.80354000),
(101240504, 360922, 2405, 3, 4, 'wanzai', '万载', '县', 28.10568900, 114.44485400),
(101240505, 360923, 2405, 3, 4, 'shanggao', '上高', '县', 28.23282700, 114.92449400),
(101240506, 360925, 2405, 3, 4, 'jingan', '靖安', '县', 28.86147900, 115.36262900),
(101240507, 360921, 2405, 3, 4, 'fengxin', '奉新', '县', 28.68842300, 115.40049100),
(101240508, 360983, 2405, 3, 4, 'gaoan', '高安', '市', 28.41725500, 115.37561600),
(101240509, 360982, 2405, 3, 4, 'zhangshu', '樟树', '市', 28.07669100, 115.57782700),
(101240510, 360981, 2405, 3, 4, 'fengcheng1', '丰城', '市', 28.18201400, 115.79087300),
(101240511, 360902, 2405, 3, 5, 'yuanzhouqu', '袁州区', '区', 27.83938300, 114.29035800),
(101240601, 360801, 2406, 3, 3, 'jian1', '吉安', '市', 27.11010600, 115.02182000),
(101240602, 360821, 2406, 3, 4, 'jianxian', '吉安', '县', 27.03989000, 114.90773300),
(101240603, 360822, 2406, 3, 4, 'jishui', '吉水', '县', 27.17693600, 115.13408700),
(101240604, 360824, 2406, 3, 4, 'xingan', '新干', '县', 27.73268900, 115.39711600),
(101240605, 360823, 2406, 3, 4, 'xiajiang', '峡江', '县', 27.59856400, 115.33617000),
(101240606, 360825, 2406, 3, 4, 'yongfeng', '永丰', '县', 27.31887600, 115.44376000),
(101240607, 360830, 2406, 3, 4, 'yongxin', '永新', '县', 26.94500200, 114.24309600),
(101240608, 360881, 2406, 3, 4, 'jinggangshan', '井冈山', '市', 26.72695700, 114.29748200),
(101240609, 360828, 2406, 3, 4, 'wanan', '万安', '县', 26.45825400, 114.78618200),
(101240610, 360827, 2406, 3, 4, 'suichuan', '遂川', '县', 26.31373700, 114.52053700),
(101240611, 360826, 2406, 3, 4, 'taihe1', '泰和', '县', 26.79023100, 114.90886100),
(101240612, 360829, 2406, 3, 4, 'anfu', '安福', '县', 27.39287400, 114.61989300),
(101240613, 360803, 2406, 3, 5, 'qingyuanqu', '青原', '区', 27.08794700, 115.02127700),
(101240614, 360802, 2406, 3, 5, 'jizhouqu', '吉州', '区', 27.16092500, 114.96043700),
(101240701, 360701, 2407, 3, 3, 'ganzhou', '赣州', '市', 25.81962500, 114.96512200),
(101240702, 360725, 2407, 3, 4, 'chongyi', '崇义', '县', 25.68178400, 114.30826700),
(101240703, 360724, 2407, 3, 4, 'shangyou', '上犹', '县', 25.78517200, 114.55113800),
(101240704, 360703, 2407, 3, 5, 'nankang', '南康', '市', 25.66147100, 114.76540300),
(101240705, 360723, 2407, 3, 4, 'dayu', '大余', '县', 25.40131400, 114.36211200),
(101240706, 360722, 2407, 3, 4, 'xinfeng', '信丰', '县', 25.38670400, 114.92283000),
(101240707, 360730, 2407, 3, 4, 'ningdu', '宁都', '县', 26.47011600, 116.00947200),
(101240708, 360735, 2407, 3, 4, 'shicheng', '石城', '县', 26.31477500, 116.34699500),
(101240709, 360781, 2407, 3, 4, 'ruijin', '瑞金', '市', 25.86311700, 116.05599400),
(101240710, 360731, 2407, 3, 4, 'yudu', '于都', '县', 25.97608100, 115.41691900),
(101240711, 360733, 2407, 3, 4, 'huichang', '会昌', '县', 25.60027200, 115.78605700),
(101240712, 360726, 2407, 3, 4, 'anyuan', '安远', '县', 25.13692700, 115.39392200),
(101240713, 360729, 2407, 3, 4, 'quannan', '全南', '县', 24.74240300, 114.53012500),
(101240714, 360727, 2407, 3, 4, 'longnan', '龙南', '县', 24.91106900, 114.78987300),
(101240715, 360728, 2407, 3, 4, 'dingnan', '定南', '县', 24.78441000, 115.02784500),
(101240716, 360734, 2407, 3, 4, 'xunwu', '寻乌', '县', 24.96337100, 115.64663600),
(101240717, 360732, 2407, 3, 4, 'xingguo', '兴国', '县', 26.33793700, 115.36319000),
(101240718, 360721, 2407, 3, 4, 'ganxian', '赣县', '县', 25.86069100, 115.01156100),
(101240719, 360702, 2407, 3, 5, 'zhanggongqu', '章贡', '区', 25.83871100, 114.93736500),
(101240801, 360201, 2408, 3, 3, 'jingdezhen', '景德镇', '市', 29.29223600, 117.22262000),
(101240802, 360281, 2408, 3, 4, 'leping', '乐平', '市', 28.97844000, 117.15179600),
(101240803, 360222, 2408, 3, 4, 'fuliang', '浮梁', '县', 29.34731000, 117.22992300),
(101240804, 360202, 2408, 3, 5, 'changjiangqu', '昌江区', '区', 29.27894300, 117.19020000),
(101240813, 360203, 2408, 3, 5, 'zhushanqu', '珠山', '区', 29.30654500, 117.20722100),
(101240901, 360301, 2409, 3, 3, 'pingxiang1', '萍乡', '县', 27.62870400, 113.86101900),
(101240902, 360321, 2409, 3, 4, 'lianhua', '莲花', '县', 27.12766900, 113.96146500),
(101240903, 360322, 2409, 3, 4, 'shangli', '上栗', '县', 27.88030200, 113.79531100),
(101240904, 360302, 2409, 3, 5, 'anyuanqu', '安源', '区', 27.63319800, 113.83954000),
(101240905, 360323, 2409, 3, 4, 'luxi3', '芦溪', '县', 27.65244500, 114.05314300),
(101240906, 360313, 2409, 3, 5, 'xiangdong', '湘东', '区', 27.64007500, 113.73304700),
(101241001, 360501, 2410, 3, 3, 'xinyu', '新余', '市', 27.80964500, 114.94364000),
(101241002, 360521, 2410, 3, 4, 'fenyi', '分宜', '县', 27.80498500, 114.66334700),
(101241003, 360502, 2410, 3, 5, 'yushuiqu', '渝水', '区', 27.85057800, 115.00785100),
(101241101, 360601, 2411, 3, 3, 'yingtan', '鹰潭', '县', 28.23495400, 117.02766200),
(101241102, 360622, 2411, 3, 4, 'yujiang', '余江', '县', 28.21549000, 116.81846800),
(101241103, 360681, 2411, 3, 4, 'guixi', '贵溪', '市', 28.29033800, 117.21494200),
(101241104, 360602, 2411, 3, 5, 'yuehuqu', '月湖', '区', 28.24720500, 117.05770600),
(101250101, 430101, 2501, 3, 3, 'changsha', '长沙', '市', 28.19939200, 113.01477000),
(101250102, 430124, 2501, 3, 4, 'ningxiang', '宁乡', '县', 28.27748300, 112.55188500),
(101250103, 430181, 2501, 3, 4, 'liuyang', '浏阳', '市', 28.16283300, 113.64307600),
(101250104, 0, 2501, 3, 4, 'mapoling', '马坡岭', '县', 28.20068100, 113.07613600),
(101250105, 430112, 2501, 3, 5, 'wangcheng', '望城', '区', 28.36073500, 112.81787300),
(101250106, 430102, 2501, 3, 5, 'furongqu', '芙蓉', '区', 28.20381100, 113.02096900),
(101250107, 430103, 2501, 3, 5, 'tianxinqu', '天心', '区', 28.14447100, 112.99619500),
(101250108, 430104, 2501, 3, 5, 'yueluqu', '岳麓', '区', 28.20270700, 112.90869900),
(101250109, 430105, 2501, 3, 5, 'kaifuqu', '开福', '区', 28.26021900, 113.02473000),
(101250110, 430111, 2501, 3, 5, 'changshayuhua', '雨花', '区', 28.14644400, 113.02020100),
(101250121, 430121, 2501, 3, 4, 'changshaxian', '长沙', '县', 28.25254100, 113.08864700),
(101250201, 430301, 2502, 3, 3, 'xiangtan', '湘潭', '市', 27.87600400, 112.91308300),
(101250202, 430382, 2502, 3, 4, 'shaoshan', '韶山', '市', 27.92149500, 112.52901000),
(101250203, 430381, 2502, 3, 4, 'xiangxiang', '湘乡', '市', 27.74531500, 112.52904400),
(101250204, 430302, 2502, 3, 5, 'yuhuqu', '雨湖', '区', 27.87184300, 112.89448000),
(101250205, 430304, 2502, 3, 5, 'yuetangqu', '岳塘', '区', 27.92774700, 113.02348800),
(101250221, 430321, 2502, 3, 4, 'xiangtanxian', '湘潭', '县', 27.77554000, 112.95570000),
(101250301, 430201, 2503, 3, 3, 'zhuzhou', '株洲', '', 27.84426100, 113.15400000),
(101250302, 430223, 2503, 3, 4, 'youxian', '攸县', '县', 27.01136400, 113.35507400),
(101250303, 430281, 2503, 3, 4, 'liling', '醴陵', '市', 27.67022200, 113.51178600),
(101250305, 430224, 2503, 3, 4, 'chaling', '茶陵', '县', 26.81105000, 113.54971700),
(101250306, 430225, 2503, 3, 4, 'yanling1', '炎陵', '县', 26.48990200, 113.77265500),
(101250307, 430202, 2503, 3, 5, 'hetangqu', '荷塘', '区', 27.90722900, 113.21252600),
(101250308, 430203, 2503, 3, 5, 'lusongqu', '芦淞', '区', 27.82207300, 113.16976000),
(101250309, 430204, 2503, 3, 5, 'shifengqu', '石峰', '区', 27.94158400, 113.16351100),
(101250310, 430211, 2503, 3, 5, 'tianyuanqu', '天元', '区', 27.77777200, 113.06800900),
(101250321, 430221, 2503, 3, 4, 'zhuzhouxian', '株洲', '县', 27.70586700, 113.14926700),
(101250401, 430401, 2504, 3, 3, 'hengyang', '衡阳', '市', 26.89447200, 112.62841000),
(101250402, 430423, 2504, 3, 4, 'hengshan1', '衡山', '县', 27.21841000, 112.88763100),
(101250403, 430424, 2504, 3, 4, 'hengdong', '衡东', '县', 27.08117000, 112.95316800),
(101250404, 430426, 2504, 3, 4, 'qidong1', '祁东', '县', 26.78096700, 112.12517300),
(101250405, 430421, 2504, 3, 4, 'hengyangxian', '衡阳', '县', 26.96963500, 112.37053200),
(101250406, 430482, 2504, 3, 4, 'changning', '常宁', '市', 26.42093200, 112.39999500),
(101250407, 430422, 2504, 3, 4, 'hengnan', '衡南', '县', 26.73824800, 112.67787700),
(101250408, 430481, 2504, 3, 4, 'leiyang', '耒阳', '市', 26.40431900, 112.82236000),
(101250409, 430412, 2504, 3, 5, 'nanyue', '南岳', '区', 27.23244400, 112.73860400),
(101250410, 430405, 2504, 3, 5, 'zhuhuiqu', '珠晖', '区', 26.88222500, 112.68849000),
(101250411, 430406, 2504, 3, 5, 'yanfengqu', '雁峰', '区', 26.85286200, 112.60790700),
(101250412, 430407, 2504, 3, 5, 'shiguqu', '石鼓', '区', 26.95888000, 112.60248800),
(101250413, 430408, 2504, 3, 5, 'zhengxiangqu', '蒸湘', '区', 26.88650900, 112.55504700),
(101250501, 431001, 2505, 3, 3, 'chenzhou', '郴州', '市', 25.77671100, 113.02131100),
(101250502, 431021, 2505, 3, 4, 'guiyang', '桂阳', '县', 25.75411600, 112.73414100),
(101250503, 431024, 2505, 3, 4, 'jiahe', '嘉禾', '县', 25.58752000, 112.36902100),
(101250504, 431022, 2505, 3, 4, 'yizhang', '宜章', '县', 25.39979200, 112.94877200),
(101250505, 431025, 2505, 3, 4, 'linwu', '临武', '县', 25.27556000, 112.56345600),
(101250507, 431081, 2505, 3, 4, 'zixing', '资兴', '市', 25.97624300, 113.23614600),
(101250508, 431026, 2505, 3, 4, 'rucheng', '汝城', '县', 25.53281600, 113.68472700),
(101250509, 431028, 2505, 3, 4, 'anren', '安仁', '县', 26.70905600, 113.26944100),
(101250510, 431023, 2505, 3, 4, 'yongxing', '永兴', '县', 26.12715100, 113.11652700),
(101250511, 431027, 2505, 3, 4, 'guidong', '桂东', '县', 26.07761600, 113.94461400),
(101250512, 431003, 2505, 3, 5, 'suxian', '苏仙', '区', 25.80636700, 113.04873300),
(101250513, 431002, 2505, 3, 5, 'beihuqu', '北湖', '区', 25.67915800, 112.88447600),
(101250601, 430701, 2506, 3, 3, 'changde', '常德', '市', 29.07235400, 111.69593800),
(101250602, 430721, 2506, 3, 4, 'anxiang', '安乡', '县', 29.41130900, 112.17113100),
(101250603, 430725, 2506, 3, 4, 'taoyuan', '桃源', '县', 28.90250300, 111.48892500),
(101250604, 430722, 2506, 3, 4, 'hanshou', '汉寿', '县', 28.90610700, 111.97051400),
(101250605, 430723, 2506, 3, 4, 'lixian2', '澧县', '县', 29.81894100, 111.60414600),
(101250606, 430724, 2506, 3, 4, 'linli', '临澧', '县', 29.44079300, 111.64751800),
(101250607, 430726, 2506, 3, 4, 'shimen', '石门', '县', 29.58429300, 111.38001400),
(101250608, 430781, 2506, 3, 4, 'jinshi', '津市', '市', 29.60548000, 111.87749900),
(101250609, 430702, 2506, 3, 5, 'wulingqu', '武陵', '区', 28.99687100, 111.69745000),
(101250610, 430703, 2506, 3, 5, 'dingchengqu', '鼎城', '区', 28.99524300, 111.74779600),
(101250700, 430901, 2507, 3, 3, 'yiyang1', '益阳', '市', 28.53794100, 112.34167200),
(101250701, 430903, 2507, 3, 5, 'heshanqu', '赫山', '区', 28.56010800, 112.36173700),
(101250702, 430921, 2507, 3, 4, 'nanxian', '南县', '县', 29.36134100, 112.39641600),
(101250703, 430922, 2507, 3, 4, 'taojiang', '桃江', '县', 28.51808500, 112.15582200),
(101250704, 430923, 2507, 3, 4, 'anhua', '安化', '县', 28.03412500, 111.10050300),
(101250705, 430981, 2507, 3, 4, 'yuanjiang', '沅江', '市', 28.84704500, 112.35595400),
(101250706, 430902, 2507, 3, 5, 'ziyangqu', '资阳', '区', 28.59733400, 112.33069600),
(101250801, 431301, 2508, 3, 3, 'loudi', '娄底', '市', 27.74049200, 112.00537200),
(101250802, 431321, 2508, 3, 4, 'shuangfeng', '双峰', '县', 27.45665800, 112.17524600),
(101250803, 431381, 2508, 3, 4, 'lengshuijiang', '冷水江', '市', 27.68625200, 111.43498400),
(101250805, 431322, 2508, 3, 4, 'xinhua', '新化', '县', 27.72783600, 111.30289700),
(101250806, 431382, 2508, 3, 4, 'lianyuan', '涟源', '市', 27.68417000, 111.67606500),
(101250807, 431302, 2508, 3, 5, 'louxing', '娄星', '区', 27.76694500, 112.00461900),
(101250901, 430501, 2509, 3, 3, 'shaoyang', '邵阳', '市', 27.21287100, 111.46113700),
(101250902, 430524, 2509, 3, 4, 'longhui', '隆回', '县', 27.11397800, 111.03243800),
(101250903, 430525, 2509, 3, 4, 'dongkou', '洞口', '县', 27.06032100, 110.57584600),
(101250904, 430522, 2509, 3, 4, 'xinshao', '新邵', '县', 27.32091800, 111.45865700),
(101250905, 430521, 2509, 3, 4, 'shaodong', '邵东', '县', 27.26901500, 111.76557600),
(101250906, 430527, 2509, 3, 4, 'suining', '绥宁', '县', 26.58195500, 110.15565500),
(101250907, 430528, 2509, 3, 4, 'xinning', '新宁', '县', 26.43341800, 110.85662300),
(101250908, 430581, 2509, 3, 4, 'wugang1', '武冈', '市', 26.72659900, 110.63188400),
(101250909, 430529, 2509, 3, 4, 'chengbu', '城步', '自治县', 26.39059800, 110.32224000),
(101250910, 430523, 2509, 3, 4, 'shaoyangxian', '邵阳', '县', 26.99063700, 111.27380600),
(101250911, 430502, 2509, 3, 5, 'shuangqingqu', '双清', '区', 27.24822200, 111.54534700),
(101250912, 430503, 2509, 3, 5, 'daxiangqu', '大祥', '区', 27.15673700, 111.48663900),
(101250913, 430511, 2509, 3, 5, 'beitaqu', '北塔', '区', 27.25033800, 111.42227900),
(101251001, 430601, 2510, 3, 3, 'yueyang', '岳阳', '市', 29.37728100, 113.11996500),
(101251002, 430623, 2510, 3, 4, 'huarong', '华容', '县', 29.53105700, 112.54046300),
(101251003, 430624, 2510, 3, 4, 'xiangyin', '湘阴', '县', 28.67080700, 112.88330100),
(101251004, 430681, 2510, 3, 4, 'miluo', '汨罗', '市', 28.81423700, 113.07678700),
(101251005, 430626, 2510, 3, 4, 'pingjiang', '平江', '县', 28.70186800, 113.58123400),
(101251006, 430682, 2510, 3, 4, 'linxiang', '临湘', '市', 29.47471800, 113.47838000),
(101251007, 430602, 2510, 3, 5, 'yueyanglouqu', '岳阳楼', '区', 29.36774300, 113.15537000),
(101251008, 430603, 2510, 3, 5, 'yunxiqu', '云溪', '区', 29.52621100, 113.35377400),
(101251009, 430611, 2510, 3, 5, 'junshanqu', '君山', '区', 29.46196300, 112.82353000),
(101251021, 430621, 2510, 3, 4, 'yueyangxian', '岳阳', '县', 29.15104200, 113.11988200),
(101251101, 430801, 2511, 3, 3, 'zhangjiajie', '张家界', '市', 29.11830200, 110.55123500),
(101251102, 430822, 2511, 3, 4, 'sangzhi', '桑植', '县', 29.40006900, 110.16581900),
(101251103, 430821, 2511, 3, 4, 'cili', '慈利', '县', 29.41638000, 111.11899200),
(101251104, 430811, 2511, 3, 5, 'wulingyuan', '武陵源', '区', 29.34573000, 110.55043400),
(101251105, 430802, 2511, 3, 5, 'yongdingqu', '张家界永定', '区', 29.08853900, 110.50100700),
(101251201, 431201, 2512, 3, 3, 'huaihua', '怀化', '市', 27.55788600, 109.96810000),
(101251203, 431222, 2512, 3, 4, 'yuanling', '沅陵', '县', 28.45268600, 110.39384400),
(101251204, 431223, 2512, 3, 4, 'chenxi', '辰溪', '县', 27.87804800, 110.25572400),
(101251205, 431229, 2512, 3, 4, 'jingzhou1', '靖州', '自治县', 26.56642500, 109.68807400),
(101251206, 431225, 2512, 3, 4, 'huitong', '会同', '县', 26.88197700, 109.73259800),
(101251207, 431230, 2512, 3, 4, 'tongdao', '通道', '自治县', 26.15805400, 109.78441200),
(101251208, 431226, 2512, 3, 4, 'mayang', '麻阳', '自治县', 27.85510400, 109.80333100),
(101251209, 431227, 2512, 3, 4, 'xinhuang', '新晃', '自治县', 27.34872700, 109.19594800),
(101251210, 431228, 2512, 3, 4, 'zhijiang1', '芷江', '自治县', 27.44349900, 109.68462900),
(101251211, 431224, 2512, 3, 4, 'xupu', '溆浦', '县', 27.92686400, 110.57813300),
(101251212, 431221, 2512, 3, 4, 'zhongfang', '中方', '县', 27.44052300, 109.94601200),
(101251213, 431281, 2512, 3, 4, 'hongjiang', '洪江', '市', 27.20860900, 109.83666900),
(101251214, 431202, 2512, 3, 5, 'hecheng', '鹤城', '区', 27.61202400, 109.94553900),
(101251401, 431101, 2514, 3, 3, 'yongzhou', '永州', '市', 26.42585000, 111.61986600),
(101251402, 431121, 2514, 3, 4, 'qiyang', '祁阳', '县', 26.70055100, 111.82378300),
(101251403, 431122, 2514, 3, 4, 'dongan', '东安', '县', 26.39440400, 111.31411700),
(101251404, 431123, 2514, 3, 4, 'shuangpai', '双牌', '县', 26.01986500, 111.66048000),
(101251405, 431124, 2514, 3, 4, 'daoxian', '道县', '县', 25.52643800, 111.60079600),
(101251406, 431126, 2514, 3, 4, 'ningyuan', '宁远', '县', 25.57097600, 111.94580500),
(101251407, 431125, 2514, 3, 4, 'jiangyong', '江永', '县', 25.35045200, 111.46638100),
(101251408, 431127, 2514, 3, 4, 'lanshan', '蓝山', '县', 25.36989800, 112.19673100),
(101251409, 431128, 2514, 3, 4, 'xintian', '新田', '县', 25.90657400, 112.22157300),
(101251410, 431129, 2514, 3, 4, 'jianghua', '江华', '自治县', 25.17998600, 111.55513700),
(101251411, 431103, 2514, 3, 5, 'lengshuitan', '冷水滩', '区', 26.46735900, 111.59885600),
(101251412, 431102, 2514, 3, 5, 'lingling', '零陵', '区', 26.10231100, 111.56391900),
(101251501, 433101, 2515, 3, 4, 'jishou', '吉首', '市', 28.32461100, 109.73493900),
(101251502, 433125, 2515, 3, 4, 'baojing', '保靖', '县', 28.69987800, 109.66056000),
(101251503, 433127, 2515, 3, 4, 'yongshun', '永顺', '县', 29.00144000, 109.85125400),
(101251504, 433126, 2515, 3, 4, 'guzhang', '古丈', '县', 28.61693500, 109.95072800),
(101251505, 433123, 2515, 3, 4, 'fenghuang', '凤凰', '县', 27.94801400, 109.59872200),
(101251506, 433122, 2515, 3, 4, 'luxi', '泸溪', '县', 28.21664100, 110.21961000),
(101251507, 433130, 2515, 3, 4, 'longshan', '龙山', '县', 29.45766300, 109.44393900),
(101251508, 433124, 2515, 3, 4, 'huayuan', '花垣', '县', 28.57203000, 109.48207800),
(101260101, 520101, 2601, 3, 3, 'guiyang1', '贵阳', '市', 26.65331600, 106.63676600),
(101260102, 520113, 2601, 3, 5, 'baiyun', '白云', '区', 26.67856200, 106.62300700),
(101260103, 520111, 2601, 3, 5, 'huaxi', '花溪', '区', 26.40981800, 106.67026000),
(101260104, 520112, 2601, 3, 5, 'wudang', '乌当', '区', 26.63084500, 106.75062500),
(101260105, 520122, 2601, 3, 4, 'xifeng2', '息烽', '县', 27.07835900, 106.74745700),
(101260106, 520121, 2601, 3, 4, 'kaiyang', '开阳', '县', 27.05776400, 106.96509000),
(101260107, 520123, 2601, 3, 4, 'xiuwen', '修文', '县', 26.83892600, 106.59210800),
(101260108, 520181, 2601, 3, 4, 'qingzhen', '清镇', '市', 26.55607900, 106.47071500),
(101260109, 0, 2601, 3, 5, 'xiaohe', '小河', '区', 26.63207800, 106.63108700),
(101260110, 520103, 2601, 3, 5, 'yunyan', '云岩', '区', 26.60484800, 106.72485000),
(101260111, 520102, 2601, 3, 5, 'nanming', '南明', '区', 26.57416400, 106.72063800),
(101260115, 520115, 2601, 3, 5, 'guanshanhu', '观山湖', '区', 26.60719700, 106.62910300),
(101260201, 520301, 2602, 3, 3, 'zunyi', '遵义', '市', 27.65087700, 106.90029700),
(101260202, 520602, 2602, 3, 5, 'bijiangqu', '碧江', '区', 27.69683300, 109.18742500),
(101260203, 520382, 2602, 3, 4, 'renhuai', '仁怀', '市', 27.79165000, 106.40034200),
(101260204, 520323, 2602, 3, 4, 'suiyang', '绥阳', '县', 27.94659500, 107.19086200),
(101260205, 520328, 2602, 3, 4, 'meitan', '湄潭', '县', 27.74905500, 107.46540700),
(101260206, 520327, 2602, 3, 4, 'fenggang', '凤冈', '县', 27.95469500, 107.71635600),
(101260207, 520322, 2602, 3, 4, 'tongzi', '桐梓', '县', 28.13018200, 106.83207600),
(101260208, 520381, 2602, 3, 4, 'chishui', '赤水', '市', 28.59033700, 105.69747200),
(101260209, 520330, 2602, 3, 4, 'xishui1', '习水', '县', 28.33127000, 106.19713800),
(101260210, 520325, 2602, 3, 4, 'daozhen', '道真', '自治县', 28.86242500, 107.61313300),
(101260211, 520324, 2602, 3, 4, 'zhengan', '正安', '县', 28.55004000, 107.44403100),
(101260212, 520326, 2602, 3, 4, 'wuchuan1', '务川', '自治县', 28.56308600, 107.89895700),
(101260213, 520329, 2602, 3, 4, 'yuqing', '余庆', '县', 27.22534600, 107.88828900),
(101260214, 520303, 2602, 3, 5, 'huichuan', '汇川', '县', 27.75649400, 106.94124000),
(101260215, 520302, 2602, 3, 5, 'honghuagang', '红花岗', '区', 27.64512300, 106.89318200),
(101260224, 520304, 2602, 3, 5, 'bozhouqu', '播州', '区', 27.54477800, 106.83274100),
(101260301, 520401, 2603, 3, 3, 'anshun', '安顺', '市', 26.22902800, 105.94309400),
(101260302, 520422, 2603, 3, 4, 'puding', '普定', '县', 26.29268800, 105.71474800),
(101260303, 520423, 2603, 3, 4, 'zhenning', '镇宁', '自治县', 26.05736200, 105.77040200),
(101260304, 520403, 2603, 3, 5, 'pingba', '平坝', '区', 26.40550200, 106.25555700),
(101260305, 520425, 2603, 3, 4, 'ziyun', '紫云', '自治县', 25.75105200, 106.08434000),
(101260306, 520424, 2603, 3, 4, 'guanling', '关岭', '自治县', 25.94385600, 105.61874500),
(101260307, 520402, 2603, 3, 5, 'xixiuqu', '西秀', '区', 26.25163100, 105.97161500),
(101260401, 522701, 2604, 3, 4, 'duyun', '都匀', '市', 26.22946400, 107.51430000),
(101260402, 522723, 2604, 3, 4, 'guiding', '贵定', '县', 26.57646400, 107.22986000),
(101260403, 522725, 2604, 3, 4, 'wengan', '瓮安', '县', 27.07847200, 107.47155500),
(101260404, 522729, 2604, 3, 4, 'changshun', '长顺', '县', 26.02263600, 106.45192600),
(101260405, 522702, 2604, 3, 4, 'fuquan', '福泉', '市', 26.62373400, 107.53638300),
(101260406, 522731, 2604, 3, 4, 'huishui', '惠水', '县', 26.13206100, 106.65708900),
(101260407, 522730, 2604, 3, 4, 'longli', '龙里', '县', 26.45061900, 106.97033000),
(101260408, 522728, 2604, 3, 4, 'luodian', '罗甸', '县', 25.42484500, 106.75141800),
(101260409, 522727, 2604, 3, 4, 'pingtang', '平塘', '县', 25.83195500, 107.32307700),
(101260410, 522726, 2604, 3, 4, 'dushan', '独山', '县', 25.85401300, 107.55291000),
(101260411, 522732, 2604, 3, 4, 'sandu', '三都', '自治县', 25.98320200, 107.86974900),
(101260412, 522722, 2604, 3, 4, 'libo', '荔波', '县', 25.41065400, 107.88645000),
(101260413, 522701, 2604, 3, 3, 'qiannan', '黔南', '自治州', 26.26058810, 107.52865810),
(101260501, 522601, 2605, 3, 4, 'kaili', '凯里', '市', 26.60333800, 107.97612300),
(101260502, 522626, 2605, 3, 4, 'cengong', '岑巩', '县', 27.17388700, 108.81606000),
(101260503, 522623, 2605, 3, 4, 'shibing', '施秉', '县', 26.91951300, 108.14212000),
(101260504, 522625, 2605, 3, 4, 'zhenyuan1', '镇远', '县', 27.03436000, 108.41082200),
(101260505, 522622, 2605, 3, 4, 'huangping', '黄平', '县', 26.94268700, 108.18215900),
(101260507, 522635, 2605, 3, 4, 'majiang', '麻江', '县', 26.54849900, 107.67523400),
(101260508, 522636, 2605, 3, 4, 'danzhai', '丹寨', '县', 26.19832000, 107.78872800),
(101260509, 522624, 2605, 3, 4, 'sansui', '三穗', '县', 26.95296800, 108.67526700),
(101260510, 522630, 2605, 3, 4, 'taijiang', '台江', '县', 26.66752500, 108.32124500),
(101260511, 522629, 2605, 3, 4, 'jianhe', '剑河', '县', 26.72827400, 108.44150100),
(101260512, 522634, 2605, 3, 4, 'leishan', '雷山', '县', 26.37844300, 108.07754000),
(101260513, 522631, 2605, 3, 4, 'liping', '黎平', '县', 26.23038500, 109.13672400),
(101260514, 522627, 2605, 3, 4, 'tianzhu1', '天柱', '县', 26.90967800, 109.20775700),
(101260515, 522628, 2605, 3, 4, 'jinping', '锦屏', '县', 26.67623300, 109.20053400),
(101260516, 522632, 2605, 3, 4, 'rongjiang', '榕江', '县', 25.93189300, 108.52188100),
(101260517, 522633, 2605, 3, 4, 'congjiang', '从江', '县', 25.75300900, 108.90532900),
(101260518, 522601, 2605, 3, 3, 'qiandongnan', '黔东南', '自治州', 26.58993110, 107.98933610),
(101260601, 520601, 2606, 3, 3, 'tongren', '铜仁', '市', 27.74012000, 109.20465500),
(101260602, 520621, 2606, 3, 4, 'jiangkou', '江口', '县', 27.69965000, 108.83955700),
(101260603, 520622, 2606, 3, 4, 'yuping', '玉屏', '自治县', 27.23924900, 108.93496500),
(101260604, 520603, 2606, 3, 5, 'wanshan', '万山', '区', 27.51789600, 109.21364400),
(101260605, 520624, 2606, 3, 4, 'sinan', '思南', '县', 27.93751900, 108.25386400),
(101260607, 520625, 2606, 3, 4, 'yinjiang', '印江', '自治县', 27.99424700, 108.40975200),
(101260608, 520623, 2606, 3, 4, 'shiqian', '石阡', '县', 27.51382900, 108.22361200),
(101260609, 520627, 2606, 3, 4, 'yanhe', '沿河', '自治县', 28.56392800, 108.50387000),
(101260610, 520626, 2606, 3, 4, 'dejiang', '德江', '县', 28.26396400, 108.11980700),
(101260611, 520628, 2606, 3, 4, 'songtao', '松桃', '自治县', 28.07673500, 108.97269700),
(101260701, 520501, 2607, 3, 3, 'bijie', '毕节', '市', 27.28542600, 105.31866200),
(101260702, 520527, 2607, 3, 4, 'hezhang', '赫章', '县', 27.12307900, 104.72741800),
(101260703, 520523, 2607, 3, 4, 'jinsha', '金沙', '县', 27.45921400, 106.22022800),
(101260704, 520526, 2607, 3, 4, 'weining', '威宁', '自治县', 26.85621000, 104.27874000),
(101260705, 520521, 2607, 3, 4, 'dafang', '大方', '县', 27.14168200, 105.61317400),
(101260706, 520525, 2607, 3, 4, 'nayong', '纳雍', '县', 26.77764500, 105.38271500),
(101260707, 520524, 2607, 3, 4, 'zhijin', '织金', '县', 26.65403400, 105.76159400),
(101260708, 520522, 2607, 3, 4, 'qianxi1', '黔西', '县', 27.00771300, 106.03354400),
(101260712, 520502, 2607, 3, 5, 'qixingguan', '七星关', '区', 27.30439200, 105.31391300),
(101260801, 520221, 2608, 3, 4, 'shuicheng', '水城', '县', 26.54790400, 104.95783100),
(101260802, 520203, 2608, 3, 5, 'liuzhi', '六枝', '区', 26.22587500, 105.46475200),
(101260804, 520222, 2608, 3, 4, 'panxian', '盘县', '县', 25.70999000, 104.47152600),
(101260805, 520201, 2608, 3, 5, 'zhongshanqu', '钟山', '区', 26.73115700, 104.76254700),
(101260806, 520201, 2608, 3, 3, 'liupanshui', '六盘水', '市', 26.59186610, 104.85208710),
(101260901, 522301, 2609, 3, 4, 'xingyi1', '兴义', '市', 25.16661100, 104.98746000),
(101260902, 522324, 2609, 3, 4, 'qinglong1', '晴隆', '县', 25.83478400, 105.21899100),
(101260903, 522322, 2609, 3, 4, 'xingren', '兴仁', '县', 25.43518300, 105.18623800),
(101260904, 522325, 2609, 3, 4, 'zhenfeng', '贞丰', '县', 25.38576000, 105.64986400),
(101260905, 522326, 2609, 3, 4, 'wangmo', '望谟', '县', 25.17842200, 106.09961700),
(101260907, 522328, 2609, 3, 4, 'anlong', '安龙', '县', 25.06302700, 105.24272300),
(101260908, 522327, 2609, 3, 4, 'ceheng', '册亨', '县', 24.91458600, 105.57494900),
(101260909, 522323, 2609, 3, 4, 'puan', '普安', '县', 25.78413500, 104.95306300),
(101260910, 522301, 2609, 3, 3, 'qianxinan', '黔西南', '自治州', 25.09597410, 104.91085810),
(101270101, 510101, 2701, 3, 3, 'chengdu', '成都', '市', 30.69745500, 104.07400500),
(101270102, 510112, 2701, 3, 5, 'longquanyi', '龙泉驿', '区', 30.55650700, 104.27463200),
(101270103, 510114, 2701, 3, 5, 'xindu', '新都', '区', 30.82349900, 104.15870500),
(101270104, 510115, 2701, 3, 5, 'wenjiang', '温江', '区', 30.68220300, 103.85664600),
(101270105, 510121, 2701, 3, 4, 'jintang', '金堂', '区', 30.86201700, 104.41200500),
(101270106, 510116, 2701, 3, 5, 'shuangliu', '双流', '区', 30.57465500, 103.92371500),
(101270107, 510124, 2701, 3, 4, 'pixian', '郫县', '县', 30.79585400, 103.90109200),
(101270108, 510129, 2701, 3, 4, 'dayi', '大邑', '县', 30.57233100, 103.51189900),
(101270109, 510131, 2701, 3, 4, 'pujiang1', '蒲江', '县', 30.19678900, 103.50649800),
(101270110, 510132, 2701, 3, 4, 'xinjin', '新津', '县', 30.41022200, 103.81134500),
(101270111, 510181, 2701, 3, 3, 'dujiangyan', '都江堰', '市', 30.95803800, 103.63710600),
(101270112, 510182, 2701, 3, 3, 'pengzhou', '彭州', '市', 30.99010900, 103.95801400),
(101270113, 510183, 2701, 3, 3, 'qionglai', '邛崃', '市', 30.41027500, 103.46415600),
(101270114, 510184, 2701, 3, 3, 'chongzhou', '崇州', '市', 30.63012200, 103.67300100),
(101270115, 510104, 2701, 3, 5, 'jinjiangqu', '锦江', '区', 30.86840000, 104.24250000),
(101270116, 510106, 2701, 3, 5, 'jinniuqu', '金牛', '区', 30.73562200, 104.06137700),
(101270117, 510108, 2701, 3, 5, 'chenghuaqu', '成华', '区', 30.69504000, 104.15003200),
(101270118, 510107, 2701, 3, 5, 'wuhouqu', '武侯', '区', 30.61288200, 104.04124000),
(101270119, 510105, 2701, 3, 5, 'qingyangqu', '青羊', '区', 30.68510200, 103.98842900),
(101270120, 510113, 2701, 3, 5, 'qingbaijiangqu', '青白江', '区', 30.79635400, 104.34643000),
(101270201, 510401, 2702, 3, 3, 'panzhihua', '攀枝花', '市', 26.54368700, 101.85180100),
(101270202, 510411, 2702, 3, 5, 'renhe', '仁和', '区', 26.50390900, 101.74510700),
(101270203, 510421, 2702, 3, 4, 'miyi', '米易', '县', 26.87501300, 102.11378300),
(101270204, 510422, 2702, 3, 4, 'yanbian1', '盐边', '县', 26.68321300, 101.85507100),
(101270205, 510402, 2702, 3, 5, 'panzhihuadongqu', '攀枝花东区', '区', 22.27611200, 114.23539400),
(101270206, 510403, 2702, 3, 5, 'panzhihuaxiqu', '攀枝花西区', '区', 26.61086900, 101.55533200),
(101270301, 510301, 2703, 3, 3, 'zigong', '自贡', '市', 29.35546000, 104.79131800),
(101270302, 510322, 2703, 3, 4, 'fu shun', '富顺', '县', 29.18143000, 104.97504800),
(101270303, 510321, 2703, 3, 4, 'rongxian', '荣县', '县', 29.44541000, 104.41738800),
(101270304, 510303, 2703, 3, 5, 'gongjingqu', '贡井', '区', 29.31459100, 104.60273500),
(101270305, 510302, 2703, 3, 5, 'ziliujingqu', '自流井', '区', 29.28261400, 104.70785400),
(101270306, 510311, 2703, 3, 5, 'yantanqu', '沿滩', '区', 29.24264000, 104.85476300),
(101270307, 510304, 2703, 3, 5, 'daanqu', '大安', '区', 29.41154800, 104.87756600),
(101270401, 510701, 2704, 3, 3, 'mianyang', '绵阳', '市', 31.46011200, 104.71743700),
(101270402, 510722, 2704, 3, 4, 'santai', '三台', '县', 31.09597900, 105.09458600),
(101270403, 510723, 2704, 3, 4, 'yanting', '盐亭', '县', 31.20836300, 105.38945300),
(101270404, 0, 2704, 3, 4, 'anxian', '安县', '县', 31.53488600, 104.56718700),
(101270405, 510725, 2704, 3, 4, 'zitong', '梓潼', '县', 31.64271800, 105.17084500),
(101270406, 510726, 2704, 3, 4, 'beichuan', '北川', '自治县', 31.61719900, 104.46816800),
(101270407, 510727, 2704, 3, 4, 'pingwu', '平武', '县', 32.40967500, 104.55558300),
(101270408, 510781, 2704, 3, 4, 'jiangyou', '江油', '市', 31.78102400, 104.77109400),
(101270409, 510703, 2704, 3, 5, 'fuchengqu', '涪城', '区', 31.43573500, 104.67051400),
(101270410, 510704, 2704, 3, 5, 'youxianqu', '游仙', '区', 31.51881600, 104.98158000),
(101270415, 510705, 2704, 3, 5, 'anzhouqu', '安州', '区', 31.54097600, 104.57325900),
(101270501, 511301, 2705, 3, 3, 'nanchong', '南充', '市', 30.80785300, 106.08512100),
(101270502, 511321, 2705, 3, 4, 'nanbu', '南部', '县', 31.34746700, 106.03658400),
(101270503, 511322, 2705, 3, 4, 'yingshanxian', '营山', '县', 31.06448000, 106.56862100),
(101270504, 511323, 2705, 3, 4, 'pengan', '蓬安', '县', 31.02852000, 106.41218100),
(101270505, 511324, 2705, 3, 4, 'yilong', '仪陇', '县', 31.27156200, 106.30304200),
(101270506, 511325, 2705, 3, 4, 'xichong', '西充', '县', 30.99503200, 105.90081800),
(101270507, 511381, 2705, 3, 4, 'langzhong', '阆中', '市', 31.55835700, 106.00504600),
(101270508, 511304, 2705, 3, 5, 'jialingqu', '嘉陵', '区', 30.66545200, 105.93870300),
(101270509, 511303, 2705, 3, 5, 'gaopingqu', '高坪', '区', 30.75468400, 106.25975900),
(101270510, 511302, 2705, 3, 5, 'shunqing', '顺庆', '区', 30.94962500, 106.11579800),
(101270601, 511701, 2706, 3, 3, 'dazhou', '达州', '市', 31.21434700, 107.47450400);
INSERT INTO `cmf_plugin_modules_citys` (`id`, `code`, `pid`, `level`, `level3`, `pinyin`, `name`, `areaname`, `lat`, `lng`) VALUES
(101270602, 511722, 2706, 3, 4, 'xuanhan', '宣汉', '县', 31.54221500, 107.65848500),
(101270603, 511723, 2706, 3, 4, 'kaijiang', '开江', '县', 30.91409300, 107.80102800),
(101270604, 511724, 2706, 3, 4, 'dazhu', '大竹', '县', 30.73626600, 107.20474400),
(101270605, 511725, 2706, 3, 4, 'quxian', '渠县', '县', 30.80324900, 107.01221100),
(101270606, 511781, 2706, 3, 4, 'wanyuan', '万源', '市', 32.08484000, 108.04348900),
(101270607, 511703, 2706, 3, 5, 'dachuan', '达川', '区', 31.20232200, 107.51818100),
(101270608, 0, 2706, 3, 4, 'daxian', '达县', '县', 30.65165200, 104.07593100),
(101270609, 511702, 2706, 3, 5, 'tongchuanqu', '通川', '区', 31.23876400, 107.51920400),
(101270701, 510901, 2707, 3, 3, 'suining1', '遂宁', '市', 30.54289600, 105.54277900),
(101270702, 510921, 2707, 3, 4, 'pengxi', '蓬溪', '县', 30.67860200, 105.69983300),
(101270703, 510922, 2707, 3, 4, 'shehong', '射洪', '县', 30.87098600, 105.38840500),
(101270704, 510923, 2707, 3, 4, 'dayinqu', '大英', '县', 30.58019100, 105.25637200),
(101270705, 510903, 2707, 3, 5, 'chuanshanqu', '船山', '区', 30.52350000, 105.62152800),
(101270706, 510904, 2707, 3, 5, 'anjuqu', '安居', '区', 30.36352200, 105.41441100),
(101270801, 511601, 2708, 3, 3, 'guangan', '广安', '市', 30.49348400, 106.89713300),
(101270802, 511621, 2708, 3, 4, 'yuechi', '岳池', '县', 30.53786300, 106.44011400),
(101270803, 511622, 2708, 3, 4, 'wusheng', '武胜', '县', 30.34877200, 106.29576400),
(101270804, 511623, 2708, 3, 4, 'linshui', '邻水', '县', 30.33476900, 106.93038000),
(101270805, 511681, 2708, 3, 3, 'huaying', '华蓥', '市', 30.36352600, 106.78209800),
(101270806, 511602, 2708, 3, 5, 'guanganqu', '广安', '区', 30.47990200, 106.64816300),
(101270813, 511603, 2708, 3, 5, 'qianfeng', '前锋', '区', 30.50236000, 106.89977500),
(101270901, 511901, 2709, 3, 3, 'bazhong', '巴中', '市', 31.87150800, 106.76810000),
(101270902, 511921, 2709, 3, 4, 'tongjiang1', '通江', '县', 31.91170500, 107.24503300),
(101270903, 511922, 2709, 3, 4, 'nanjiang', '南江', '县', 32.34658900, 106.82869700),
(101270904, 511923, 2709, 3, 4, 'pingchang', '平昌', '县', 31.56087400, 107.10400800),
(101270913, 511903, 2709, 3, 5, 'enyang', '恩阳', '区', 31.79635200, 106.64712000),
(101271001, 510501, 2710, 3, 3, 'luzhou', '泸州', '市', 28.87923900, 105.44333200),
(101271003, 510521, 2710, 3, 4, 'luxian', '泸县', '县', 29.15153400, 105.38189300),
(101271004, 510522, 2710, 3, 4, 'hejiang', '合江', '县', 28.81120300, 105.83106700),
(101271005, 510524, 2710, 3, 4, 'xuyong', '叙永', '县', 28.15580100, 105.44476500),
(101271006, 510525, 2710, 3, 4, 'gulin', '古蔺', '县', 28.03880200, 105.81260200),
(101271007, 510503, 2710, 3, 5, 'naxi', '纳溪', '区', 28.77342800, 105.37115100),
(101271008, 510504, 2710, 3, 5, 'longmatan', '龙马潭', '区', 28.98746000, 105.43784200),
(101271009, 510502, 2710, 3, 5, 'jiangyangqu', '江阳', '区', 28.87690100, 105.37171300),
(101271101, 511501, 2711, 3, 3, 'yibin', '宜宾', '市', 28.75186100, 104.60085000),
(101271103, 511521, 2711, 3, 4, 'yibinxian', '宜宾', '县', 28.69004500, 104.53321300),
(101271104, 511503, 2711, 3, 5, 'nanxi', '南溪', '区', 28.84562600, 104.96988200),
(101271105, 511523, 2711, 3, 4, 'jiangan', '江安', '县', 28.72399900, 105.06694300),
(101271106, 511524, 2711, 3, 4, 'chan gning', '长宁', '县', 28.58216900, 104.92117400),
(101271107, 511525, 2711, 3, 4, 'gaoxian', '高县', '县', 28.43622600, 104.51773900),
(101271108, 511526, 2711, 3, 4, 'gongxian', '珙县', '县', 28.43863000, 104.70920200),
(101271109, 511527, 2711, 3, 4, 'junlian', '筠连', '县', 28.16386000, 104.51098800),
(101271110, 511528, 2711, 3, 4, 'xingwen', '兴文', '县', 28.30361400, 105.23632500),
(101271111, 511529, 2711, 3, 4, 'pingshanxian', '屏山', '县', 28.82848200, 104.34597400),
(101271112, 511502, 2711, 3, 5, 'cuipingqu', '翠屏', '区', 28.81582000, 104.69325500),
(101271201, 511001, 2712, 3, 3, 'neijiang', '内江', '市', 29.58699100, 105.03709100),
(101271202, 511011, 2712, 3, 5, 'dongxing', '东兴', '区', 29.59275600, 105.07549000),
(101271203, 511024, 2712, 3, 4, 'weiyuanxian', '威远', '县', 29.52744000, 104.66887900),
(101271204, 511025, 2712, 3, 4, 'zizhong', '资中', '县', 29.76805600, 104.86376500),
(101271205, 511028, 2712, 3, 4, 'longchang', '隆昌', '县', 29.35594200, 105.28132400),
(101271301, 512001, 2713, 3, 3, 'ziyang1', '资阳', '市', 30.12466700, 104.65203300),
(101271302, 512021, 2713, 3, 4, 'anyue', '安岳', '县', 30.09723000, 105.33569000),
(101271303, 512022, 2713, 3, 4, 'lezhi', '乐至', '县', 30.27608100, 105.02110100),
(101271304, 510185, 2713, 3, 4, 'jianyang1', '简阳', '市', 30.41075500, 104.54677400),
(101271312, 512002, 2713, 3, 5, 'yanjiangqu', '雁江', '区', 30.12411500, 104.68388200),
(101271401, 511101, 2714, 3, 3, 'leshan', '乐山', '市', 29.75011900, 103.57593900),
(101271402, 511123, 2714, 3, 4, 'qianwei', '犍为', '县', 29.20817100, 103.94932600),
(101271403, 511124, 2714, 3, 4, 'jingyan', '井研', '县', 29.65128700, 104.06972600),
(101271404, 511126, 2714, 3, 4, 'jiajiang', '夹江', '县', 29.73763000, 103.57165700),
(101271405, 511129, 2714, 3, 4, 'muchuan', '沐川', '县', 28.95664700, 103.90233500),
(101271406, 511132, 2714, 3, 4, 'ebian', '峨边', '自治县', 29.23042500, 103.26204800),
(101271407, 511133, 2714, 3, 4, 'mabian', '马边', '自治县', 28.83552100, 103.54634800),
(101271408, 0, 2714, 3, 4, 'emei', '峨眉', '市', 29.59136900, 103.52215000),
(101271409, 511181, 2714, 3, 4, 'emeishan', '峨眉山', '市', 29.60119900, 103.48450400),
(101271410, 511113, 2714, 3, 5, 'jinkouhequ', '金口河', '区', 29.29382000, 103.07336600),
(101271411, 511112, 2714, 3, 5, 'wutongqiaoqu', '五通桥', '区', 29.39544400, 103.84663300),
(101271412, 511111, 2714, 3, 5, 'shawanqu', '沙湾', '区', 29.31641000, 103.60454800),
(101271501, 511401, 2715, 3, 3, 'meishan', '眉山', '市', 30.06437400, 103.81305100),
(101271502, 511421, 2715, 3, 4, 'renshou', '仁寿', '县', 29.99563000, 104.13408200),
(101271503, 511403, 2715, 3, 5, 'pengshan', '彭山', '区', 30.19305600, 103.87295000),
(101271504, 511423, 2715, 3, 4, 'hongya', '洪雅', '县', 29.90489000, 103.37286300),
(101271505, 511424, 2715, 3, 4, 'danleng', '丹棱', '县', 30.01444800, 103.51273300),
(101271506, 511425, 2715, 3, 4, 'qingshen', '青神', '县', 29.83135800, 103.84668800),
(101271507, 511402, 2715, 3, 5, 'dongpoqu', '东坡', '区', 30.05737200, 103.74833300),
(101271601, 513401, 2716, 3, 3, 'liangshan1', '凉山', '自治州', 28.91504900, 102.61399200),
(101271603, 513422, 2716, 3, 4, 'muli', '木里', '自治县', 27.92883500, 101.28020600),
(101271604, 513423, 2716, 3, 4, 'yanyuan', '盐源', '县', 27.42264500, 101.50918800),
(101271605, 513424, 2716, 3, 4, 'dechang', '德昌', '县', 27.39568000, 102.18664500),
(101271606, 513425, 2716, 3, 4, 'huili', '会理', '县', 26.65502600, 102.24468300),
(101271607, 513426, 2716, 3, 4, 'huidong', '会东', '县', 26.63466900, 102.57796000),
(101271608, 513427, 2716, 3, 4, 'ningnan', '宁南', '县', 27.06630800, 102.75968700),
(101271609, 513428, 2716, 3, 4, 'puge', '普格', '县', 27.37641300, 102.54090100),
(101271610, 513401, 2716, 3, 4, 'xichang', '西昌', '市', 27.87760600, 102.22394700),
(101271611, 513430, 2716, 3, 4, 'jinyang', '金阳', '县', 27.69686100, 103.24877200),
(101271612, 513431, 2716, 3, 4, 'zhaojue', '昭觉', '县', 28.01408800, 102.84261100),
(101271613, 513432, 2716, 3, 4, 'xide', '喜德', '县', 28.30968900, 102.39983700),
(101271614, 513433, 2716, 3, 4, 'mianning', '冕宁', '县', 28.28477000, 102.19409300),
(101271615, 513434, 2716, 3, 4, 'yuexizian', '越西', '县', 28.63980100, 102.50768000),
(101271616, 513435, 2716, 3, 4, 'ganluo', '甘洛', '县', 28.96606900, 102.77174900),
(101271617, 513437, 2716, 3, 4, 'leibo', '雷波', '县', 28.26268300, 103.57169600),
(101271618, 513436, 2716, 3, 4, 'meigu', '美姑', '县', 28.32864000, 103.13218000),
(101271619, 513429, 2716, 3, 4, 'butuo', '布拖', '县', 27.71142900, 102.80730200),
(101271701, 511801, 2717, 3, 3, 'yaan', '雅安', '市', 29.99007000, 102.99494400),
(101271702, 511803, 2717, 3, 5, 'mingshan', '名山', '区', 30.06995400, 103.10918500),
(101271703, 511822, 2717, 3, 4, 'yingjing', '荥经', '县', 29.79293100, 102.84673800),
(101271704, 511823, 2717, 3, 4, 'hanyuan', '汉源', '县', 29.34461700, 102.65248300),
(101271705, 511824, 2717, 3, 4, 'shimian', '石棉', '县', 29.22787400, 102.35946200),
(101271706, 511825, 2717, 3, 4, 'tianquan', '天全', '县', 30.06671300, 102.75831700),
(101271707, 511826, 2717, 3, 4, 'lushanxian', '芦山', '县', 30.14408400, 102.92826000),
(101271708, 511827, 2717, 3, 4, 'baoxing', '宝兴', '县', 30.36812600, 102.81453100),
(101271709, 511802, 2717, 3, 5, 'yuchengqu', '雨城', '区', 29.92850700, 103.03840500),
(101271801, 513328, 2718, 3, 3, 'ganzi', '甘孜', '县', 31.62293400, 99.99267100),
(101271802, 513301, 2718, 3, 4, 'kangding', '康定', '市', 29.99843600, 101.95714600),
(101271803, 513322, 2718, 3, 4, 'luding', '泸定', '县', 29.91416000, 102.23461800),
(101271804, 513323, 2718, 3, 4, 'danba', '丹巴', '县', 30.87857700, 101.89035800),
(101271805, 513324, 2718, 3, 4, 'jiulong', '九龙', '县', 29.00034800, 101.50729400),
(101271806, 513325, 2718, 3, 4, 'yajiang', '雅江', '县', 30.03153300, 101.01442500),
(101271807, 513326, 2718, 3, 4, 'daofu', '道孚', '县', 30.97954500, 101.12523700),
(101271808, 513327, 2718, 3, 4, 'luhuo', '炉霍', '县', 31.39179000, 100.67637200),
(101271809, 513329, 2718, 3, 4, 'xinlong', '新龙', '县', 30.93916900, 100.31136900),
(101271810, 513330, 2718, 3, 4, 'dege', '德格', '县', 31.80611800, 98.58091500),
(101271811, 513331, 2718, 3, 4, 'baiyu', '白玉', '县', 31.20991300, 98.82418200),
(101271812, 513332, 2718, 3, 4, 'shiqu', '石渠', '县', 32.97896000, 98.10290000),
(101271813, 513333, 2718, 3, 4, 'seda', '色达', '县', 32.26812900, 100.33274300),
(101271814, 513334, 2718, 3, 4, 'litang', '理塘', '县', 29.99604900, 100.26981800),
(101271815, 513335, 2718, 3, 4, 'batang', '巴塘', '县', 30.00467700, 99.11071200),
(101271816, 513336, 2718, 3, 4, 'xiangchengxian', '乡城', '县', 28.93117200, 99.79843500),
(101271817, 513337, 2718, 3, 4, 'daocheng', '稻城', '县', 29.03700700, 100.29840300),
(101271818, 513338, 2718, 3, 4, 'derong', '得荣', '县', 28.71303700, 99.28633500),
(101271901, 513231, 2719, 3, 4, 'aba', '阿坝', '县', 32.90749000, 101.71026000),
(101271902, 513221, 2719, 3, 4, 'wenchuan', '汶川', '县', 31.47677000, 103.59024600),
(101271903, 513222, 2719, 3, 4, 'lixian3', '理县', '县', 31.43647300, 103.16685300),
(101271904, 513223, 2719, 3, 4, 'maoxian', '茂县', '县', 31.68115400, 103.85352200),
(101271905, 513224, 2719, 3, 4, 'songpan', '松潘', '县', 32.65532500, 103.60469800),
(101271906, 513225, 2719, 3, 4, 'jiuzhaigou', '九寨沟', '县', 33.25205600, 104.24384100),
(101271907, 513226, 2719, 3, 4, 'jinchuan', '金川', '县', 31.47627700, 102.06382900),
(101271908, 513227, 2719, 3, 4, 'xiaojin', '小金', '县', 30.99903100, 102.36437300),
(101271909, 513228, 2719, 3, 4, 'heishui', '黑水', '县', 32.06189500, 102.99010800),
(101271910, 513201, 2719, 3, 4, 'maerkang', '马尔康', '市', 31.90581300, 102.20650400),
(101271911, 513230, 2719, 3, 4, 'rangtang', '壤塘', '县', 32.26579600, 100.97852600),
(101271912, 513232, 2719, 3, 4, 'nuoergai', '若尔盖', '县', 33.57589200, 102.96179800),
(101271913, 513233, 2719, 3, 4, 'hongyuan', '红原', '县', 32.79089100, 102.54440500),
(101272001, 510601, 2720, 3, 3, 'deyang', '德阳', '市', 31.14251500, 104.38187000),
(101272002, 510623, 2720, 3, 4, 'zhongjiang', '中江', '县', 31.03305100, 104.67874900),
(101272003, 510681, 2720, 3, 4, 'guanghan', '广汉', '市', 30.99347100, 104.26631000),
(101272004, 510682, 2720, 3, 4, 'shifang', '什邡', '市', 31.12678000, 104.16750100),
(101272005, 510683, 2720, 3, 4, 'mianzhu', '绵竹', '市', 31.33807700, 104.22075000),
(101272006, 510626, 2720, 3, 4, 'luojiang', '罗江', '县', 31.30508600, 104.50199400),
(101272007, 510603, 2720, 3, 5, 'jingyangqu', '旌阳', '区', 31.17980500, 104.41525800),
(101272101, 510801, 2721, 3, 3, 'guangyuan', '广元', '市', 32.45098700, 105.82107100),
(101272102, 510821, 2721, 3, 4, 'wangcang', '旺苍', '县', 32.22770300, 106.26960800),
(101272103, 510822, 2721, 3, 4, 'qingchuan', '青川', '县', 32.57548400, 105.23884200),
(101272104, 510823, 2721, 3, 4, 'jiange', '剑阁', '县', 32.28772300, 105.52476600),
(101272105, 510824, 2721, 3, 4, 'cangxi', '苍溪', '县', 31.73243200, 105.93480100),
(101272106, 510802, 2721, 3, 5, 'lizhou', '利州', '区', 32.47853000, 105.78531700),
(101272107, 0, 2721, 3, 5, 'yuanbaqu', '元坝', '区', 32.14990300, 105.88337900),
(101272108, 510812, 2721, 3, 5, 'chaotianqu', '朝天', '区', 32.70841700, 106.02216400),
(101272111, 510811, 2721, 3, 5, 'zhaohuaqu', '昭化', '区', 32.30324500, 105.79009000),
(101280101, 440101, 2801, 3, 3, 'guangzhou', '广州', '市', 23.13552000, 113.27071400),
(101280102, 440113, 2801, 3, 5, 'panyu', '番禺', '区', 22.94358600, 113.38749400),
(101280103, 440117, 2801, 3, 5, 'conghua', '从化', '区', 23.54885200, 113.58660500),
(101280104, 440118, 2801, 3, 5, 'zengcheng', '增城', '区', 23.26114100, 113.81086000),
(101280105, 440114, 2801, 3, 5, 'huadu', '花都', '区', 23.40416500, 113.22021800),
(101280106, 0, 2801, 3, 5, 'luogang', '萝岗', '区', 23.25627200, 113.52257400),
(101280107, 440103, 2801, 3, 5, 'liwan', '荔湾', '区', 23.09366600, 113.23442300),
(101280108, 440104, 2801, 3, 5, 'yuexiuqu', '越秀', '区', 23.13927800, 113.28783300),
(101280109, 440112, 2801, 3, 5, 'huangpuqu', '黄埔', '区', 23.10871200, 113.49288500),
(101280110, 440105, 2801, 3, 5, 'haizhuqu', '海珠', '区', 23.08762900, 113.33384100),
(101280111, 440106, 2801, 3, 5, 'tianhequ', '天河', '区', 23.16612900, 113.38564300),
(101280112, 440115, 2801, 3, 5, 'nanshaqu', '南沙', '区', 22.77745900, 113.61500200),
(101280113, 0, 2801, 3, 5, 'guiyangbaiyun', '贵阳白云', '区', 23.16427600, 113.27958500),
(101280201, 440201, 2802, 3, 3, 'shaoguan', '韶关', '市', 24.75111500, 113.51415700),
(101280202, 440232, 2802, 3, 4, 'ruyuan', '乳源', '自治县', 24.77607800, 113.27588300),
(101280203, 440222, 2802, 3, 4, 'shixing', '始兴', '县', 24.95297700, 114.06178900),
(101280204, 440229, 2802, 3, 4, 'wengyuan', '翁源', '县', 24.35034700, 114.13034200),
(101280205, 440281, 2802, 3, 4, 'lechang', '乐昌', '市', 25.12969600, 113.35762900),
(101280206, 440224, 2802, 3, 4, 'renhua', '仁化', '县', 25.08562100, 113.74902700),
(101280207, 440282, 2802, 3, 4, 'nanxiong', '南雄', '市', 25.11775300, 114.31198200),
(101280208, 440233, 2802, 3, 4, 'xinfengxian', '新丰', '县', 24.05976000, 114.20686700),
(101280209, 440205, 2802, 3, 5, 'qujiang', '曲江', '区', 24.68272800, 113.60454900),
(101280210, 440204, 2802, 3, 5, 'zhenjiang1', '浈江', '区', 24.80438100, 113.61109800),
(101280211, 440203, 2802, 3, 5, 'wujiang1', '武江', '区', 24.79836400, 113.59426600),
(101280301, 441301, 2803, 3, 3, 'huizhou', '惠州', '市', 23.15131000, 114.41557400),
(101280302, 441322, 2803, 3, 4, 'boluo', '博罗', '县', 23.17289900, 114.28949600),
(101280303, 441303, 2803, 3, 5, 'huiyang', '惠阳', '区', 22.78873400, 114.45669600),
(101280304, 441323, 2803, 3, 4, 'huidongxian', '惠东', '县', 22.84710800, 114.78977800),
(101280305, 441324, 2803, 3, 4, 'longmen', '龙门', '县', 23.72773700, 114.25486300),
(101280306, 441302, 2803, 3, 5, 'huichengqu', '惠城', '区', 23.16306300, 114.48589800),
(101280401, 441401, 2804, 3, 3, 'meizhou', '梅州', '市', 24.25846300, 116.13164900),
(101280402, 441481, 2804, 3, 4, 'xingningshi', '兴宁', '市', 24.10156000, 115.72801300),
(101280403, 441427, 2804, 3, 4, 'jiaoling', '蕉岭', '县', 24.65870000, 116.17135500),
(101280404, 441422, 2804, 3, 4, 'dabu', '大埔', '县', 24.40968300, 116.57717600),
(101280406, 441423, 2804, 3, 4, 'fengshun', '丰顺', '县', 23.75139700, 116.19109500),
(101280407, 441426, 2804, 3, 4, 'pingyuanxian', '平远', '县', 24.56726200, 115.89163800),
(101280408, 441424, 2804, 3, 4, 'wuhua', '五华', '县', 23.93240900, 115.77578800),
(101280409, 441403, 2804, 3, 5, 'meixian1', '梅县', '区', 24.26527200, 116.08214400),
(101280410, 441402, 2804, 3, 5, 'meijiangqu', '梅江', '区', 24.29075000, 116.11595200),
(101280501, 440501, 2805, 3, 3, 'shantou', '汕头', '市', 23.37752200, 116.75640000),
(101280502, 440513, 2805, 3, 5, 'chaoyang2', '潮阳', '区', 23.38340200, 116.41785800),
(101280503, 440515, 2805, 3, 5, 'chenghai', '澄海', '区', 23.46596000, 116.75609200),
(101280504, 440523, 2805, 3, 4, 'nanao', '南澳', '县', 23.42172400, 117.02337400),
(101280505, 440507, 2805, 3, 5, 'longhu', '龙湖', '区', 23.40884900, 116.75934700),
(101280506, 440511, 2805, 3, 5, 'jinpingqu', '金平', '区', 23.39988800, 116.65179400),
(101280507, 440512, 2805, 3, 5, 'haojiangqu', '濠江', '区', 23.28244300, 116.71136300),
(101280508, 440514, 2805, 3, 5, 'chaonanqu', '潮南', '区', 23.18139500, 116.41405600),
(101280601, 440301, 2806, 3, 3, 'shenzhen', '深圳', '市', 22.53184400, 114.11727300),
(101280602, 440303, 2806, 3, 5, 'luohu', '罗湖', '区', 22.58193400, 114.15639500),
(101280603, 440307, 2806, 3, 5, 'longgang', '龙岗', '区', 22.65746200, 114.34769600),
(101280604, 440308, 2806, 3, 5, 'yantianqu', '盐田', '区', 22.60698100, 114.27848300),
(101280605, 440305, 2806, 3, 5, 'nanshanqu', '南山', '区', 22.53905700, 113.93695000),
(101280606, 440304, 2806, 3, 5, 'futianqu', '福田', '区', 22.55173100, 114.05559300),
(101280607, 440306, 2806, 3, 5, 'baoanqu', '宝安', '区', 22.70743300, 113.93001300),
(101280701, 440401, 2807, 3, 3, 'zhuhai', '珠海', '市', 22.21501500, 113.54922200),
(101280702, 440403, 2807, 3, 5, 'doumen', '斗门', '区', 22.20920000, 113.29646700),
(101280703, 440404, 2807, 3, 5, 'jinwan', '金湾', '区', 22.14687400, 113.36339300),
(101280704, 440402, 2807, 3, 5, 'xiangzhouqu', '香洲', '区', 22.26560000, 113.53373100),
(101280800, 440601, 2808, 3, 3, 'foshan', '佛山', '市', 23.04687300, 113.10372900),
(101280801, 440606, 2808, 3, 5, 'shunde', '顺德', '区', 22.87497500, 113.27666100),
(101280802, 440607, 2808, 3, 5, 'sanshui', '三水', '区', 23.15961600, 112.88796000),
(101280803, 440605, 2808, 3, 5, 'nanhai', '南海', '区', 23.02895600, 113.14344100),
(101280804, 440608, 2808, 3, 5, 'gaoming', '高明', '区', 22.90018200, 112.89257800),
(101280805, 440604, 2808, 3, 5, 'chanchengqu', '禅城', '区', 23.00421000, 113.07042300),
(101280901, 441201, 2809, 3, 3, 'zhaoqing', '肇庆', '市', 23.08170300, 112.44528000),
(101280902, 441223, 2809, 3, 4, 'guangning', '广宁', '县', 23.63467600, 112.44069000),
(101280903, 441284, 2809, 3, 4, 'sihui', '四会', '市', 23.32650400, 112.73377300),
(101280905, 441226, 2809, 3, 4, 'deqingxian', '德庆', '县', 23.14372200, 111.78593700),
(101280906, 441224, 2809, 3, 4, 'huaiji', '怀集', '县', 23.91189900, 112.18465200),
(101280907, 441225, 2809, 3, 4, 'fengkai', '封开', '县', 23.42403300, 111.51234300),
(101280908, 441204, 2809, 3, 5, 'gaoyao', '高要', '区', 23.02566800, 112.45777100),
(101280909, 441202, 2809, 3, 5, 'duanzhouqu', '端州', '区', 23.10332300, 112.47779400),
(101280910, 441203, 2809, 3, 5, 'dinghuqu', '鼎湖', '区', 23.20896800, 112.62524900),
(101281001, 440801, 2810, 3, 3, 'zhanjiang', '湛江', '市', 21.18711700, 110.38672600),
(101281002, 440883, 2810, 3, 4, 'wuchuanshi', '吴川', '市', 21.44180800, 110.77841100),
(101281003, 440882, 2810, 3, 4, 'leizhou', '雷州', '市', 20.91950500, 110.04518200),
(101281004, 440825, 2810, 3, 4, 'xuwen', '徐闻', '县', 20.34595900, 110.14526900),
(101281005, 440881, 2810, 3, 4, 'lianjiangshi', '廉江', '市', 21.61473200, 110.29700300),
(101281006, 440802, 2810, 3, 5, 'chikan', '赤坎', '区', 21.26611900, 110.36590000),
(101281007, 440823, 2810, 3, 4, 'suixixian', '遂溪', '县', 21.39840300, 110.26722300),
(101281008, 440804, 2810, 3, 5, 'potou', '坡头', '区', 21.24472100, 110.45533200),
(101281009, 440803, 2810, 3, 5, 'xiashan', '霞山', '区', 21.19898900, 110.40068500),
(101281010, 440811, 2810, 3, 5, 'mazhang', '麻章', '区', 21.26344300, 110.33438700),
(101281101, 440701, 2811, 3, 3, 'jiangmen', '江门', '市', 22.56113000, 113.10426900),
(101281103, 440783, 2811, 3, 4, 'kaiping', '开平', '市', 22.37639500, 112.69854500),
(101281104, 440705, 2811, 3, 5, 'xinhui', '新会', '区', 22.52140700, 113.06959500),
(101281105, 440785, 2811, 3, 4, 'enping', '恩平', '市', 22.18320600, 112.30514500),
(101281106, 440781, 2811, 3, 4, 'taishan', '台山', '市', 22.25192400, 112.79406500),
(101281107, 440703, 2811, 3, 5, 'pengjiang', '蓬江', '区', 22.59515600, 113.07849700),
(101281108, 440784, 2811, 3, 4, 'heshan', '鹤山', '市', 22.76543500, 112.96428300),
(101281109, 440704, 2811, 3, 5, 'jianghai', '江海', '区', 22.56581300, 113.10913400),
(101281201, 441601, 2812, 3, 3, 'heyuan', '河源', '市', 23.76007300, 114.68184100),
(101281202, 441621, 2812, 3, 4, 'zijin', '紫金', '县', 23.63841000, 115.18213400),
(101281203, 441623, 2812, 3, 4, 'lianping', '连平', '县', 24.36958800, 114.48871400),
(101281204, 441624, 2812, 3, 4, 'heping', '和平', '县', 24.44218000, 114.93868400),
(101281205, 441622, 2812, 3, 4, 'longchuan', '龙川', '县', 24.11272800, 115.23704500),
(101281206, 441625, 2812, 3, 4, 'dongyuan', '东源', '县', 23.78839300, 114.74638000),
(101281207, 441602, 2812, 3, 5, 'yuanchengqu', '源城', '区', 23.69360400, 114.65448400),
(101281301, 441801, 2813, 3, 3, 'qingyuan3', '清远', '市', 23.68823700, 113.06261900),
(101281302, 441826, 2813, 3, 4, 'liannan', '连南', '自治县', 24.72601700, 112.28701200),
(101281303, 441882, 2813, 3, 4, 'lianzhou', '连州', '市', 24.78096600, 112.37736100),
(101281304, 441825, 2813, 3, 4, 'lianshan', '连山', '自治县', 24.56769500, 112.08065900),
(101281305, 441823, 2813, 3, 4, 'yangshan', '阳山', '县', 24.46667500, 112.62649500),
(101281306, 441821, 2813, 3, 4, 'fogang', '佛冈', '县', 23.87919200, 113.53160700),
(101281307, 441881, 2813, 3, 4, 'yingde', '英德', '市', 24.15899000, 113.43986300),
(101281308, 441803, 2813, 3, 5, 'qingxin', '清新', '区', 23.75510100, 112.99309200),
(101281309, 441802, 2813, 3, 5, 'qingchengqu', '清城', '区', 23.62585600, 113.11458500),
(101281401, 445301, 2814, 3, 3, 'yunfu', '云浮', '市', 22.93227800, 112.15494000),
(101281402, 445381, 2814, 3, 4, 'luoding', '罗定', '市', 22.76859500, 111.57001100),
(101281403, 445321, 2814, 3, 4, 'xinxing', '新兴', '县', 22.69569000, 112.22533500),
(101281404, 445322, 2814, 3, 4, 'yunan', '郁南', '县', 23.23462700, 111.53524900),
(101281406, 445303, 2814, 3, 5, 'yunan1', '云安', '县', 23.07102000, 112.00320900),
(101281407, 445302, 2814, 3, 5, 'yunchengqu', '云城', '区', 22.97300200, 112.17160400),
(101281501, 445101, 2815, 3, 3, 'chaozhou', '潮州', '市', 23.66414900, 116.62860800),
(101281502, 445122, 2815, 3, 4, 'raoping', '饶平', '县', 23.71450200, 116.92810100),
(101281503, 445103, 2815, 3, 5, 'chaoan', '潮安', '区', 23.46836500, 116.68469900),
(101281504, 445102, 2815, 3, 5, 'xiangqiaoqu', '湘桥', '区', 23.70004400, 116.67790000),
(101281601, 441901, 2816, 3, 3, 'dongguan', '东莞', '市', 23.09206600, 113.85495000),
(101281701, 442001, 2817, 3, 3, 'zhongshan', '中山', '市', 22.54453100, 113.43303300),
(101281801, 441701, 2818, 3, 3, 'yangjiang', '阳江', '市', 21.71070400, 111.80926000),
(101281802, 441781, 2818, 3, 4, 'yangchun', '阳春', '市', 22.18975900, 111.76123100),
(101281803, 441704, 2818, 3, 5, 'yangdong', '阳东', '区', 21.86835800, 112.00633800),
(101281804, 441721, 2818, 3, 4, 'yangxi', '阳西', '县', 21.75239600, 111.61784900),
(101281805, 441702, 2818, 3, 5, 'jiangchengqu', '江城', '区', 21.76280400, 111.93003600),
(101281901, 445201, 2819, 3, 3, 'jieyang', '揭阳', '市', 23.57120900, 116.37004400),
(101281902, 445222, 2819, 3, 4, 'jiexi', '揭西', '县', 23.43129400, 115.84183800),
(101281903, 445281, 2819, 3, 4, 'puning', '普宁', '市', 23.26912300, 116.19463800),
(101281904, 445224, 2819, 3, 4, 'huilai', '惠来', '县', 23.03326700, 116.29515000),
(101281905, 445203, 2819, 3, 5, 'jiedong', '揭东', '区', 23.56612700, 116.41201500),
(101281906, 445202, 2819, 3, 5, 'rongchengqu', '榕城', '区', 23.52945300, 116.36922400),
(101282001, 440901, 2820, 3, 3, 'maoming', '茂名', '市', 21.68177000, 110.84810600),
(101282002, 440981, 2820, 3, 4, 'gaozhou', '高州', '市', 21.91260000, 110.86500000),
(101282003, 440982, 2820, 3, 4, 'huazhou', '化州', '市', 21.65259200, 110.65182000),
(101282004, 440904, 2820, 3, 5, 'dianbai', '电白', '区', 21.51416400, 111.01355600),
(101282005, 440983, 2820, 3, 4, 'xinyishi', '信宜', '市', 22.33138900, 110.96749400),
(101282006, 0, 2820, 3, 5, 'maogang', '茂港', '区', 21.46470700, 111.05833600),
(101282007, 440902, 2820, 3, 5, 'maonanqu', '茂南', '区', 21.67611600, 110.86861000),
(101282101, 441501, 2821, 3, 3, 'shanwei', '汕尾', '市', 22.81341700, 115.42398200),
(101282102, 441521, 2821, 3, 4, 'haifeng', '海丰', '县', 22.96661700, 115.32353000),
(101282103, 441581, 2821, 3, 4, 'lufeng', '陆丰', '市', 22.95079200, 115.72869500),
(101282104, 441523, 2821, 3, 4, 'luhe', '陆河', '县', 23.30161700, 115.66014300),
(101282105, 441502, 2821, 3, 5, 'chengqu', '城区', '区', 37.85786500, 113.61283800),
(101290101, 530101, 2901, 3, 3, 'kunming', '昆明', '市', 25.04423800, 102.72861300),
(101290102, 530102, 2901, 3, 5, 'wuhuaqu', '五华', '区', 25.04970800, 102.71376200),
(101290103, 530113, 2901, 3, 5, 'dongchuan', '东川', '区', 26.08287300, 103.18782500),
(101290104, 530129, 2901, 3, 4, 'xundian', '寻甸', '自治县', 25.55820100, 103.25661600),
(101290105, 530122, 2901, 3, 4, 'jinning', '晋宁', '县 ', 24.66971100, 102.59543400),
(101290106, 530125, 2901, 3, 4, 'yiliang', '宜良', '县 ', 24.91970500, 103.14130700),
(101290107, 530126, 2901, 3, 4, 'shilin', '石林', '自治县', 24.86328400, 103.32932900),
(101290108, 530114, 2901, 3, 5, 'chenggong', '呈贡', '区', 24.88553200, 102.82146800),
(101290109, 530124, 2901, 3, 4, 'fumin', '富民', '县 ', 25.22204500, 102.49768400),
(101290110, 530127, 2901, 3, 4, 'songming', '嵩明', '县 ', 25.33864400, 103.03690800),
(101290111, 530128, 2901, 3, 4, 'luquan', '禄劝', '自治县', 25.55133200, 102.47151800),
(101290112, 530181, 2901, 3, 4, 'anning', '安宁', '市', 24.91949300, 102.47849400),
(101290113, 0, 2901, 3, 0, 'taihuashan', '太华山', '', 25.01520700, 102.72195500),
(101290114, 530103, 2901, 3, 5, 'panlong', '盘龙', '区', 25.27401900, 102.76755600),
(101290115, 530111, 2901, 3, 5, 'guanduqu', '官渡', '区', 25.03131100, 102.82881900),
(101290116, 530112, 2901, 3, 5, 'xishanqu', '西山', '区', 24.98363000, 102.60347800),
(101290201, 532901, 2902, 3, 3, 'dali1', '大理', '市', 25.58862000, 100.24953800),
(101290202, 532929, 2902, 3, 4, 'yunlong', '云龙', '县', 25.88566200, 99.37104800),
(101290203, 532922, 2902, 3, 4, 'yangbi', '漾濞', '自治县', 25.67014800, 99.95801500),
(101290204, 532928, 2902, 3, 4, 'yongping', '永平', '县', 25.46468100, 99.54123600),
(101290205, 532924, 2902, 3, 4, 'binchuan', '宾川', '县', 25.82718200, 100.57541200),
(101290206, 532925, 2902, 3, 4, 'midu', '弥渡', '县', 25.49645000, 100.42594400),
(101290207, 532923, 2902, 3, 4, 'xiangyun', '祥云', '县', 25.46989500, 100.54543200),
(101290208, 532927, 2902, 3, 4, 'weishanxian', '巍山', '自治县', 25.22721200, 100.30717500),
(101290209, 532931, 2902, 3, 4, 'jianchuan', '剑川', '县', 26.53709300, 99.90554200),
(101290210, 532930, 2902, 3, 4, 'eryuan', '洱源', '县', 26.11116000, 99.95105400),
(101290211, 532932, 2902, 3, 4, 'heqing', '鹤庆', '县', 26.55532700, 100.21697100),
(101290212, 532926, 2902, 3, 4, 'nanjian', '南涧', '自治县', 25.04351000, 100.50903600),
(101290301, 532529, 2903, 3, 4, 'honghe', '红河', '县', 23.36916100, 102.42060000),
(101290302, 532525, 2903, 3, 4, 'shiping', '石屏', '县', 23.70593600, 102.49498400),
(101290303, 532524, 2903, 3, 4, 'jianshui', '建水', '县', 23.62121000, 102.83321000),
(101290304, 532504, 2903, 3, 4, 'mile', '弥勒', '市', 24.41191200, 103.41487400),
(101290305, 532528, 2903, 3, 4, 'yuanyangxian', '元阳', '县', 23.21993200, 102.83522300),
(101290306, 532531, 2903, 3, 4, 'lvchun', '绿春', '县', 22.99371800, 102.39246300),
(101290307, 532502, 2903, 3, 4, 'kaiyuan1', '开远', '市', 23.71431600, 103.26714300),
(101290308, 532501, 2903, 3, 4, 'gejiu', '个旧', '市', 23.35912100, 103.16003400),
(101290309, 532503, 2903, 3, 4, 'mengzi', '蒙自', '市', 23.39620100, 103.36490500),
(101290310, 532523, 2903, 3, 4, 'pingbian', '屏边', '自治县', 22.98356000, 103.68761200),
(101290311, 532527, 2903, 3, 4, 'lu xi', '泸西', '县', 24.53202500, 103.76619600),
(101290313, 532532, 2903, 3, 4, 'he kou', '河口', '自治县', 22.52940400, 103.93935000),
(101290330, 532530, 2903, 3, 4, 'jinpingmiaozu', '金平苗族', '自治县', 22.78000500, 103.24786200),
(101290401, 530301, 2904, 3, 3, 'qujing', '曲靖', '市', 25.52682200, 103.79206400),
(101290402, 530303, 2904, 3, 5, 'zhanyi', '沾益', '区', 25.60050700, 103.82232400),
(101290403, 530322, 2904, 3, 4, 'luliang', '陆良', '县', 24.84736300, 103.69722300),
(101290404, 530325, 2904, 3, 4, 'fuyuanxian', '富源', '县', 25.68177500, 104.26941200),
(101290405, 530321, 2904, 3, 4, 'malong', '马龙', '县', 25.42813000, 103.57845400),
(101290406, 530323, 2904, 3, 4, 'shizong', '师宗', '县', 24.82616700, 104.01929900),
(101290407, 530324, 2904, 3, 4, 'luoping', '罗平', '县', 24.90781900, 104.31576500),
(101290408, 530326, 2904, 3, 4, 'huize', '会泽', '县', 26.41794700, 103.29736100),
(101290409, 530381, 2904, 3, 4, 'xuanwei', '宣威', '市', 26.20756400, 104.11992000),
(101290410, 530302, 2904, 3, 5, 'qilinqu', '麒麟', '区', 25.36005700, 103.91332600),
(101290501, 530501, 2905, 3, 3, 'baoshan1', '保山', '市', 25.10039300, 99.16319600),
(101290503, 530523, 2905, 3, 4, 'longling', '龙陵', '县', 24.58676600, 98.68923000),
(101290504, 530521, 2905, 3, 4, 'sidian', '施甸', '县', 24.72306400, 99.18922100),
(101290505, 530524, 2905, 3, 4, 'changningxian', '昌宁', '县', 24.82783900, 99.60514200),
(101290506, 530581, 2905, 3, 4, 'tengchong', '腾冲', '市', 25.02043900, 98.49096700),
(101290507, 530502, 2905, 3, 5, 'longyangqu', '隆阳', '区', 25.20526500, 99.06904600),
(101290601, 532601, 2906, 3, 4, 'wenshan', '文山', '市', 23.38630600, 104.23251000),
(101290602, 532623, 2906, 3, 4, 'xichou', '西畴', '县', 23.43778200, 104.67259700),
(101290603, 532625, 2906, 3, 4, 'maguan', '马关', '县', 23.01291500, 104.39415800),
(101290604, 532624, 2906, 3, 4, 'malipo', '麻栗坡', '县', 23.12571400, 104.70279900),
(101290605, 532622, 2906, 3, 4, 'yanshanxian', '砚山', '县', 23.60574000, 104.33724400),
(101290606, 532626, 2906, 3, 4, 'qiubei', '丘北', '县', 24.04191900, 104.19582000),
(101290607, 532627, 2906, 3, 4, 'guangnan', '广南', '县', 24.04594100, 105.05498100),
(101290608, 532628, 2906, 3, 4, 'funingxian', '富宁', '县', 23.62528300, 105.63099900),
(101290701, 530401, 2907, 3, 3, 'yuxi', '玉溪', '市', 24.35253500, 102.52683300),
(101290702, 530422, 2907, 3, 4, 'chengjiang', '澄江', '县', 24.67373400, 102.90824800),
(101290703, 530403, 2907, 3, 5, 'jiangchuan', '江川', '区', 24.28753400, 102.75373400),
(101290704, 530423, 2907, 3, 4, 'tonghai', '通海', '县', 24.11669500, 102.66458200),
(101290705, 530424, 2907, 3, 4, 'huaning', '华宁', '县', 24.19276100, 102.92883500),
(101290706, 530427, 2907, 3, 4, 'xinping', '新平', '自治县', 24.07005100, 101.99015700),
(101290707, 530425, 2907, 3, 4, 'yimen', '易门', '县', 24.67165100, 102.16253100),
(101290708, 530426, 2907, 3, 4, 'eshan', '峨山', '自治县', 24.16895700, 102.40581900),
(101290709, 530428, 2907, 3, 4, 'yuanjiangxian', '元江', '自治县', 23.59650300, 101.99810300),
(101290712, 530402, 2907, 3, 5, 'hongtaqu', '红塔', '区', 24.34697800, 102.54674500),
(101290801, 532301, 2908, 3, 4, 'chuxiong', '楚雄', '市', 25.05097900, 101.54454900),
(101290802, 532326, 2908, 3, 4, 'dayao', '大姚', '县', 25.72215300, 101.32433200),
(101290803, 532328, 2908, 3, 4, 'yuanmou', '元谋', '县', 25.73845600, 101.84199500),
(101290804, 532325, 2908, 3, 4, 'yaoan', '姚安', '县', 25.36629000, 101.06409200),
(101290805, 532323, 2908, 3, 4, 'mouding', '牟定', '县', 25.31312200, 101.54656600),
(101290806, 532324, 2908, 3, 4, 'nanhua', '南华', '县', 25.20662600, 101.28344900),
(101290807, 532329, 2908, 3, 4, 'wuding', '武定', '县', 25.53038900, 102.40433800),
(101290808, 532331, 2908, 3, 4, 'lufengxian', '禄丰', '县', 25.15011100, 102.07902700),
(101290809, 532322, 2908, 3, 4, 'shuangbai', '双柏', '县', 24.68887500, 101.64193700),
(101290810, 532327, 2908, 3, 4, 'yongren', '永仁', '县', 26.05635100, 101.66984200),
(101290901, 530801, 2909, 3, 3, 'puer', '普洱', '市', 22.80031700, 100.97884800),
(101290902, 530824, 2909, 3, 4, 'jinggu', '景谷', '自治县', 23.49702800, 100.70287100),
(101290903, 530823, 2909, 3, 4, 'jingdong', '景东', '自治县', 24.44673100, 100.83387700),
(101290904, 530828, 2909, 3, 4, 'lancang', '澜沧', '自治县', 22.55590500, 99.93197500),
(101290906, 530822, 2909, 3, 4, 'mojiang', '墨江', '自治县', 23.43189400, 101.69246100),
(101290907, 441702, 2909, 3, 4, 'jiangcheng', '江城', '县', 22.58586800, 101.86212000),
(101290908, 530827, 2909, 3, 4, 'menglian', '孟连', '自治县', 22.32909900, 99.58415700),
(101290909, 530829, 2909, 3, 4, 'ximeng', '西盟', '自治县', 22.64450800, 99.59012400),
(101290911, 530825, 2909, 3, 4, 'zhenyuanxian', '镇沅', '自治县', 24.00444200, 101.10859500),
(101290912, 530821, 2909, 3, 4, 'ninger', '宁洱', '自治县', 23.06175000, 101.04531700),
(101290913, 530802, 2909, 3, 5, 'simao', '思茅', '区', 22.73913300, 100.85525300),
(101290926, 530826, 2909, 3, 4, 'jiangchengha', '江城哈尼族', '自治县', 22.58713200, 101.86818200),
(101291001, 530601, 2910, 3, 3, 'zhaotong', '昭通', '市', 27.38519200, 103.79143400),
(101291002, 530621, 2910, 3, 4, 'ludian', '鲁甸', '县', 27.18665900, 103.55804200),
(101291003, 530628, 2910, 3, 4, 'yiliangxian', '彝良', '县', 27.62541900, 104.04828900),
(101291004, 530627, 2910, 3, 4, 'zhenxiong', '镇雄', '县', 27.44163600, 104.87364800),
(101291005, 530629, 2910, 3, 4, 'weixin', '威信', '县', 27.84690100, 105.04902700),
(101291006, 530622, 2910, 3, 4, 'qiaojia', '巧家', '县', 26.90846100, 102.93016400),
(101291007, 530626, 2910, 3, 4, 'suijiang', '绥江', '县', 28.59210000, 103.96897800),
(101291008, 530625, 2910, 3, 4, 'yongshan', '永善', '县', 28.22911300, 103.63806700),
(101291009, 530623, 2910, 3, 4, 'yanjinxian', '盐津', '县', 28.10871000, 104.23444200),
(101291010, 530624, 2910, 3, 4, 'daguan', '大关', '县', 27.74797800, 103.89114600),
(101291011, 530630, 2910, 3, 4, 'shuifu', '水富', '县', 28.62988000, 104.41603100),
(101291012, 530602, 2910, 3, 5, 'zhaoyangqu', '昭阳', '区', 27.42758300, 103.60727700),
(101291101, 530901, 2911, 3, 3, 'lincang', '临沧', '市', 23.89755900, 100.09714900),
(101291102, 530927, 2911, 3, 4, 'cangyuan', '沧源', '自治县', 23.14671200, 99.24619700),
(101291103, 530926, 2911, 3, 4, 'gengma', '耿马', '自治县', 23.53809200, 99.39712700),
(101291104, 530925, 2911, 3, 4, 'shuangjiang', '双江', '自治县', 23.47349900, 99.82769800),
(101291105, 530921, 2911, 3, 4, 'fengqing', '凤庆', '县', 24.58042400, 99.92846000),
(101291106, 530923, 2911, 3, 4, 'yongde', '永德', '县', 24.01835700, 99.25934000),
(101291107, 530922, 2911, 3, 4, 'yunxian', '云县', '县', 24.43706100, 100.12324800),
(101291108, 530924, 2911, 3, 4, 'zhenkang', '镇康', '县', 23.76258400, 98.82528500),
(101291109, 530902, 2911, 3, 5, 'linxiangqu', '临翔', '区', 23.84957000, 100.13990800),
(101291201, 533301, 2912, 3, 3, 'nujiang', '怒江', '自治州', 23.82681600, 96.01866500),
(101291203, 533323, 2912, 3, 4, 'fugong', '福贡', '县', 26.90183200, 98.86913200),
(101291204, 533325, 2912, 3, 4, 'lanping', '兰坪', '自治县', 26.45357100, 99.41667700),
(101291205, 533301, 2912, 3, 4, 'lushui', '泸水', '市', 25.82288000, 98.85797700),
(101291206, 0, 2912, 3, 4, 'liuku', '六库', '县', 25.84369100, 98.85453300),
(101291207, 533324, 2912, 3, 4, 'gongshan', '贡山', '自治县', 27.74099900, 98.66596500),
(101291301, 533401, 2913, 3, 4, 'xianggelila', '香格里拉', '市', 27.82974300, 99.70083600),
(101291302, 533422, 2913, 3, 4, 'deqin', '德钦', '县', 28.48611000, 98.91154200),
(101291303, 533423, 2913, 3, 4, 'weixi', '维西', '自治县', 27.17716200, 99.28717300),
(101291304, 0, 2913, 3, 4, 'zhongdian', '中甸', '县', 27.82135000, 99.70340100),
(101291401, 530701, 2914, 3, 3, 'lijiang', '丽江', '市', 26.81104100, 100.25243300),
(101291402, 530722, 2914, 3, 4, 'yongsheng', '永胜', '县', 26.68422500, 100.75079500),
(101291403, 530723, 2914, 3, 4, 'huaping', '华坪', '县', 26.62921100, 101.26619500),
(101291404, 530724, 2914, 3, 4, 'ninglang', '宁蒗', '自治县', 27.28207100, 100.85200100),
(101291421, 530721, 2914, 3, 4, 'yulongnaxi', '玉龙', '自治县', 26.82741300, 100.24347600),
(101291501, 533101, 2915, 3, 4, 'dehong', '德宏', '自治州', 24.42619700, 98.58464800),
(101291503, 533124, 2915, 3, 4, 'longchuanxian', '陇川', '县', 24.18296500, 97.79210500),
(101291504, 533123, 2915, 3, 4, 'yingjiang', '盈江', '县', 24.70521100, 97.93195500),
(101291506, 533102, 2915, 3, 4, 'ruilishi', '瑞丽', '市', 24.01280800, 97.85193100),
(101291507, 533122, 2915, 3, 4, 'lianghe', '梁河', '县', 24.80423200, 98.29665700),
(101291508, 0, 2915, 3, 4, 'luxixian', '潞西', '县', 24.43349800, 98.58386700),
(101291509, 533103, 2915, 3, 4, 'mangshi', '芒市', '市', 24.43951800, 98.59470400),
(101291510, 0, 2915, 3, 5, 'mangshiqu', '芒市', '区', 27.32610200, 103.71246800),
(101291601, 532801, 2916, 3, 4, 'jinghongshi', '景洪', '市', 22.00014300, 100.77167900),
(101291603, 532822, 2916, 3, 4, 'menghai', '勐海', '县', 21.95735400, 100.45254800),
(101291605, 532823, 2916, 3, 4, 'mengla', '勐腊', '县', 21.45923300, 101.56463600),
(101300101, 450101, 3001, 3, 3, 'nanning', '南宁', '市', 22.82730700, 108.31498900),
(101300102, 450102, 3001, 3, 5, 'xingning', '兴宁', '区', 22.86053400, 108.37520500),
(101300103, 450109, 3001, 3, 5, 'yongningqu', '邕宁', '区', 22.75839000, 108.48736900),
(101300104, 450127, 3001, 3, 4, 'hengxian', '横县', '县', 22.67993200, 109.26138400),
(101300105, 450123, 3001, 3, 4, 'longan', '隆安', '县', 23.16602800, 107.69615300),
(101300106, 450124, 3001, 3, 4, 'mashan', '马山', '县', 23.70819200, 108.17697900),
(101300107, 450125, 3001, 3, 4, 'shanglin', '上林', '县', 23.43193600, 108.60492100),
(101300108, 450110, 3001, 3, 5, 'wumingqu', '武鸣', '区', 23.15869300, 108.27471200),
(101300109, 450126, 3001, 3, 4, 'binyang', '宾阳', '县', 23.21778700, 108.81032600),
(101300110, 450103, 3001, 3, 5, 'qingxiu', '青秀', '区', 22.82921800, 108.54168000),
(101300111, 450107, 3001, 3, 5, 'xixiangtang', '西乡塘', '区', 32.89490300, 107.75371200),
(101300112, 450108, 3001, 3, 5, 'liangqing', '良庆', '区', 22.49891000, 108.37044900),
(101300115, 450105, 3001, 3, 5, 'jiangnan', '江南', '区', 22.78838300, 108.27620900),
(101300201, 451401, 3002, 3, 3, 'chongzuo', '崇左', '市', 22.40328600, 107.35836400),
(101300202, 451425, 3002, 3, 4, 'tiandeng', '天等', '县', 23.08139400, 107.14343300),
(101300203, 451423, 3002, 3, 4, 'longzhou', '龙州', '县', 22.34277100, 106.85437600),
(101300204, 451481, 3002, 3, 4, 'pingxiangshi', '凭祥', '市', 22.07982400, 106.74287700),
(101300205, 451424, 3002, 3, 4, 'daxin', '大新', '县', 22.82928800, 107.20065400),
(101300206, 451421, 3002, 3, 4, 'fusui', '扶绥', '县', 22.62772300, 107.91935400),
(101300207, 451422, 3002, 3, 4, 'ningming', '宁明', '县', 22.15881300, 107.06375600),
(101300208, 451402, 3002, 3, 5, 'jiangzhou', '江州', '区', 22.41201200, 107.35789200),
(101300212, 451402, 3002, 3, 5, 'jaingzhou', '江州', '区', 22.41201200, 107.35702900),
(101300301, 450201, 3003, 3, 3, 'liuzhou', '柳州', '市', 24.29999400, 109.38221000),
(101300302, 450222, 3003, 3, 4, 'liucheng', '柳城', '县', 24.65151800, 109.24473000),
(101300304, 450223, 3003, 3, 4, 'luzhai', '鹿寨', '县', 24.47923100, 109.74627000),
(101300305, 450206, 3003, 3, 5, 'liujiangqu', '柳江', '县', 24.16622400, 109.49474900),
(101300306, 450224, 3003, 3, 4, 'rongan', '融安', '县', 25.20625700, 109.40722000),
(101300307, 450225, 3003, 3, 4, 'rongshuixian', '融水', '自治县', 25.07319000, 109.23996600),
(101300308, 450226, 3003, 3, 4, 'sanjiang', '三江', '自治县', 25.78319100, 109.60768200),
(101300309, 450202, 3003, 3, 5, 'chengzhongqu', '城中', '区', 36.60664900, 101.77736100),
(101300310, 450203, 3003, 3, 5, 'yufengqu', '鱼峰', '区', 24.27581600, 109.45632700),
(101300311, 450204, 3003, 3, 5, 'liunanqu', '柳南', '区', 24.30618400, 109.34346600),
(101300315, 450205, 3003, 3, 5, 'liubeiqu', '柳北', '区', 24.37340700, 109.40916000),
(101300401, 451301, 3004, 3, 3, 'laibin', '来宾', '市', 23.73017000, 109.24167200),
(101300402, 451321, 3004, 3, 4, 'xicheng', '忻城', '县', 24.06623500, 108.66566600),
(101300403, 451324, 3004, 3, 4, 'jinxiu', '金秀', '自治县', 24.13037400, 110.18946200),
(101300404, 451322, 3004, 3, 4, 'xiangzhou', '象州', '县', 23.95852800, 109.68398500),
(101300405, 451323, 3004, 3, 4, 'wuxuan', '武宣', '县', 23.59411000, 109.66320700),
(101300406, 451381, 3004, 3, 4, 'heshanshi', '合山', '市', 23.80653600, 108.88608200),
(101300407, 451302, 3004, 3, 5, 'xingbin', '兴宾', '区', 23.66427100, 109.19320500),
(101300501, 450301, 3005, 3, 3, 'guilin', '桂林', '市', 25.25359700, 110.28302000),
(101300503, 450328, 3005, 3, 4, 'longsheng', '龙胜', '自治县', 25.79793100, 110.01123800),
(101300504, 450326, 3005, 3, 4, 'yongfu', '永福', '县', 24.97985600, 109.98307600),
(101300505, 450312, 3005, 3, 5, 'linguiqu', '临桂', '区', 25.23862800, 110.21246300),
(101300506, 450325, 3005, 3, 4, 'xinganxian', '兴安', '县', 25.61170500, 110.67167000),
(101300507, 450323, 3005, 3, 4, 'lingchuanxian', '灵川', '县', 25.40974700, 110.32563600),
(101300508, 450324, 3005, 3, 4, 'quanzhouxian', '全州', '县', 25.92861700, 111.07292600),
(101300509, 450327, 3005, 3, 4, 'guanyang', '灌阳', '县', 25.48938300, 111.16085100),
(101300510, 450321, 3005, 3, 4, 'yangshuo', '阳朔', '县', 24.77848100, 110.49659300),
(101300511, 450332, 3005, 3, 4, 'gongcheng', '恭城', '自治县', 24.83149300, 110.82838900),
(101300512, 450330, 3005, 3, 4, 'pingle', '平乐', '县', 24.63336200, 110.64330500),
(101300513, 450331, 3005, 3, 4, 'lipu', '荔浦', '县', 24.48782200, 110.39521500),
(101300514, 450329, 3005, 3, 4, 'ziyuan', '资源', '县', 26.04244300, 110.65270000),
(101300515, 450302, 3005, 3, 5, 'xiufeng', '秀峰', '区', 25.28713800, 110.27454900),
(101300516, 450303, 3005, 3, 5, 'diecai', '叠彩', '区', 25.31887400, 110.33622600),
(101300517, 450305, 3005, 3, 5, 'qixing', '七星', '区', 25.26467000, 110.35658800),
(101300518, 450311, 3005, 3, 5, 'yanshanqu', '雁山', '区', 25.11280600, 110.37148500),
(101300521, 450332, 3005, 3, 4, 'gongchengyaozu', '恭城瑶族', '自治县', 24.94932600, 110.90944700),
(101300524, 450304, 3005, 3, 5, 'guilinxiangshan', '桂林象山', '区', 25.27819000, 110.29650200),
(101300601, 450401, 3006, 3, 3, 'wuzhou', '梧州', '市', 23.48723200, 111.24012900),
(101300602, 450422, 3006, 3, 4, 'tengxian', '藤县', '县', 23.37498400, 110.91484900),
(101300604, 450421, 3006, 3, 4, 'cangwu', '苍梧', '县', 23.84509700, 111.54400800),
(101300605, 450423, 3006, 3, 4, 'mengshan', '蒙山', '县', 24.19357000, 110.52500300),
(101300606, 450481, 3006, 3, 4, 'cenxishi', '岑溪', '市', 22.90335200, 110.94810900),
(101300607, 450405, 3006, 3, 5, 'changzhouqu', '长洲', '区', 23.51000000, 111.34000000),
(101300608, 450403, 3006, 3, 5, 'wanxiuqu', '万秀', '区', 23.56345500, 111.42162600),
(101300616, 450406, 3006, 3, 5, 'longweiqu', '龙圩', '区', 23.41000000, 111.25000000),
(101300701, 451101, 3007, 3, 3, 'hezhou', '贺州', '市', 24.42000000, 111.55000000),
(101300702, 451121, 3007, 3, 4, 'zhaoping', '昭平', '县', 24.17000000, 110.80000000),
(101300703, 451123, 3007, 3, 4, 'fuchuan', '富川', '自治县', 24.53000000, 111.30000000),
(101300704, 451122, 3007, 3, 4, 'zhongshanxian', '钟山', '县', 24.83000000, 111.27000000),
(101300705, 451102, 3007, 3, 5, 'babu', '八步', '区', 24.30933600, 111.68835200),
(101300706, 451103, 3007, 3, 5, 'pingguiqu', '平桂', '区', 24.46973000, 106.05847800),
(101300707, 0, 3007, 3, 5, 'zhaopingqu', '昭平', '区', 24.10807300, 110.97690800),
(101300712, 451228, 3007, 3, 4, 'duan', '都安瑶族', '自治县', 24.16977800, 108.11806100),
(101300723, 451103, 3007, 3, 5, 'pinggui', '平桂', '区', 24.46561200, 111.49871300),
(101300801, 450801, 3008, 3, 3, 'guigang', '贵港', '市', 23.10000000, 109.60000000),
(101300802, 450881, 3008, 3, 4, 'guipingshi', '桂平', '市', 23.40000000, 110.08000000),
(101300803, 450821, 3008, 3, 4, 'pingnanxian', '平南', '县', 23.55000000, 110.38000000),
(101300804, 450802, 3008, 3, 5, 'gangbei', '港北', '区', 23.24465500, 109.68955800),
(101300805, 450803, 3008, 3, 5, 'gangnan', '港南', '区', 22.87475100, 109.70985100),
(101300806, 450804, 3008, 3, 5, 'tantangqu', '覃塘', '区', 23.14790000, 109.40133600),
(101300901, 450901, 3009, 3, 3, 'yulin1', '玉林', '市', 22.63000000, 110.17000000),
(101300902, 450923, 3009, 3, 4, 'bobai', '博白', '县', 22.28000000, 109.97000000),
(101300903, 450981, 3009, 3, 4, 'beiliushi', '北流', '市', 22.72000000, 110.35000000),
(101300904, 450921, 3009, 3, 4, 'rong xian', '容县', '县', 22.87000000, 110.55000000),
(101300905, 450922, 3009, 3, 4, 'luchuan', '陆川', '县', 22.33000000, 110.27000000),
(101300906, 450924, 3009, 3, 4, 'xingye', '兴业', '县', 22.75000000, 109.87000000),
(101300907, 450902, 3009, 3, 5, 'yuzhouqu', '玉州', '区', 22.55721300, 110.06453400),
(101300913, 450903, 3009, 3, 5, 'fumian', '福绵', '区', 22.58529900, 110.06069800),
(101301001, 451001, 3010, 3, 3, 'baise', '百色', '市', 23.90000000, 106.62000000),
(101301002, 451026, 3010, 3, 4, 'napo', '那坡', '县', 23.42000000, 105.83000000),
(101301003, 451021, 3010, 3, 4, 'tianyang', '田阳', '县', 23.73000000, 106.92000000),
(101301004, 451024, 3010, 3, 4, 'debao', '德保', '县', 23.33000000, 106.62000000),
(101301005, 451081, 3010, 3, 4, 'jingxishi', '靖西', '市', 23.13000000, 106.42000000),
(101301006, 451022, 3010, 3, 4, 'tiandong', '田东', '县', 23.60000000, 107.12000000),
(101301007, 451023, 3010, 3, 4, 'pingguo', '平果', '县', 23.32000000, 107.58000000),
(101301008, 451031, 3010, 3, 4, 'longlin', '隆林', '自治县', 24.77000000, 105.33000000),
(101301009, 451030, 3010, 3, 4, 'xilin', '西林', '县', 24.50000000, 105.10000000),
(101301010, 451028, 3010, 3, 4, 'leye', '乐业', '县', 24.78000000, 106.55000000),
(101301011, 451027, 3010, 3, 4, 'lingyun', '凌云', '县', 24.35000000, 106.57000000),
(101301012, 451029, 3010, 3, 4, 'tianlin', '田林', '县', 24.30000000, 106.23000000),
(101301013, 451002, 3010, 3, 5, 'youjiang', '右江', '区', 23.94186600, 106.50559600),
(101301014, 451031, 3010, 3, 4, 'longlinqu', '隆林各族', '自治县', 24.68043300, 105.30321300),
(101301101, 450701, 3011, 3, 3, 'qinzhou', '钦州', '市', 21.95000000, 108.62000000),
(101301102, 450722, 3011, 3, 4, 'pubei', '浦北', '县', 22.27000000, 109.55000000),
(101301103, 450721, 3011, 3, 4, 'lingshan', '灵山', '县', 22.43000000, 109.30000000),
(101301104, 450702, 3011, 3, 5, 'qinnan', '钦南', '区', 21.89668100, 108.81652400),
(101301105, 450703, 3011, 3, 5, 'qinbei', '钦北', '区', 22.17113300, 108.52867600),
(101301106, 0, 3011, 3, 4, 'pubei', '浦北', '县', 22.27130400, 109.54236700),
(101301201, 451201, 3012, 3, 3, 'hechi', '河池', '市', 24.70000000, 108.07000000),
(101301202, 451222, 3012, 3, 4, 'tiane', '天峨', '县', 25.00000000, 107.17000000),
(101301203, 451224, 3012, 3, 4, 'donglan', '东兰', '县', 24.52000000, 107.37000000),
(101301204, 451227, 3012, 3, 4, 'bama', '巴马', '自治县', 24.15000000, 107.25000000),
(101301205, 451226, 3012, 3, 4, 'huanjiang', '环江', '自治县', 24.83000000, 108.25000000),
(101301206, 451225, 3012, 3, 4, 'luocheng', '罗城', '自治县', 24.78000000, 108.90000000),
(101301207, 451281, 3012, 3, 4, 'yizhoushi', '宜州', '市', 24.50000000, 108.67000000),
(101301208, 451223, 3012, 3, 4, 'fengshan', '凤山', '县', 24.55000000, 107.05000000),
(101301209, 451221, 3012, 3, 4, 'nandan', '南丹', '县', 24.98000000, 107.53000000),
(101301210, 451228, 3012, 3, 4, 'andu', '都安', '自治县', 23.93000000, 108.10000000),
(101301211, 451229, 3012, 3, 4, 'dahua', '大化', '自治县', 23.73000000, 107.98000000),
(101301212, 451202, 3012, 3, 5, 'jinchengjiang', '金城江', '区', 24.66076200, 107.87344400),
(101301301, 450501, 3013, 3, 3, 'beihai', '北海', '市', 21.48000000, 109.12000000),
(101301302, 450521, 3013, 3, 4, 'hepu', '合浦', '县', 21.67000000, 109.20000000),
(101301303, 0, 3013, 3, 4, 'weizhoudao', '涠洲岛', '区', 21.03330000, 109.10000000),
(101301304, 450503, 3013, 3, 5, 'yinhai', '银海', '区', 21.48972300, 109.25159100),
(101301305, 450512, 3013, 3, 5, 'tieshangang', '铁山港', '区', 21.57491500, 109.42248900),
(101301312, 450502, 3013, 3, 5, 'hai cheng', '海城', '区', 21.48582400, 109.12307900),
(101301401, 450601, 3014, 3, 3, 'fangchenggang', '防城港', '市', 21.70000000, 108.35000000),
(101301402, 450621, 3014, 3, 4, 'shangsi', '上思', '县', 22.15000000, 107.98000000),
(101301403, 450681, 3014, 3, 4, 'dongxingshi', '东兴', '市', 21.53000000, 107.97000000),
(101301405, 450603, 3014, 3, 5, 'fangchengqu', '防城', '区', 21.77000000, 108.35000000),
(101301406, 450602, 3014, 3, 5, 'gangkou', '港口', '区', 21.66203600, 108.44916600),
(101310101, 460101, 3101, 3, 3, 'haikou', '海口', '市', 20.02000000, 110.35000000),
(101310102, 460107, 3101, 3, 5, 'qiongshan', '琼山', '区', 19.74133400, 110.48011000),
(101310103, 460106, 3101, 3, 5, 'longhua1', '龙华', '区', 19.90535100, 110.33522400),
(101310104, 460105, 3101, 3, 5, 'xiuying', '秀英', '区', 19.88434400, 110.26320000),
(101310106, 460108, 3101, 3, 5, 'meilan', '美兰', '区', 19.94290900, 110.50726900),
(101310201, 460201, 3102, 3, 3, 'sanya', '三亚', '市', 18.25330000, 109.50360000),
(101310202, 460202, 3102, 3, 5, 'haitangqu', '海棠', '区', 18.33818700, 109.71864300),
(101310203, 460203, 3102, 3, 5, 'jiyangqu', '吉阳', '区', 18.28723600, 109.58428900),
(101310204, 460204, 3102, 3, 5, 'tianyaqu', '天涯', '区', 18.30661500, 109.46023500),
(101310205, 460205, 3102, 3, 5, 'yazhouqu', '崖州', '区', 18.44542500, 109.22632400),
(101310302, 469007, 3103, 3, 3, 'dongfang', '东方', '市', 19.10000000, 108.63000000),
(101310403, 469024, 3104, 3, 4, 'lingao', '临高', '县', 19.92000000, 109.68000000),
(101310504, 469023, 3105, 3, 4, 'chengmai', '澄迈', '县', 19.73000000, 110.00000000),
(101310605, 460401, 3106, 3, 3, 'danzhou', '儋州', '市', 19.52000000, 109.57000000),
(101310606, 0, 3106, 3, 4, 'yangpu', '洋浦', '区', 19.73964500, 109.20097000),
(101310702, 360202, 3107, 3, 4, 'changjiang', '昌江', '自治县', 19.25000000, 109.03000000),
(101310807, 469025, 3108, 3, 4, 'baishalizu', '白沙黎族', '自治县', 19.23000000, 109.45000000),
(101310908, 469030, 3109, 3, 4, 'qiongzhonglizumiaozu', '琼中黎族苗族', '自治县', 19.03000000, 109.83000000),
(101311009, 469021, 3110, 3, 4, 'dingan', '定安', '县', 19.70000000, 110.32000000),
(101311110, 469022, 3111, 3, 4, 'tunchang', '屯昌', '县', 19.37000000, 110.10000000),
(101311211, 469002, 3112, 3, 3, 'qionghai', '琼海', '市', 19.25000000, 110.47000000),
(101311305, 469005, 3113, 3, 3, 'wenchang', '文昌', '市', 19.54993100, 110.80276900),
(101311429, 469029, 3114, 3, 4, 'baotinglizumiaozu', '保亭黎族苗族', '自治县', 18.64553800, 109.70530100),
(101311515, 469006, 3115, 3, 3, 'wanning', '万宁', '市', 18.80000000, 110.40000000),
(101311616, 469028, 3116, 3, 4, 'lingshuilizu', '陵水黎族', '自治县', 18.50000000, 110.03000000),
(101311717, 0, 3117, 3, 3, 'xisha', '西沙', '县', 16.05000000, 112.00277800),
(101311820, 469001, 3118, 3, 3, 'nanshadao', '南沙岛', '县', 10.00000000, 114.00000000),
(101311921, 469027, 3119, 3, 4, 'ledong', '乐东黎族', '自治县', 18.75000000, 109.17000000),
(101312001, 469001, 3120, 3, 3, 'wuzhishan', '五指山', '市', 18.78280500, 109.52517500),
(101312101, 460301, 3121, 3, 3, 'sansha', '三沙', '市', 16.49292510, 111.69665910),
(101320801, 810000, 3208, 3, 5, 'jiulongqu', '九龙区', '', 22.32009800, 114.20301800),
(101340101, 710105, 3401, 3, 5, 'zhongzheng', '中正', '区', 25.03227000, 121.51813600),
(101340102, 710106, 3401, 3, 5, 'taibeidatong', '大同', '区', 25.06272900, 121.51392900),
(101340103, 710104, 3401, 3, 5, 'taibeizhongshan', '中山', '区', 38.91982800, 121.63495000),
(101340104, 710107, 3401, 3, 5, 'wanhuaqu', '万华', '区', 25.03482600, 121.49963600),
(101340105, 710102, 3401, 3, 5, 'xinyiqu', '信义', '区', 25.03312000, 121.56686400),
(101340106, 710101, 3401, 3, 5, 'songshan', ' 松山', '区', 25.05894700, 121.55666800),
(101340107, 710103, 3401, 3, 5, 'taibeidaan', '大安', '区', 25.02342000, 121.54648800),
(101340108, 710109, 3401, 3, 5, 'nangang', ' 南港', '区', 25.05423300, 121.60516300),
(101340109, 710112, 3401, 3, 5, 'beitou', ' 北投', '区', 25.13550700, 121.50312500),
(101340110, 710110, 3401, 3, 5, 'neihu', '内湖', '区', 25.06937200, 121.58936300),
(101340111, 710111, 3401, 3, 5, 'taibeishilin', '士林', '区', 25.09045000, 121.52527100),
(101340112, 710108, 3401, 3, 5, 'taibeiwenshan', '文山', '区', 24.98981800, 121.57017200),
(101340201, 710204, 3402, 3, 5, 'nanzi', '楠梓', '区', 22.72573300, 120.31022900),
(101340202, 710203, 3402, 3, 5, 'zuoying', '左营', '区', 22.67906400, 120.29276200),
(101340203, 710202, 3402, 3, 5, 'gushan', '鼓山', '区', 22.65180200, 120.27530800),
(101340204, 710205, 3402, 3, 5, 'sanmin', '三民', '区', 22.65946100, 120.32088600),
(101340205, 710201, 3402, 3, 5, 'gaoxiongyancheng', '盐埕', '区', 22.62560800, 120.28401900),
(101340206, 710207, 3402, 3, 5, 'qianjin', '前金', '区', 22.62641900, 120.29352000),
(101340207, 710206, 3402, 3, 5, 'gaoxiongxinxing', '新兴', '区', 22.63057600, 120.30683900),
(101340208, 710208, 3402, 3, 5, 'lingya', '苓雅', '区', 22.62401800, 120.32305500);
INSERT INTO `cmf_plugin_modules_citys` (`id`, `code`, `pid`, `level`, `level3`, `pinyin`, `name`, `areaname`, `lat`, `lng`) VALUES
(101340209, 710209, 3402, 3, 5, 'qianzhen', '前镇', '区', 22.59047700, 120.30908000),
(101340210, 710210, 3402, 3, 5, 'qijin', '旗津', '区', 22.59055100, 120.28319000),
(101340211, 710211, 3402, 3, 5, 'xiaogang', '小港', '区', 22.55723600, 120.37258400),
(101340212, 710212, 3402, 3, 5, 'gaoxiongfengshan', '凤山', '区', 22.61232900, 120.35467800),
(101340213, 710214, 3402, 3, 5, 'dalioa', '大寮', '区', 22.58793800, 120.39525600),
(101340214, 710218, 3402, 3, 5, 'niaosong', '鸟松', '区', 22.66530300, 120.37333100),
(101340215, 710213, 3402, 3, 5, 'linyuan', '林园', '区', 22.51287800, 120.38912800),
(101340216, 710217, 3402, 3, 5, 'renwu', '仁武', '区', 22.70354300, 120.36257700),
(101340217, 710215, 3402, 3, 5, 'sashu', '大树', '区', 22.71072300, 120.41331700),
(101340218, 710216, 3402, 3, 5, 'dashe', '大社', '区', 22.74086700, 120.37275700),
(101340219, 710219, 3402, 3, 5, 'gangshan', '冈山', '区', 22.80618200, 120.30362900),
(101340220, 710224, 3402, 3, 5, 'luzhu', '路竹', '区', 22.86043600, 120.26761900),
(101340221, 710220, 3402, 3, 5, 'qiaotou', '桥头', '区', 22.75213700, 120.30245700),
(101340222, 710229, 3402, 3, 5, 'ziguan', '梓官', '区', 22.75090500, 120.25881600),
(101340223, 710228, 3402, 3, 5, 'nituo', '弥陀', '区', 22.77488900, 120.24153700),
(101340224, 710227, 3402, 3, 5, 'gaoxiongyongan', '永安', '区', 22.81883100, 120.23625000),
(101340225, 710221, 3402, 3, 5, 'yanchao', '燕巢', '区', 22.78982900, 120.37064900),
(101340226, 710223, 3402, 3, 5, 'alian', '阿莲', '区', 22.86883000, 120.32213100),
(101340227, 710226, 3402, 3, 5, 'qieding', '茄萣', '区', 22.88774900, 120.19689400),
(101340228, 710225, 3402, 3, 5, 'hunei', '湖内', '区', 22.89079400, 120.22796500),
(101340229, 710230, 3402, 3, 5, 'gaoxiongqishan', '旗山', '区', 22.89424000, 120.48090300),
(101340230, 710231, 3402, 3, 5, 'meinong', '美浓', '区', 22.92820600, 120.56745600),
(101340231, 710235, 3402, 3, 5, 'neimen', '内门', '区', 22.94310200, 120.47196800),
(101340232, 710234, 3402, 3, 5, 'shanlin', '杉林', '区', 22.98105300, 120.55994600),
(101340233, 710233, 3402, 3, 5, 'gaoxiongjiaxian', '甲仙', '区', 23.11201300, 120.62032000),
(101340234, 710232, 3402, 3, 5, 'liugui', '六龟', '区', 23.04511200, 120.68185100),
(101340235, 710236, 3402, 3, 5, 'maolin', '茂林', '区', 22.91125200, 120.76276700),
(101340236, 710237, 3402, 3, 5, 'gaoxiongtaoyuan', '桃源', '区', 23.16742000, 120.79543800),
(101340237, 710238, 3402, 3, 5, 'namaxia', '那玛夏', '区', 23.27386100, 120.71957500),
(101340238, 710222, 3402, 3, 5, 'tianliao', '田寮', '区', 22.86688200, 120.39378600),
(101340401, 710401, 3404, 3, 5, 'zhongqu', '中区', '区', 24.14317100, 120.67988200),
(101340402, 710402, 3404, 3, 5, 'taizhongdongqu', '东区', '', 24.13875300, 120.69765000),
(101340403, 710403, 3404, 3, 5, 'zhanghua', '西区', '区', 24.14955900, 120.66703100),
(101340404, 710404, 3404, 3, 5, 'taizhongnanqu', '南区', '区', 24.11605400, 120.66544600),
(101340405, 710405, 3404, 3, 5, 'beiqu', '北区', '区', 24.15608500, 120.68176700),
(101340406, 710406, 3404, 3, 5, 'xitun', '西屯', '区', 24.19092900, 120.63625400),
(101340407, 710407, 3404, 3, 5, 'nantun', '南屯', '区', 24.14025900, 120.61600200),
(101340408, 710408, 3404, 3, 5, 'beitun', '北屯', '区', 24.18823600, 120.72541500),
(101340409, 710409, 3404, 3, 5, 'fengyuan', '丰原', '区', 24.24381900, 120.73431400),
(101340410, 710428, 3404, 3, 5, 'taizhongdali', '大里', '区', 24.09987000, 120.69365700),
(101340411, 710427, 3404, 3, 5, 'taiping', '太平', '区', 24.10642800, 120.77720300),
(101340412, 710410, 3404, 3, 5, 'dongshi', '东势', '区', 24.25932200, 120.83667100),
(101340413, 710413, 3404, 3, 5, 'dajia', '大甲', '区', 24.37451900, 120.62810200),
(101340414, 710412, 3404, 3, 5, 'taizhongqingshui', '清水', '区', 24.30097800, 120.57491100),
(101340415, 710413, 3404, 3, 5, 'shalu', '沙鹿', '区', 24.22981800, 120.58434600),
(101340416, 710414, 3404, 3, 5, 'taizhongwuxi', '梧栖', '区', 24.24657100, 120.52433100),
(101340417, 710415, 3404, 3, 5, 'houli', '后里', '区', 24.31981000, 120.72620600),
(101340418, 710416, 3404, 3, 5, 'shengang', '神冈', '区', 24.25425100, 120.67999200),
(101340419, 710417, 3404, 3, 5, 'tanzi', '潭子', '区', 24.21178400, 120.70928800),
(101340420, 710418, 3404, 3, 5, 'daya', '大雅', '区', 24.22515300, 120.65007800),
(101340421, 710419, 3404, 3, 5, 'xinshe', '新社', '区', 24.23341500, 120.81067700),
(101340422, 710420, 3404, 3, 5, 'shigang', '石冈', '区', 24.27459400, 120.78060300),
(101340423, 710421, 3404, 3, 5, 'waipu', '外埔', '区', 24.33174200, 120.65468500),
(101340424, 710422, 3404, 3, 5, 'taizhongdaan', '大安', '区', 24.35885500, 120.59128700),
(101340425, 710423, 3404, 3, 5, 'wuri', '乌日', '区', 24.08097300, 120.64169900),
(101340426, 710424, 3404, 3, 5, 'dadu', '大肚', '区', 24.14792600, 120.56181900),
(101340427, 710425, 3404, 3, 5, 'taizhonglongjing', '龙井', '区', 24.20067200, 120.53002200),
(101340428, 710426, 3404, 3, 5, 'taizhongwufeng', '雾峰', '区', 24.04708300, 120.72379100),
(101340429, 710429, 3404, 3, 5, 'taizhongheping', '和平', '区', 24.24937900, 121.09565600),
(101340601, 710801, 3406, 3, 5, 'banqiao', '板桥', '区', 25.01838700, 121.47502100),
(101340602, 710813, 3406, 3, 5, 'tuchneg', '土城', '区', 24.97076400, 121.45429400),
(101340603, 710805, 3406, 3, 5, 'xinzhuang', '新庄', '区', 25.03383900, 121.42690200),
(101340604, 710806, 3406, 3, 5, 'xindian', '新店', '区', 24.93733200, 121.53035000),
(101340605, 710818, 3406, 3, 5, 'shnekeng', '深坑', '区', 25.00095000, 121.62531800),
(101340606, 710819, 3406, 3, 5, 'shiding', '石碇', '区', 24.96272900, 121.65365500),
(101340607, 710820, 3406, 3, 5, 'pinglin', '坪林', '区', 24.92701500, 121.73270800),
(101340608, 710829, 3406, 3, 5, 'wulai', '乌来', '区', 24.78385500, 121.56111500),
(101340609, 710815, 3406, 3, 5, 'wugu', '五股', '区', 25.09221600, 121.42529900),
(101340610, 710823, 3406, 3, 5, 'bali', '八里', '区', 25.11222700, 121.39973900),
(101340611, 710817, 3406, 3, 5, 'xinbeilinkou', '林口', '区', 25.08914300, 121.38267900),
(101340612, 710810, 3406, 3, 5, 'danshui', '淡水', '区', 25.19804600, 121.47366600),
(101340613, 710803, 3406, 3, 5, 'zhonghe', '中和', '区', 24.98785700, 121.49308000),
(101340614, 710804, 3406, 3, 5, 'xinbeiyonghe', '永和', '区', 25.00464200, 121.51336600),
(101340615, 710802, 3406, 3, 5, 'sanchong', '三重', '区', 25.06458900, 121.48033700),
(101340616, 710814, 3406, 3, 5, 'xinbeiluzhou', '芦洲', '区', 25.08552900, 121.47063400),
(101340617, 710816, 3406, 3, 5, 'xinbeitaishan', '泰山', '区', 25.05936500, 121.40782000),
(101340618, 710807, 3406, 3, 5, 'shulin', '树林', '区', 24.98801600, 121.40368800),
(101340619, 710808, 3406, 3, 5, 'yingge', '莺歌', '区', 24.96151100, 121.34128300),
(101340620, 710809, 3406, 3, 5, 'xinbeisanxia', '三峡', '区', 24.87901700, 121.40793500),
(101340621, 320431, 3406, 3, 5, 'xizhi', '汐止', '区', 25.06850500, 121.65666500),
(101340622, 710827, 3406, 3, 5, 'xinbeijinshan', '金山', '区', 25.22371700, 121.61428900),
(101340623, 710828, 3406, 3, 5, 'wanli', '万里', '区', 25.18530000, 121.66367500),
(101340624, 710821, 3406, 3, 5, 'sanzhi', '三芝', '区', 25.23751100, 121.51303600),
(101340625, 710822, 3406, 3, 5, 'xinbeishimen', '石门', '区', 25.26521800, 121.55519700),
(101340626, 710812, 3406, 3, 5, 'ruifang', '瑞芳', '区', 25.10211000, 121.83440100),
(101340627, 710826, 3406, 3, 5, 'gongliao', '贡寮', '区', 25.03419900, 121.92195000),
(101340628, 710825, 3406, 3, 5, 'shuangxi', '双溪', '区', 24.99623600, 121.83318200),
(101340629, 710824, 3406, 3, 5, 'pingxi', '平溪区', '区	', 25.01605100, 121.75553900),
(101340701, 710501, 3407, 3, 5, 'tainandongqu', '东区', '', 22.98143200, 120.23365400),
(101340702, 710502, 3407, 3, 5, 'tainannanqu', '南区', '区', 22.94699400, 120.18819400),
(101340703, 710504, 3407, 3, 5, 'tainanbeiqu', '北区', '', 23.00941700, 120.20967900),
(101340704, 710506, 3407, 3, 5, 'annan', '安南区', '区', 23.04967600, 120.17146200),
(101340705, 710507, 3407, 3, 5, 'tainananping', '安平', '区', 22.98785700, 120.16196000),
(101340706, 710508, 3407, 3, 5, 'tainanzhongxi', '中西', '区', 22.99860100, 120.18781700),
(101340707, 710509, 3407, 3, 5, 'xinying', '新营', '区', 23.31466600, 120.29266100),
(101340708, 710510, 3407, 3, 5, 'yanshui', '盐水', '区', 23.30485800, 120.25491000),
(101340709, 710511, 3407, 3, 5, 'tainanbaihe', '白河', '区', 23.34960700, 120.46730700),
(101340710, 710512, 3407, 3, 5, 'liuying', '柳营', '区 ', 23.27838100, 120.31135100),
(101340711, 710513, 3407, 3, 5, 'houbi', '后壁', '区', 23.36590900, 120.36197100),
(101340712, 710514, 3407, 3, 5, 'tainandongshan', '东山', '区', 23.29082400, 120.50009200),
(101340713, 710515, 3407, 3, 5, 'madou', '麻豆', '区', 23.18159600, 120.24817200),
(101340714, 710516, 3407, 3, 5, 'xiaying', '下营', '区', 23.23547400, 120.26451100),
(101340715, 710517, 3407, 3, 5, 'liujia', '六甲', '区', 23.23183200, 120.34764600),
(101340716, 710518, 3407, 3, 5, 'guantian', '官田', '区', 23.19330700, 120.31518700),
(101340717, 710519, 3407, 3, 5, 'danei', '大内', '区', 23.11885500, 120.35685300),
(101340718, 710520, 3407, 3, 5, 'tainanjiali', '佳里', '区', 23.16557900, 120.17683500),
(101340719, 710521, 3407, 3, 5, 'xuejia', '学甲', '区', 23.23051800, 120.18231500),
(101340720, 710522, 3407, 3, 5, 'xigang', '西港', '区', 23.12324000, 120.20344900),
(101340721, 710523, 3407, 3, 5, 'qigu', '七股', '区', 23.14049700, 120.13904300),
(101340722, 710524, 3407, 3, 5, 'jiangjun', '将军', '区 ', 23.19891400, 120.15871900),
(101340723, 710525, 3407, 3, 5, 'beimen', '北门', '区', 23.27115900, 120.12226800),
(101340724, 710526, 3407, 3, 5, 'tainanxinhua', '新化', '区', 23.03841800, 120.31078000),
(101340725, 710527, 3407, 3, 5, 'shanhua', '善化', '区', 23.13255100, 120.29670900),
(101340726, 710528, 3407, 3, 5, 'xinshi', '新市', '区', 23.07889900, 120.29508100),
(101340727, 710529, 3407, 3, 5, 'tainananding', '安定', '区', 23.09568400, 120.23485500),
(101340728, 710530, 3407, 3, 5, 'shanshang', '山上', '区', 23.09402400, 120.37463600),
(101340729, 710531, 3407, 3, 5, 'yujing', '玉井', '区', 23.12205100, 120.45423000),
(101340730, 710532, 3407, 3, 5, 'tainannanxi', '楠西', '区', 23.17215700, 120.50146500),
(101340731, 710533, 3407, 3, 5, 'tainannanhua', '南化', '区', 23.10982700, 120.53257500),
(101340732, 710534, 3407, 3, 5, 'zuozhen', '左镇', '区', 23.03317200, 120.40826200),
(101340733, 710535, 3407, 3, 5, 'rende', '仁德', '区', 22.94204500, 120.24830900),
(101340734, 710536, 3407, 3, 5, 'guiren', '归仁', '区', 22.94841300, 120.29525100),
(101340735, 710537, 3407, 3, 5, 'guanmiao', '关庙', '区', 22.94903200, 120.33968800),
(101340736, 710538, 3407, 3, 5, 'longqi', '龙崎', '区', 22.95622500, 120.38246800),
(101340737, 710539, 3407, 3, 5, 'tainanyongkang', '永康', '区', 23.02649500, 120.25300700),
(101340801, 710901, 3409, 3, 5, 'taoyuanqu', '桃园', '区', 24.99705800, 121.29771100),
(101340802, 710902, 3409, 3, 5, 'zhongli', '中坜', '区', 24.98275700, 121.21360800),
(101340803, 710903, 3409, 3, 5, 'pingzhen', '平镇', '区', 24.91069900, 121.21784100),
(101340804, 710904, 3409, 3, 5, 'bade', '八德', '区', 24.95089000, 121.28661600),
(101340805, 710905, 3409, 3, 5, 'yangmei', '杨梅', '区', 24.90936600, 121.13089200),
(101340806, 710906, 3409, 3, 5, 'daxi', '大溪', '区', 24.87141600, 121.29795700),
(101340807, 710907, 3409, 3, 5, 'taoyuanluzhu', '芦竹', '区', 25.04865300, 121.28868000),
(101340808, 710908, 3409, 3, 5, 'dayuan', '大园', '区 ', 25.05050200, 121.21119000),
(101340809, 710909, 3409, 3, 5, 'guishan', '龟山', '区', 25.02794200, 121.36117500),
(101340810, 710910, 3409, 3, 5, 'taoyuanlongtan', '龙潭', '区', 24.86420700, 121.21269100),
(101340811, 710911, 3409, 3, 5, 'xinwu', '新屋', '区', 24.96608600, 121.06154500),
(101340812, 710912, 3409, 3, 5, 'guanyin', '观音', '区', 25.01914500, 121.10404800),
(101340813, 710913, 3409, 3, 5, 'fuxing', '复兴', '区', 24.73552100, 121.37334700),
(101341200, 710900, 34, 3, 4, 'xinzhu', '新竹', '县', 24.83923300, 121.00201200),
(101341700, 710900, 34, 2, 4, 'jiayi', '嘉义', '县', 23.43447300, 120.62425500);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_plugin_modules_column`
--

CREATE TABLE `cmf_plugin_modules_column` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '分类id',
  `colony_id` varchar(10) NOT NULL DEFAULT '00000' COMMENT '栏目id',
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类父id',
  `modules_id` int(10) NOT NULL DEFAULT '0' COMMENT '模块id',
  `post_count` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系路径',
  `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '分类级别',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `thumbnail` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '文章页模板',
  `more` text COMMENT '扩展属性',
  `content` text,
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `catalog` varchar(255) NOT NULL DEFAULT '' COMMENT '目录',
  `def_keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '默认关键词',
  `ctime` int(11) DEFAULT '0',
  `alias` varchar(255) DEFAULT '' COMMENT '别名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容模型栏目表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_plugin_modules_day_data`
--

CREATE TABLE `cmf_plugin_modules_day_data` (
  `id` int(11) UNSIGNED NOT NULL,
  `time` int(11) NOT NULL COMMENT '时间，年月日00:00:00',
  `admin_id` int(11) NOT NULL COMMENT '管理员id',
  `module_id` smallint(11) NOT NULL COMMENT '模型id',
  `module_name` varchar(30) DEFAULT '' COMMENT '模型名称',
  `pub_num` int(11) NOT NULL DEFAULT '0' COMMENT '发布数量',
  `edi_num` int(11) NOT NULL DEFAULT '0' COMMENT '修改数量',
  `del_num` int(11) NOT NULL DEFAULT '0' COMMENT '删除数量',
  `rev_num` int(11) NOT NULL DEFAULT '0' COMMENT '审核数量',
  `norev_num` int(11) NOT NULL DEFAULT '0' COMMENT '取消审核数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员日统计每天数据表';

--
-- 转存表中的数据 `cmf_plugin_modules_day_data`
--

INSERT INTO `cmf_plugin_modules_day_data` (`id`, `time`, `admin_id`, `module_id`, `module_name`, `pub_num`, `edi_num`, `del_num`, `rev_num`, `norev_num`) VALUES
(1, 1624204800, 2, 3, '', 2, 0, 0, 0, 0),
(2, 1625846400, 2, 3, '', 1, 1, 2, 2, 0),
(3, 1626105600, 2, 3, '', 0, 1, 0, 0, 0),
(4, 1626364800, 2, 3, '', 0, 1, 0, 0, 0),
(5, 1626710400, 2, 3, '', 1, 2, 0, 0, 0),
(6, 1627142400, 2, 3, '', 1, 3, 0, 0, 0),
(7, 1627747200, 2, 3, '', 1, 0, 0, 0, 0),
(8, 1630339200, 2, 3, '', 0, 0, 4, 4, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_plugin_modules_day_info`
--

CREATE TABLE `cmf_plugin_modules_day_info` (
  `id` int(11) UNSIGNED NOT NULL,
  `time` int(11) NOT NULL COMMENT '时间，年月日00:00:00',
  `admin_id` int(11) NOT NULL COMMENT '管理员id',
  `day_id` int(11) NOT NULL COMMENT '天id',
  `module_id` smallint(11) NOT NULL COMMENT '模型id',
  `module_name` varchar(30) DEFAULT '' COMMENT '模型名称',
  `operate_name` varchar(30) NOT NULL COMMENT '操作备注',
  `ids` varchar(40) DEFAULT '0' COMMENT '文章id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员日统计每天数据表';

--
-- 转存表中的数据 `cmf_plugin_modules_day_info`
--

INSERT INTO `cmf_plugin_modules_day_info` (`id`, `time`, `admin_id`, `day_id`, `module_id`, `module_name`, `operate_name`, `ids`) VALUES
(1, 1624245228, 2, 1, 3, '', 'add', '1'),
(2, 1624245248, 2, 1, 3, '', 'add', '2'),
(3, 1625881329, 2, 2, 3, '', 'del', '2,1'),
(4, 1625882087, 2, 2, 3, '', 'add', '3'),
(5, 1625882095, 2, 2, 3, '', 'edit', '3'),
(6, 1626158021, 2, 3, 3, '', 'edit', '3'),
(7, 1626436839, 2, 4, 3, '', 'edit', '3'),
(8, 1626760697, 2, 5, 3, '', 'add', '4'),
(9, 1626760742, 2, 5, 3, '', 'edit', '4'),
(10, 1626760989, 2, 5, 3, '', 'edit', '4'),
(11, 1627204787, 2, 6, 3, '', 'add', '5'),
(12, 1627204971, 2, 6, 3, '', 'edit', '5'),
(13, 1627204999, 2, 6, 3, '', 'edit', '5'),
(14, 1627205360, 2, 6, 3, '', 'edit', '5'),
(15, 1627808223, 2, 7, 3, '', 'add', '6'),
(16, 1630406399, 2, 8, 3, '', 'del', '4'),
(17, 1630406403, 2, 8, 3, '', 'del', '6'),
(18, 1630406406, 2, 8, 3, '', 'del', '5'),
(19, 1630406409, 2, 8, 3, '', 'del', '3');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_plugin_modules_tables`
--

CREATE TABLE `cmf_plugin_modules_tables` (
  `id` int(8) NOT NULL,
  `modules_id` int(8) NOT NULL COMMENT '模块ID',
  `pinyin` varchar(16) DEFAULT NULL COMMENT '表的标识名称',
  `table_name` varchar(32) DEFAULT NULL COMMENT '表全名',
  `relate_field` varchar(16) DEFAULT NULL COMMENT '关联主表的字段',
  `relate_level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '关联关系：0不关联，1一对一，2一对多',
  `remark` varchar(48) DEFAULT NULL COMMENT '描述说明',
  `control_edit` text,
  `control_list` text,
  `control_search` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容模型模块下所有表';

--
-- 转存表中的数据 `cmf_plugin_modules_tables`
--

INSERT INTO `cmf_plugin_modules_tables` (`id`, `modules_id`, `pinyin`, `table_name`, `relate_field`, `relate_level`, `remark`, `control_edit`, `control_list`, `control_search`) VALUES
(1, 1, '', 'cmf_item_activity', '', 0, '活动管理', '[{\"alias\":\"\\u6807\\u9898\",\"width\":\"\",\"type\":\"text\",\"config\":\"\",\"position\":\"\",\"name\":\"title\"},{\"alias\":\"\\u5173\\u952e\\u8bcd\",\"width\":\"\",\"type\":\"textarea\",\"config\":\"\",\"position\":\"\",\"name\":\"keywords\"},{\"alias\":\"\\u72b6\\u6001\",\"width\":\"\",\"type\":\"radio\",\"config\":\"1:\\u5ba1\\u6838,2:\\u5f85\\u5ba1\\u6838,3:\\u9a73\\u56de\",\"position\":\"right\",\"name\":\"state\"},{\"alias\":\"\\u88ab\\u63a8\\u9001\\u6807\\u8bc6\",\"width\":\"\",\"type\":\"radio\",\"config\":\"1:\\u6b63\\u5e38,2:\\u63a8\\u8350\",\"position\":\"right\",\"name\":\"showtype\"},{\"alias\":\"\\u6458\\u8981\",\"width\":\"\",\"type\":\"textarea\",\"config\":\"\",\"position\":\"\",\"name\":\"digest\"},{\"alias\":\"\\u7f16\\u8f91\\u4eba\\u5458ID\",\"width\":\"80\",\"type\":\"system_create\",\"config\":\"uid\",\"position\":\"right\",\"name\":\"editorid\"},{\"alias\":\"\\u7f29\\u7565\\u56fe\\u7247\",\"width\":\"\",\"type\":\"uploadOneImg\",\"config\":\"\",\"position\":\"left\",\"name\":\"picture\"},{\"alias\":\"\\u5f55\\u5165\\u65f6\\u95f4\",\"width\":\"\",\"type\":\"system_create\",\"config\":\"time\",\"position\":\"right\",\"name\":\"createtime\"},{\"alias\":\"\\u66f4\\u65b0\\u65f6\\u95f4\",\"width\":\"\",\"type\":\"system\",\"config\":\"time\",\"position\":\"right\",\"name\":\"updatetime\"},{\"alias\":\"\\u53d1\\u5e03\\u65f6\\u95f4\",\"width\":\"\",\"type\":\"ctime\",\"config\":\"\",\"position\":\"right\",\"name\":\"showtime\"},{\"alias\":\"\\u603b\\u8bbf\\u95ee\\u6b21\\u6570\",\"width\":\"80\",\"type\":\"text\",\"config\":\"\",\"position\":\"\",\"name\":\"pv\"}]', '[{\"name\":\"title\",\"alias\":\"\\u6807\\u9898\",\"type\":\"text\"},{\"name\":\"state\",\"alias\":\"\\u72b6\\u6001\",\"type\":\"radio\",\"position\":\"right\",\"config\":\"1:\\u5ba1\\u6838,2:\\u5f85\\u5ba1\\u6838,3:\\u9a73\\u56de\"},{\"name\":\"showtime\",\"alias\":\"\\u53d1\\u5e03\\u65f6\\u95f4\",\"type\":\"ctime\",\"position\":\"right\"}]', '[{\"name\":\"title\",\"alias\":\"\\u6807\\u9898\",\"type\":\"like\",\"width\":\"250\"}]'),
(2, 1, 'texts', 'cmf_item_activity_texts', '', 1, '活动管理内容', '[{\"name\":\"text\",\"alias\":\"\\u5185\\u5bb9\",\"type\":\"editor\",\"desc\":\"\"}]', '[]', '[]'),
(3, 2, '', 'cmf_item_activity', '', 0, '活动管理', '[{\"alias\":\"\\u6807\\u9898\",\"width\":\"\",\"type\":\"text\",\"config\":\"\",\"position\":\"\",\"name\":\"title\"},{\"alias\":\"\\u5173\\u952e\\u8bcd\",\"width\":\"\",\"type\":\"textarea\",\"config\":\"\",\"position\":\"\",\"name\":\"keywords\"},{\"alias\":\"\\u72b6\\u6001\",\"width\":\"\",\"type\":\"radio\",\"config\":\"1:\\u5ba1\\u6838,2:\\u5f85\\u5ba1\\u6838,3:\\u9a73\\u56de\",\"position\":\"right\",\"name\":\"state\"},{\"alias\":\"\\u88ab\\u63a8\\u9001\\u6807\\u8bc6\",\"width\":\"\",\"type\":\"radio\",\"config\":\"1:\\u6b63\\u5e38,2:\\u63a8\\u8350\",\"position\":\"right\",\"name\":\"showtype\"},{\"alias\":\"\\u6458\\u8981\",\"width\":\"\",\"type\":\"textarea\",\"config\":\"\",\"position\":\"\",\"name\":\"digest\"},{\"alias\":\"\\u7f16\\u8f91\\u4eba\\u5458ID\",\"width\":\"80\",\"type\":\"system_create\",\"config\":\"uid\",\"position\":\"right\",\"name\":\"editorid\"},{\"alias\":\"\\u7f29\\u7565\\u56fe\\u7247\",\"width\":\"\",\"type\":\"uploadOneImg\",\"config\":\"\",\"position\":\"left\",\"name\":\"picture\"},{\"alias\":\"\\u5f55\\u5165\\u65f6\\u95f4\",\"width\":\"\",\"type\":\"system_create\",\"config\":\"time\",\"position\":\"right\",\"name\":\"createtime\"},{\"alias\":\"\\u66f4\\u65b0\\u65f6\\u95f4\",\"width\":\"\",\"type\":\"system\",\"config\":\"time\",\"position\":\"right\",\"name\":\"updatetime\"},{\"alias\":\"\\u53d1\\u5e03\\u65f6\\u95f4\",\"width\":\"\",\"type\":\"ctime\",\"config\":\"\",\"position\":\"right\",\"name\":\"showtime\"},{\"alias\":\"\\u603b\\u8bbf\\u95ee\\u6b21\\u6570\",\"width\":\"80\",\"type\":\"text\",\"config\":\"\",\"position\":\"\",\"name\":\"pv\"}]', '[{\"name\":\"title\",\"alias\":\"\\u6807\\u9898\",\"type\":\"text\"},{\"name\":\"state\",\"alias\":\"\\u72b6\\u6001\",\"type\":\"radio\",\"position\":\"right\",\"config\":\"1:\\u5ba1\\u6838,2:\\u5f85\\u5ba1\\u6838,3:\\u9a73\\u56de\"},{\"name\":\"showtime\",\"alias\":\"\\u53d1\\u5e03\\u65f6\\u95f4\",\"type\":\"ctime\",\"position\":\"right\"}]', '[{\"name\":\"title\",\"alias\":\"\\u6807\\u9898\",\"type\":\"like\",\"width\":\"250\"}]'),
(4, 2, 'texts', 'cmf_item_activity_texts', '', 1, '活动管理内容', '[{\"name\":\"text\",\"alias\":\"\\u5185\\u5bb9\",\"type\":\"editor\",\"desc\":\"\"}]', '[]', '[]'),
(5, 3, '', 'cmf_item_activity', '', 0, '活动管理', '[{\"alias\":\"\\u6807\\u9898\",\"width\":\"\",\"type\":\"text\",\"config\":\"\",\"position\":\"\",\"name\":\"title\"},{\"alias\":\"\\u5173\\u952e\\u8bcd\",\"width\":\"\",\"type\":\"textarea\",\"config\":\"\",\"position\":\"\",\"name\":\"keywords\"},{\"alias\":\"\\u72b6\\u6001\",\"width\":\"\",\"type\":\"radio\",\"config\":\"1:\\u5ba1\\u6838,2:\\u5f85\\u5ba1\\u6838,3:\\u9a73\\u56de\",\"position\":\"right\",\"name\":\"state\"},{\"alias\":\"\\u88ab\\u63a8\\u9001\\u6807\\u8bc6\",\"width\":\"\",\"type\":\"radio\",\"config\":\"1:\\u6b63\\u5e38,2:\\u63a8\\u8350\",\"position\":\"right\",\"name\":\"showtype\"},{\"alias\":\"\\u6458\\u8981\",\"width\":\"\",\"type\":\"textarea\",\"config\":\"\",\"position\":\"\",\"name\":\"digest\"},{\"alias\":\"\\u7f16\\u8f91\\u4eba\\u5458ID\",\"width\":\"80\",\"type\":\"system_create\",\"config\":\"uid\",\"position\":\"right\",\"name\":\"editorid\"},{\"alias\":\"\\u7f29\\u7565\\u56fe\\u7247\",\"width\":\"\",\"type\":\"uploadOneImg\",\"config\":\"\",\"position\":\"left\",\"name\":\"picture\"},{\"alias\":\"\\u5f55\\u5165\\u65f6\\u95f4\",\"width\":\"\",\"type\":\"system_create\",\"config\":\"time\",\"position\":\"right\",\"name\":\"createtime\"},{\"alias\":\"\\u66f4\\u65b0\\u65f6\\u95f4\",\"width\":\"\",\"type\":\"system\",\"config\":\"time\",\"position\":\"right\",\"name\":\"updatetime\"},{\"alias\":\"\\u53d1\\u5e03\\u65f6\\u95f4\",\"width\":\"\",\"type\":\"ctime\",\"config\":\"\",\"position\":\"right\",\"name\":\"showtime\"},{\"alias\":\"\\u603b\\u8bbf\\u95ee\\u6b21\\u6570\",\"width\":\"80\",\"type\":\"text\",\"config\":\"\",\"position\":\"\",\"name\":\"pv\"}]', '[{\"name\":\"title\",\"alias\":\"\\u6807\\u9898\",\"type\":\"text\"},{\"name\":\"state\",\"alias\":\"\\u72b6\\u6001\",\"type\":\"radio\",\"position\":\"right\",\"config\":\"1:\\u5ba1\\u6838,2:\\u5f85\\u5ba1\\u6838,3:\\u9a73\\u56de\"},{\"name\":\"showtime\",\"alias\":\"\\u53d1\\u5e03\\u65f6\\u95f4\",\"type\":\"ctime\",\"position\":\"right\"}]', '[{\"name\":\"title\",\"alias\":\"\\u6807\\u9898\",\"type\":\"like\",\"width\":\"250\"}]'),
(6, 3, 'texts', 'cmf_item_activity_texts', '', 1, '活动管理内容', '[{\"name\":\"text\",\"alias\":\"\\u5185\\u5bb9\",\"type\":\"editor\",\"desc\":\"\"}]', '[]', '[]');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_plugin_modules_tables_content`
--

CREATE TABLE `cmf_plugin_modules_tables_content` (
  `id` int(8) NOT NULL,
  `modules_id` int(10) NOT NULL COMMENT '模块ID',
  `object_id` int(10) NOT NULL COMMENT '内容id',
  `table` varchar(16) DEFAULT NULL COMMENT '表的标识名称',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `digest` varchar(255) DEFAULT NULL COMMENT '描述',
  `picture` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `showtime` int(10) DEFAULT '0' COMMENT '发布时间',
  `state` tinyint(1) DEFAULT '0' COMMENT '是否显示'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容模型模块下聚合表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_portal_category`
--

CREATE TABLE `cmf_portal_category` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '分类id',
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章分类表';

--
-- 转存表中的数据 `cmf_portal_category`
--

INSERT INTO `cmf_portal_category` (`id`, `parent_id`, `post_count`, `status`, `delete_time`, `list_order`, `name`, `description`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `more`) VALUES
(1, 0, 0, 1, 0, 10000, '男性', '', '0-1', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_portal_category_post`
--

CREATE TABLE `cmf_portal_category_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_portal_post`
--

CREATE TABLE `cmf_portal_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_favorites` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '收藏数',
  `post_like` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_portal_tag`
--

CREATE TABLE `cmf_portal_tag` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章标签表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_portal_tag_post`
--

CREATE TABLE `cmf_portal_tag_post` (
  `id` bigint(20) NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_recharge`
--

CREATE TABLE `cmf_recharge` (
  `id` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(6,2) DEFAULT '0.00' COMMENT '得到金额',
  `price` decimal(6,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `list_order` smallint(5) NOT NULL DEFAULT '1000' COMMENT '1000',
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `cmf_recharge`
--

INSERT INTO `cmf_recharge` (`id`, `name`, `amount`, `price`, `remark`, `list_order`, `status`) VALUES
(1, '充值', '30.00', '200.00', '送30元', 2, 1),
(3, '充值', '10.00', '100.00', '', 1, 1),
(4, '充值', '50.00', '500.00', '赠送50元', 3, 1),
(5, '充值', '150.00', '1000.00', '赠送150元', 4, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_recharge_order`
--

CREATE TABLE `cmf_recharge_order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:充值；1：提现',
  `add_time` int(10) DEFAULT NULL,
  `pay_time` int(10) DEFAULT NULL,
  `pay_status` tinyint(1) NOT NULL DEFAULT '0',
  `order_sn` varchar(35) DEFAULT NULL COMMENT '订单编号',
  `goods_id` int(11) DEFAULT NULL,
  `order_amount` decimal(6,2) DEFAULT NULL,
  `get_amount` decimal(6,2) DEFAULT NULL,
  `goods_name` varchar(100) DEFAULT NULL,
  `goods_price` decimal(8,2) DEFAULT '0.00' COMMENT '开通价格',
  `pay_name` varchar(30) DEFAULT NULL COMMENT '支付方式'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_recharge_order`
--

INSERT INTO `cmf_recharge_order` (`id`, `user_id`, `order_type`, `add_time`, `pay_time`, `pay_status`, `order_sn`, `goods_id`, `order_amount`, `get_amount`, `goods_name`, `goods_price`, `pay_name`) VALUES
(1, 2, 1, 1630391376, NULL, 0, 'A831913765676524', NULL, '10.00', NULL, NULL, '0.00', NULL),
(2, 5, 1, 1630735979, NULL, 0, 'A904359790913209', NULL, '10.00', NULL, NULL, '0.00', NULL),
(3, 5, 1, 1630736286, 1630743691, 1, 'A904362863317496', NULL, '1.00', NULL, NULL, '0.00', NULL),
(4, 5, 1, 1630736292, 1630743604, 1, 'A904362922721921', NULL, '1.00', NULL, NULL, '0.00', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_recycle_bin`
--

CREATE TABLE `cmf_recycle_bin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) UNSIGNED DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=' 回收站';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_role`
--

CREATE TABLE `cmf_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

--
-- 转存表中的数据 `cmf_role`
--

INSERT INTO `cmf_role` (`id`, `parent_id`, `status`, `create_time`, `update_time`, `list_order`, `name`, `remark`) VALUES
(1, 0, 1, 1329633709, 1329633709, 0, '超级管理员', '拥有网站最高管理员权限！'),
(2, 0, 1, 1329633709, 1329633709, 0, '普通管理员', '权限由最高管理员分配！'),
(3, 0, 1, 0, 0, 0, 'l', ',m');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_role_user`
--

CREATE TABLE `cmf_role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

--
-- 转存表中的数据 `cmf_role_user`
--

INSERT INTO `cmf_role_user` (`id`, `role_id`, `user_id`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_route`
--

CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='url路由表';

--
-- 转存表中的数据 `cmf_route`
--

INSERT INTO `cmf_route` (`id`, `list_order`, `status`, `type`, `full_url`, `url`) VALUES
(1, 5000, 1, 2, 'portal/List/index?id=1', '男性'),
(2, 4999, 1, 2, 'portal/Article/index?cid=1', '男性/:id');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_slide`
--

CREATE TABLE `cmf_slide` (
  `id` int(11) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分类备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片表';

--
-- 转存表中的数据 `cmf_slide`
--

INSERT INTO `cmf_slide` (`id`, `status`, `delete_time`, `name`, `remark`) VALUES
(1, 1, 0, '首页banner', ''),
(2, 1, 0, '返利餐主页banner', ''),
(3, 1, 0, '会员开通页banner', ''),
(4, 1, 0, '我的 - banner', ''),
(5, 1, 0, '邀请赚钱', ''),
(6, 1, 0, '每日签到', ''),
(7, 1, 0, '商家合作', '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_slide_item`
--

CREATE TABLE `cmf_slide_item` (
  `id` int(10) UNSIGNED NOT NULL,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COMMENT '幻灯片内容',
  `more` text COMMENT '扩展信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片子项表';

--
-- 转存表中的数据 `cmf_slide_item`
--

INSERT INTO `cmf_slide_item` (`id`, `slide_id`, `status`, `list_order`, `title`, `image`, `url`, `target`, `description`, `content`, `more`) VALUES
(1, 1, 1, 10000, '新手操作指南', 'admin/20210826/69d46865eafec9c303f8f30a8abfd57d.png', '/pages/course/index', '', '', '', NULL),
(3, 2, 1, 10000, '1', 'admin/20210826/fdfa2231b45fe05879754f1587fd820f.png', '/pages/user/recharge/recharge', '', '', '', NULL),
(4, 3, 1, 10000, '1', 'admin/20210827/8fb452b84fe0d048c98fb2059d004c70.png', '', '', '', '', NULL),
(5, 4, 1, 10000, '1', 'admin/20210827/93d967c595b2619be41b0a52b52fec4e.png', '/pages/my/sign/index', '', '', '', NULL),
(6, 5, 1, 10000, '1', 'admin/20210907/807f692894c0cd4114b927a58c26e60a.png', '', '', '', '', NULL),
(7, 6, 1, 10000, '1', 'admin/20210907/acc5fb3b80135780abcb7cbe1a722d6b.png', '', '', '', '', NULL),
(8, 1, 1, 10000, '邀请新用户成功下单', 'admin/20210907/9e30424a1661a6000a269396bebd5b03.png', '/pages/my/invitation/index', '', '', '', NULL),
(9, 1, 1, 10000, '每日打卡签到领金币', 'admin/20210907/84f03cbdf1503a57f3d92f0da5b0c7a2.png', '/pages/my/sign/index', '', '', '', NULL),
(10, 7, 1, 10000, '商家合作', 'admin/20210908/0d5bf3e1b403f1369b68eab4840ca935.png', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_spec`
--

CREATE TABLE `cmf_spec` (
  `id` int(11) NOT NULL COMMENT '规格表',
  `type_id` int(11) DEFAULT '0' COMMENT '规格类型',
  `spec_name` varchar(55) DEFAULT NULL COMMENT '规格名称',
  `list_order` int(11) DEFAULT '50' COMMENT '排序',
  `search_index` tinyint(1) DEFAULT '1' COMMENT '是否需要检索：1是，0否'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_spec_img`
--

CREATE TABLE `cmf_spec_img` (
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `spec_item_id` int(11) NOT NULL COMMENT '规格id',
  `img` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_spec_item`
--

CREATE TABLE `cmf_spec_item` (
  `id` int(11) NOT NULL COMMENT '规格项id',
  `spec_id` int(11) DEFAULT NULL COMMENT '规格id',
  `item` varchar(54) DEFAULT NULL COMMENT '规格项',
  `item_order` int(8) NOT NULL DEFAULT '50' COMMENT '前台规则排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_store_seckill`
--

CREATE TABLE `cmf_store_seckill` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '商品秒杀产品表id',
  `goods_id` int(10) UNSIGNED NOT NULL COMMENT '商品id',
  `goods_img` varchar(255) NOT NULL COMMENT '推荐图',
  `photo` varchar(2000) NOT NULL COMMENT '轮播图',
  `title` varchar(255) NOT NULL COMMENT '活动标题',
  `info` varchar(255) NOT NULL COMMENT '简介',
  `shop_price` decimal(10,2) UNSIGNED NOT NULL COMMENT '价格',
  `cost` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '成本',
  `ot_price` decimal(10,2) UNSIGNED NOT NULL COMMENT '原价',
  `give_integral` decimal(10,2) UNSIGNED NOT NULL COMMENT '返多少积分',
  `list_order` int(5) UNSIGNED NOT NULL DEFAULT '1000' COMMENT '排序',
  `store_count` int(10) UNSIGNED NOT NULL COMMENT '库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '销量',
  `supplier_id` int(7) NOT NULL DEFAULT '0' COMMENT '商家',
  `postage` decimal(8,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `good_desc` text COMMENT '内容',
  `start_time` varchar(128) NOT NULL COMMENT '开始时间',
  `end_time` varchar(128) NOT NULL COMMENT '结束时间',
  `add_time` varchar(128) NOT NULL COMMENT '添加时间',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '产品状态',
  `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否包邮',
  `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '热门推荐',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '删除 0未删除1已删除',
  `num` int(11) UNSIGNED NOT NULL COMMENT '最多秒杀几个',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '显示',
  `click_count` int(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品秒杀产品表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_student_type`
--

CREATE TABLE `cmf_student_type` (
  `id` int(11) NOT NULL,
  `coach_user_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `student_id` int(10) DEFAULT '0' COMMENT '学生id',
  `add_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `goods_id` int(10) DEFAULT '0' COMMENT '课程id',
  `train_time` int(10) NOT NULL DEFAULT '0' COMMENT '训练时长'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_student_type`
--

INSERT INTO `cmf_student_type` (`id`, `coach_user_id`, `user_id`, `student_id`, `add_time`, `goods_id`, `train_time`) VALUES
(1, 2, 2, 1, 1623830012, 4, 0),
(2, 2, 5, 2, 1624354934, 5, 0),
(26, 5, 3, 26, 1624700338, 6, 0),
(27, 5, 3, 26, 1624852572, 5, 0),
(28, 2, 8, 27, 1624933996, 5, 0),
(29, 5, 8, 28, 1624934383, 6, 0),
(30, 5, 3, 26, 1624937320, 2, 0),
(31, 2, 8, 27, 1625019417, 4, 0),
(32, 2, 8, 27, 1625025087, 1, 0),
(33, 2, 3, 29, 1625130610, 4, 0),
(34, 8, 3, 30, 1625477978, 6, 0),
(35, 8, 5, 31, 1625551182, 6, 0),
(36, 8, 8, 32, 1625552393, 6, 0),
(37, 2, 5, 2, 1625553128, 6, 0),
(38, 5, 5, 33, 1625628500, 4, 0),
(39, 5, 5, 33, 1625743129, 6, 0),
(49, NULL, NULL, 43, 1625830392, NULL, 0),
(53, 5, 5, 33, 1625889866, 7, 0),
(54, 5, 4, 47, 1625916911, 1, 0),
(55, 5, 5, 33, 1625916911, 1, 0),
(56, 5, 6, 48, 1625916951, 1, 0),
(57, 5, 33, 49, 1625917191, 1, 0),
(58, 5, 30, 50, 1625917192, 1, 0),
(59, 3, 3, 51, 1626076856, 6, 0),
(60, 5, 4, 47, 1626163648, 6, 0),
(61, 19, 4, 52, 1626264111, 10, 0),
(62, 45, 63, 53, 1626424930, 8, 0),
(63, 25, 35, 54, 1626426467, 8, 0),
(64, 45, 66, 55, 1626430748, 8, 0),
(65, 45, 68, 56, 1626437108, 8, 0),
(66, 45, 37, 57, 1626437352, 8, 0),
(67, 6, 5, 58, 1626440447, 6, 0),
(68, 6, 4, 59, 1626440583, 6, 0),
(69, 25, 71, 60, 1626443030, 8, 0),
(70, 45, 72, 61, 1626443118, 8, 0),
(71, 23, 75, 62, 1626445850, 14, 0),
(72, 19, 73, 63, 1626447442, 10, 0),
(90, 45, 38, 81, 1626502866, 8, 0),
(91, 24, 83, 82, 1626511642, 13, 0),
(92, 19, 3, 83, 1626659301, 6, 0),
(93, 25, 71, 60, 1626701491, 9, 0),
(94, 25, 93, 84, 1626701799, 9, 0),
(95, 25, 94, 85, 1626702420, 9, 0),
(96, 25, 93, 84, 1626703090, 8, 0),
(97, 25, 94, 85, 1626703211, 8, 0),
(98, 25, 57, 86, 1626704866, 8, 0),
(99, 25, 68, 87, 1626763630, 9, 0),
(104, 25, 4, 92, 1626772753, 8, 0),
(120, 23, 3, 98, 1626773885, 14, 0),
(121, 23, 3, 98, 1626773996, 9, 0),
(122, 45, 4, 99, 1626949769, 8, 0),
(123, 45, 5, 100, 1626955996, 8, 0),
(124, 45, 67, 101, 1627020263, 8, 0),
(125, 45, 95, 102, 1627020384, 8, 0),
(126, 5, 35, 103, 1627030197, 18, 0),
(127, 45, 101, 104, 1627033613, 6, 0),
(128, 45, 72, 61, 1627034711, 6, 0),
(129, 5, 5, 33, 1627036008, 19, 0),
(130, 5, 107, 105, 1627043602, 18, 0),
(131, 5, 8, 28, 1627048139, 18, 0),
(132, 5, 109, 106, 1627048186, 19, 0),
(133, 25, 15, 107, 1627380328, 8, 0),
(134, 25, 5, 108, 1627381281, 8, 0),
(135, 25, 15, 107, 1627381505, 9, 0),
(136, 45, 62, 109, 1627386002, 6, 0),
(137, 25, 119, 110, 1627386334, 9, 0),
(138, 45, 123, 111, 1627449482, 17, 0),
(139, 45, 122, 112, 1627449934, 17, 0),
(140, 45, 121, 113, 1627464958, 6, 0),
(141, 45, 119, 114, 1627473260, 17, 0),
(142, 23, 119, 115, 1627559179, 9, 0),
(145, 45, 135, 118, 1627642705, 8, 0),
(146, 45, 135, 118, 1627642723, 6, 0),
(155, 45, 64, 127, 1627807950, 6, 0),
(156, 45, 158, 128, 1627959648, 6, 0),
(157, 45, 158, 128, 1627960103, 17, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_supplier`
--

CREATE TABLE `cmf_supplier` (
  `id` mediumint(8) UNSIGNED NOT NULL COMMENT '角色id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `supplier_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商户名称',
  `cat_id` int(10) NOT NULL DEFAULT '0' COMMENT '分类id',
  `bus_time` varchar(20) DEFAULT NULL COMMENT '营业时间',
  `description` varchar(1000) DEFAULT '' COMMENT '介绍',
  `contact_user` varchar(30) DEFAULT '' COMMENT '联系人',
  `contact_address` varchar(100) DEFAULT '' COMMENT '联系地址',
  `contact_phone` varchar(20) DEFAULT '' COMMENT '联系电话',
  `photo` text,
  `thumbnail` varchar(500) NOT NULL DEFAULT '' COMMENT '商品上传原始图',
  `rec_thumbnail` varchar(255) DEFAULT NULL,
  `list_order` int(10) UNSIGNED NOT NULL DEFAULT '1000' COMMENT '排序',
  `add_time` int(10) NOT NULL DEFAULT '0',
  `recommend` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `province_id` int(10) DEFAULT NULL,
  `city_id` int(10) DEFAULT NULL,
  `district_id` int(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL COMMENT '维度',
  `longitude` varchar(20) DEFAULT NULL COMMENT '经度',
  `click_count` int(10) NOT NULL DEFAULT '0',
  `tags` varchar(255) DEFAULT NULL COMMENT '标签',
  `region_id` int(10) DEFAULT '0' COMMENT '区域id',
  `content` text,
  `prome_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '活动类型 ： 1：霸王餐；2：返利餐',
  `plat_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '平台类型：1：美团；2：饿了嘛',
  `max_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '满减金额',
  `ret_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '返金额',
  `ret_vip_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员返金额',
  `sales_sum` int(10) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `store_count` int(10) NOT NULL DEFAULT '0' COMMENT '库存',
  `app_path` varchar(50) DEFAULT NULL COMMENT '跳转小程序地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_supplier`
--

INSERT INTO `cmf_supplier` (`id`, `user_id`, `supplier_name`, `cat_id`, `bus_time`, `description`, `contact_user`, `contact_address`, `contact_phone`, `photo`, `thumbnail`, `rec_thumbnail`, `list_order`, `add_time`, `recommend`, `status`, `province_id`, `city_id`, `district_id`, `address`, `latitude`, `longitude`, `click_count`, `tags`, `region_id`, `content`, `prome_type`, `plat_type`, `max_price`, `ret_price`, `ret_vip_price`, `sales_sum`, `store_count`, `app_path`) VALUES
(1, 0, '淦烦人烧腊猪脚饭', 0, '', '五星好评，2图20个文字', '懒懒', '西安市碑林区南院门粉巷了街A204', '18629530853', '[\"goods\\/20210714\\/1208067b00567a5bdfd805b31d35d797.jpg\",\"goods\\/20210714\\/1c7c6e8c5f40a16ea06203cf401312e4.jpg\"]', 'goods/20210907/4e39b2628275e2fe86f48483534dfdcb.png', 'goods/20210826/0c7ead1661d139e9466a1b37e5077e87.png', 1000, 0, 1, 1, 2, 201, 101020106, NULL, '34.25615', '108.939686', 45, NULL, 0, '<p>1.运动装备：适合贴身的运动服饰， 避免衣服过于宽松产生动作的影响，脚下要穿舒适耐磨防滑的运动鞋</p><p>2.在运动前1小时可以食用少量食物，避免在运动中会产生晕头恶心的状况，同时可以增加运动效果。运动前补充适量的水分可以减少脱水的可能，忌讳一次性大量饮水</p><p>3.本地提供更衣室、储物柜、不舍淋浴</p><p>4.室内设有WIFI&nbsp; 小鹿乱撞：xllz6666&nbsp;小鹿乱撞-5G：xllz6666</p><p>5.未满18周岁未成年人请勿进入小鹿乱撞门店</p><p>6.店内设有视频监控</p><p>7.如有任何身体不适，请及时告知教练或场地工作人员</p><p><br/></p>', 2, 2, '20.00', '2.00', '5.00', 0, 6, NULL),
(2, 0, '翻滚吧炒饭君 ', 1, '10:30-23:59', '环境好，味道更好', '王居居', '西安市新城广场商铺', '18695451211', NULL, 'goods/20210907/18556f14dd4438d0c0ae881f85316f72.png', 'goods/20210826/22f249048014093bbd148c883a9f0811.png', 1000, 1629965714, 1, 1, 11, 1101, 101110108, NULL, '34.22034', '108.887915', 61, NULL, 0, NULL, 1, 1, '20.00', '16.00', '18.00', 0, 7, NULL),
(3, 0, '李家凉皮', 2, '8:30-18:00', '加入会员可享更多特权', '张三', '西安市高新区科技五路数字大厦', '18691459300', '[\"goods\\/20210827\\/37baa709d3db92a2d626580e045a8969.png\"]', 'goods/20210907/4e39b2628275e2fe86f48483534dfdcb.png', 'goods/20210826/a8266316959f37d14f102daf4c2e9909.png', 1000, 1629965773, 1, 1, 11, 1101, 101110113, NULL, '34.218322', '108.882073', 104, NULL, 0, NULL, 1, 2, '18.00', '12.00', '15.00', 0, 7, NULL),
(4, 0, '水姐麻辣烫', 1, '9:00-22:00', '名额有限，优惠力度很大', '李四', '西安市未央区张家堡转盘', '13993393322', NULL, 'goods/20210826/9c222571ddc717cef497f41d0f4825a7.png', NULL, 1000, 1629965795, 0, 1, 11, 1101, 101110112, NULL, '34.236609', '108.887309', 98, NULL, 0, NULL, 1, 1, '20.00', '15.00', '18.00', 0, 0, NULL),
(5, 0, '真心冒菜麻辣汤', 1, '10:00-22：00', '五星2图，20字', '胡超峰', '陕西省西安市南稍门', '18729485120', NULL, 'goods/20210904/9410a886a204f46faf337ee72dbb6300.jpg', NULL, 1000, 1630744262, 0, 1, 11, 1101, 101110109, NULL, '34.23341247794123', '108.94807934761047', 17, NULL, 0, NULL, 1, 2, '20.00', '10.00', '15.00', 0, 10, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_theme`
--

CREATE TABLE `cmf_theme` (
  `id` int(11) NOT NULL,
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_theme`
--

INSERT INTO `cmf_theme` (`id`, `create_time`, `update_time`, `status`, `is_compiled`, `theme`, `name`, `version`, `demo_url`, `thumbnail`, `author`, `author_url`, `lang`, `keywords`, `description`) VALUES
(1, 0, 0, 0, 0, 'simpleboot3', 'simpleboot3', '1.0.2', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', 'zh-cn', 'ThinkCMF模板', 'ThinkCMF默认模板');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_theme_file`
--

CREATE TABLE `cmf_theme_file` (
  `id` int(11) NOT NULL,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_theme_file`
--

INSERT INTO `cmf_theme_file` (`id`, `is_public`, `list_order`, `theme`, `name`, `action`, `file`, `description`, `more`, `config_more`, `draft_more`) VALUES
(1, 0, 10, 'simpleboot3', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', NULL),
(2, 0, 10, 'simpleboot3', '联系我们页', 'portal/Page/index', 'portal/contact', '联系我们页模板文件', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', NULL),
(3, 0, 5, 'simpleboot3', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL),
(4, 0, 10, 'simpleboot3', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL),
(5, 0, 10, 'simpleboot3', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', NULL),
(6, 0, 10, 'simpleboot3', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', NULL),
(7, 1, 0, 'simpleboot3', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', NULL),
(8, 1, 1, 'simpleboot3', '导航条', 'public/Nav', 'public/nav', '导航条模板文件', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_third_party_user`
--

CREATE TABLE `cmf_third_party_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方唯一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方用户表';

--
-- 转存表中的数据 `cmf_third_party_user`
--

INSERT INTO `cmf_third_party_user` (`id`, `user_id`, `last_login_time`, `expire_time`, `create_time`, `login_times`, `status`, `nickname`, `third_party`, `app_id`, `last_login_ip`, `access_token`, `openid`, `union_id`, `more`) VALUES
(1, 3, 1630576222, 0, 1630406505, 5, 1, '', 'wxapp', 'wxa28549fc9910295d', '117.35.132.229', '', 'oAOJE5caV4IJ-d51hP4xmPo1zQEo', '', '{\"nickName\":\"Lntano\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Yuncheng\",\"province\":\"Shanxi\",\"country\":\"China\",\"avatarUrl\":\"https:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/Q0j4TwGTfTIibHplsbM8iaoibW2SU3v0FwszzInibtTxnYibygIKceVA3XpEx3RicawqdRInfbFgVyTBmAVUx8VickMNQ\\/132\",\"sessionKey\":\"XU8SIPJHyknSyKN3KCAS1A==\"}'),
(2, 4, 1631009719, 0, 1630490078, 7, 1, '', 'wxapp', 'wxa28549fc9910295d', '1.80.83.176', '', 'oAOJE5ZskIjZvfn3JkNqlw6rPecg', '', '{\"nickName\":\"\\u8d75\\u8d24\\u81e3\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Xi\'an\",\"province\":\"Shaanxi\",\"country\":\"China\",\"avatarUrl\":\"https:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/Q0j4TwGTfTKEwNS5mqPzcZtWC7C7vPDZTbZT2Bv6UTRbpq0D2JicXTCpYvcWdKSxfWntlwoaJ6CzWcBDddAsg9A\\/132\",\"sessionKey\":\"dY5VGt9Bt7Sm8igYqc2rPw==\"}'),
(3, 5, 1630724736, 0, 1630565698, 3, 1, '', 'wxapp', 'wxa28549fc9910295d', '1.80.247.97', '', 'oAOJE5a_ujstK4pSlV5Xyrjtx7iQ', '', '{\"nickName\":\"Super\\u5cf0\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Xi\'an\",\"province\":\"Shaanxi\",\"country\":\"China\",\"avatarUrl\":\"https:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/Q0j4TwGTfTLhMtBwGqqmyty7wJkYBjVoeOaKKQ4RicibdScssNqH41LOo1NvJ9lBEvJIzCAAadHH8MTKV3770jdw\\/132\",\"sessionKey\":\"M\\/mFIXkD48JqXvDXXGP3rg==\"}'),
(4, 6, 1630574748, 0, 1630574748, 1, 1, '', 'wxapp', 'wxa28549fc9910295d', '1.80.247.211', '', 'oAOJE5YuWH7mZsiz8h9omDk5GVoY', '', '{\"nickName\":\"...\\ud83d\\udc40\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Xi\'an\",\"province\":\"Shaanxi\",\"country\":\"China\",\"avatarUrl\":\"https:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/DYAIOgq83eqqG7YoGUvNTCJj5oqYEJXFibKGLoiaibhHZdXPzFejqss2xxCgCXhHcCWKSjfKKPlKYiaCmazpWicq7Uw\\/132\",\"sessionKey\":\"7AeczsNmynekfF36i2h3Og==\"}'),
(5, 7, 1631080791, 0, 1630575090, 7, 1, '', 'wxapp', 'wxa28549fc9910295d', '219.144.219.55', '', 'oAOJE5QMqT-Fwghwd-Oq_04BckKE', '', '{\"nickName\":\"\\u7a7a\\u57ce\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Xi\'an\",\"province\":\"Shaanxi\",\"country\":\"China\",\"avatarUrl\":\"https:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/Q0j4TwGTfTJUQyU2vvOWsMc4PYVZOXKiaKLXFlWk4icDM261MSLvxcFIHOxO1G1JYiavboQhL5KeOwHPVTyFN2sZA\\/132\",\"sessionKey\":\"p6zWDgC42cwDhzAe2+bGXA==\"}'),
(6, 8, 1630725016, 0, 1630724983, 11, 1, '', 'wxapp', 'wxa28549fc9910295d', '1.80.247.97', '', 'oAOJE5dd0cz0ayp4j7uVi-dJ5ks8', '', '{\"nickName\":\"super\\u5cf0\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Xi\'an\",\"province\":\"Shaanxi\",\"country\":\"China\",\"avatarUrl\":\"https:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/IBGUnHRcliaia0kb7jZ0iaWPsBibICRSQ33JoiaPZ709ViaqD6P8t2LnpuDfvQudL07aKg3qPq6jmEiakwribhmjEVBw0Q\\/132\",\"sessionKey\":\"OUHAksDjVe5MlQKXM3B05g==\"}'),
(7, 9, 1630725038, 0, 1630725038, 1, 1, '', 'wxapp', 'wxa28549fc9910295d', '1.86.13.111', '', 'oAOJE5Qhv0W_RY97azfgX8wsrYH4', '', '{\"nickName\":\"\\u98de\\u9e1f\\u4ee3\\u8fd0\\u8425+\\u54c1\\u724c\\u62db\\u554617392464647\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Xi\'an\",\"province\":\"Shaanxi\",\"country\":\"China\",\"avatarUrl\":\"https:\\/\\/thirdwx.qlogo.cn\\/mmopen\\/vi_32\\/oawDPl6RMSP4hUtMRkNq7YKcDErdwRN7QCnA658l9Vo80hN7dFug8q4nODV84s8UnpoYPXia6vBPicJWViaM9cgjQ\\/132\",\"sessionKey\":\"EHWOWVZC3BeYBB6lrkFmiw==\"}');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user`
--

CREATE TABLE `cmf_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `total_score` int(10) NOT NULL DEFAULT '0' COMMENT '总积分数量',
  `coin` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '鹿角',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `total_coin` int(10) NOT NULL DEFAULT '0' COMMENT '可提现额度',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `realname` varchar(30) DEFAULT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `is_vip` tinyint(1) NOT NULL DEFAULT '0',
  `user_level` tinyint(2) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `more` text COMMENT '扩展属性',
  `is_article` tinyint(1) NOT NULL DEFAULT '0',
  `promo_code` varchar(10) DEFAULT NULL,
  `f_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

--
-- 转存表中的数据 `cmf_user`
--

INSERT INTO `cmf_user` (`id`, `user_type`, `sex`, `birthday`, `last_login_time`, `score`, `total_score`, `coin`, `balance`, `total_coin`, `create_time`, `user_status`, `user_login`, `user_pass`, `user_nickname`, `user_email`, `user_url`, `realname`, `avatar`, `signature`, `last_login_ip`, `user_activation_key`, `is_vip`, `user_level`, `mobile`, `more`, `is_article`, `promo_code`, `f_id`) VALUES
(1, 1, 0, 0, 1627522260, 0, 0, 0, '0.00', 0, 1609050879, 1, 'admin_ch', '###6b00d957c3bfecf69a19a55a9c2ea5c8', 'admin_ch', 'admin_ch@qq.com', '', '', '', '', '117.35.132.207', '', 0, 0, '', NULL, 0, NULL, 0),
(2, 1, 0, 1623254400, 1631071319, 0, 0, 1055, '51.00', 0, 1609050879, 1, 'admin', '###4e4121db2ece20359c3bd4b22aad48b9', '懒懒1号', 'admin@qq.com', '', NULL, 'default/20210827/9bd238b68a07841f3d970f4dea26f188.png', '', '1.80.80.175', '', 0, 0, '15295513108', NULL, 0, 'VO3QF0HT', 0),
(3, 2, 1, 0, 1630406505, 0, 0, 215, '0.00', 15, 1630406505, 1, '', '', 'Lntano', '', '', NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIibHplsbM8iaoibW2SU3v0FwszzInibtTxnYibygIKceVA3XpEx3RicawqdRInfbFgVyTBmAVUx8VickMNQ/132', '', '127.0.0.1', '', 1, 0, '', NULL, 0, 'T86SAIFV', 0),
(4, 2, 0, 486403200, 1630490078, 0, 0, 7895, '0.00', 15, 1630490078, 1, '', '', '赵贤臣', '', '', NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKEwNS5mqPzcZtWC7C7vPDZTbZT2Bv6UTRbpq0D2JicXTCpYvcWdKSxfWntlwoaJ6CzWcBDddAsg9A/132', '', '117.35.134.65', '', 0, 0, '18691459300', NULL, 0, 'DVT4TB9H', 0),
(5, 2, 0, -28800, 1630565698, 0, 0, 345, '0.00', 0, 1630565698, 1, '', '', 'Super峰', '', '', NULL, 'default/20210903/408f25506527c98787408121eb31aa85.png', '', '1.80.247.211', '', 1, 0, '', NULL, 0, 'MJULRTR9', 0),
(6, 2, 2, 0, 1630574748, 0, 0, 20, '0.00', 0, 1630574748, 1, '', '', '...👀', '', '', NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqqG7YoGUvNTCJj5oqYEJXFibKGLoiaibhHZdXPzFejqss2xxCgCXhHcCWKSjfKKPlKYiaCmazpWicq7Uw/132', '', '1.80.247.211', '', 0, 0, '', NULL, 0, 'SR7LFDB5', 0),
(7, 2, 0, -28800, 1630575090, 0, 0, 50, '0.00', 15, 1630575090, 1, '', '', '空城', '', '', NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJUQyU2vvOWsMc4PYVZOXKiaKLXFlWk4icDM261MSLvxcFIHOxO1G1JYiavboQhL5KeOwHPVTyFN2sZA/132', '', '117.136.87.18', '', 0, 0, '13519180648', NULL, 0, 'DEVLGIAG', 0),
(8, 2, 1, 0, 1630724983, 0, 0, 0, '0.00', 0, 1630724983, 1, '', '', 'super峰', '', '', NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/IBGUnHRcliaia0kb7jZ0iaWPsBibICRSQ33JoiaPZ709ViaqD6P8t2LnpuDfvQudL07aKg3qPq6jmEiakwribhmjEVBw0Q/132', '', '1.80.247.97', '', 0, 0, '', NULL, 0, NULL, 0),
(9, 2, 1, 0, 1630725038, 0, 0, 10, '0.00', 0, 1630725038, 1, '', '', '飞鸟代运营+品牌招商17392464647', '', '', NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/oawDPl6RMSP4hUtMRkNq7YKcDErdwRN7QCnA658l9Vo80hN7dFug8q4nODV84s8UnpoYPXia6vBPicJWViaM9cgjQ/132', '', '1.86.13.111', '', 0, 0, '', NULL, 0, '6PDNGC4S', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_action`
--

CREATE TABLE `cmf_user_action` (
  `id` int(11) NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作表';

--
-- 转存表中的数据 `cmf_user_action`
--

INSERT INTO `cmf_user_action` (`id`, `score`, `coin`, `reward_number`, `cycle_type`, `cycle_time`, `name`, `action`, `app`, `url`) VALUES
(1, 1, 1, 1, 2, 1, '用户登录', 'login', 'user', '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_action_log`
--

CREATE TABLE `cmf_user_action_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问记录表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_balance_log`
--

CREATE TABLE `cmf_user_balance_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `change` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改余额',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改后余额',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户余额变更日志表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_card`
--

CREATE TABLE `cmf_user_card` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `card_name` varchar(100) DEFAULT NULL COMMENT '会员卡名称',
  `add_time` int(11) DEFAULT NULL,
  `card_on` varchar(10) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type_id` smallint(5) NOT NULL DEFAULT '0',
  `goods_id` smallint(3) NOT NULL DEFAULT '0' COMMENT '年卡类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_user_card`
--

INSERT INTO `cmf_user_card` (`id`, `user_id`, `card_name`, `add_time`, `card_on`, `start_time`, `end_time`, `status`, `type_id`, `goods_id`) VALUES
(1, 3, '周卡', 1630573708, NULL, 1630573708, 1633165708, 1, 0, 1),
(2, 5, '周卡', 1630574863, NULL, 1630574863, 1633166863, 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_card_order`
--

CREATE TABLE `cmf_user_card_order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL,
  `pay_time` int(10) DEFAULT NULL,
  `pay_status` tinyint(1) NOT NULL DEFAULT '0',
  `level` tinyint(2) DEFAULT '0',
  `order_sn` varchar(35) DEFAULT NULL COMMENT '订单编号',
  `goods_id` int(11) DEFAULT NULL,
  `order_amount` decimal(6,2) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT '0：开通会员，1：单次卡',
  `cycle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员卡开通周期 0：1个月，1：3个月，2：6个月，3：12个月',
  `goods_name` varchar(100) DEFAULT NULL,
  `goods_price` decimal(8,2) DEFAULT '0.00' COMMENT '开通价格',
  `pay_name` varchar(30) DEFAULT NULL COMMENT '支付方式',
  `pay_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_user_card_order`
--

INSERT INTO `cmf_user_card_order` (`id`, `user_id`, `add_time`, `pay_time`, `pay_status`, `level`, `order_sn`, `goods_id`, `order_amount`, `type`, `cycle`, `goods_name`, `goods_price`, `pay_name`, `pay_id`) VALUES
(1, 4, 1630548236, NULL, 0, 0, 'A902482360820110', 1, '9.90', 0, 0, '周卡', '9.90', '微信支付', 0),
(2, 4, 1630565375, NULL, 0, 0, 'A902653753566015', 2, '19.90', 0, 1, '月卡', '19.90', '微信支付', 0),
(3, 3, 1630573477, NULL, 0, 0, 'A902734777653677', 1, '9.90', 0, 0, '周卡', '9.90', '微信支付', 0),
(4, 3, 1630573697, 1630573708, 1, 0, 'A902736977718619', 1, '0.01', 0, 0, '周卡', '0.01', '微信', 0),
(5, 5, 1630574854, 1630574863, 1, 0, 'A902748548037495', 1, '9.90', 0, 0, '周卡', '9.90', '微信', 0),
(6, 7, 1630650365, NULL, 0, 0, 'A903503653225498', 3, '39.90', 0, 2, '季卡', '39.90', '微信支付', 0),
(7, 5, 1630724146, NULL, 0, 0, 'A904241466735208', 1, '9.90', 0, 0, '周卡', '9.90', '微信支付', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_coach`
--

CREATE TABLE `cmf_user_coach` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `add_time` int(10) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店id',
  `post_excerpt` varchar(500) DEFAULT NULL,
  `vocation` varchar(20) DEFAULT NULL COMMENT '职业',
  `experie` varchar(10) DEFAULT NULL COMMENT '经验',
  `specialty` varchar(30) DEFAULT NULL COMMENT '主攻方向',
  `photo` varchar(255) DEFAULT NULL COMMENT '图片',
  `list_order` int(5) NOT NULL DEFAULT '1000',
  `wechat` varchar(50) DEFAULT NULL,
  `is_pt` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：团教练，1：私教'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_coin_log`
--

CREATE TABLE `cmf_user_coin_log` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `type` int(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1：签到，2：订餐，3：邀请，4：间接邀请',
  `change` int(11) NOT NULL DEFAULT '0' COMMENT '更改鹿角，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '剩余鹿角',
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作鹿角等奖励日志表';

--
-- 转存表中的数据 `cmf_user_coin_log`
--

INSERT INTO `cmf_user_coin_log` (`id`, `user_id`, `create_time`, `action`, `type`, `change`, `coin`, `description`) VALUES
(1, 2, 1630037325, '', 1, 10, 10, '签到，获得10个金币'),
(3, 2, 1630319442, '', 2, 1000, 1020, '商家淦烦人烧腊猪脚饭-返利餐'),
(4, 2, 1630319511, '', 2, 1000, 2020, '商家淦烦人烧腊猪脚饭-返利餐'),
(5, 2, 1630319531, '', 1, 10, 2030, '签到，获得10个金币'),
(7, 2, 1630372523, '', 1, 15, 2055, '签到，获得15个金币'),
(8, 2, 1630391376, '', 0, -1000, 1055, '提现申请'),
(9, 4, 1630490145, '', 1, 10, 10, '签到，获得10个金币'),
(10, 4, 1630542470, '', 1, 15, 25, '签到，获得15个金币'),
(11, 5, 1630565914, '', 1, 10, 10, '签到，获得10个金币'),
(12, 4, 1630578856, '', 2, 1500, 1525, '商家水姐麻辣烫-霸王餐'),
(13, 4, 1630578922, '', 2, 1600, 3125, '商家翻滚吧炒饭君 -霸王餐'),
(14, 4, 1630579088, '', 2, 1200, 4325, '商家李家凉皮-霸王餐'),
(15, 4, 1630579096, '', 2, 1500, 5825, '商家水姐麻辣烫-霸王餐'),
(16, 4, 1630579101, '', 2, 1000, 6825, '商家淦烦人烧腊猪脚饭-返利餐'),
(17, 4, 1630579107, '', 2, 1000, 7825, '商家淦烦人烧腊猪脚饭-返利餐'),
(18, 7, 1630650290, '', 1, 10, 10, '签到，获得10个金币'),
(19, 5, 1630664476, '', 1, 15, 25, '签到，获得15个金币'),
(20, 4, 1630669306, '', 1, 20, 7845, '签到，获得20个金币'),
(21, 7, 1630720009, '', 1, 15, 25, '签到，获得15个金币'),
(22, 5, 1630722029, '', 1, 20, 45, '签到，获得20个金币'),
(23, 4, 1630723675, '', 1, 25, 7870, '签到，获得25个金币'),
(24, 9, 1630726598, '', 1, 10, 10, '签到，获得10个金币'),
(25, 5, 1630728529, '', 2, 1500, 1545, '商家李家凉皮-霸王餐'),
(26, 5, 1630735979, '', 0, -1000, 545, '提现申请'),
(27, 5, 1630736286, '', 0, -100, 445, '提现申请'),
(28, 5, 1630736292, '', 0, -100, 345, '提现申请'),
(29, 6, 1630751039, '', 1, 10, 10, '签到，获得10个金币'),
(30, 4, 1630976052, '', 1, 10, 7880, '签到，获得10个金币'),
(31, 3, 1630982168, '', 1, 10, 10, '签到，获得10个金币'),
(32, 7, 1630985396, '', 1, 10, 35, '签到，获得10个金币'),
(33, 6, 1630997470, '', 1, 10, 20, '签到，获得10个金币'),
(38, 4, 1631071572, '', 1, 15, 7895, '签到，获得15个金币'),
(39, 3, 1631071780, '', 1, 15, 215, '签到，获得15个金币'),
(40, 7, 1631072441, '', 1, 15, 50, '签到，获得15个金币');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_favorite`
--

CREATE TABLE `cmf_user_favorite` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，JSON格式',
  `description` text COMMENT '收藏内容的描述',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) UNSIGNED DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) UNSIGNED DEFAULT '0' COMMENT '收藏时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表';

--
-- 转存表中的数据 `cmf_user_favorite`
--

INSERT INTO `cmf_user_favorite` (`id`, `user_id`, `title`, `thumbnail`, `url`, `description`, `table_name`, `object_id`, `create_time`) VALUES
(6, 137, '小鹿乱撞运动会粉巷店', '', '1', '介绍', 'supplier', 1, 1627717547),
(9, 2, '李家凉皮', 'goods/20210826/a8266316959f37d14f102daf4c2e9909.png', '', '', 'supplier', 3, 1630050231),
(10, 2, '翻滚吧炒饭君 ', 'goods/20210826/22f249048014093bbd148c883a9f0811.png', '', '', 'supplier', 2, 1630375153),
(12, 4, '李家凉皮', 'goods/20210826/a8266316959f37d14f102daf4c2e9909.png', '', '加入会员可享更多特权', 'supplier', 3, 1630545889),
(13, 4, '翻滚吧炒饭君 ', 'goods/20210826/22f249048014093bbd148c883a9f0811.png', '', '环境好，味道更好', 'supplier', 2, 1630547369),
(16, 5, '水姐麻辣烫', 'goods/20210826/9c222571ddc717cef497f41d0f4825a7.png', '', '名额有限，优惠力度很大', 'supplier', 4, 1630665860),
(17, 5, '李家凉皮', 'goods/20210826/a8266316959f37d14f102daf4c2e9909.png', '', '加入会员可享更多特权', 'supplier', 3, 1630665865),
(18, 4, '淦烦人烧腊猪脚饭', 'goods/20210826/0c7ead1661d139e9466a1b37e5077e87.png', '', '五星好评，2图20个文字', 'supplier', 1, 1630727370);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_group_card`
--

CREATE TABLE `cmf_user_group_card` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `original_price` decimal(10,2) DEFAULT '0.00',
  `price` decimal(6,2) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：会员卡，1单次卡',
  `thumbnail` varchar(300) DEFAULT NULL,
  `days` tinyint(4) DEFAULT NULL,
  `list_order` smallint(4) NOT NULL DEFAULT '1000',
  `remark` varchar(1200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_user_group_card`
--

INSERT INTO `cmf_user_group_card` (`id`, `title`, `status`, `original_price`, `price`, `type`, `thumbnail`, `days`, `list_order`, `remark`) VALUES
(1, '周卡', 1, '29.29', '9.90', 0, '', 0, 1, ''),
(2, '月卡', 1, '39.29', '19.90', 0, '', 1, 2, ''),
(3, '季卡', 1, '99.29', '39.90', 0, '', 2, 3, '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_like`
--

CREATE TABLE `cmf_user_like` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户 id',
  `object_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '内容原来的主键id',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '内容以前所在表,不带前缀',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容的原文地址，不带域名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` text COMMENT '内容的描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户点赞表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_login_attempt`
--

CREATE TABLE `cmf_user_login_attempt` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `login_attempts` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户登录尝试表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_notice`
--

CREATE TABLE `cmf_user_notice` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT '0' COMMENT '用户id',
  `add_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型   1：下单',
  `ranks` varchar(255) DEFAULT NULL,
  `content` text,
  `wx_url` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0' COMMENT '是否已读',
  `order_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_user_notice`
--

INSERT INTO `cmf_user_notice` (`id`, `user_id`, `add_time`, `title`, `type`, `ranks`, `content`, `wx_url`, `is_read`, `order_id`) VALUES
(1, 2, 1624699115, '课程预约提醒', 1, '您已经成功预约懒懒1号教练课程，人数1人。', '{\"预约人\":\"懒懒1号\",\"课程内容\":\"BODYABCD燃脂搏击 \",\"上课时间\":\"2021-06-12 12:00 16:00\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"\"}', '/pages/sign/sign?id=1', 1, 0),
(2, 2, 1624699122, '课程预约提醒', 1, '您已经成功预约懒懒1号教练课程，人数1人。', '{\"预约人\":\"懒懒1号\",\"课程内容\":\"BODYABCD燃脂搏击 \",\"上课时间\":\"2021-06-12 12:00 16:00\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"\"}', '/pages/eg1/eg1?id=16', 1, 0),
(3, 3, 1624699219, '课程预约提醒', 1, '您已经成功预约《懒懒1号》教练课程，人数1人。', '{\"预约人\":\"懒懒\",\"课程内容\":\"BODYABCD燃脂搏击 \",\"上课时间\":\"2021-06-12 12:00 16:00\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"\"}', '/pages/sign/sign?id=1', 1, 0),
(4, 3, 1624700338, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"懒懒\",\"课程内容\":\"搏击体验测试\",\"上课时间\":\"2021-06-27 15:00 ~ 18:00\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"111111\"}', '/pages/eg1/eg1?id=1', 1, 0),
(5, 3, 1624700342, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数2人。', '{\"预约人\":\"懒懒\",\"课程内容\":\"搏击体验测试\",\"上课时间\":\"2021-06-27 15:00 ~ 18:00\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"111111\"}', '/pages/eg1/eg1?id=17', 1, 0),
(6, 3, 1624852573, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"懒懒\",\"课程内容\":\"零噪音减脂进阶\",\"上课时间\":\"2021-06-30 11:00 ~ 13:00\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"111111\"}', '/pages/eg1/eg1?id=19', 1, 0),
(7, 8, 1624933996, '课程预约提醒', 1, '您已经成功预约《懒懒1号》教练课程，人数1人。', '{\"预约人\":\"王诚(名远14年网站小程序开发)\",\"课程内容\":\"零噪音减脂进阶\",\"上课时间\":\"2021-06-29 11:00 ~ 12:20\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"111111\"}', '/pages/eg1/eg1?id=20', 0, 20),
(8, 8, 1624934383, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"王诚(名远14年网站小程序开发)\",\"课程内容\":\"搏击体验测试\",\"上课时间\":\"2021-06-29 11:00 ~ 13:00\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"111111\"}', '/pages/eg1/eg1?id=21', 0, 21),
(9, 3, 1624937321, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"懒懒\",\"课程内容\":\"BODYABCD晋级\",\"上课时间\":\"2021-06-29 12:00 ~ 15:00\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"111111\"}', '/pages/eg1/eg1?id=23', 1, 23),
(10, 8, 1625019417, '课程预约提醒', 1, '您已经成功预约《懒懒1号》教练课程，人数1人。', '{\"预约人\":\"王诚(名远14年网站小程序开发)\",\"课程内容\":\"HIIT燃脂进阶\",\"上课时间\":\"2021-06-30 10:50 ~ 12:00\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"111111\"}', '/pages/eg1/eg1?id=24', 0, 24),
(11, 8, 1625025088, '课程预约提醒', 1, '您已经成功预约《懒懒1号》教练课程，人数1人。', '{\"预约人\":\"王诚(名远14年网站小程序开发)\",\"课程内容\":\" BODYABCD\",\"上课时间\":\"2021-06-30 12:22 ~ 15:00\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"111111\"}', '/pages/eg1/eg1?id=25', 0, 25),
(12, 3, 1625130610, '课程预约提醒', 1, '您已经成功预约《懒懒1号》教练课程，人数1人。', '{\"预约人\":\"懒懒\",\"课程内容\":\"HIIT燃脂进阶\",\"上课时间\":\"2021-07-02 13:00 ~ 15:00\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"111111\"}', '/pages/eg1/eg1?id=27', 1, 27),
(13, 3, 1625477978, '课程预约提醒', 1, '您已经成功预约《王诚(名远14年网站小程序开发)》教练课程，人数1人。', '{\"预约人\":\"懒懒\",\"课程内容\":\"搏击体验测试\",\"上课时间\":\"2021-07-06 17:00 ~ 19:00\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"111111\"}', '/pages/my/order/orderDetail?id=28', 1, 28),
(14, 5, 1625551182, '课程预约提醒', 1, '您已经成功预约《王诚(名远14年网站小程序开发)》教练课程，人数1人。', '{\"预约人\":\"陈嘴嘴\",\"课程内容\":\"搏击体验测试\",\"上课时间\":\"2021-07-06 17:00 ~ 19:00\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"111111\"}', '/pages/my/order/orderDetail?id=29', 1, 29),
(15, 8, 1625552393, '课程预约提醒', 1, '您已经成功预约《王诚(名远14年网站小程序开发)》教练课程，人数1人。', '{\"预约人\":\"王诚(名远14年网站小程序开发)\",\"课程内容\":\"搏击体验测试\",\"上课时间\":\"2021-07-06 17:00 ~ 19:00\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"111111\"}', '/pages/my/order/orderDetail?id=30', 0, 30),
(16, 5, 1625553128, '课程预约提醒', 1, '您已经成功预约《懒懒1号》教练课程，人数1人。', '{\"预约人\":\"陈嘴嘴\",\"课程内容\":\"搏击体验测试\",\"上课时间\":\"2021-07-06 15:05 ~ 17:00\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"111111\"}', '/pages/my/order/orderDetail?id=31', 1, 31),
(17, 2, 1625560589, '上课提醒', 2, '您预约的《BODYABCD燃脂搏击 》即将开课，请及时入场', '{\"上课时间\":\"2021-06-12 13:00 ~ 15:00\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=7', 1, 7),
(18, 2, 1625560589, '上课提醒', 2, '您预约的《BODYABCD燃脂搏击 》即将开课，请及时入场', '{\"上课时间\":\"2021-06-12 16:00 ~ 18:00\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=9', 1, 9),
(19, 2, 1625560589, '上课提醒', 2, '您预约的《BODYABCD燃脂搏击 》即将开课，请及时入场', '{\"上课时间\":\"2021-06-20 14:00 ~ 16:00\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=11', 1, 11),
(20, 5, 1625560590, '上课提醒', 2, '您预约的《零噪音减脂进阶》即将开课，请及时入场', '{\"上课时间\":\"2021-06-23 18:00 ~ 00:20\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=14', 1, 14),
(21, 3, 1625560590, '上课提醒', 2, '您预约的《搏击体验测试》即将开课，请及时入场', '{\"上课时间\":\"2021-06-27 15:00 ~ 18:00\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=16', 1, 16),
(22, 3, 1625560590, '上课提醒', 2, '您预约的《搏击体验测试》即将开课，请及时入场', '{\"上课时间\":\"2021-06-27 15:00 ~ 18:00\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=17', 1, 17),
(23, 3, 1625560590, '上课提醒', 2, '您预约的《零噪音减脂进阶》即将开课，请及时入场', '{\"上课时间\":\"2021-06-30 11:00 ~ 13:00\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=19', 1, 19),
(24, 8, 1625560591, '上课提醒', 2, '您预约的《零噪音减脂进阶》即将开课，请及时入场', '{\"上课时间\":\"2021-06-29 11:00 ~ 12:20\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=20', 0, 20),
(25, 8, 1625560591, '上课提醒', 2, '您预约的《搏击体验测试》即将开课，请及时入场', '{\"上课时间\":\"2021-06-29 11:00 ~ 13:00\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=21', 0, 21),
(26, 3, 1625560591, '上课提醒', 2, '您预约的《BODYABCD晋级》即将开课，请及时入场', '{\"上课时间\":\"2021-06-29 12:00 ~ 15:00\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=23', 1, 23),
(27, 8, 1625560591, '上课提醒', 2, '您预约的《HIIT燃脂进阶》即将开课，请及时入场', '{\"上课时间\":\"2021-06-30 10:50 ~ 12:00\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=24', 0, 24),
(28, 8, 1625560591, '上课提醒', 2, '您预约的《 BODYABCD》即将开课，请及时入场', '{\"上课时间\":\"2021-06-30 12:22 ~ 15:00\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=25', 0, 25),
(29, 3, 1625560592, '上课提醒', 2, '您预约的《HIIT燃脂进阶》即将开课，请及时入场', '{\"上课时间\":\"2021-07-02 13:00 ~ 15:00\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=27', 1, 27),
(30, 3, 1625560592, '上课提醒', 2, '您预约的《搏击体验测试》即将开课，请及时入场', '{\"上课时间\":\"2021-07-06 17:00 ~ 19:00\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=28', 1, 28),
(31, 5, 1625560592, '上课提醒', 2, '您预约的《搏击体验测试》即将开课，请及时入场', '{\"上课时间\":\"2021-07-06 17:00 ~ 19:00\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=29', 1, 29),
(32, 8, 1625560592, '上课提醒', 2, '您预约的《搏击体验测试》即将开课，请及时入场', '{\"上课时间\":\"2021-07-06 17:00 ~ 19:00\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=30', 0, 30),
(33, 5, 1625560592, '上课提醒', 2, '您预约的《搏击体验测试》即将开课，请及时入场', '{\"上课时间\":\"2021-07-06 15:05 ~ 17:00\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=31', 1, 31),
(34, 5, 1625628500, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"陈嘴嘴\",\"课程内容\":\"HIIT燃脂进阶\",\"上课时间\":\"2021-07-07 12:00 ~ 16:00\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"111111\"}', '/pages/my/order/orderDetail?id=32', 1, 32),
(35, 5, 1625629816, '上课提醒', 2, '您预约的《HIIT燃脂进阶》即将开课，请及时入场', '{\"上课时间\":\"2021-07-07 12:00 ~ 16:00\",\"预约门店\":\"测试门店\"}', '/pages/eg1/eg1?id=32', 1, 32),
(36, 5, 1625743130, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"陈嘴嘴\",\"课程内容\":\"Dear Combat燃脂搏击\",\"上课时间\":\"2021-07-08 19:34 ~ 20:15\",\"上课地点\":\"西安市雁塔区望庭国际1号楼1单元1509室\",\"联系电话\":\"111111\"}', '/pages/my/order/orderDetail?id=33', 1, 33),
(37, 5, 1625889867, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"陈嘴嘴\",\"课程内容\":\"品牌发布会\",\"上课时间\":\"2021-07-10 15:00 ~ 17:00\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=37', 1, 37),
(38, 5, 1625904468, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"陈嘴嘴\",\"课程内容\":\"品牌发布会\",\"上课时间\":\"2021-07-10 17:00 ~ 19:00\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=38', 1, 38),
(39, 4, 1625916911, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"Miludeer\",\"课程内容\":\" BODYABCD\",\"上课时间\":\"2021-07-10 20:00 ~ 21:00\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=39', 1, 39),
(40, 5, 1625916912, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"陈嘴嘴\",\"课程内容\":\" BODYABCD\",\"上课时间\":\"2021-07-10 20:00 ~ 21:00\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=40', 1, 40),
(41, 6, 1625916951, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"周某女\",\"课程内容\":\" BODYABCD\",\"上课时间\":\"2021-07-10 20:00 ~ 21:00\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=41', 1, 41),
(42, 33, 1625917191, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"林希\",\"课程内容\":\" BODYABCD\",\"上课时间\":\"2021-07-10 20:00 ~ 21:00\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=43', 1, 43),
(43, 30, 1625917192, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"S\",\"课程内容\":\" BODYABCD\",\"上课时间\":\"2021-07-10 20:00 ~ 21:00\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=42', 1, 42),
(44, 3, 1626076857, '课程预约提醒', 1, '您已经成功预约《懒懒》教练课程，人数1人。', '{\"预约人\":\"懒懒\",\"课程内容\":\"Dear Combat燃脂搏击\",\"上课时间\":\"2021-07-12 18:00 ~ 20:00\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=44', 1, 44),
(45, 3, 1626077053, '课程预约提醒', 1, '您已经成功预约《懒懒》教练课程，人数2人。', '{\"预约人\":\"懒懒\",\"课程内容\":\"Dear Combat燃脂搏击\",\"上课时间\":\"2021-07-12 18:00 ~ 20:00\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=45', 1, 45),
(46, 3, 1626082201, '上课提醒', 2, '您预约的《Dear Combat燃脂搏击》即将开课，请及时入场', '{\"上课时间\":\"2021-07-12 18:00 ~ 20:00\",\"预约门店\":\"小鹿乱撞运动会\"}', '/pages/eg1/eg1?id=44', 1, 44),
(47, 3, 1626082202, '上课提醒', 2, '您预约的《Dear Combat燃脂搏击》即将开课，请及时入场', '{\"上课时间\":\"2021-07-12 18:00 ~ 20:00\",\"预约门店\":\"小鹿乱撞运动会\"}', '/pages/eg1/eg1?id=45', 1, 45),
(48, 5, 1626145990, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"陈嘴嘴\",\"课程内容\":\"Dear Combat燃脂搏击\",\"上课时间\":\"2021-07-13 11:45 ~ 12:45\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=46', 1, 46),
(49, 5, 1626146102, '上课提醒', 2, '您预约的《Dear Combat燃脂搏击》即将开课，请及时入场', '{\"上课时间\":\"2021-07-13 11:45 ~ 12:45\",\"预约门店\":\"小鹿乱撞运动会\"}', '/pages/eg1/eg1?id=46', 1, 46),
(50, 4, 1626163648, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"陈子熙\",\"课程内容\":\"Dear Combat燃脂搏击\",\"上课时间\":\"2021-07-13 20:00 ~ 21:00\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=48', 1, 48),
(51, 4, 1626175801, '上课提醒', 2, '您预约的《Dear Combat燃脂搏击》即将开课，请及时入场', '{\"上课时间\":\"2021-07-13 20:00 ~ 21:00\",\"预约门店\":\"小鹿乱撞运动会\"}', '/pages/eg1/eg1?id=48', 1, 48),
(52, 4, 1626264111, '课程预约提醒', 1, '您已经成功预约《小宁》教练课程，人数1人。', '{\"预约人\":\"陈子熙\",\"课程内容\":\"Mocha(舞动青春）\",\"上课时间\":\"2021-07-17 09:00 ~ 09:45\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=52', 1, 52),
(53, 5, 1626440447, '课程预约提醒', 1, '您已经成功预约《周某女》教练课程，人数1人。', '{\"预约人\":\"陈嘴嘴\",\"课程内容\":\"Dear Combat（拳力出击）\",\"上课时间\":\"2021-07-16 21:05 ~ 21:23\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=62', 1, 62),
(54, 5, 1626440582, '上课提醒', 2, '您预约的《Dear Combat（拳力出击）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-16 21:05 ~ 21:23\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=62', 1, 62),
(55, 4, 1626440583, '课程预约提醒', 1, '您已经成功预约《周某女》教练课程，人数1人。', '{\"预约人\":\"陈子熙\",\"课程内容\":\"Dear Combat（拳力出击）\",\"上课时间\":\"2021-07-16 21:05 ~ 21:23\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=64', 1, 64),
(56, 5, 1626481802, '上课提醒', 2, '您预约的《Mocha(舞动青春）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-17 09:00 ~ 09:45\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=53', 1, 53),
(57, 73, 1626481802, '上课提醒', 2, '您预约的《Mocha(舞动青春）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-17 09:00 ~ 09:45\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=71', 1, 71),
(58, 35, 1626489001, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-17 11:00 ~ 11:45\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=56', 0, 56),
(59, 71, 1626489001, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-17 11:00 ~ 11:45\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=66', 0, 66),
(60, 75, 1626496202, '上课提醒', 2, '您预约的《Dear JP(Jazz Party)》即将开课，请及时入场', '{\"上课时间\":\"2021-07-17 13:00 ~ 13:45\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=70', 0, 70),
(61, 83, 1626511682, '上课提醒', 2, '您预约的《Dear Step（活力踏板）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-17 17:00 ~ 17:45\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=74', 0, 74),
(62, 63, 1626521401, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-17 20:00 ~ 20:45\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=55', 0, 55),
(63, 66, 1626521401, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-17 20:00 ~ 20:45\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=57', 0, 57),
(64, 68, 1626521402, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-17 20:00 ~ 20:45\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=60', 0, 60),
(65, 37, 1626521402, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-17 20:00 ~ 20:45\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=61', 0, 61),
(66, 72, 1626521402, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-17 20:00 ~ 20:45\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=68', 1, 68),
(67, 38, 1626521402, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-17 20:00 ~ 20:45\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=73', 1, 73),
(68, 3, 1626659301, '课程预约提醒', 1, '您已经成功预约《小宁》教练课程，人数1人。', '{\"预约人\":\"懒懒\",\"课程内容\":\"Dear Combat（拳力出击）\",\"上课时间\":\"2021-07-24 14:00 ~ 16:00\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=75', 1, 75),
(69, 3, 1626769468, '签到成功通知', 3, '签到成功', '{\"课程名称\":\"Dear Combat燃脂搏击\",\"签到时间\":\"2021-07-20 16:24:28\"}', '/pages/my/order/order', 1, 50),
(70, 3, 1626769663, '签到成功通知', 3, '签到成功,共消耗50卡路里', '{\"课程名称\":\"零噪音减脂进阶\",\"签到时间\":\"2021-07-20 16:27:43\"}', '/pages/my/order/order', 1, 19),
(71, 3, 1626769691, '签到成功通知', 3, '签到成功', '{\"课程名称\":\"BODYABCD晋级\",\"签到时间\":\"2021-07-20 16:28:11\"}', '/pages/my/order/order', 1, 23),
(72, 3, 1626773997, '课程预约提醒', 1, '您已经成功预约《李科》教练课程，人数1人。', '{\"预约人\":\"懒懒\",\"课程内容\":\"Dear Shbam\",\"上课时间\":\"2021-07-22 20:00 ~ 20:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=97', 1, 97),
(73, 71, 1626777002, '上课提醒', 2, '您预约的《Dear Shbam》即将开课，请及时入场', '{\"上课时间\":\"2021-07-20 19:00 ~ 19:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=78', 0, 78),
(74, 93, 1626777002, '上课提醒', 2, '您预约的《Dear Shbam》即将开课，请及时入场', '{\"上课时间\":\"2021-07-20 19:00 ~ 19:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=79', 0, 79),
(75, 94, 1626777002, '上课提醒', 2, '您预约的《Dear Shbam》即将开课，请及时入场', '{\"上课时间\":\"2021-07-20 19:00 ~ 19:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=81', 0, 81),
(76, 68, 1626777002, '上课提醒', 2, '您预约的《Dear Shbam》即将开课，请及时入场', '{\"上课时间\":\"2021-07-20 19:00 ~ 19:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=86', 0, 86),
(77, 93, 1626780602, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-20 20:00 ~ 20:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=82', 0, 82),
(78, 94, 1626780602, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-20 20:00 ~ 20:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=83', 0, 83),
(79, 57, 1626780602, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-20 20:00 ~ 20:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=85', 0, 85),
(80, 4, 1626780602, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-20 20:00 ~ 20:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=89', 1, 89),
(81, 94, 1626785432, '签到成功通知', 3, '签到成功', '{\"课程名称\":\"Dear Shbam\",\"签到时间\":\"2021-07-20 20:50:32\"}', '/pages/my/order/order', 0, 81),
(82, 68, 1626785455, '签到成功通知', 3, '签到成功', '{\"课程名称\":\"Dear Shbam\",\"签到时间\":\"2021-07-20 20:50:55\"}', '/pages/my/order/order', 0, 86),
(83, 94, 1626785470, '签到成功通知', 3, '签到成功', '{\"课程名称\":\"Dear Pump（杠铃操）\",\"签到时间\":\"2021-07-20 20:51:10\"}', '/pages/my/order/order', 0, 83),
(84, 93, 1626785485, '签到成功通知', 3, '签到成功', '{\"课程名称\":\"Dear Pump（杠铃操）\",\"签到时间\":\"2021-07-20 20:51:25\"}', '/pages/my/order/order', 0, 82),
(85, 93, 1626785493, '签到成功通知', 3, '签到成功', '{\"课程名称\":\"Dear Shbam\",\"签到时间\":\"2021-07-20 20:51:33\"}', '/pages/my/order/order', 0, 79),
(86, 4, 1626949769, '课程预约提醒', 1, '您已经成功预约《天天》教练课程，人数1人。', '{\"预约人\":\"陈子熙\",\"课程内容\":\"Dear Pump（杠铃操）\",\"上课时间\":\"2021-07-23 19:00 ~ 19:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=99', 1, 99),
(87, 5, 1626955997, '课程预约提醒', 1, '您已经成功预约《天天》教练课程，人数1人。', '{\"预约人\":\"陈嘴嘴\",\"课程内容\":\"Dear Pump（杠铃操）\",\"上课时间\":\"2021-07-23 19:00 ~ 19:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=101', 1, 101),
(88, 95, 1627020385, '课程预约提醒', 1, '您已经成功预约《天天》教练课程，人数1人。', '{\"预约人\":\"橙賢惠\",\"课程内容\":\"Dear Pump（杠铃操）\",\"上课时间\":\"2021-07-23 19:00 ~ 19:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=104', 1, 104),
(89, 35, 1627030197, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"张大妞\",\"课程内容\":\"Dear 燃脂\",\"上课时间\":\"2021-07-24 10:00 ~ 10:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=105', 0, 105),
(90, 101, 1627033613, '课程预约提醒', 1, '您已经成功预约《天天》教练课程，人数1人。', '{\"预约人\":\"Amarna元気小喵菌\",\"课程内容\":\"Dear Combat（拳力出击）\",\"上课时间\":\"2021-07-23 20:00 ~ 20:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=106', 1, 106),
(91, 72, 1627034711, '课程预约提醒', 1, '您已经成功预约《天天》教练课程，人数1人。', '{\"预约人\":\"Dx\",\"课程内容\":\"Dear Combat（拳力出击）\",\"上课时间\":\"2021-07-23 20:00 ~ 20:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=107', 1, 107),
(92, 5, 1627036009, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"陈嘴嘴\",\"课程内容\":\"Dear 燃脂\",\"上课时间\":\"2021-07-27 10:00 ~ 10:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=108', 1, 108),
(93, 101, 1627036202, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-23 19:00 ~ 19:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=100', 1, 100),
(94, 67, 1627036202, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-23 19:00 ~ 19:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=103', 1, 103),
(95, 95, 1627036202, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-23 19:00 ~ 19:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=104', 0, 104),
(96, 101, 1627039801, '上课提醒', 2, '您预约的《Dear Combat（拳力出击）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-23 20:00 ~ 20:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=106', 1, 106),
(97, 72, 1627039801, '上课提醒', 2, '您预约的《Dear Combat（拳力出击）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-23 20:00 ~ 20:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=107', 1, 107),
(98, 8, 1627048140, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"王诚(名远14年网站小程序开发)\",\"课程内容\":\"Dear 燃脂\",\"上课时间\":\"2021-07-24 10:00 ~ 10:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=110', 0, 110),
(99, 109, 1627048186, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"〽嗡嗡嗡℡®*\",\"课程内容\":\"Dear 燃脂\",\"上课时间\":\"2021-07-24 19:00 ~ 19:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=112', 1, 112),
(100, 35, 1627090201, '上课提醒', 2, '您预约的《Dear 燃脂》即将开课，请及时入场', '{\"上课时间\":\"2021-07-24 10:00 ~ 10:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=105', 0, 105),
(101, 107, 1627090201, '上课提醒', 2, '您预约的《Dear 燃脂》即将开课，请及时入场', '{\"上课时间\":\"2021-07-24 10:00 ~ 10:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=109', 0, 109),
(102, 8, 1627090202, '上课提醒', 2, '您预约的《Dear 燃脂》即将开课，请及时入场', '{\"上课时间\":\"2021-07-24 10:00 ~ 10:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=110', 0, 110),
(103, 3, 1627104602, '上课提醒', 2, '您预约的《Dear Combat（拳力出击）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-24 14:00 ~ 16:00\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=75', 1, 75),
(104, 109, 1627122602, '上课提醒', 2, '您预约的《Dear 燃脂》即将开课，请及时入场', '{\"上课时间\":\"2021-07-24 19:00 ~ 19:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=112', 0, 112),
(105, 35, 1627127688, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"张大妞\",\"课程内容\":\"Dear 翘臀\",\"上课时间\":\"2021-07-25 10:00 ~ 10:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=113', 0, 113),
(106, 35, 1627176601, '上课提醒', 2, '您预约的《Dear 翘臀》即将开课，请及时入场', '{\"上课时间\":\"2021-07-25 10:00 ~ 10:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=113', 0, 113),
(107, 5, 1627272231, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"陈嘴嘴\",\"课程内容\":\"Dear 燃脂\",\"上课时间\":\"2021-07-26 14:00 ~ 14:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=114', 1, 114),
(108, 5, 1627277402, '上课提醒', 2, '您预约的《Dear 燃脂》即将开课，请及时入场', '{\"上课时间\":\"2021-07-26 14:00 ~ 14:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=114', 1, 114),
(109, 5, 1627280226, '签到成功通知', 3, '签到成功,共消耗2卡路里', '{\"课程名称\":\"Dear 燃脂\",\"签到时间\":\"2021-07-26 14:17:06\"}', '/pages/my/order/order', 1, 114),
(110, 35, 1627294833, '课程预约提醒', 1, '您已经成功预约《郜樊雪》教练课程，人数1人。', '{\"预约人\":\"张大妞\",\"课程内容\":\"Dear Pump（杠铃操）\",\"上课时间\":\"2021-07-27 19:00 ~ 19:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=115', 0, 115),
(111, 15, 1627380328, '课程预约提醒', 1, '您已经成功预约《郜樊雪》教练课程，人数1人。', '{\"预约人\":\"不吃鱼不吃辣\",\"课程内容\":\"Dear Pump（杠铃操）\",\"上课时间\":\"2021-07-27 19:00 ~ 19:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=117', 1, 117),
(112, 5, 1627381281, '课程预约提醒', 1, '您已经成功预约《郜樊雪》教练课程，人数1人。', '{\"预约人\":\"陈嘴嘴\",\"课程内容\":\"Dear Pump（杠铃操）\",\"上课时间\":\"2021-07-27 19:00 ~ 19:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=118', 1, 118),
(113, 4, 1627381393, '课程预约提醒', 1, '您已经成功预约《郜樊雪》教练课程，人数1人。', '{\"预约人\":\"陈子熙\",\"课程内容\":\"Dear Pump（杠铃操）\",\"上课时间\":\"2021-07-27 19:00 ~ 19:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=119', 1, 119),
(114, 15, 1627381505, '课程预约提醒', 1, '您已经成功预约《郜樊雪》教练课程，人数1人。', '{\"预约人\":\"不吃鱼不吃辣\",\"课程内容\":\"Dear Shbam\",\"上课时间\":\"2021-07-27 20:00 ~ 20:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=120', 0, 120),
(115, 35, 1627381801, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-27 19:00 ~ 19:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=115', 0, 115),
(116, 15, 1627381801, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-27 19:00 ~ 19:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=117', 0, 117),
(117, 5, 1627381802, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-27 19:00 ~ 19:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=118', 1, 118),
(118, 4, 1627381802, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-27 19:00 ~ 19:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=119', 1, 119),
(119, 15, 1627385401, '上课提醒', 2, '您预约的《Dear Shbam》即将开课，请及时入场', '{\"上课时间\":\"2021-07-27 20:00 ~ 20:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=120', 0, 120),
(120, 119, 1627386334, '课程预约提醒', 1, '您已经成功预约《郜樊雪》教练课程，人数1人。', '{\"预约人\":\"木木夕立里\",\"课程内容\":\"Dear Shbam\",\"上课时间\":\"2021-07-27 20:00 ~ 20:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=123', 1, 123),
(121, 119, 1627386481, '上课提醒', 2, '您预约的《Dear Shbam》即将开课，请及时入场', '{\"上课时间\":\"2021-07-27 20:00 ~ 20:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=123', 1, 123),
(122, 123, 1627449482, '课程预约提醒', 1, '您已经成功预约《天天》教练课程，人数1人。', '{\"预约人\":\"May\",\"课程内容\":\"Dear Zumba(尊巴）\",\"上课时间\":\"2021-07-28 20:00 ~ 20:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=125', 0, 125),
(123, 122, 1627449934, '课程预约提醒', 1, '您已经成功预约《天天》教练课程，人数1人。', '{\"预约人\":\"zz\",\"课程内容\":\"Dear Zumba(尊巴）\",\"上课时间\":\"2021-07-28 20:00 ~ 20:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=126', 1, 126),
(124, 121, 1627464958, '课程预约提醒', 1, '您已经成功预约《天天》教练课程，人数1人。', '{\"预约人\":\"周奉陪\",\"课程内容\":\"Dear Combat（拳力出击）\",\"上课时间\":\"2021-07-28 19:00 ~ 19:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=127', 1, 127),
(125, 62, 1627468202, '上课提醒', 2, '您预约的《Dear Combat（拳力出击）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-28 19:00 ~ 19:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=121', 1, 121),
(126, 121, 1627468202, '上课提醒', 2, '您预约的《Dear Combat（拳力出击）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-28 19:00 ~ 19:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=127', 0, 127),
(127, 123, 1627471802, '上课提醒', 2, '您预约的《Dear Zumba(尊巴）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-28 20:00 ~ 20:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=125', 0, 125),
(128, 122, 1627471802, '上课提醒', 2, '您预约的《Dear Zumba(尊巴）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-28 20:00 ~ 20:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=126', 1, 126),
(129, 119, 1627473260, '课程预约提醒', 1, '您已经成功预约《天天》教练课程，人数1人。', '{\"预约人\":\"木木夕立里\",\"课程内容\":\"Dear Zumba(尊巴）\",\"上课时间\":\"2021-07-28 20:00 ~ 20:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=128', 1, 128),
(130, 119, 1627473421, '上课提醒', 2, '您预约的《Dear Zumba(尊巴）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-28 20:00 ~ 20:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=128', 1, 128),
(131, 119, 1627559179, '课程预约提醒', 1, '您已经成功预约《李科》教练课程，人数1人。', '{\"预约人\":\"木木夕立里\",\"课程内容\":\"Dear Shbam\",\"上课时间\":\"2021-07-29 20:00 ~ 20:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=130', 1, 130),
(132, 119, 1627559223, '签到成功通知', 3, '签到成功,共消耗283卡路里', '{\"课程名称\":\"Dear Shbam\",\"签到时间\":\"2021-07-29 19:47:03\"}', '/pages/my/order/order', 1, 130),
(133, 67, 1627642621, '上课提醒', 2, '您预约的《Dear Pump（杠铃操）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-30 19:00 ~ 19:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=132', 1, 132),
(134, 135, 1627642705, '课程预约提醒', 1, '您已经成功预约《天天》教练课程，人数1人。', '{\"预约人\":\"幻鱼\",\"课程内容\":\"Dear Pump（杠铃操）\",\"上课时间\":\"2021-07-30 19:00 ~ 19:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=134', 1, 134),
(135, 135, 1627642723, '课程预约提醒', 1, '您已经成功预约《天天》教练课程，人数1人。', '{\"预约人\":\"幻鱼\",\"课程内容\":\"Dear Combat（拳力出击）\",\"上课时间\":\"2021-07-30 20:00 ~ 20:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=135', 1, 135),
(136, 135, 1627644602, '上课提醒', 2, '您预约的《Dear Combat（拳力出击）》即将开课，请及时入场', '{\"上课时间\":\"2021-07-30 20:00 ~ 20:50\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=135', 0, 135),
(137, 5, 1627695734, '课程预约提醒', 1, '您已经成功预约《陈嘴嘴》教练课程，人数1人。', '{\"预约人\":\"陈嘴嘴\",\"课程内容\":\"Dear 燃脂\",\"上课时间\":\"2021-07-31 10:00 ~ 10:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=138', 1, 138),
(138, 64, 1627807950, '课程预约提醒', 1, '您已经成功预约《天天》教练课程，人数1人。', '{\"预约人\":\"船长大人\",\"课程内容\":\"Dear Combat（拳力出击）\",\"上课时间\":\"2021-08-03 10:30 ~ 11:20\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=140', 0, 140),
(139, 64, 1627956002, '上课提醒', 2, '您预约的《Dear Combat（拳力出击）》即将开课，请及时入场', '{\"上课时间\":\"2021-08-03 10:30 ~ 11:20\",\"预约门店\":\"小鹿乱撞运动会粉巷店\"}', '/pages/eg1/eg1?id=140', 0, 140),
(140, 158, 1627959648, '课程预约提醒', 1, '您已经成功预约《天天》教练课程，人数1人。', '{\"预约人\":\"?\",\"课程内容\":\"Dear Combat（拳力出击）\",\"上课时间\":\"2021-08-04 19:00 ~ 19:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=146', 0, 146),
(141, 158, 1627960103, '课程预约提醒', 1, '您已经成功预约《天天》教练课程，人数1人。', '{\"预约人\":\"?\",\"课程内容\":\"Dear Zumba(尊巴）\",\"上课时间\":\"2021-08-04 20:00 ~ 20:50\",\"上课地点\":\"西安市碑林区南院门粉巷了街A204\",\"联系电话\":\"18629530853\"}', '/pages/my/order/orderDetail?id=147', 0, 147);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_other`
--

CREATE TABLE `cmf_user_other` (
  `user_id` int(10) NOT NULL,
  `sign_day` int(10) NOT NULL DEFAULT '0' COMMENT '签单天数',
  `sign_coin` int(10) NOT NULL DEFAULT '0' COMMENT '签到金币',
  `order_coin` int(10) NOT NULL DEFAULT '0' COMMENT '订单金币',
  `invite_coin` int(10) NOT NULL DEFAULT '0' COMMENT '直接邀请金币',
  `f_invite_coin` int(10) NOT NULL DEFAULT '0' COMMENT '间接邀请金币'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `cmf_user_other`
--

INSERT INTO `cmf_user_other` (`user_id`, `sign_day`, `sign_coin`, `order_coin`, `invite_coin`, `f_invite_coin`) VALUES
(1, 0, 0, 0, 0, 0),
(2, 2, 35, 1000, 0, 0),
(3, 2, 25, 0, 0, 0),
(4, 2, 95, 7800, 0, 0),
(5, 3, 45, 1500, 0, 0),
(6, 1, 20, 0, 0, 0),
(7, 2, 50, 0, 0, 0),
(8, 0, 0, 0, 0, 0),
(9, 1, 10, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_rank`
--

CREATE TABLE `cmf_user_rank` (
  `id` int(10) NOT NULL,
  `rank_name` varchar(50) DEFAULT NULL,
  `user_level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `level_integral` int(10) NOT NULL DEFAULT '0',
  `thumbnail` varchar(255) DEFAULT NULL,
  `small_thumb` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(1000) DEFAULT NULL,
  `list_order` int(5) NOT NULL DEFAULT '1000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_user_rank`
--

INSERT INTO `cmf_user_rank` (`id`, `rank_name`, `user_level`, `level_integral`, `thumbnail`, `small_thumb`, `status`, `remark`, `list_order`) VALUES
(2, '梅花鹿级', 1, 1, 'user/20210709/06a87c3b82c31fa1f8d54a2cf3cc5844.png', 'user/20210713/2c917bdee48005ff1536bbdc95cc4a22.png', 1, '', 1),
(3, '麋鹿级', 2, 1000, 'user/20210709/751c6a364e82b7c33ae01914ee6e3ec9.png', 'user/20210713/cbb9f24e6f64edf1481e80594c99c241.png', 1, '', 2),
(4, '驯鹿级', 3, 5000, 'user/20210709/8ade9b58de7d9c8805bc25717f46af46.png', 'user/20210713/8a702f298acc0e7df992c2bd879c4c6e.png', 1, '', 3),
(5, '马鹿级', 4, 15000, 'user/20210709/ca148b98994944cb5afe849e99a24e46.png', 'user/20210713/6d01d4ccf0533d1c013bff11cd47e6e1.png', 1, '', 4),
(6, '长颈鹿级', 5, 30000, 'user/20210709/6d235e3a38604ced3d72db30b6018ecd.png', 'user/20210713/f666b0e86c3813c9c32f5a6de8980f9f.png', 1, '', 5);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_score_log`
--

CREATE TABLE `cmf_user_score_log` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `change` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '剩余积分',
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作积分等奖励日志表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_token`
--

CREATE TABLE `cmf_user_token` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';

--
-- 转存表中的数据 `cmf_user_token`
--

INSERT INTO `cmf_user_token` (`id`, `user_id`, `expire_time`, `create_time`, `token`, `device_type`) VALUES
(1, 2, 1645577662, 1630025662, 'cc8f377c5ac15df04870d72b034f4e8a5be0c37939bf115dba04bc3be8f9f9d6', 'wxapp'),
(2, 2, 1645579143, 1630027143, 'e8c03c1e0f4b1741d341d52799be3ec3889dd8c576ace55cf5b2879b3f23d9b1', 'web'),
(3, 3, 1645958505, 1630406505, '1f92002e9ffb49eb3a14f0b214d5a0d08da833087171a87230ac4486679f0e4f', 'wxapp'),
(4, 4, 1646042078, 1630490078, 'a1bebb135073e879ad07f92523b571619cb3bceb303d8b1056b4023d509a5296', 'wxapp'),
(5, 5, 1646117698, 1630565698, '8c829094aac15ed1f4f3004a9b1ea94460ba942b342cbae103b236c358b84a53', 'wxapp'),
(6, 6, 1646126748, 1630574748, '2e53b3c0cd0bea06a6c30ca7c8303151782e5d6d3b934b2e3daf0b6c96ff1cdc', 'wxapp'),
(7, 7, 1646127090, 1630575090, '1b5e566cdbbfc1b3dfc089cf6f1380e9e2ddefaf148c3ff9c642fce3a2d21bc7', 'wxapp'),
(8, 8, 1646276983, 1630724983, '3e10af532063a3b6e54eac815d821a1899eb6d8b6baf61d74f2e8c6740a106c8', 'wxapp'),
(9, 9, 1646277039, 1630725039, '9fcafa000f72a749829af6990dd1c0ecd7758d325f68fbcfbcabbdbb0e924cbb', 'wxapp');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_train`
--

CREATE TABLE `cmf_user_train` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT '0' COMMENT '用户id',
  `coach_user_id` int(10) DEFAULT NULL COMMENT '教练id',
  `start_time` int(10) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(10) DEFAULT NULL COMMENT '结束时间',
  `add_time` int(10) DEFAULT NULL,
  `student_id` int(10) DEFAULT '0' COMMENT '学生id',
  `train_time` int(10) NOT NULL DEFAULT '0' COMMENT '训练时间',
  `year` smallint(4) DEFAULT '0' COMMENT '年',
  `month` tinyint(2) DEFAULT '0' COMMENT '月',
  `day` tinyint(2) DEFAULT NULL COMMENT '天',
  `goods_id` int(10) DEFAULT '0' COMMENT '课程id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_user_train`
--

INSERT INTO `cmf_user_train` (`id`, `user_id`, `coach_user_id`, `start_time`, `end_time`, `add_time`, `student_id`, `train_time`, `year`, `month`, `day`, `goods_id`) VALUES
(3, 2, 2, 1623484800, 1623492000, 1624008424, 1, 7200, 2021, 6, 12, 5),
(4, 3, 2, 1625202000, 1625209200, 1625131377, 29, 7200, 2021, 7, 2, 4),
(5, 5, 2, 1624442400, 1624378800, 1625207191, 2, 1, 2021, 6, 23, 5),
(6, 2, 2, 1624168800, 1624176000, 1625539338, 1, 7200, 2021, 6, 20, 4),
(7, 3, 8, 1625562000, 1625569200, 1626321331, 30, 7200, 2021, 7, 6, 6),
(8, 3, 5, 1624777200, 1624788000, 1626321874, 26, 10800, 2021, 6, 27, 6),
(9, 5, 6, 1626440700, 1626441780, 1626440762, 58, 1080, 2021, 7, 16, 6),
(10, 4, 6, 1626440700, 1626441780, 1626440807, 59, 1080, 2021, 7, 16, 6),
(11, 73, 19, 1626483600, 1626486300, 1626482950, 63, 2700, 2021, 7, 17, 10),
(12, 35, 25, 1626490800, 1626493500, 1626493621, 54, 2700, 2021, 7, 17, 8),
(13, 75, 23, 1626498000, 1626500700, 1626501639, 62, 2700, 2021, 7, 17, 14),
(14, 83, 24, 1626512400, 1626515100, 1626511994, 82, 2700, 2021, 7, 17, 13),
(15, 72, 45, 1626523200, 1626525900, 1626527107, 61, 2700, 2021, 7, 17, 8),
(16, 38, 45, 1626523200, 1626525900, 1626527112, 81, 2700, 2021, 7, 17, 8),
(17, 66, 45, 1626523200, 1626525900, 1626527171, 55, 2700, 2021, 7, 17, 8),
(21, 3, 3, 1629104000, 1626091200, 1626769467, 51, 1, 2021, 8, 16, 6),
(23, 3, 5, 1625022000, 1625029200, 1626769663, 26, 7200, 2021, 6, 30, 5),
(24, 3, 5, 1624939200, 1624950000, 1626769690, 26, 10800, 2021, 6, 29, 2),
(25, 94, 25, 1626778800, 1626781800, 1626785431, 85, 3000, 2021, 7, 20, 9),
(26, 68, 25, 1626778800, 1626781800, 1626785455, 87, 3000, 2021, 7, 20, 9),
(27, 94, 25, 1626782400, 1626785400, 1626785470, 85, 3000, 2021, 7, 20, 8),
(28, 93, 25, 1626782400, 1626785400, 1626785485, 84, 3000, 2021, 7, 20, 8),
(29, 93, 25, 1626778800, 1626781800, 1626785493, 84, 3000, 2021, 7, 20, 9),
(30, 5, 5, 1627279200, 1627282200, 1627280225, 33, 3000, 2021, 7, 26, 19),
(44, 119, 23, 1627560000, 1627563000, 1627559222, 115, 3000, 2021, 7, 29, 9);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_train_day`
--

CREATE TABLE `cmf_user_train_day` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `date_time` int(10) DEFAULT NULL,
  `year` mediumint(5) DEFAULT NULL,
  `month` smallint(2) DEFAULT NULL,
  `day` smallint(2) DEFAULT NULL,
  `train_time` int(10) NOT NULL DEFAULT '0' COMMENT '训练时间',
  `class_hour` int(10) NOT NULL DEFAULT '0' COMMENT '课时'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_user_train_day`
--

INSERT INTO `cmf_user_train_day` (`id`, `user_id`, `date_time`, `year`, `month`, `day`, `train_time`, `class_hour`) VALUES
(8, 2, 1623427200, 2021, 6, 12, 7200, 1),
(10, 3, 1625155200, 2021, 7, 2, 7200, 1),
(11, 5, 1624377600, 2021, 6, 23, 1, 1),
(12, 2, 1624118400, 2021, 6, 20, 7200, 1),
(13, 3, 1625500800, 2021, 7, 6, 7200, 1),
(14, 3, 1624723200, 2021, 6, 27, 10800, 1),
(15, 5, 1626364800, 2021, 7, 16, 1080, 1),
(16, 4, 1626364800, 2021, 7, 16, 1080, 1),
(17, 73, 1626451200, 2021, 7, 17, 2700, 1),
(18, 35, 1626451200, 2021, 7, 17, 2700, 1),
(19, 75, 1626451200, 2021, 7, 17, 2700, 1),
(20, 83, 1626451200, 2021, 7, 17, 2700, 1),
(21, 72, 1626451200, 2021, 7, 17, 2700, 1),
(22, 38, 1626451200, 2021, 7, 17, 2700, 1),
(23, 66, 1626451200, 2021, 7, 17, 2700, 1),
(27, 3, 1629043200, 2021, 8, 16, 1, 1),
(29, 3, 1624982400, 2021, 6, 30, 7200, 1),
(30, 3, 1624896000, 2021, 6, 29, 10800, 1),
(31, 94, 1626710400, 2021, 7, 20, 6000, 2),
(32, 68, 1626710400, 2021, 7, 20, 3000, 1),
(33, 93, 1626710400, 2021, 7, 20, 6000, 2),
(34, 5, 1627228800, 2021, 7, 26, 3000, 1),
(48, 119, 1627488000, 2021, 7, 29, 3000, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_train_mouth`
--

CREATE TABLE `cmf_user_train_mouth` (
  `id` int(11) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `year` mediumint(5) DEFAULT NULL,
  `month` smallint(2) DEFAULT NULL,
  `train_time` int(10) NOT NULL DEFAULT '0',
  `class_hour` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_user_train_mouth`
--

INSERT INTO `cmf_user_train_mouth` (`id`, `user_id`, `year`, `month`, `train_time`, `class_hour`) VALUES
(9, 2, 2021, 6, 14400, 2),
(11, 3, 2021, 7, 14400, 2),
(12, 5, 2021, 6, 1, 1),
(13, 3, 2021, 6, 28800, 3),
(14, 5, 2021, 7, 4080, 2),
(15, 4, 2021, 7, 1080, 1),
(16, 73, 2021, 7, 2700, 1),
(17, 35, 2021, 7, 2700, 1),
(18, 75, 2021, 7, 2700, 1),
(19, 83, 2021, 7, 2700, 1),
(20, 72, 2021, 7, 2700, 1),
(21, 38, 2021, 7, 2700, 1),
(22, 66, 2021, 7, 2700, 1),
(26, 3, 2021, 8, 1, 1),
(27, 94, 2021, 7, 6000, 2),
(28, 68, 2021, 7, 3000, 1),
(29, 93, 2021, 7, 6000, 2),
(34, 119, 2021, 7, 3000, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_train_year`
--

CREATE TABLE `cmf_user_train_year` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `year` mediumint(5) DEFAULT NULL,
  `train_time` int(10) NOT NULL DEFAULT '0',
  `class_hour` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_user_train_year`
--

INSERT INTO `cmf_user_train_year` (`id`, `user_id`, `year`, `train_time`, `class_hour`) VALUES
(12, 2, 2021, 14400, 2),
(14, 3, 2021, 43201, 6),
(15, 5, 2021, 4081, 3),
(16, 4, 2021, 1080, 1),
(17, 73, 2021, 2700, 1),
(18, 35, 2021, 2700, 1),
(19, 75, 2021, 2700, 1),
(20, 83, 2021, 2700, 1),
(21, 72, 2021, 2700, 1),
(22, 38, 2021, 2700, 1),
(23, 66, 2021, 2700, 1),
(24, 94, 2021, 6000, 2),
(25, 68, 2021, 3000, 1),
(26, 93, 2021, 6000, 2),
(31, 119, 2021, 3000, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_verification_code`
--

CREATE TABLE `cmf_verification_code` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '表id',
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='手机邮箱数字验证码表';

--
-- 转储表的索引
--

--
-- 表的索引 `cmf_admin_menu`
--
ALTER TABLE `cmf_admin_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `controller` (`controller`);

--
-- 表的索引 `cmf_asset`
--
ALTER TABLE `cmf_asset`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_auth_access`
--
ALTER TABLE `cmf_auth_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `rule_name` (`rule_name`) USING BTREE;

--
-- 表的索引 `cmf_auth_rule`
--
ALTER TABLE `cmf_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD KEY `module` (`app`,`status`,`type`);

--
-- 表的索引 `cmf_cart`
--
ALTER TABLE `cmf_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- 表的索引 `cmf_coach_student`
--
ALTER TABLE `cmf_coach_student`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_comment`
--
ALTER TABLE `cmf_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `table_id_status` (`table_name`,`object_id`,`status`),
  ADD KEY `object_id` (`object_id`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `parent_id` (`parent_id`) USING BTREE,
  ADD KEY `create_time` (`create_time`) USING BTREE;

--
-- 表的索引 `cmf_coupon`
--
ALTER TABLE `cmf_coupon`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_coupon_type`
--
ALTER TABLE `cmf_coupon_type`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_device`
--
ALTER TABLE `cmf_device`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_goods`
--
ALTER TABLE `cmf_goods`
  ADD PRIMARY KEY (`goods_id`),
  ADD KEY `goods_sn` (`tags`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `last_update` (`last_update`),
  ADD KEY `goods_number` (`store_count`),
  ADD KEY `sort_order` (`list_order`);

--
-- 表的索引 `cmf_goods_brand`
--
ALTER TABLE `cmf_goods_brand`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_goods_category`
--
ALTER TABLE `cmf_goods_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- 表的索引 `cmf_goods_comment`
--
ALTER TABLE `cmf_goods_comment`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_goods_factory`
--
ALTER TABLE `cmf_goods_factory`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_goods_images`
--
ALTER TABLE `cmf_goods_images`
  ADD PRIMARY KEY (`img_id`);

--
-- 表的索引 `cmf_goods_mold`
--
ALTER TABLE `cmf_goods_mold`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_goods_sku`
--
ALTER TABLE `cmf_goods_sku`
  ADD PRIMARY KEY (`sku_id`);

--
-- 表的索引 `cmf_goods_style`
--
ALTER TABLE `cmf_goods_style`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_goods_tag`
--
ALTER TABLE `cmf_goods_tag`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_goods_time`
--
ALTER TABLE `cmf_goods_time`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_hook`
--
ALTER TABLE `cmf_hook`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_hook_plugin`
--
ALTER TABLE `cmf_hook_plugin`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_item_activity`
--
ALTER TABLE `cmf_item_activity`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_league_order`
--
ALTER TABLE `cmf_league_order`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_link`
--
ALTER TABLE `cmf_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- 表的索引 `cmf_meal_order`
--
ALTER TABLE `cmf_meal_order`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_sn` (`order_sn`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_status` (`order_status`),
  ADD KEY `pay_status` (`pay_status`);

--
-- 表的索引 `cmf_nav`
--
ALTER TABLE `cmf_nav`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_nav_menu`
--
ALTER TABLE `cmf_nav_menu`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_option`
--
ALTER TABLE `cmf_option`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- 表的索引 `cmf_order`
--
ALTER TABLE `cmf_order`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_sn` (`order_sn`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_status` (`order_status`),
  ADD KEY `shipping_status` (`shipping_status`),
  ADD KEY `pay_status` (`pay_status`),
  ADD KEY `shipping_id` (`shipping_code`),
  ADD KEY `pay_id` (`pay_code`);

--
-- 表的索引 `cmf_order_log`
--
ALTER TABLE `cmf_order_log`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 表的索引 `cmf_order_sub`
--
ALTER TABLE `cmf_order_sub`
  ADD PRIMARY KEY (`rec_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- 表的索引 `cmf_pay_log`
--
ALTER TABLE `cmf_pay_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_plugin`
--
ALTER TABLE `cmf_plugin`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_plugin_guestbook`
--
ALTER TABLE `cmf_plugin_guestbook`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_plugin_modules`
--
ALTER TABLE `cmf_plugin_modules`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_plugin_modules_citys`
--
ALTER TABLE `cmf_plugin_modules_citys`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_plugin_modules_column`
--
ALTER TABLE `cmf_plugin_modules_column`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_plugin_modules_day_data`
--
ALTER TABLE `cmf_plugin_modules_day_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `domain` (`admin_id`,`time`,`module_id`) USING BTREE;

--
-- 表的索引 `cmf_plugin_modules_day_info`
--
ALTER TABLE `cmf_plugin_modules_day_info`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `domain` (`admin_id`,`time`,`module_id`) USING BTREE;

--
-- 表的索引 `cmf_plugin_modules_tables`
--
ALTER TABLE `cmf_plugin_modules_tables`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_plugin_modules_tables_content`
--
ALTER TABLE `cmf_plugin_modules_tables_content`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_portal_category`
--
ALTER TABLE `cmf_portal_category`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_portal_category_post`
--
ALTER TABLE `cmf_portal_category_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `term_taxonomy_id` (`category_id`);

--
-- 表的索引 `cmf_portal_post`
--
ALTER TABLE `cmf_portal_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `create_time` (`create_time`) USING BTREE;

--
-- 表的索引 `cmf_portal_tag`
--
ALTER TABLE `cmf_portal_tag`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_portal_tag_post`
--
ALTER TABLE `cmf_portal_tag_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- 表的索引 `cmf_recharge`
--
ALTER TABLE `cmf_recharge`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_recharge_order`
--
ALTER TABLE `cmf_recharge_order`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_recycle_bin`
--
ALTER TABLE `cmf_recycle_bin`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_role`
--
ALTER TABLE `cmf_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `status` (`status`);

--
-- 表的索引 `cmf_role_user`
--
ALTER TABLE `cmf_role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `user_id` (`user_id`);

--
-- 表的索引 `cmf_route`
--
ALTER TABLE `cmf_route`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_slide`
--
ALTER TABLE `cmf_slide`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_slide_item`
--
ALTER TABLE `cmf_slide_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slide_id` (`slide_id`);

--
-- 表的索引 `cmf_spec`
--
ALTER TABLE `cmf_spec`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_spec_item`
--
ALTER TABLE `cmf_spec_item`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_store_seckill`
--
ALTER TABLE `cmf_store_seckill`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `goods_id` (`goods_id`) USING BTREE,
  ADD KEY `start_time` (`start_time`,`end_time`) USING BTREE,
  ADD KEY `is_del` (`is_del`) USING BTREE,
  ADD KEY `is_hot` (`is_hot`) USING BTREE,
  ADD KEY `is_show` (`status`) USING BTREE,
  ADD KEY `add_time` (`add_time`) USING BTREE,
  ADD KEY `sort` (`list_order`) USING BTREE,
  ADD KEY `is_postage` (`is_postage`) USING BTREE;

--
-- 表的索引 `cmf_student_type`
--
ALTER TABLE `cmf_student_type`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_supplier`
--
ALTER TABLE `cmf_supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `list_order` (`list_order`);

--
-- 表的索引 `cmf_theme`
--
ALTER TABLE `cmf_theme`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_theme_file`
--
ALTER TABLE `cmf_theme_file`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_third_party_user`
--
ALTER TABLE `cmf_third_party_user`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_user`
--
ALTER TABLE `cmf_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_login` (`user_login`),
  ADD KEY `user_nickname` (`user_nickname`);

--
-- 表的索引 `cmf_user_action`
--
ALTER TABLE `cmf_user_action`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_user_action_log`
--
ALTER TABLE `cmf_user_action_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_object_action` (`user_id`,`object`,`action`),
  ADD KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`);

--
-- 表的索引 `cmf_user_balance_log`
--
ALTER TABLE `cmf_user_balance_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_user_card`
--
ALTER TABLE `cmf_user_card`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_user_card_order`
--
ALTER TABLE `cmf_user_card_order`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_user_coach`
--
ALTER TABLE `cmf_user_coach`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_user_coin_log`
--
ALTER TABLE `cmf_user_coin_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_user_favorite`
--
ALTER TABLE `cmf_user_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`user_id`);

--
-- 表的索引 `cmf_user_group_card`
--
ALTER TABLE `cmf_user_group_card`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_user_like`
--
ALTER TABLE `cmf_user_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`user_id`);

--
-- 表的索引 `cmf_user_login_attempt`
--
ALTER TABLE `cmf_user_login_attempt`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_user_notice`
--
ALTER TABLE `cmf_user_notice`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_user_other`
--
ALTER TABLE `cmf_user_other`
  ADD PRIMARY KEY (`user_id`);

--
-- 表的索引 `cmf_user_rank`
--
ALTER TABLE `cmf_user_rank`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_user_score_log`
--
ALTER TABLE `cmf_user_score_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_user_token`
--
ALTER TABLE `cmf_user_token`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_user_train`
--
ALTER TABLE `cmf_user_train`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_user_train_day`
--
ALTER TABLE `cmf_user_train_day`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_user_train_mouth`
--
ALTER TABLE `cmf_user_train_mouth`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_user_train_year`
--
ALTER TABLE `cmf_user_train_year`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cmf_verification_code`
--
ALTER TABLE `cmf_verification_code`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cmf_admin_menu`
--
ALTER TABLE `cmf_admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- 使用表AUTO_INCREMENT `cmf_asset`
--
ALTER TABLE `cmf_asset`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- 使用表AUTO_INCREMENT `cmf_auth_access`
--
ALTER TABLE `cmf_auth_access`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `cmf_auth_rule`
--
ALTER TABLE `cmf_auth_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键', AUTO_INCREMENT=229;

--
-- 使用表AUTO_INCREMENT `cmf_cart`
--
ALTER TABLE `cmf_cart`
  MODIFY `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '购物车表';

--
-- 使用表AUTO_INCREMENT `cmf_coach_student`
--
ALTER TABLE `cmf_coach_student`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- 使用表AUTO_INCREMENT `cmf_comment`
--
ALTER TABLE `cmf_comment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cmf_coupon`
--
ALTER TABLE `cmf_coupon`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- 使用表AUTO_INCREMENT `cmf_coupon_type`
--
ALTER TABLE `cmf_coupon_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `cmf_device`
--
ALTER TABLE `cmf_device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `cmf_goods`
--
ALTER TABLE `cmf_goods`
  MODIFY `goods_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品id', AUTO_INCREMENT=21;

--
-- 使用表AUTO_INCREMENT `cmf_goods_brand`
--
ALTER TABLE `cmf_goods_brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id';

--
-- 使用表AUTO_INCREMENT `cmf_goods_category`
--
ALTER TABLE `cmf_goods_category`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品分类id', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `cmf_goods_comment`
--
ALTER TABLE `cmf_goods_comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `cmf_goods_factory`
--
ALTER TABLE `cmf_goods_factory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `cmf_goods_images`
--
ALTER TABLE `cmf_goods_images`
  MODIFY `img_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cmf_goods_mold`
--
ALTER TABLE `cmf_goods_mold`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id自增', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `cmf_goods_sku`
--
ALTER TABLE `cmf_goods_sku`
  MODIFY `sku_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cmf_goods_style`
--
ALTER TABLE `cmf_goods_style`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cmf_goods_tag`
--
ALTER TABLE `cmf_goods_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `cmf_goods_time`
--
ALTER TABLE `cmf_goods_time`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- 使用表AUTO_INCREMENT `cmf_hook`
--
ALTER TABLE `cmf_hook`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- 使用表AUTO_INCREMENT `cmf_hook_plugin`
--
ALTER TABLE `cmf_hook_plugin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `cmf_item_activity`
--
ALTER TABLE `cmf_item_activity`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `cmf_league_order`
--
ALTER TABLE `cmf_league_order`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- 使用表AUTO_INCREMENT `cmf_link`
--
ALTER TABLE `cmf_link`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cmf_meal_order`
--
ALTER TABLE `cmf_meal_order`
  MODIFY `order_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单id', AUTO_INCREMENT=26;

--
-- 使用表AUTO_INCREMENT `cmf_nav`
--
ALTER TABLE `cmf_nav`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `cmf_nav_menu`
--
ALTER TABLE `cmf_nav_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `cmf_option`
--
ALTER TABLE `cmf_option`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `cmf_order`
--
ALTER TABLE `cmf_order`
  MODIFY `order_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单id';

--
-- 使用表AUTO_INCREMENT `cmf_order_log`
--
ALTER TABLE `cmf_order_log`
  MODIFY `action_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表id';

--
-- 使用表AUTO_INCREMENT `cmf_order_sub`
--
ALTER TABLE `cmf_order_sub`
  MODIFY `rec_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表id自增';

--
-- 使用表AUTO_INCREMENT `cmf_pay_log`
--
ALTER TABLE `cmf_pay_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `cmf_plugin`
--
ALTER TABLE `cmf_plugin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `cmf_plugin_guestbook`
--
ALTER TABLE `cmf_plugin_guestbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `cmf_plugin_modules`
--
ALTER TABLE `cmf_plugin_modules`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `cmf_plugin_modules_column`
--
ALTER TABLE `cmf_plugin_modules_column`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id';

--
-- 使用表AUTO_INCREMENT `cmf_plugin_modules_day_data`
--
ALTER TABLE `cmf_plugin_modules_day_data`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `cmf_plugin_modules_day_info`
--
ALTER TABLE `cmf_plugin_modules_day_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 使用表AUTO_INCREMENT `cmf_plugin_modules_tables`
--
ALTER TABLE `cmf_plugin_modules_tables`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `cmf_plugin_modules_tables_content`
--
ALTER TABLE `cmf_plugin_modules_tables_content`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `cmf_portal_category`
--
ALTER TABLE `cmf_portal_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `cmf_portal_category_post`
--
ALTER TABLE `cmf_portal_category_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cmf_portal_post`
--
ALTER TABLE `cmf_portal_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cmf_portal_tag`
--
ALTER TABLE `cmf_portal_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id';

--
-- 使用表AUTO_INCREMENT `cmf_portal_tag_post`
--
ALTER TABLE `cmf_portal_tag_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cmf_recharge`
--
ALTER TABLE `cmf_recharge`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `cmf_recharge_order`
--
ALTER TABLE `cmf_recharge_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `cmf_recycle_bin`
--
ALTER TABLE `cmf_recycle_bin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cmf_role`
--
ALTER TABLE `cmf_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `cmf_role_user`
--
ALTER TABLE `cmf_role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `cmf_route`
--
ALTER TABLE `cmf_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `cmf_slide`
--
ALTER TABLE `cmf_slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `cmf_slide_item`
--
ALTER TABLE `cmf_slide_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `cmf_spec`
--
ALTER TABLE `cmf_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格表';

--
-- 使用表AUTO_INCREMENT `cmf_spec_item`
--
ALTER TABLE `cmf_spec_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格项id';

--
-- 使用表AUTO_INCREMENT `cmf_store_seckill`
--
ALTER TABLE `cmf_store_seckill`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品秒杀产品表id';

--
-- 使用表AUTO_INCREMENT `cmf_student_type`
--
ALTER TABLE `cmf_student_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- 使用表AUTO_INCREMENT `cmf_supplier`
--
ALTER TABLE `cmf_supplier`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色id', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `cmf_theme`
--
ALTER TABLE `cmf_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `cmf_theme_file`
--
ALTER TABLE `cmf_theme_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `cmf_third_party_user`
--
ALTER TABLE `cmf_third_party_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `cmf_user`
--
ALTER TABLE `cmf_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `cmf_user_action`
--
ALTER TABLE `cmf_user_action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `cmf_user_action_log`
--
ALTER TABLE `cmf_user_action_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cmf_user_balance_log`
--
ALTER TABLE `cmf_user_balance_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cmf_user_card`
--
ALTER TABLE `cmf_user_card`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `cmf_user_card_order`
--
ALTER TABLE `cmf_user_card_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `cmf_user_coach`
--
ALTER TABLE `cmf_user_coach`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- 使用表AUTO_INCREMENT `cmf_user_coin_log`
--
ALTER TABLE `cmf_user_coin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- 使用表AUTO_INCREMENT `cmf_user_favorite`
--
ALTER TABLE `cmf_user_favorite`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用表AUTO_INCREMENT `cmf_user_group_card`
--
ALTER TABLE `cmf_user_group_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `cmf_user_like`
--
ALTER TABLE `cmf_user_like`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cmf_user_login_attempt`
--
ALTER TABLE `cmf_user_login_attempt`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cmf_user_notice`
--
ALTER TABLE `cmf_user_notice`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- 使用表AUTO_INCREMENT `cmf_user_rank`
--
ALTER TABLE `cmf_user_rank`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `cmf_user_score_log`
--
ALTER TABLE `cmf_user_score_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cmf_user_token`
--
ALTER TABLE `cmf_user_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `cmf_user_train`
--
ALTER TABLE `cmf_user_train`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- 使用表AUTO_INCREMENT `cmf_user_train_day`
--
ALTER TABLE `cmf_user_train_day`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- 使用表AUTO_INCREMENT `cmf_user_train_mouth`
--
ALTER TABLE `cmf_user_train_mouth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- 使用表AUTO_INCREMENT `cmf_user_train_year`
--
ALTER TABLE `cmf_user_train_year`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- 使用表AUTO_INCREMENT `cmf_verification_code`
--
ALTER TABLE `cmf_verification_code`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表id';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
