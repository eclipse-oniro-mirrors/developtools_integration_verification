# install_targets 收录 symlink_file：详细方案

日期：2026-10-19
版本：2.1
状态：**已实施**，实施记录见 §9。

> **v2.0 修订**：v1.0 把 `symlink_path` 与 `symlink_file` 当成了同一件事的两种写法，
> 并据此提议加一个 `kind` 列。两点都错了，已按评审意见改写 §2–§4：
> 两个键**方向相反**，而 `kind` **不需要**——理由见 §3。

针对："解析 system_module_info.json 时处理 `symlink_file` 字段，为 install_targets 创建软链接对象。"

全部结论来自对 rk3568 的 `system_module_info.json`（5501 条）与产品包的实测，
测量方法见 §8。

---

## 1. 缺口有多大：775 个镜像里的文件，扫描器完全不知道

| | 实测 |
| --- | ---: |
| 产品包里的软链接总数 | **787** |
| 当前 `install_targets` 覆盖到的 | **1** |
| `symlink_file` 声明的路径 | **776**（94 个模块） |
| 其中盘上确实是软链接 | **776 / 776，零误报** |

也就是说按路径反查 `system/lib/platformsdk/libcjson.z.so` 这类路径，
**今天查不到任何结果**——而它在镜像里真实存在，且确实属于某个部件。
这是归属链上一个 775 条的空洞。

体积上的影响很小：776 个链接自身合计只有 **8.9 KB**（单个 6–54 字节）。
这正好印证上一轮 `size` 用 `lstat` 的决定——如果跟随链接，
这 776 行会把它们指向的那些 .so 再算一遍，镜像总量会凭空暴涨。

---

## 2. 建链接的位置只看 `symlink_file`：另外两个键净贡献为 0

SMI 里有五个带 symlink 字样的键。逐一按"最直观的路径推法"试探，与盘上真实软链接比对：

| 键 | 出现 | 形态 | 推出路径 | 命中真实 | **净新增** |
| --- | ---: | --- | ---: | ---: | ---: |
| `symlink_file` | 94 | 镜像相对路径数组 | 776 | 776 | **776** |
| `symlink` | 19 | 裸文件名数组 | 653 | 653 | **0** |
| `symlink_ext` | 3 | 分区相对路径数组 | 3 | 3 | **0** |
| `symlink_path` | 1 | 字符串（`dest` 那个链接**指向**谁） | — | — | **0**（不是路径来源） |
| `softlink_create_path` | 73 | 字符串（目录名，如 `platformsdk`） | — | — | — |

`symlink` 推出的 653 条是 `symlink_file` 的**完全子集**（交集 653 = 全部）——
它是同一批链接的另一种写法（只给文件名，位置靠 `softlink_create_path` 拼）。
`symlink_ext` 同理。

`symlink_path` 不是路径来源，它是 `dest` 那个条目的**指向**（见 §3.1），
所以"净新增路径"对它不适用。

**结论：建链接的位置只认 `symlink_file`，指向只认 `symlink_path`，
其余三个键不必解析。** 解析它们只会产生重复行，还要额外写去重逻辑。

### 剩下的 11 个不在 SMI 的职责内

```
root/bin      → /system/bin        updater/init  → bin/init
root/etc      → /system/etc        ramdisk/init  → bin/init_early
root/lib      → /system/lib        updater/system/bin → /bin
root/chipset  → /vendor            …
```

这些是**镜像组装阶段**建的根文件系统链接，不属于任何构建模块，
SMI 里压根没有声明。扫描器无从归属，不应该强行编一个来源。
如果将来要收录，那是另一个采集器（读镜像本身）的事。

---

## 3. 两个键方向相反；不需要 `kind` 列

### 3.1 方向：逐字验证过

| 键 | 链接在哪 | 指向谁 |
| --- | --- | --- |
| `symlink_path` | **在 `dest`** | 指向 `symlink_path` 给的路径 |
| `symlink_file` | **在 `symlink_file`** | 指向 `dest` |

