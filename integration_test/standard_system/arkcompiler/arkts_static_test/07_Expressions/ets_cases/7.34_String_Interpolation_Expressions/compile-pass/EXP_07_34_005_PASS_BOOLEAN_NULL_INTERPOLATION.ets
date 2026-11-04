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
 * @id EXP_07_34_005_PASS_BOOLEAN_NULL_INTERPOLATION
 * @expect compile-pass
 * @section 7.34
 * @design 验证布尔值、null、undefined 在字符串插值中的编译通过：boolean 转为 "true"/"false"，nullish 值转为对应字面量
 * @note 正向用例：所有类型均可作为嵌入表达式，隐式转换规则与字符串拼接一致
 */
function main(): void {
  let b1: boolean = true;
  let b2: boolean = false;
  let n: int | undefined = undefined;

  // 布尔值插值
  let r1: string = `true = ${b1} and false = ${b2}`;

  // undefined 插值
  let r2: string = `nil = ${n}`;

  // 三元表达式作为嵌入表达式
  let cond: boolean = true;
  let r3: string = `cond = ${cond ? 'yes' : 'no'}`;

  console.log('verified');
}
