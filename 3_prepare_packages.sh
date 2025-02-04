./scripts/feeds update -a && ./scripts/feeds install -a
rm -rf feeds/packages/libs/libcap/ && svn co https://github.com/openwrt/openwrt/trunk/package/libs/libcap feeds/packages/libs/libcap
rm -rf feeds/packages/lang/golang/ && svn co https://github.com/coolsnowwolf/packages/trunk/lang/golang feeds/packages/lang/golang
sed -i '/enable-jsonc/i\\t--disable-cloud \\' feeds/packages/admin/netdata/Makefile

# fix docker build with golang
rm -rf feeds/packages/utils/containerd && svn export https://github.com/biliwala/packages/branches/docker-ce/utils/containerd feeds/packages/utils/containerd
rm -rf feeds/packages/utils/docker-ce && svn export https://github.com/biliwala/packages/branches/docker-ce/utils/docker-ce feeds/packages/utils/docker-ce
rm -rf feeds/packages/utils/docker-compose && svn export https://github.com/biliwala/packages/branches/docker-ce/utils/docker-compose feeds/packages/utils/docker-compose
rm -rf feeds/packages/utils/libnetwork && svn export https://github.com/biliwala/packages/branches/docker-ce/utils/libnetwork feeds/packages/utils/libnetwork
rm -rf feeds/packages/utils/runc && svn export https://github.com/biliwala/packages/branches/docker-ce/utils/runc feeds/packages/utils/runc

cd package/lean/
if [[ `pwd` == *"rk3328"* ]]; then
  rm -rf luci-app-oled/ && git clone https://github.com/NateLol/luci-app-oled
fi
[ ! -d luci-app-adguardhome ] && git clone https://github.com/rufengsuixing/luci-app-adguardhome
[ ! -d luci-app-mentohust ] && git clone https://github.com/BoringCat/luci-app-mentohust
[ ! -d mentohust ] && svn export https://github.com/immortalwrt/packages/trunk/net/mentohust
[ ! -d luci-app-jd-dailybonus ] && git clone https://github.com/jerrykuku/luci-app-jd-dailybonus
rm -rf luci-theme-argon*/ ../lean/luci-theme-argon/ && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon
rm -rf luci-theme-edge/ && git clone -b 18.06 https://github.com/garypang13/luci-theme-edge
rm -rf luci-theme-infinityfreedom/ && git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom
rm -rf luci-app-chinadns-ng/ && git clone https://github.com/WuSiYu/luci-app-chinadns-ng
rm -rf openwrt-chinadns-ng/ && git clone https://github.com/pexcn/openwrt-chinadns-ng && sed -i 's/\$(PKG_BUILD_DIR)\/chinadns-ng-update-list\.sh/files\/chinadns-ng-update-list\.sh/g' openwrt-chinadns-ng/Makefile
rm -rf v2ray/ && mkdir v2ray && cd v2ray && wget https://github.com/coolsnowwolf/lede/raw/622af09a79af119f4f719a50988b5b314f723383/package/lean/v2ray/Makefile && sed -i 's/4\.34\.0/4\.37\.2/g' Makefile && sed -i 's/b250f569cb0369f394f63184e748f1df0c90500feb8a1bf2276257c4c8b81bee/ece74b2f0e04d9cd487d1b4d79010f0269b6ee0742aaeb147979e5b97639ffa3/g' Makefile && cd ..
rm -rf v2ray-plugin/ && mkdir v2ray-plugin && cd v2ray-plugin && wget https://github.com/coolsnowwolf/lede/raw/763081f891c89f86fa6de0defdbfe359fb3aec92/package/lean/v2ray-plugin/Makefile && cd ..
rm -rf luci-app-ssr-plus/ && svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus
rm -rf shadowsocksr-libev/ && svn co https://github.com/fw876/helloworld/trunk/shadowsocksr-libev
rm -rf trojan/ && svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/trojan
rm -rf autocore/ && svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/autocore
rm -rf luci-app-unblockmusic/ && svn export -r3322 https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-unblockmusic
svn co https://github.com/songchenwen/nanopi-r2s/trunk/luci-app-r2sflasher
sed -i "s/option limit_enable '1'/option limit_enable '0'/" nft-qos/files/nft-qos.config
cd ../../
