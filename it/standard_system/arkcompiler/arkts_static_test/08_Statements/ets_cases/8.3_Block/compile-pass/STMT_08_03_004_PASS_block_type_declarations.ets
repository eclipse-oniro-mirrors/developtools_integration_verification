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
 * @id STMT_08_03_004_PASS_block_type_declarations
 * @expect compile-pass
 * @section 8.3
 * @design 块内变量遮蔽（shadowing）— 内层块声明与外层同名的 let 变量，块结束后外层变量恢复可见
 * @note 正向用例：ArkTS 不允许局部 interface/type alias 声明（已验证 compile-fail），本用例聚焦块级变量遮蔽
 */
function testBlockShadowing(): void {
  let x: int = 10
  {
    let x: int = 20    // 遮蔽外层的 x，编译通过
    let y: int = 30    // 块内声明
    if (x != 20) {
      console.log("inner x should be 20")
    }
  }
  // 此处 x 恢复为 10，y 不可见
  if (x != 10) {
    console.log("outer x should be 10")
  }
}

function testBlockNestedShadowing(): void {
  let name: string = "outer"
  {
    let name: string = "middle"
    {
      let name: string = "inner"    // 三层嵌套遮蔽
      if (name != "inner") {
        console.log("FAIL")
      }
    }
    if (name != "middle") {
      console.log("FAIL")
    }
  }
  if (name != "outer") {
    console.log("FAIL")
  }
}

// 注意：ArkTS 不允许在块内声明 interface 或 type alias
// 以下形式会导致编译错误（已在 compile-fail 中验证）：
// { interface LocalShape { area: int } }  ← ESY0040: Illegal start of INTERFACE
// { type LocalId = int }                  ← ESY0040: Illegal start of Type Alias
