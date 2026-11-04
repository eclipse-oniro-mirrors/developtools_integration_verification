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
 * @id STMT_08_05_009_RUNTIME_IF_TRUE_FALSE
 * @expect runtime
 * @section 8.5
 * @design 运行时验证 boolean 条件为 true/false 时 if/else 分支正确执行
 * @note 运行时用例：true 走 then、false 走 else、无 else 时 false 跳过
 */
function main(): void {
  let result: int = 0

  // if-true 走 then 分支
  if (true) {
    result = 1
  } else {
    result = 2
  }
  if (result != 1) {
    throw new Error("if(true) failed: expected 1, got " + result)
  }

  // if-false 走 else 分支
  if (false) {
    result = 3
  } else {
    result = 4
  }
  if (result != 4) {
    throw new Error("if(false) else failed: expected 4, got " + result)
  }

  // if-false 无 else 分支，不执行 then 体
  result = 0
  if (false) {
    result = 99
  }
  if (result != 0) {
    throw new Error("if(false) without else failed: expected 0, got " + result)
  }

  // boolean 变量 true
  let cond: boolean = true
  if (cond) {
    result = 5
  } else {
    result = 6
  }
  if (result != 5) {
    throw new Error("boolean var true failed: expected 5, got " + result)
  }

  // boolean 变量 false
  cond = false
  if (cond) {
    result = 7
  } else {
    result = 8
  }
  if (result != 8) {
    throw new Error("boolean var false failed: expected 8, got " + result)
  }

  // 关系表达式作为条件
  let a: int = 10
  let b: int = 20
  if (a < b) {
    result = 9
  } else {
    result = 10
  }
  if (result != 9) {
    throw new Error("relational expr < failed: expected 9, got " + result)
  }

  if (a == b) {
    result = 11
  } else {
    result = 12
  }
  if (result != 12) {
    throw new Error("relational expr == failed: expected 12, got " + result)
  }

  // 逻辑非
  cond = false
  if (!cond) {
    result = 13
  }
  if (result != 13) {
    throw new Error("logical not failed: expected 13, got " + result)
  }

  console.log("verified")
}
