/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
/**
 * @id STMT_08_05_015_RUNTIME_block_scope_interaction
 * @expect runtime
 * @section 8.5
 * @design 运行时验证 non-block if 与 block if 的作用域差异，以及嵌套 if-else 的 dangling else 绑定
 * @note 运行时用例：验证 no-block 变量可后续访问、block 内独立作用域、dangling else 正确分支
 */
function main(): void {
  let r: int = 0

  // === no-block if: 变量在 if 后可访问 ===
  let flag: boolean = true
  r = 0
  if (flag) r = 1
  else r = 2
  if (r != 1) { throw new Error("no-block if: then-branch should execute") }

  flag = false
  r = 0
  if (flag) r = 1
  else r = 2
  if (r != 2) { throw new Error("no-block if: else-branch should execute") }

  // === block if: then-block 与 else-block 独立作用域，正确分支执行 ===
  let cond: boolean = true
  r = 0
  if (cond) {
    // then-block scope: x 仅在此块内可见
    let x: int = 10
    r = x
  } else {
    // else-block scope: x 仅在此块内可见，与 then-block 的 x 不冲突
    let x: int = 20
    r = x
  }
  if (r != 10) { throw new Error("block if: then-block (x=10) should assign r=10, got " + r) }

  cond = false
  r = 0
  if (cond) {
    let x: int = 10
    r = x
  } else {
    let x: int = 20
    r = x
  }
  if (r != 20) { throw new Error("block if: else-block (x=20) should assign r=20, got " + r) }

  // === dangling else 绑定到最近 if (无块) ===
  // 场景: 外层 false → 不进入内层 if，dangling else 绑定到内层 if
  // if (false) if (true) r=99 else r=1
  // 外层 false → 整个内层 if-else 跳过 → r 不变
  r = 0
  if (false)
    if (true)
      r = 99
    else
      r = 1
  if (r != 0) { throw new Error("dangling else: outer false should skip inner if-else entirely, got r=" + r) }

  // dangling else: 外层 true, 内层 true → 内层 then
  r = 0
  if (true)
    if (true)
      r = 5
    else
      r = 99
  if (r != 5) { throw new Error("dangling else: true/true should be then, got r=" + r) }

  // dangling else: 外层 true, 内层 false → 内层 else (dangling)
  r = 0
  if (true)
    if (false)
      r = 99
    else
      r = 6
  if (r != 6) { throw new Error("dangling else: true/false should bind to inner else, got r=" + r) }

  // === 使用块打破 dangling else 绑定 ===
  // 场景: 外层 true 进块，内层 false → 内层 then 跳过，无 else → r 不变
  // if (true) { if (false) r=99 } else r=7
  // 块后的 else 绑定到外层 if
  r = 0
  if (true) {
    if (false) r = 99
  } else {
    r = 7
  }
  if (r != 0) { throw new Error("block breaks dangling else: outer true should skip outer else, got r=" + r) }

  // 场景: 外层 false，块不执行，else 绑定到外层 → r=8
  r = 0
  if (false) {
    if (true) r = 99
  } else {
    r = 8
  }
  if (r != 8) { throw new Error("block breaks dangling else: outer false should go to outer else, got r=" + r) }

  // === 嵌套 block if 多层作用域 ===
  r = 0
  if (true) {
    let outer: int = 100
    if (true) {
      let inner: int = 200
      r = outer + inner
    }
  }
  if (r != 300) { throw new Error("nested block scope: 100+200 should be 300, got " + r) }

  console.log("verified")
}
