include $(TOPDIR)/rules.mk

PKG_NAME:=ysfbmdirect
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/stefanolande/YSFBMDirect.git
PKG_SOURCE_VERSION:=main
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=BI4PCS <qzyuebing@126.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/ysfbmdirect
  SECTION:=net
  CATEGORY:=Network
  TITLE:=YSFBMDirect - YSF to BrandMeister direct connection
  DEPENDS:=+libstdcpp
  URL:=https://github.com/stefanolande/YSFBMDirect
endef

define Package/ysfbmdirect/description
  YSFBMDirect is a software that creates a direct connection between 
  a YSF reflector and a BrandMeister master server.
endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CXX="$(TARGET_CXX)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)"
endef

define Package/ysfbmdirect/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/YSFBMDirect $(1)/usr/bin/
	
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/ysfbmdirect.init $(1)/etc/init.d/ysfbmdirect
	
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/ysfbmdirect.config $(1)/etc/config/ysfbmdirect
endef

$(eval $(call BuildPackage,ysfbmdirect))