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
 * @id STMT_08_05_004_PASS_BLOCK_SCOPE
 * @expect compile-pass
 * @section 8.5
 * @design if/else 块语句创建独立块级作用域，同名变量可在不同分支声明
 * @note 正向用例：spec 示例 if(cond1) { let x = 10; } else { let x = 20; } 同名义合法
 */
function testBlockScope(): void {
  let cond: boolean = true

  // 不同分支块中可声明同名变量（作用域隔离）
  if (cond) {
    let x: int = 10
  } else {
    let x: int = 20
  }

  // 多层块嵌套，内部作用域正常
  if (cond) {
    let y: int = 30
    if (y > 0) {
      let z: int = y + 1
    }
  }

  // 连续 if 块，各块作用域独立
  if (cond) {
    let a: int = 1
  }
  if (!cond) {
    let a: int = 2
  }

  // if-else 块内字符串变量
  if (cond) {
    let s: string = "hello"
  } else {
    let s: string = "world"
  }
}
