# oskm viewer

浏览 `oskm scan` 产出的 SQLite 知识库。纯静态 + sql.js，无服务端。

## 跑起来

```bash
npm install
npm run dev
```

打开 <http://localhost:5173/>，点右上角 **选择 .db**，或者直接带上库：

```
http://localhost:5173/?db=knowledge.db#/runtime
```

`?db=` 指向任意可访问的 `.db` URL。把 `.db` 和构建产物放在一起，
别人打开链接就能看，不需要再手动选文件。

## 结构

两个表面，两套标准（见 `docs/implementation-plan.md` §1）：

| | 产品面 | 调测面 |
| --- | --- | --- |
| 路由 | `#/` `#/runtime` `#/build` `#/image` `#/lookup` `#/findings` | `#/data/<table>` |
| 读者 | 系统开发者、测试集成 | oskm 自身开发者 |
| 组件 | 自建领域组件 + token 化的 Element Plus | Element Plus 原样 |

- `#/` 首页：概念模型 + 能做什么
- `#/runtime` 运行视图：164 个运行单元，混装进程一眼可见
- `#/build` 构建视图：382 个部件，按入度排序
- `#/image` 镜像视图：5804 个文件的路径树，标注归属
- `#/lookup?q=` 反查：从 so 名 / 路径 / 进程名回到部件与仓
- `#/findings` 质量：扫描层问题与数据一致性
- `#/e/<table>/<id>` 实体档案：三镜头摘要 + 外键自动关联，**新表不改代码也能打开**
- `#/data/<table>` 调测：原始表

## 自验

```bash
npm run verify  # 跑全部四项
npm run smoke   # 24 条行为断言（运行视图计数、反查六级回退、档案页扩展性…）
npm run menu    # 下拉菜单可用性回归（鼠标移入不消失、点外部/Esc 关闭）
npm run a11y    # 对比度 AA / 键盘焦点可见 / 360px 无横向溢出
npm run a11y:light  # 浅色主题同样校验
npm run perf    # implementation-plan §5 的性能预算
npm run shoot   # 逐视图截图到 shots/，抓控制台错误与空内容
```

都需要 `npm run dev` 已在 5173 端口运行。
截图要看中文得先装字体：`sudo apt-get install -y fonts-noto-cjk`，否则全是豆腐块。

## 文档

- [UX 设计 v3.1](./docs/ux-design.md)
- [实施计划 v3.1](./docs/implementation-plan.md)
- [备选方案与选型理由](./docs/ux-options.md)
- [URL 规范](./docs/url-spec.md)（待按 ux-design §10 修订）
