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
 * @id EXP_07_33_004_PASS_MIXED_TYPES
 * @expect compile-pass
 * @section 7.33
 * @design 验证三元条件表达式在不同类型组合时的编译通过：string|int、float|int、boolean 等混合类型
 * @note 正向用例：不同类型的 whenTrue 和 whenFalse 组合，编译器正确推断联合类型
 */
function main(): void {
  let cond: boolean = true;

  // cond ? "5" : 6 → string|int
  let a: string | int = cond ? '5' : 6;

  // cond ? "hello" : "world" → string（相同类型）
  let b: string = cond ? 'hello' : 'world';

  // cond ? true : false → boolean
  let c: boolean = cond ? true : false;

  // cond ? 42 : 99 → int
  let e: int = cond ? 42 : 99;

  // cond ? 1.5f : 2.5f → float
  let f: float = cond ? 1.5f : 2.5f;

  // cond ? 42 : 99 → int
  let g: int = cond ? 42 : 99;
}