**两者相反。** 实测：

```
symlink_path  dest = system/etc/etsstdlib.abc
              readlink(dest)     = ../framework/etsstdlib_bootabc.abc
              symlink_path       = ../framework/etsstdlib_bootabc.abc   ← 逐字相同

symlink_file  link = system/lib/platformsdk/libstring_utils.z.so
              readlink(link)     = ../chipset-sdk/libstring_utils.z.so
              解析后             = system/lib/chipset-sdk/libstring_utils.z.so
              dest               = system/lib/chipset-sdk/libstring_utils.z.so   ← 指向 dest
```

775/776 个 `symlink_file` 链接解析后指向本模块自己的 `dest`。

### 3.2 统一读法

两个键可以合成一句话：

> **`symlink_file[]` 是"本模块在这些位置建软链接"，
> `symlink_path` 是"这些链接指向哪"——不给就指向本模块自己的 `dest`。**

唯一同时用上两个键的那条记录正好印证：

```json
{ "dest":         ["system/etc/etsstdlib.abc"],
  "symlink_file": ["system/etc/etsstdlib.abc"],        // 同一个路径
  "symlink_path": "../framework/etsstdlib_bootabc.abc" }
```

链接建在 `system/etc/etsstdlib.abc`，指向 `../framework/...`。
`dest` 与 `symlink_file` 给的是同一个位置，不是两样东西（§4.3 处理）。

### 3.3 为什么不需要 `kind`

v1.0 的理由是"`kind` 是声明、`link_target` 是观测，两个轴不能混"。
**这个论证站不住**，有三条：

1. **声明已经在 `record` 里了。** 全部 94 个模块的 `record` 都逐字带着
   `symlink_file` 与 `symlink_path`（已验证）。再加一个 `kind` 列，
   正是上一轮删 `components.features` 时反对的"同一事实的第三份拷贝"——
   我自己刚立的规矩，转头就要破。

2. **`link_target` 已经能回答唯一需要回答的问题。** 它是观测值
   （`readlink` 的结果），所以 `link_target IS NOT NULL` ⟺ **这个条目在镜像里
   确实是软链接**。这比"声明说它是链接"更有用——后者在构建出错时会骗人。

3. **没有查询需要"这行来自哪个数组"。** 实测 `dest_index` 全部用途只有
   三处 `ORDER BY` 和档案页上显示成"目标序号"，没有任何代码把它映射回
   声明的数组下标。

**所以：不加 `kind`，`link_target` 一列即可。**

### 3.4 唯一索引是真障碍，但不用 `kind` 也能解

现有 `UNIQUE(scan_id, module_id, dest_index)`。两个数组都从 0 开始编号，
而**全部 94 个有 `symlink_file` 的模块同时也有 `dest`**——
`dest[0]` 与 `symlink_file[0]` 必然撞。

两个办法，建议都采纳：

- **`dest_index` 连续编号**：先 `dest[]`（0..m-1），再 `symlink_file[]`（m..m+n-1）。
  `dest_index` 的实际语义本来就只是"这个模块放进镜像的第几样东西"
  （档案页就是这么写的），连续编号与之相符，且索引定义一个字不用改。
- **唯一键换成 `(scan_id, module_id, dest)`**：这才是自然键——
  一个模块在一个路径上只放一样东西。实测模块内 `dest[]` 零重复，
  跨数组重复仅 1 处（§4.3 会去掉），所以换得过去。
  换了之后数据库自己就挡住重复，不用只靠代码里的去重。

---

## 4. 解析规则

```
对每个 SMI 行：
  遍历 dest[]          → emit 一行
                         若有 symlink_path，这一行就是个链接（观测会证实）
  遍历 symlink_file[]  → emit 一行，它是个链接，指向本模块的 dest
  两轮共用一个连续的 dest_index
```

四条规矩，都来自实测：

