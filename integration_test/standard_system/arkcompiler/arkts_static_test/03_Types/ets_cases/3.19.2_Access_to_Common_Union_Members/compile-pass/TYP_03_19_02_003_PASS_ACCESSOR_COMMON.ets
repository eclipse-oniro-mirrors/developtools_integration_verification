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
 * @id TYP_03_19_02_003_PASS_ACCESSOR_COMMON
 * @expect compile-pass
 * @section 3.19.2
 * @design 同名同签名 accessor 可作为共同成员访问
 * @note 正向用例：get value(): int 在两个类中签名相同
 */
class A3 {
  private v: int = 1
  get value(): int { return this.v }
}
class B3 {
  private v: int = 2
  get value(): int { return this.v }
}

function testAccessorCommon(): void {
  let u: A3 | B3 = new A3()
  let x: int = u.value
}