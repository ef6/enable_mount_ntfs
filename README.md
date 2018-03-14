# 开启 Mac 原生 NTFS 读写功能
## 安装

执行 `enable_mount_ntfs`

## 复原

执行 `reset_mount_ntfs`

## 问题

有时候在 Mac 系统下读写 NTFS 分区时，会发现一些文件呈灰色不能打开。

使用 `ls -l@` 命令可以看到：
```
-rwxr-xr-x@  1 evan  staff  - 12292  9 14 10:38 abc.zip
    com.apple.FinderInfo       32
```

文件的读写权限中被加上了一个@符号，这就是 Mac OS X 文件系统的附加属性（extended attributes）。

解决办法:

在当前目录使用 `find . -exec xattr -c {} \;` 命令去除附加属性

也可以在 .bashrc 或 .zshrc 等文件中写入 `alias xattr@="find . -exec xattr -c {} \;"` ,这样就可以在当前目录使用 `xattr@` 命令去除附加属性

## 参考
[Mac中如何写NTFS的移动硬盘](https://jingyan.baidu.com/article/cbcede07c8e4e002f50b4d68.html)  
[OS X 原生可读写挂载NTFS分区](https://www.jianshu.com/p/d4073acbb218)