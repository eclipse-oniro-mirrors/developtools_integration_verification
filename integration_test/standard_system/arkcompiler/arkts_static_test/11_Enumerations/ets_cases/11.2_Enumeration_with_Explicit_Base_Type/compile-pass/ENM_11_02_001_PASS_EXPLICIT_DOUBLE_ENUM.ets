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
 * @id ENM_11_02_001_PASS_EXPLICIT_DOUBLE_ENUM
 * @expect compile-pass
 * @section 11.2
 * @design 显式 double/long/fd/byte 基类枚举全部合法初始化
 * @note 正向用例：spec 原例 DoubleEnum / LongEnum / ByteEnum
 */
enum DoubleEnum: double { A = 0.0, B = 1, C = 3.14159 }
enum LongEnum: long { A = 0, B = 1, C = 3 }
enum ByteEnum: byte { AA = 0, BB = 1, CC = 3 }
enum ShortEnum: short { X = 10, Y = 20, Z = 30 }
enum FloatEnum: float { P = 0.5f, Q = 1.0f, R = 2.5f }

function testExplicitDoubleEnum(): void {
  let d: DoubleEnum = DoubleEnum.A
  let l: LongEnum = LongEnum.B
  let b: ByteEnum = ByteEnum.AA
}