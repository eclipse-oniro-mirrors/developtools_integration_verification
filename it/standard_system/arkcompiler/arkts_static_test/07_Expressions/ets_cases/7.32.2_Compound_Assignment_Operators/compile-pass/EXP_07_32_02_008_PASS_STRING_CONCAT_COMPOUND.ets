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
 * @id EXP_07_32_02_008_PASS_STRING_CONCAT_COMPOUND
 * @expect compile-pass
 * @section 7.32.2
 * @design 验证字符串拼接复合赋值 += 的编译通过：string += string、string += int、string += 其他类型
 * @note 正向用例：string 类型只支持 += 复合赋值（字符串拼接），其他运算符如 -= *= 等对 string 不适用。根据 spec，+ 对 string 执行拼接
 */
function main(): void {
  // string += string (字符串拼接)
  let a: string = 'hello';
  a += ' world';

  // string += int (int 隐式转字符串拼接到末尾)
  let b: string = 'value: ';
  b += 42;

  // string += 变量拼接
  let suffix: string = '!!!';
  let c: string = 'hi';
  c += suffix;

  // 多次 += 拼接
  let d: string = '';
  d += 'a';
  d += 'b';
  d += 'c';

  // 复杂表达式拼接
  let e: string = 'result = ';
  let x: int = 10;
  e += x;

  console.log('verified');
}