1. **`symlink_file` 也要走 `normalize_dest()`**。当前 776 条路径全都干净
   （无绝对路径、无 `..`、无反斜杠、无尾部 `/`），但 `dest` 里**有 8 条带 `/./`**
   （`system/etc/./telephony/operator_config.json`），说明这份文件的路径
   并不总是规范的。不能因为 `symlink_file` 这次碰巧干净就跳过规范化。

2. **`symlink_file` 的路径不当作目录安装**。`normalize_dest` 返回的
   `is_directory` 对链接没有意义，一律按单个条目处理。实测 776 条无一以 `/` 结尾。

3. **与本模块自己的 `dest` 撞路径时，不再发第二行**。
   实测 1 例：`system/etc/etsstdlib.abc` 同时出现在该模块的 `dest`
   和 `symlink_file` 里——两个键指的是同一个位置，不是两样东西。
   `dest` 那一行已经代表了它，`link_target` 的观测也已记下"这里是个链接"。
   再发一行会让 `modules_at()` 对同一路径返回两条，是纯伤害。
   去重用**规范化之后**的路径比较——否则 `system/lib/./ndk/x.so`
   和 `system/lib/ndk/x.so` 会被当成两个。

4. **`size` / `link_target` 沿用上一轮的 `measure()`**，不新写一套。
   链接行的 `size` 自然就是链接自身的几十字节，`link_target` 自然就是
   `readlink` 的结果。`symlink_path` 的声明值留在 `record` 里，
   需要比对"声明与实际是否一致"时随时可取。

---

## 5. 质量问题码

两个现有的码直接复用，新增一个：

| 码 | 条件 | rk3568 预计 |
| --- | --- | ---: |
| `TARGET_MISSING`（已有） | `symlink_file` 的路径在包里不存在 | 0 |
| **`SYMLINK_NOT_A_LINK`**（新增） | 声明为 `symlink_file`，但盘上是普通文件或目录 | 0 |

`SYMLINK_NOT_A_LINK` 当前一条都不会触发——776/776 都如实是软链接。
加它不是为了现在报警，而是**这个不变量一旦破掉必须有人知道**：
那意味着构建把一份完整拷贝放在了本该是链接的位置，镜像会凭空变大。

两条都是 `advisory=True`：文件读得好好的，是产品的声明与产物不一致。

**不加**"链接指向本模块之外"的检查。实测 775/776 指向本模块自己的 `dest`，
剩下 1 条就是 §3.2 那条同时用了 `symlink_path` 的记录（去重后不单独成行）。
没有真实的反例，现在加规则等于凭空立规矩。

---

## 6. 影响面

| | 现在 | 之后 |
| --- | ---: | ---: |
| `install_targets` 行数 | 5804 | **6580**（+776） |
| 镜像体积合计 | 1259.9 MB | 1259.9 MB（+8.9 KB） |
| 按路径反查能命中的软链接 | 1 / 787 | **777 / 787** |

### viewer 侧要动的

- **列表加「类型」列**（文件 / 软链接），判据是 `link_target` 是否为空；
  `link_target` 列本身已经有了
- **「同模块文件」列的口径变了**：现在数的是同一模块的全部 install_targets。
  一个模块 1 个 dest + 8 个链接会显示 9，容易被读成"装出 9 个文件"。
  建议拆成两个数，或在 ⓘ 里写明包含链接
- **安装目标页的导语要改**：「5804 个文件」变成「6580 个条目：
  5804 个文件 + 776 个软链接」
- **镜像树**（`Image.vue`）会多出 776 个节点，`platformsdk` 这类目录
  第一次有内容——这正是收益：以前点进去是空的

### 性能

`measure()` 每条一次 `lstat`，776 条约 9 ms（上一轮 5804 条实测 68 ms）。
可忽略。

---

## 7. 实施清单

