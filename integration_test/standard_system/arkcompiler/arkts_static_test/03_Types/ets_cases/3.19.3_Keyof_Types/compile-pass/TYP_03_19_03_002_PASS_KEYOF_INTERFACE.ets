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
 * @id TYP_03_19_03_002_PASS_KEYOF_INTERFACE
 * @expect compile-pass
 * @section 3.19.3
 * @design keyof 可用于接口类型，结果为接口可访问成员名 union
 * @note 正向用例：interface 的方法和属性名
 */
interface I2 {
  name: string
  run(): void
}
type KeysOfI2 = keyof I2

function testKeyofInterface(): void {
  let k: KeysOfI2 = "name"
  k = "run"
}