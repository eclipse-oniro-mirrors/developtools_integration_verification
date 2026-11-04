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
 * @id CON_06_04_008_PASS_CONVERSION_CHAIN
 * @expect compile-pass
 * @section 6.4
 * @design 转换链: enum→int→long→double 的多重隐式转换
 * @note 正向用例：验证枚举值可经过多重 widening 链
 */
enum Base {
  A,
  B,
  C
}

function testConversionChain(): void {
  let v: int = Base.B
  let w: long = v
  let x: double = w

  let y: int = Base.C
  let z: double = y
}
