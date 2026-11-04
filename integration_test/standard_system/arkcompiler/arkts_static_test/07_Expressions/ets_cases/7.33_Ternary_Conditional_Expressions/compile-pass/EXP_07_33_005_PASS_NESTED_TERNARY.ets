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
 * @id EXP_07_33_005_PASS_NESTED_TERNARY
 * @expect compile-pass
 * @section 7.33
 * @design 验证三元条件表达式的右结合性：a?b:c?d:e 等价于 a?b:(c?d:e)，嵌套多层三元表达式编译通过
 * @note 正向用例：嵌套三元条件表达式右结合编译通过
 */
function main(): void {
  let a: boolean = true;
  let b: boolean = false;
  let c: boolean = true;

  // 嵌套三元：a?b:c?d:e 等价于 a?b:(c?d:e)
  let x: int = a ? 1 : b ? 2 : 3;

  // 带括号的等价形式
  let y: int = a ? 1 : (b ? 2 : 3);

  // 三层嵌套：a?b:c?d:e?f:g
  let z: int = a ? 1 : b ? 2 : c ? 3 : 4;

  // 混合不同类型（结果类型为联合类型）
  let w: string | int = a ? 'hello' : b ? 42 : 99;
}
