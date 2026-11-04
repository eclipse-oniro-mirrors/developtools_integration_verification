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
 * @id STMT_08_03_011_PASS_redeclare_var_after_block
 * @expect compile-pass
 * @section 8.3
 * @design 块内声明的 let 变量在块结束后不可见，外层作用域可以声明同名变量，验证块作用域边界
 * @note 正向用例：同一作用域内，块结束后块内变量释放，同名变量可重新声明
 */
function testRedeclareAfterBlock(): void {
  // Block-scoped variable lives only inside the block
  {
    let x: int = 42
  }
  // After block ends, inner x is gone — redeclare is allowed
  let x: int = 100
  if (x != 100) {
    console.log("unreachable")
  }
}

function testMultipleBlocksReuseName(): void {
  {
    let temp: string = "first"
  }
  {
    let temp: string = "second"
  }
  {
    let temp: string = "third"
  }
  // After all blocks end, temp is not in scope here
  let temp: string = "outer"
  if (temp != "outer") {
    console.log("unreachable")
  }
}

function testBlockVarIndependentOfOuter(): void {
  let outer: int = 1
  {
    let inner: int = 2
    outer = outer + inner
  }
  // inner is not visible here — but outer still is
  // Redeclaring a name that was only used inside a block is valid
  {
    let inner: int = 99
    outer = outer + inner
  }
}
