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
 * @id TYP_03_08_002_PASS_ANY_REFERENCE
 * @expect compile-pass
 * @section 3.8
 * @design Any 接受所有引用类型
 * @note 正向用例：class/interface/array/tuple
 */
class C2 { v: int = 0 }
interface I2 { do2(): void }
class IImpl2 implements I2 { do2(): void {} }

function testAnyReference(): void {
  let a: Any = new C2()
  a = new IImpl2()
  a = [1, 2, 3]
  a = [1, "x"]   // tuple
  a = (x: int): int => { return x }   // function
}