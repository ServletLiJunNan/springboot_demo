#CREATE DATABASE IF NOT EXISTS decobim default charset utf8mb4 COLLATE utf8mb4_general_ci;
# grant all privileges on *.* to hzxx@'%' identified by 'u#fj4_Dk1';
# grant all privileges on *.* to hzxx@'localhost' identified by 'u#fj4_Dk1';
/* 用户： 所有在系统中存在的人都需要在这个表格中存在 */
CREATE TABLE user(
  userId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  mobile VARCHAR(20) NOT NULL DEFAULT '',    /* 用户的登陆凭证 */
  pwd VARCHAR(200) NOT NULL DEFAULT '',

  avatarUrl VARCHAR(200) NOT NULL DEFAULT '',/*数据库存放的url不带安全签名，给前端的时候需要加安全签名*/
  pfileId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  name VARCHAR(50) NOT NULL DEFAULT '',      /* 用户姓名 */

  status VARCHAR(10) NOT NULL DEFAULT '',   /* deleted: 已删除， normal：正常 */
  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/* 公司 */
CREATE TABLE company(
  companyId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  name VARCHAR(50) NOT NULL DEFAULT '',

  status VARCHAR(10) NOT NULL DEFAULT '',    /* deleted：已删除， normal： 正常 */
  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/* 公司和用户的关系表， 目前一个用户最多只能属于一个公司，一个用户也可以不在任何公司中 */
CREATE TABLE companyuser(
  companyUserId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  companyId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  userId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  status VARCHAR(10) NOT NULL DEFAULT '',    /* deleted：已删除， normal： 正常 */
  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/* 角色， 一个用户在一个项目中，必须有一个角色。 一个项目中每一个人都必须有一个角色 */
CREATE TABLE role(
  roleId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  name VARCHAR(50) NOT NULL DEFAULT '', /*项目经理，质量员，深化设计员，施工员，材料员，预决算员，安全员，仓管员*/

  refId BIGINT UNSIGNED NOT NULL DEFAULT 0,  -- 默认角色是全局的，只有了慧筑的系统管理员能修改全局的角色。
  refType VARCHAR(50) NOT NULL DEFAULT '', -- 角色所属的对象， '' :全局   'project':项目   'company':公司

  status VARCHAR(10) NOT NULL DEFAULT '',     /* deleted：已删除， normal： 正常 */
  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



/* 权限： 每一个权限对应一个操作或者资源。 一个角色代表权限的集合 */
CREATE TABLE permission(
  permissionId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  name VARCHAR(50) NOT NULL DEFAULT '',

  status VARCHAR(10) NOT NULL DEFAULT '',           /* deleted：已删除， normal： 正常 */
  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/* 权限和角色的关系表 */
CREATE TABLE permissionrole(
  permissionRoleId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  permissionId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  roleId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  status VARCHAR(10) NOT NULL DEFAULT '',               /* deleted：已删除， normal： 正常 */
  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE project(
  projectId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  name VARCHAR(50) NOT NULL DEFAULT '',

  province VARCHAR(50) NOT NULL DEFAULT '', /* 项目的详细地址 */
  city VARCHAR(50) NOT NULL DEFAULT '',
  district VARCHAR(50) NOT NULL DEFAULT '',
  address VARCHAR(200) NOT NULL DEFAULT '',

  avatarUrl VARCHAR(200) NOT NULL DEFAULT '',/* 本字段的操作同用户头像*/
  pfileId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  progress INT NOT NULL DEFAULT 0,

  code VARCHAR(50) NOT NULL DEFAULT '',           /* 项目编码 */
  builder VARCHAR(200) NOT NULL DEFAULT '',       /* 建设单位 */
  designer VARCHAR(200) NOT NULL DEFAULT '',      /* 设计单位 */
  decorator VARCHAR(200) NOT NULL DEFAULT '',     /* 施工单位 */
  area DECIMAL(10,2) NOT NULL DEFAULT '0.00',     /* 施工面积，默认单位平方米 */
  buildingType VARCHAR(50) NOT NULL DEFAULT '',   /* 项目类型 */
  remark VARCHAR(1000) NOT NULL DEFAULT '',       /* 备注 */

  companyId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  companyName VARCHAR(50) NOT NULL DEFAULT '',

  status VARCHAR(10) NOT NULL DEFAULT '',         /* working：在建， done：竣工， 已删除：deleted */
  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* 班组 */
/*
DROP TABLE IF EXISTS workteam ;
CREATE TABLE workteam(
    workteamId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    leaderId BIGINT UNSIGNED NOT NULL DEFAULT 0,   # 带班人id
    leaderName VARCHAR(50) NOT NULL DEFAULT '',    # 现场带班人姓名
    leaderMobile VARCHAR(20) NOT NULL DEFAULT '',  # 带班人电话

    scope VARCHAR(50) NOT NULL DEFAULT '',   # 权责范围，如：(16-18层)
    remark VARCHAR(200) NOT NULL DEFAULT '', # 备注

    status VARCHAR(10) NOT NULL DEFAULT '',  # deleted：已删除， normal：正常
    created DATETIME NOT NULL,
    lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
*/

/* 供应商 */
/*
DROP TABLE IF EXISTS supplier ;
CREATE TABLE supplier(
    supplierId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    contactUserId BIGINT UNSIGNED NOT NULL DEFAULT 0,   # 带班人id
    contactUserName VARCHAR(50) NOT NULL DEFAULT '',    # 现场带班人姓名
    contactUserMobile VARCHAR(20) NOT NULL DEFAULT '',  # 带班人电话

    -- materialId BIGINT UNSIGNED NOT NULL DEFAULT 0,      # 材料id

    materialName VARCHAR(50) NOT NULL DEFAULT '',        # 材料名称

    scope VARCHAR(50) NOT NULL DEFAULT '',               # 权责范围，如：(16-18层)
    remark VARCHAR(200) NOT NULL DEFAULT '',             # 备注

    status VARCHAR(10) NOT NULL DEFAULT '',  # deleted：已删除， normal：正常
    created DATETIME NOT NULL,
    lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
*/

/* 项目，人员，角色的关系表。 每一行表示 用户在项目中担当的角色 */
CREATE TABLE member(
  memberId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  projectId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  projectName VARCHAR(50) NOT NULL DEFAULT '',

  userId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  userName VARCHAR(50) NOT NULL DEFAULT '',

  roleId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  roleName VARCHAR(50) NOT NULL DEFAULT '',

  scope VARCHAR(50) NOT NULL DEFAULT '',   /* 权责范围 */
  remark VARCHAR(200) NOT NULL DEFAULT '', /* 备注 */

  status VARCHAR(10) NOT NULL DEFAULT '',  /* deleted：已删除， normal：正常 */
  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* 验证码短信 */
CREATE TABLE sms(
  smsId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  mobile VARCHAR(20) NOT NULL DEFAULT '',
  code VARCHAR(50) NOT NULL DEFAULT '',           /* 验证码 */

  status VARCHAR(10) NOT NULL DEFAULT '',
  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* 项目邀请， 公司邀请 */
CREATE TABLE invitation(
  invitationId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  mobile VARCHAR(20) NOT NULL DEFAULT '',

  roleId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  refId BIGINT UNSIGNED NOT NULL DEFAULT 0, /* 邀请加入 project | company 的id */
  refType VARCHAR(20) NOT NULL DEFAULT '',  /* ref_type: project, company */

  senderId BIGINT UNSIGNED NOT NULL DEFAULT 0,    /* 发邀请人 */
  receiverId BIGINT UNSIGNED NOT NULL DEFAULT 0,  /* 被邀请人 */

  status VARCHAR(10) NOT NULL DEFAULT '',

  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* 虚拟文件 */
CREATE TABLE vfile(
  vfileId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  name VARCHAR(100) NOT NULL DEFAULT '',
  path VARCHAR(300) NOT NULL DEFAULT '',/*（虚拟）路径，仅显示（查询）用。新增时不用填写*/
  parentId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  type VARCHAR(20) NOT NULL DEFAULT '',/* file or folder*/

  version INT NOT NULL DEFAULT 1,

  ownerId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  ownerName VARCHAR(50) NOT NULL DEFAULT '',  /* owner：创建人 */

  projectId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  status VARCHAR(10) NOT NULL DEFAULT '',

  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* 模型，也就是revit文件中导出的一个轻量化模型，是一个目录，目录下有若干文件 */
CREATE TABLE model(
  modelId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  name VARCHAR(100) NOT NULL DEFAULT '',

  svfFileId BIGINT UNSIGNED NOT NULL DEFAULT 0,  # svf（模型的入口文件，一个模型只有一个）文件id
  svfFileUri VARCHAR(200) NOT NULL DEFAULT '',  # svf文件的uri

  sdbFileId BIGINT UNSIGNED NOT NULL DEFAULT 0,  # model.sdb 的文件id
  sdbFileUri VARCHAR(200) NOT NULL DEFAULT '',  # model.sdb 文件的uri

  version INT NOT NULL DEFAULT 1,

  ownerId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  ownerName VARCHAR(50) NOT NULL DEFAULT '',  /* owner：创建人 */

  projectId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  status VARCHAR(10) NOT NULL DEFAULT '',

  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE modelview(
  modelViewId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  state VARCHAR(1500) NOT NULL DEFAULT '', #轻量化模型中表示视图的参数

  avatarUrl VARCHAR(200) NOT NULL DEFAULT '',/*缩略图*/
  pfileId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  name VARCHAR(100) NOT NULL DEFAULT '', # 视图名称

  status VARCHAR(10) NOT NULL DEFAULT '',

  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/* 物理文件 */
CREATE TABLE pfile(
  pfileId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  # vfileId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  refType VARCHAR(50) NOT NULL DEFAULT '',      # pfile 对应的宿主类型, vfile 或者 model (基本对应表明一致)
  refId BIGINT UNSIGNED NOT NULL DEFAULT 0,     # 宿主的id

  version INT NOT NULL DEFAULT 1,/*对应vfile的当时版本号*/

  ownerId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  ownerName VARCHAR(50) NOT NULL DEFAULT '',/*owner : 创建人*/

  projectId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  mimeType VARCHAR(200) NOT NULL DEFAULT '',/*mimeType: 小写文件扩展名*/
  name VARCHAR(200) NOT NULL DEFAULT '',
  uri VARCHAR(200) NOT NULL DEFAULT '',
  volume INT NOT NULL DEFAULT 0,/*文件大小*/
  hash VARCHAR(200) NOT NULL DEFAULT '',/*oss中hash*/

  status VARCHAR(10) NOT NULL DEFAULT '',

  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* log */
CREATE TABLE log (
  logId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  content VARCHAR(500) NOT NULL DEFAULT '',

  projectId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  ownerId BIGINT UNSIGNED DEFAULT 0,
  ownerName VARCHAR(200) DEFAULT '',

  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* 操作日志 */
CREATE TABLE event (
  eventId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  name VARCHAR(50) NOT NULL DEFAULT '',

  projectId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  ownerId BIGINT UNSIGNED DEFAULT 0,
  ownerName VARCHAR(200) DEFAULT '',

  type VARCHAR(200) NOT NULL DEFAULT '',

  refId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  refType VARCHAR(100) NOT NULL DEFAULT '',

  description VARCHAR(200) NOT NULL DEFAULT '',

  data VARCHAR(200) NOT NULL DEFAULT '',

  status VARCHAR(10) NOT NULL DEFAULT '',

  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/* 二维码 */
CREATE TABLE barcode (
  barcodeId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  content VARCHAR(200) NOT NULL DEFAULT '',  # 必须全局唯一，最好是uuid

  projectId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  pfileId BIGINT UNSIGNED NOT NULL DEFAULT 0,   # 二维码的文件的id
  pfileUri VARCHAR(200) NOT NULL DEFAULT '',   # 二维码的文件的id

  ownerId BIGINT UNSIGNED DEFAULT 0,
  ownerName VARCHAR(200) DEFAULT '',

  remark VARCHAR(200) NOT NULL DEFAULT '',   # 备注

  type VARCHAR(10) NOT NULL DEFAULT '',   # 类型(vfile，则是区域二维码；构件，则是构件二维码)

  status VARCHAR(10) NOT NULL DEFAULT '',

  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/* 二维码明细 */
CREATE TABLE barcodeitem (
  barcodeItemId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  barcodeId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  barcodeContent VARCHAR(200) NOT NULL DEFAULT '',

  projectId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  refType VARCHAR(100) NOT NULL DEFAULT '',   # 明细类型(其实就是表名。目前已知的值有 vfile modelview )
  refId BIGINT UNSIGNED NOT NULL DEFAULT 0,   # 明细id（主键）

  remark VARCHAR(200) NOT NULL DEFAULT '',   # 备注

  status VARCHAR(10) NOT NULL DEFAULT '',

  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/* 任务表（原话题表） */
CREATE TABLE task(
  taskId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  title VARCHAR(100) NOT NULL DEFAULT '',
  content VARCHAR(500) NOT NULL DEFAULT '',

  ownerId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  ownerName VARCHAR(50) NOT NULL DEFAULT '',  /* owner：创建人 */
  avatarUrl VARCHAR(200) NOT NULL DEFAULT '',  # 创建人的头像
  pfileId BIGINT UNSIGNED NOT NULL DEFAULT 0,  # 创建人头像文件的id

  deadline VARCHAR(50) NOT NULL DEFAULT '',        #整改期限
  property VARCHAR(50) NOT NULL DEFAULT '',        #性质
  specialty VARCHAR(50) NOT NULL DEFAULT '',        #专业
  rank VARCHAR(50) NOT NULL DEFAULT '',        #等级
  percent INT UNSIGNED NOT NULL DEFAULT 0, #任务百分比(冗余)，最新的百分比数据

  modelViewId BIGINT UNSIGNED NOT NULL DEFAULT 0,        #模型视图id
  elementId VARCHAR(100) NOT NULL DEFAULT '', # 模型中构件id

  state VARCHAR(10) NOT NULL DEFAULT '',         #任务状态 进行process 完成finish 关闭closed

  projectId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  status VARCHAR(10) NOT NULL DEFAULT '',

  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/* 任务明细表 */
CREATE TABLE taskitem(
  taskItemId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  taskId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  content VARCHAR(500) NOT NULL DEFAULT '',

  ownerId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  ownerName VARCHAR(50) NOT NULL DEFAULT '',  /* owner：创建人 */
  avatarUrl VARCHAR(200) NOT NULL DEFAULT '',  # 创建人的头像
  pfileId BIGINT UNSIGNED NOT NULL DEFAULT 0,  # 创建人头像文件的id

  percent INT UNSIGNED NOT NULL DEFAULT 0, #任务百分比(数字)
  type VARCHAR(10) NOT NULL DEFAULT '',        #类型 post表示评论  process 表示过程


  projectId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  status VARCHAR(10) NOT NULL DEFAULT '',

  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



/* 任务附件表 */
CREATE TABLE attachment(
  attachmentId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  refType VARCHAR(50) NOT NULL DEFAULT '',      # 对应的宿主类型, task 或者 taskitem (基本对应表名一致)
  refId BIGINT UNSIGNED NOT NULL DEFAULT 0,     # 宿主的id

  name VARCHAR(100) NOT NULL DEFAULT '',

  pfileId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  uri VARCHAR(200) NOT NULL DEFAULT '',

  ownerId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  ownerName VARCHAR(50) NOT NULL DEFAULT '',  /* owner：创建人 */

  projectId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  status VARCHAR(10) NOT NULL DEFAULT '',

  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* 任务相关人 */
CREATE TABLE taskuser(
  taskUserId BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  taskId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  userId BIGINT UNSIGNED NOT NULL DEFAULT 0,
  userName VARCHAR(200) NOT NULL DEFAULT '',
  avatarUrl VARCHAR(200) NOT NULL DEFAULT '',

  type VARCHAR(10) NOT NULL DEFAULT '',  #人员类型  executor 执行人；supervisor 监督人

  projectId BIGINT UNSIGNED NOT NULL DEFAULT 0,

  status VARCHAR(10) NOT NULL DEFAULT '',

  created DATETIME NOT NULL,
  lastmod TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
