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
 * @id EXP_07_34_001_PASS_BASIC_INTERPOLATION
 * @expect compile-pass
 * @section 7.34
 * @design 验证基本类型变量在字符串插值中的编译通过：string、int、long、float、double、boolean 六种基本类型均可作为嵌入表达式
 * @note 正向用例：字符串插值中嵌入各种基本类型变量应编译通过，所有类型均隐式转换为 string
 */
function main(): void {
  let s: string = 'world';
  let i: int = 42;
  let l: long = 100;
  let f: float = 3.14f;
  let d: double = 2.718;
  let b: boolean = true;

  // string 变量插值
  let r1: string = `hello ${s}`;

  // int 变量插值
  let r2: string = `value = ${i}`;

  // long 变量插值
  let r3: string = `big = ${l}`;

  // float 变量插值
  let r4: string = `pi ≈ ${f}`;

  // double 变量插值
  let r5: string = `e ≈ ${d}`;

  // boolean 变量插值
  let r6: string = `flag = ${b}`;

  console.log('verified');
}
