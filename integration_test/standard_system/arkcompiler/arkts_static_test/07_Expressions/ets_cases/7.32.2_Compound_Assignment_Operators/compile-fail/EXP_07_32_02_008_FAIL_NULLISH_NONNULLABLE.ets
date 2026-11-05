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
 * @id EXP_07_32_02_008_FAIL_NULLISH_NONNULLABLE
 * @expect compile-fail
 * @section 7.32.2
 * @design 验证 ??= 的编译错误。Spec 定义 ??= 运算符语义，但当前编译器不支持 ??= 语法（ESY0227 Unexpected token '??='）。
 * @note ⚠️ SPEC 不一致：Spec 声明 ??= 运算符，但编译器将其视为语法错误。本文件在 compile-fail 中，失败原因不是 nullable 类型检查而是语法不识别
 */
function main(): void {
  // int 是非 nullable 类型，??= 无意义
  let a: int = 10;
  a ??= 20;

  // string 是非 nullable 类型（无联合 null/undefined）
  let b: string = 'hello';
  b ??= 'world';

  // boolean 是非 nullable 类型
  let c: boolean = true;
  c ??= false;

  // long 是非 nullable 类型
  let d: long = 100;
  d ??= 200;

  // float 是非 nullable 类型
  let e: float = 1.0f;
  e ??= 2.0f;

  // double 是非 nullable 类型
  let f: double = 3.14;
  f ??= 2.718;
}
