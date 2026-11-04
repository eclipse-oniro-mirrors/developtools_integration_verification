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
 * @id EXP_07_24_003_PASS_FLOAT_DOUBLE_TYPE_COMBOS
 * @expect compile-pass
 * @section 7.24
 * @design 验证 double 和 int 类型幂运算的类型组合：所有非 double 操作数提升为 double，结果为 double
 * @note 正向用例：验证浮点类型幂运算的各类型组合，** 将任何非 double 操作数转换为 double
 */
function main(): void {
  let c: double = 4.0
  let d: int = 2
  let e: double = d ** d    // int**int→double
  let f: double = c ** d    // double**int→double
  let g: double = d ** c    // int**double→double
  let h: double = c ** 3.0  // double**double→double
  console.log('verified')
}
