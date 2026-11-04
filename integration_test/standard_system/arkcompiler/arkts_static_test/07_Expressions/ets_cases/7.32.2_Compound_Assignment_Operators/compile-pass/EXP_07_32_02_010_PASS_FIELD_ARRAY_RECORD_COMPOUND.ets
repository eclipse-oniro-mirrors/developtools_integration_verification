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
 * @id EXP_07_32_02_010_PASS_FIELD_ARRAY_RECORD_COMPOUND
 * @expect compile-pass
 * @section 7.32.2
 * @design 验证三种 lhsExpression 形式的复合赋值编译通过：字段访问 (obj.field +=)、数组索引 (arr[idx] +=)、记录索引 (rec[key] +=)
 * @note 正向用例：复合赋值运算符可作用于字段、数组元素和记录值。覆盖 += -= *= /= %= 等
 */

// 用于字段访问测试的类
class Counter {
  public value: int = 0;
  public total: long = 0;
}

// 记录索引 key 类型
type K = 'x' | 'y' | 'z';

function main(): void {
  // === 字段访问复合赋值 (e.f op= rhs) ===
  let c: Counter = new Counter();
  c.value += 10;
  c.value -= 3;
  c.value *= 2;
  c.value /= 3;
  c.value %= 4;
  c.total += 100;

  // === 数组索引复合赋值 (arr[idx] op= rhs) ===
  let arr: int[] = [10, 20, 30, 40, 50];
  arr[0] += 5;      // 字面量索引
  let idx: int = 2;
  arr[idx] += 10;   // 变量索引
  arr[1] *= 2;
  arr[3] -= 5;
  arr[4] /= 2;

  // 字符串数组 +=
  let strArr: string[] = ['a', 'b', 'c'];
  strArr[0] += ' plus';
  let si: int = 1;
  strArr[si] += ' more';

  // === 记录索引复合赋值 (rec[key] op= rhs) ===
  let rec: Record<K, int> = { 'x': 10, 'y': 20, 'z': 30 };
  rec['x'] += 5;     // 字面量 key
  rec['y'] *= 2;
  rec['z'] -= 10;
  rec['x'] %= 3;

  console.log('verified');
}
