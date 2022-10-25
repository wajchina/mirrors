# 开源镜像站

## 说明

本项目是镜像服务器的前端与后台维护脚本源码。

前端页面会定时（本项目默认为1分钟，注：定时刷新功能不支持 IE8 及以下浏览器）从后台获取各同步源数据状态，并刷新至浏览器。

### 默认配置

- 镜像路径：/data/mirrors/web/
- 程序路径：/data/mirrors/tunasync/
- 日志路径：/data/mirrors/log/

### 安装部署
- 获取代码
    ```
    # mkdir -p /data/mirrors && cd /data/mirrors
    # git clone OUR_PROJECT_URL
    ```
- 初始化
    ```
    # /data/mirrors/tunasync/scripts/setup.sh
    ```
- 启动
    ```
    ## 主管理服务
    # systemctl start tunasync-manager
    ## 按需启动镜像同步
    # systemctl start tunasync-anaconda
    # systemctl start tunasync-bioconductor
    # systemctl start tunasync-centos
    # systemctl start tunasync-centos-vault
    # systemctl start tunasync-CPAN
    # systemctl start tunasync-CRAN
    # systemctl start tunasync-debuginfo
    # systemctl start tunasync-epel
    # systemctl start tunasync-pypi
    ```
- 配置http服务  
  以apache为例
    ```
    # cat << EOF >> /etc/httpd/conf.d/mirrors.conf 
    DocumentRoot "/data/mirrors/web"
    <Directory "/data/mirrors/web">
        Options Indexes FollowSymLinks
        IndexOptions FancyIndexing NameWidth=* IconWidth=16 IconHeight=16
        AllowOverride None
        Require all granted
    </Directory>
    EOF
    ```

### 其他

更多信息可参阅博客 [使用 tunasync 搭建开源镜像站](http://weyo.me/pages/techs/how-to-make-a-mirror-site)。

## 致谢

本项目前端页面样式参考自[网易开源镜像站](http://mirrors.163.com/)，镜像使用帮助内容参考自[网易开源镜像站](http://mirrors.163.com/)、[清华大学开源软件镜像站](https://mirrors.tuna.tsinghua.edu.cn/)、[USTC open source software mirror](https://mirrors.ustc.edu.cn/)，在此一并表示感谢！