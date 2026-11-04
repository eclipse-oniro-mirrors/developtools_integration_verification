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
 * @id EXP_07_34_002_PASS_ARITHMETIC_INTERPOLATION
 * @expect compile-pass
 * @section 7.34
 * @design 验证算术表达式在字符串插值中的编译通过：嵌入加法、乘法、除法、减法等算术表达式，结果自动转换为字符串
 * @note 正向用例：嵌入表达式可以是任意表达式，包括算术运算，结果自动转换为 string 类型
 */
function main(): void {
  let a: int = 2;
  let b: int = 3;

  // 加法表达式插值
  let r1: string = `${a} + ${b} = ${a + b}`;

  // 乘法表达式插值
  let r2: string = `${a} * ${b} = ${a * b}`;

  // 减法/除法表达式插值
  let r3: string = `${a} - ${b} = ${a - b}`;

  let x: int = 10;
  let y: int = 3;
  // 整数除法
  let r4: string = `${x} / ${y} = ${x / y}`;

  // 混合运算
  let r5: string = `${a} + ${b} * 2 = ${a + b * 2}`;

  console.log('verified');
}
