# 使用 PHP 5.4.34 和 Apache 的基础镜像
FROM php:5.4.34-apache

# 安装所需的 PHP 扩展
# 以下是一些常用的扩展，您可以根据需要添加或删除
RUN docker-php-ext-install mysqli pdo pdo_mysql

# 下载 WordPress 5.1.17 并解压到 Apache 服务器的根目录
RUN curl -O https://wordpress.org/wordpress-5.1.19.tar.gz \
    && tar -xvf wordpress-5.1.19.tar.gz -C /var/www/html --strip-components=1 \
    && rm wordpress-5.1.19.tar.gz

# 更改文件所有权和权限以适应 Apache
#RUN chown -R www-data:www-data /var/www/html \
#    && chmod -R 755 /var/www/html
RUN chmod -R 755 /var/www/html

# 暴露 80 端口以供访问
EXPOSE 80

