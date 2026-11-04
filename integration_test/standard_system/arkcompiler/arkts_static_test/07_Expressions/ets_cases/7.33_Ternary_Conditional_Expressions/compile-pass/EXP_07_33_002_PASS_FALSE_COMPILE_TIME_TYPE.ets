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
 * @id EXP_07_33_002_PASS_FALSE_COMPILE_TIME_TYPE
 * @expect compile-pass
 * @section 7.33
 * @design 验证编译时条件为 false 时，三元表达式类型为 whenFalse 分支的类型：false ? "5" : 6 → int 类型
 * @note 正向用例：编译时 false 条件，整个表达式类型为 whenFalse 分支类型
 */
class A {}
class B extends A {}

function main(): void {
  // false ? "5" : 6 → 类型为 int（compile-time false 选择 whenFalse 分支的类型）
  let a: int = false ? '5' : 6;

  // false ? 3.14f : 99 → 类型为 int
  let b: int = false ? 3.14f : 99;

  // false ? new A() : new B() → 类型为 B
  let c: B = false ? new A() : new B();

  // false ? 42 : 99 → 类型为 int
  let d: int = false ? 42 : 99;
}
