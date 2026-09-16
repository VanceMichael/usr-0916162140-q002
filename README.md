# 量子密钥区间调拨服务

`quantum-key-transfer` 是量子密钥租约体系中的纯后端服务，负责承接站点间密钥区间交接。它沿用 `contracts/domain.json` 中的区间、租约代次和冻结状态约定，不接触密钥原文。

执行 `make test` 可运行 Go 基础检查，`make build` 会在容器内复查并构建服务。`make run PORT=8312` 使用指定端口启动，进程状态通过 `GET /healthz` 返回 JSON；运行数据统一放入 `data/`。
