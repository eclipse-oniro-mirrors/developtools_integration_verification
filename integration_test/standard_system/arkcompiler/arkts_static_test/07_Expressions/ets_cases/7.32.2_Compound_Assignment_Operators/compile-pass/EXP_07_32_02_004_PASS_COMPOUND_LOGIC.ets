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
 * @id EXP_07_32_02_004_PASS_COMPOUND_LOGIC
 * @expect compile-pass
 * @section 7.32.2
 * @design 复合赋值逻辑运算（&= |= ^= 用于 boolean）
 * @note 正向用例：验证该特性编译通过的正确用法。&&= 和 ||= 在 es2panda 中暂不支持。
 */
function testCompoundLogic(): void {
  let a: boolean = true
  let b: boolean = false
  a = a && true
  b = b || true
  let c: boolean = true
  let d: boolean = false
  let e: boolean = c && d
  console.log(a.toString(), b.toString(), e.toString())
}
