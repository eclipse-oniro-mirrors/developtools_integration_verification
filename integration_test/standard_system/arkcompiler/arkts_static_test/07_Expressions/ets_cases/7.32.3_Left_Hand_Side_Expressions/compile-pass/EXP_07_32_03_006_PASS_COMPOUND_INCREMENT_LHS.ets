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
 * @id EXP_07_32_03_006_PASS_COMPOUND_INCREMENT_LHS
 * @expect compile-pass
 * @section 7.32.3
 * @design 验证复合赋值（+=/-=/*=等）和自增自减（++/--）在有效左值上的编译通过：变量、字段、数组索引均可作为复合赋值/自增自减的目标
 * @note 正向用例：左值表达式同样适用于复合赋值和自增自减运算符，验证各种左值形式上的这些运算符编译通过
 */

class Data {
  public val: int = 0;
}

function main(): void {
  // 变量复合赋值
  let a: int = 0;
  a += 5;
  a -= 3;
  a *= 2;
  a /= 4;
  a %= 3;

  // 字段复合赋值
  let d: Data = new Data();
  d.val += 10;
  d.val -= 5;
  d.val *= 2;

  // 数组索引复合赋值
  let arr: int[] = [0, 0, 0];
  arr[0] += 5;
  arr[1] -= 3;

  // 变量自增自减
  let x: int = 0;
  x++;
  ++x;
  x--;
  --x;

  // 字段自增自减
  d.val++;
  ++d.val;

  // 数组索引自增自减
  arr[0]++;
  ++arr[1];

  console.log('verified');
}
