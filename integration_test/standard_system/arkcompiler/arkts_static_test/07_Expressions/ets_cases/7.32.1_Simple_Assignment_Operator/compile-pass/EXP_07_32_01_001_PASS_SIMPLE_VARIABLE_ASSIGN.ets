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
 * @id EXP_07_32_01_001_PASS_SIMPLE_VARIABLE_ASSIGN
 * @expect compile-pass
 * @section 7.32.1
 * @design 验证简单变量赋值的编译通过：int、long、float、double、string、boolean 六种基本类型的赋值表达式
 * @note 正向用例：验证简单变量 = 同类型表达式编译通过。每个类型进行变量声明后立即赋值的操作。long 类型使用 int 字面量（隐式扩宽），不使用 bigint n 后缀
 */
function main(): void {
  // int 类型赋值
  let a: int = 0;
  a = 42;

  // long 类型赋值（使用 int 字面量隐式扩宽到 long）
  let b: long = 0;
  b = 100;

  // float 类型赋值
  let c: float = 0.0f;
  c = 3.14f;

  // double 类型赋值
  let d: double = 0.0;
  d = 2.718;

  // string 类型赋值
  let e: string = '';
  e = 'hello';

  // boolean 类型赋值
  let f: boolean = false;
  f = true;

  // 变量到变量赋值
  let g: int = a;

  // 常量到变量赋值
  let h: int = 99;

  // 表达式结果到变量赋值
  let i: int = (a + 1);

  console.log('verified');
}
