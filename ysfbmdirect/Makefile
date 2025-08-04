include $(TOPDIR)/rules.mk

# 基本信息配置
PKG_NAME:=ysfbmdirect
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

# 源代码获取方式
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/stefanolande/YSFBMDirect.git
PKG_SOURCE_VERSION:=HEAD
PKG_MIRROR_HASH:=skip

# 维护者信息
PKG_MAINTAINER:=Your Name <your.email@example.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

# 包含OpenWRT构建环境
include $(INCLUDE_DIR)/package.mk

# 软件包定义
define Package/ysfbmdirect
  SECTION:=net
  CATEGORY:=Network
  TITLE:=YSFBMDirect桥接工具
  DEPENDS:=+libstdcpp
  URL:=https://github.com/stefanolande/YSFBMDirect
endef

# 软件包描述
define Package/ysfbmdirect/description
  YSFBMDirect是一个在YSF反射器和BrandMeister主服务器之间
  建立直接连接的桥接工具。
endef

# 构建配置
define Build/Configure
  # 无需特殊配置
endef

# 编译指令
define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CXXFLAGS="$(TARGET_CXXFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)"
endef

# 安装配置
define Package/ysfbmdirect/install
	# 安装可执行文件
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/YSFBMDirect $(1)/usr/bin/
	
	# 安装init脚本
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/ysfbmdirect.init $(1)/etc/init.d/ysfbmdirect
	
	# 安装配置文件
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/ysfbmdirect.config $(1)/etc/config/ysfbmdirect
endef

# 评估构建
$(eval $(call BuildPackage,ysfbmdirect))