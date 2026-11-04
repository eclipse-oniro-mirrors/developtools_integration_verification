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
 * @id EXP_07_32_01_010_RUNTIME_SEMANTICS
 * @expect runtime
 * @section 7.32.1
 * @design 验证简单赋值运算符的运行时语义：基本类型赋值值正确、字段访问赋值值正确、数组索引赋值值正确、记录索引赋值值正确、链式赋值右结合性
 * @note 运行时用例：17 个断言覆盖全部四种 lhsExpression 形式的赋值语义。long 使用 int 字面量
 */

// 用于字段访问测试的类
class Data {
  public x: int = 0;
  public label: string = '';
  public flag: boolean = false;
}

// 记录索引 key 类型（必须在模块级别定义）
type K = 'a' | 'b' | 'c';

function main(): void {
  // === 1. 简单变量赋值 (default case) ===

  // 1a. int 赋值
  let a: int = 0;
  a = 42;
  if (a != 42) {
    throw new Error('assertion failed: int assign expected 42, got ' + a);
  }
  }
  }
  }
  }

  // 1b. long 赋值（使用 int 字面量扩宽到 long）
  let b: long = 0;
  b = 100;
  if (b != 100) {
    throw new Error('assertion failed: long assign expected 100, got ' + b);
  }
  }
  }
  }
  }

  // 1c. float 赋值
  let c: float = 0.0f;
  c = 3.14f;
  if (c != 3.14f) {
    throw new Error('assertion failed: float assign expected 3.14f, got ' + c);
  }
  }
  }
  }
  }

  // 1d. double 赋值
  let d: double = 0.0;
  d = 2.718;
  if (d != 2.718) {
    throw new Error('assertion failed: double assign expected 2.718, got ' + d);
  }
  }
  }
  }
  }

  // 1e. string 赋值
  let e: string = '';
  e = 'hello';
  if (e != 'hello') {
    throw new Error('assertion failed: string assign expected 'hello', got ' + e);
  }
  }
  }
  }
  }

  // 1f. boolean 赋值
  let f: boolean = false;
  f = true;
  if (f != true) {
    throw new Error('assertion failed: boolean assign expected true, got ' + f);
  }
  }
  }
  }
  }

  // === 2. 字段访问赋值 (e.f = value) ===
  let data: Data = new Data();
  data.x = 99;
  if (data.x != 99) {
    throw new Error('assertion failed: field assign expected 99, got ' + data.x);
  }
  }
  }
  }
  }
  data.label = 'world';
  if (data.label != 'world') {
    throw new Error('assertion failed: field string assign expected 'world', got ' + data.label);
  }
  }
  }
  }
  }
  data.flag = true;
  if (data.flag != true) {
    throw new Error('assertion failed: field boolean assign expected true, got ' + data.flag);
  }
  }
  }
  }
  }

  // === 3. 数组索引赋值 (arr[idx] = value) ===
  let arr: int[] = [0, 0, 0, 0, 0];
  arr[0] = 10;
  if (arr[0] != 10) {
    throw new Error('assertion failed: array index[0] assign expected 10, got ' + arr[0]);
  }
  }
  }
  }
  }
  let idx: int = 2;
  arr[idx] = 30;
  if (arr[2] != 30) {
    throw new Error('assertion failed: array index[2] assign with var idx expected 30, got ' + arr[2]);
  }
  }
  }
  }
  }
  arr[4] = 50;
  if (arr[4] != 50) {
    throw new Error('assertion failed: array index[4] assign expected 50, got ' + arr[4]);
  }
  }
  }
  }
  }

  // === 4. 记录索引赋值 (rec[key] = value) ===
  let rec: Record<K, int> = { 'a': 0, 'b': 0, 'c': 0 };
  rec['a'] = 100;
  if (rec['a'] != 100) {
    throw new Error('assertion failed: record assign ['a'] expected 100, got ' + rec['a']);
  }
  }
  }
  }
  }
  rec['b'] = 200;
  if (rec['b'] != 200) {
    throw new Error('assertion failed: record assign ['b'] expected 200, got ' + rec['b']);
  }
  }
  }
  }
  }

  // === 5. 链式赋值 (a = b = c, 右结合) ===
  let x: int = 0;
  let y: int = 0;
  let z: int = 0;
  x = y = z = 77;
  // 右结合: (x = (y = (z = 77)))
  if (z != 77) {
    throw new Error('assertion failed: chained assign z expected 77, got ' + z);
  }
  }
  }
  }
  }
  if (y != 77) {
    throw new Error('assertion failed: chained assign y expected 77, got ' + y);
  }
  }
  }
  }
  }
  if (x != 77) {
    throw new Error('assertion failed: chained assign x expected 77, got ' + x);
  }
  }
  }
  }
  }
console.log('verified');
}
