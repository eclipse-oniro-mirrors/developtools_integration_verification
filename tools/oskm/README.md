# oskm 收集工具

oskm 收集工具用于在编译结束后（postTargetCompilation 阶段）从编译产物中收集 oskm 信息。

## 使用方式

该工具通过编译选项 `--enable-oskm-collect` 使能，在 `./build.sh` 编译流程的
postTargetCompilation 阶段（`deps_guard` 之后）被调用，无需单独运行。

```bash
./build.sh --product-name rk3568 --ccache --build-target make_all --enable-oskm-collect
```

## 扩展

在 `oskm_collect.py` 的 `oskm_collect(out_path, target_cpu, args=None)` 函数中
实现实际的收集逻辑。