| 文件 | 改动 |
| --- | --- |
| `collector.py` | **不加列**；唯一键改为 `(scan_id, module_id, dest)` |
| `targets.py` | `expand()` 增一轮 `symlink_file` 遍历；`dest_index` 连续编号；去重；新 issue 码 |
| `model/issues.js` | `SYMLINK_NOT_A_LINK` 的人话解释 |
| `model/columns/targets.js` | 「类型」列（由 `link_target` 推导）+ 「同模块文件」的 ⓘ 改口径 |
| `views/list/Targets.vue` | 导语改成「文件 + 软链接」 |
| `tests/test_install_modules.py` | 链接行、同路径去重、声明为链接却是普通文件 |

回归要钉住的四条：
**软链接行能被路径反查命中**、
**同时出现在 `dest` 与 `symlink_file` 的路径只产生一行**、
**`symlink_path` 声明的指向与 `readlink` 观测到的一致**、
**镜像体积合计不因收录链接而暴涨**（这条守的是 `lstat` 那个决定）。

---

## 8. 测量方法

- **键的形态**：遍历 SMI 5501 条，按键统计出现次数、值类型、样本
- **覆盖率**：`pkg.rglob('*')` 取出盘上全部软链接作为 ground truth，
  对每个键按"最直观的路径推法"推出路径集，求与 ground truth 的交集，
  再按顺序累计求净新增
- **指向关系**：对每个链接 `os.readlink` 后相对 `dirname` 规范化，
  与该模块的 `dest` 集合比对
- **体积**：`lstat().st_size` 求和


---

## 9. 实施记录（2026-10-19）

按 v2.0 实施，不加 `kind` 列。结果与预测吻合：

| | 预测 | 实际 |
| --- | ---: | ---: |
| `install_targets` 行数 | 6580 | **6579** |
| 软链接行 | 776 | 776 |
| 盘上软链接覆盖率 | 777/787 | **776/787** |
| 镜像体积合计 | 1259.9 MB | 1259.9 MB |
| `SYMLINK_NOT_A_LINK` | 0 | 0 |
| 模块内重复路径 | 0 | 0 |

少的那 1 行正是 §4.3 的 `etsstdlib.abc`——`dest` 与 `symlink_file` 同路径，
按设计只产生一行。预测时忘了减它。

反查验证：`system/lib/platformsdk/libcjson.z.so` 以前查不到，
现在返回大小 31 B、指向 `../chipset-sdk-sp/libcjson.z.so`、归属部件 `cJSON`。

### 9.1 `symlink_file` 不在 `SHAPE.primary` 里

第一版用 `record.get('symlink_file')` 读，一条链接行都没发出来——
`records` 是 `SHAPE.make()` 的产物，不是原始 SMI 行，未列入 `primary` 的键
落在 `config` 桶里。要用 `field_value()`（按**声明名**查值），这正是它的用途。
`record.get()` 在这里不报错，只静默返回 None，三条用例同时失败才暴露出来。

### 9.2 连带把 `elf_modules` 打出了重复

收录软链接后 `elf_modules` 从 3517 涨到 **4291（+774）**——它遍历
`install_targets` 建 ELF 模块，于是**同一个物理 .so 被当成了两个模块**，
入度（"被依赖数"）也跟着虚高。

在它已有的"重复 dest 是同一个物理文件"去重旁边补一句：`link_target` 非空就跳过。
软链接是同一个文件的**另一个名字**，不是另一个模块。改完回到 3517。

教训：**加数据源时要回头看谁在消费这张表**。

### 9.3 三条写死的断言跟着数据变了

- `smoke.mjs` 的 ELF 用例写死 `#/e/elf_modules/220`，id 被多出来的 774 条顶掉
  （修了 9.2 之后自动恢复）
- `nav.mjs` 的"首页七个方块"维护着一张期望路由表，并行会话加「ELF 模块」就失效。
  改成**数据驱动**：点进去后落地页标题要与方块名对上，加视图不再需要改测试
- `table.mjs` 的"超长 label"断言指望第一页碰巧有；插入 776 行后第一页内容变了。
  改成定向筛（`?q=innerkits`）而不是靠运气
