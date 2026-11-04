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
 * @id ENM_11_02_006_PASS_EXPLICIT_BYTE_SHORT
 * @expect compile-pass
 * @section 11.2
 * @design byte/short/long/float/double 显式基类
 * @note 正向用例
 */
enum ByteE: byte { A = 0, B = 1 }
enum ShortE: short { X = 10, Y = 20 }
enum LongE: long { Foo = 100 }
enum FloatE: float { P = 0.5f, Q = 1.0f }
enum DoubleE: double { R = 0.5, S = 1.0 }

function testExplicitByteShort(): void {
  let b: ByteE = ByteE.A
  let l: LongE = LongE.Foo
}