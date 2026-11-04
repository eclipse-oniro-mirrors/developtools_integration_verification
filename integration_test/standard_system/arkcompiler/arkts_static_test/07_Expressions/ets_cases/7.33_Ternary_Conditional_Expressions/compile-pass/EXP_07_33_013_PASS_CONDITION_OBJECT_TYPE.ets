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
 * @id EXP_07_33_013_PASS_CONDITION_OBJECT_TYPE
 * @expect compile-pass
 * @section 7.33
 * @design 验证三元条件表达式允许对象类型作为条件（ArkTS 扩展行为，与 JS 兼容）
 * @note 正向用例：对象类型作为条件编译通过。⚠️ 设计差异：Java/Swift 要求条件必须为 boolean/Bool
 */
class X {}

function main(): void {
  let a: X = new X();
  let b: int = 42;
  let c: int = 99;
  // 对象类型作为条件编译通过（ArkTS 扩展行为）
  let x: int = a ? b : c;
}
