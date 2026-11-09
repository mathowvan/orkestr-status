# Orkestr 容器状态面板

无第三方依赖的只读 Python 状态页，提供 `/`、`/api/status` 与 `/healthz`。页面为中文深色主题，展示当前进程与容器可见的系统信息、常用 CLI 和运行时版本；容量按 1024 进位，运行时间以易读格式显示。源码位于 [mathowvan/orkestr-status](https://github.com/mathowvan/orkestr-status)。本项目改编自 [mathowvan/railway-status](https://github.com/mathowvan/railway-status)。

## 通过 Git 仓库与 Dockerfile 部署

在 Orkestr 新建服务时选择 Git 仓库 `mathowvan/orkestr-status`，使用仓库 Dockerfile 构建，并设置：

- Branch：`main`
- Root Directory：`/`
- Port：`8000`（环境变量 `PORT=8000`）
- Health Check Path：`/healthz`

无需额外依赖安装或自定义启动命令。容器以非 root 用户运行；默认不采集网络地址。服务不需要密钥，也不接受用户指定的命令、URL 或文件路径。

## 本地运行与测试

```sh
PORT=8000 python3 -I -B -u orkestr_status.py
python3 -I -B -m unittest -v
```

## 指标范围与安全提示

这些是容器/进程可见的指标，不代表 Orkestr 账户、服务商层面的可用性、运行时间或 uptime，也不是平台监控或告警保证。隔离、cgroup 与挂载视图会影响 CPU、内存、磁盘及运行时间读数；部分字段可能不可用。网络详情默认关闭，只有显式设置 `STATUS_NETWORK_DETAILS=1` 才进行本地地址解析和固定 HTTPS 公网 IP 查询。

状态 API 未提供身份认证；若公开服务地址，任何人都可能读取系统指标和已识别的软件版本。请勿与敏感业务或凭据共置。
