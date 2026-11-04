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
 * @id EXP_07_32_03_022_RUNTIME_SEMANTICS
 * @expect runtime
 * @section 7.32.3
 * @design 验证所有五种有效左值表达式的运行时赋值正确性：变量赋值、参数赋值、字段访问赋值、数组索引赋值、记录索引赋值，共 17 个断言
 * @note 运行时用例：验证左值表达式中赋值操作执行后值正确
 */

class Data {
  public x: int = 0;
  public label: string = '';
  public flag: boolean = false;
}

// 记录索引 key 类型（必须在模块级别定义）
type K = 'a' | 'b' | 'c';

function testParam(p: int): int {
  // 参数作为左值（重新赋值）
  p = 77;
  return p;
}

function main(): void {
  // === 1. 变量作为左值 ===

  // 1a. int 变量赋值
  let a: int = 0;
  a = 42;
  if (a != 42) {
    throw new Error('assertion failed: int var assign expected 42, got ' + a);
  }
  }
  }
  }
  }

  // 1b. long 变量赋值（使用 int 字面量隐式扩宽到 long）
  let b: long = 0;
  b = 100;
  if (b != 100) {
    throw new Error('assertion failed: long var assign expected 100, got ' + b);
  }
  }
  }
  }
  }

  // 1c. float 变量赋值
  let c: float = 0.0f;
  c = 3.14f;
  if (c != 3.14f) {
    throw new Error('assertion failed: float var assign expected 3.14f, got ' + c);
  }
  }
  }
  }
  }

  // 1d. double 变量赋值
  let d: double = 0.0;
  d = 2.718;
  if (d != 2.718) {
    throw new Error('assertion failed: double var assign expected 2.718, got ' + d);
  }
  }
  }
  }
  }

  // 1e. string 变量赋值
  let e: string = '';
  e = 'hello';
  if (e != 'hello') {
    throw new Error('assertion failed: string var assign expected 'hello', got ' + e);
  }
  }
  }
  }
  }

  // 1f. boolean 变量赋值
  let f: boolean = false;
  f = true;
  if (f != true) {
    throw new Error('assertion failed: boolean var assign expected true, got ' + f);
  }
  }
  }
  }
  }

  // === 2. 参数作为左值 ===
  let paramResult: int = testParam(10);
  if (paramResult != 77) {
    throw new Error('assertion failed: param assign expected 77, got ' + paramResult);
  }
  }
  }
  }
  }

  // === 3. 字段访问作为左值 ===
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

  // === 4. 数组索引作为左值 ===
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

  // === 5. 记录索引作为左值 ===
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

  // === 6. 复合赋值在左值上 ===
  let x: int = 10;
  x += 5;
  if (x != 15) {
    throw new Error('assertion failed: compound x+=5 expected 15, got ' + x);
  }
  }
  }
  }
  }
  x -= 3;
  if (x != 12) {
    throw new Error('assertion failed: compound x-=3 expected 12, got ' + x);
  }
  }
  }
  }
  }

  // === 7. 自增自减在左值上 ===
  let y: int = 5;
  y++;
  if (y != 6) {
    throw new Error('assertion failed: postfix y++ expected 6, got ' + y);
  }
  }
  }
  }
  }
  ++y;
  if (y != 7) {
    throw new Error('assertion failed: prefix ++y expected 7, got ' + y);
  }
  }
  }
  }
  }

  // === 8. 变量间互相赋值 ===
  let src: int = 999;
  let dst: int = 0;
  dst = src;
  if (dst != 999) {
    throw new Error('assertion failed: var to var assign expected 999, got ' + dst);
  }
  }
  }
  }
  }
console.log('verified');
}
