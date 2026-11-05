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
 * @id EXP_07_34_006_PASS_FIELD_ARRAY_INTERPOLATION
 * @expect compile-pass
 * @section 7.34
 * @design 验证对象字段访问和数组元素访问在字符串插值中的编译通过：obj.field、arr[idx] 均可作为嵌入表达式
 * @note 正向用例：字段访问、数组索引等复杂左值表达式也可以作为嵌入表达式
 */

class Data {
  public x: int = 0;
  public label: string = 'default';
}

function main(): void {
  let d: Data = new Data();
  d.x = 42;
  d.label = 'answer';

  // 字段访问插值
  let r1: string = `obj.x = ${d.x}`;
  let r2: string = `obj.label = ${d.label}`;

  // 数组元素插值
  let arr: int[] = [10, 20, 30];
  let r3: string = `arr[0] = ${arr[0]}`;
  let idx: int = 1;
  let r4: string = `arr[${idx}] = ${arr[idx]}`;

  console.log('verified');
}
