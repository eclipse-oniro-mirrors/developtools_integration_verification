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
 * @id EXP_07_32_02_006_PASS_SPEC_EXAMPLES
 * @expect compile-pass
 * @section 7.32.2
 * @design 验证规范中各复合赋值运算符使用示例的编译通过：所有 op= 在正确类型上的使用（不含 ??=，当前编译器不支持）
 * @note 正向用例：覆盖规范中所有支持的复合赋值运算符 += -= *= /= %= <<= >>= >>>= &= |= ^=，以及三种 lhsExpression 形式
 */

// 用于字段访问测试的类
class Data {
  public val: int = 0;
  public label: string = '';
}

// 记录索引 key 类型
type K = 'a' | 'b';

function main(): void {
  // === 变量复合赋值 ===
  let a: int = 10;
  a += 5;
  a -= 3;
  a *= 2;
  a /= 4;
  a %= 5;

  let b: int = 16;
  b <<= 2;
  b >>= 1;
  b >>>= 1;

  let c: int = 0xFF;
  c &= 0x0F;
  c |= 0xF0;
  c ^= 0xAA;

  let s: string = 'hello';
  s += ' world';

  // === 字段访问复合赋值 ===
  let d: Data = new Data();
  d.val += 10;
  d.label += ' appended';

  // === 数组索引复合赋值 ===
  let arr: int[] = [1, 2, 3, 4, 5];
  arr[0] += 10;
  arr[2] *= 3;

  // === 记录索引复合赋值 ===
  let rec: Record<K, int> = { 'a': 1, 'b': 2 };
  rec['a'] += 10;
  rec['b'] *= 2;

  console.log('verified');
}
