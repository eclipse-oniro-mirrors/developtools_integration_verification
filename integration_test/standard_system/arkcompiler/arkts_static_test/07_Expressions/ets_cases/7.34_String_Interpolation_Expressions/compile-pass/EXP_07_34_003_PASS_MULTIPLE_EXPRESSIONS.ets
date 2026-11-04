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
 * @id EXP_07_34_003_PASS_MULTIPLE_EXPRESSIONS
 * @expect compile-pass
 * @section 7.34
 * @design 验证多个嵌入表达式在同一字符串中的编译通过：三个及以上的 ${} 嵌入表达式，连续无分隔符的嵌入
 * @note 正向用例：字符串可包含任意数量的嵌入表达式，每个表达式分别求值后按顺序替换
 */
function main(): void {
  let a: int = 1;
  let b: int = 2;
  let c: int = 3;

  // 三个变量插值
  let r1: string = `${a} and ${b} and ${c}`;

  // 连续无分隔符
  let r2: string = `${a}${b}${c}`;

  // 混合字符串和数字
  let n: int = 10;
  let s: string = 'hello';
  let r3: string = `${n} + '${s}' = ${n + 1}`;

  console.log('verified');
}
