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
 * @id EXP_07_03_004_PASS_NUMERIC_TYPE_INFERENCE
 * @expect compile-pass
 * @section 7.3
 * @design 验证数值字面量类型推断：int 范围→int，long 范围→long，float 后缀→float，无后缀→double
 * @note 正向用例：验证 spec "For numeric literals, type is inferred using Type Inference for Constant Expressions"
 */
function main(): void {
  // int range (0..max(int) = 0x7FFFFFFF): inferred as int
  let a: int = 0
  let b: int = 127
  let c: int = 0x7FFFFFFF
  let d: int = 2147483647

  // long range (0x8000_0000..max(long)): inferred as long
  let e: long = 2147483648
  let f: long = 0x8000_0000
  let g: long = 0x7FFF_FFFF_FFFF_FFFF

  // float suffix → float
  let h: float = 3.14f

  // no suffix → double
  let i: double = 3.14
  let j: double = 1e10

  // bigint suffix 'n' → bigint
  let k: bigint = 153n

  console.log('verified')
}
