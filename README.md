# trivy-db

trivy-db的容器化构建

## 有什么用

由于trivy目前数据库无法直接通过github release下载，这对于身处中国大陆地区的用户来说相对不友好，本项目旨在帮助网络受限的朋友更快的获取到数据库。


## 如何使用

使用以下命令获取数据库

```bash
docker run --rm -v 目标文件夹路径:/app/release/ mrxianyu/trivy-db:latest
```

容器会自动将 `metadata.json`和`trivy.db` 拷贝到目标文件夹