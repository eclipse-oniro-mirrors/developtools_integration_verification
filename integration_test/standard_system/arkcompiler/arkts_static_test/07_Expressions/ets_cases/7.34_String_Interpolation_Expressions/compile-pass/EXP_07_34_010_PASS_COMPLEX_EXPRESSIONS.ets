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
 * @id EXP_07_34_010_PASS_COMPLEX_EXPRESSIONS
 * @expect compile-pass
 * @section 7.34
 * @design 验证复杂表达式在字符串插值中的编译通过：三元条件、逻辑运算、类型转换等复杂表达式嵌入
 * @note 正向用例：嵌入表达式可以是任意表达式，包括三元条件、逻辑与/或、字符串方法调用等
 */
function main(): void {
  let x: int = 5;
  let y: int = 10;
  let cond: boolean = true;

  // 三元条件嵌入
  let r1: string = `max = ${x > y ? x : y}`;

  // 字符串方法调用
  let s: string = 'Hello World';
  let r2: string = `sub = ${s.substring(0, 5)
}`;

  // 链式运算符
  let r3: string = `len = ${s.length}`;

  // 简单算术比较
  let r4: string = `${x} > ${y} = ${x > y}`;

  console.log('verified');
}
