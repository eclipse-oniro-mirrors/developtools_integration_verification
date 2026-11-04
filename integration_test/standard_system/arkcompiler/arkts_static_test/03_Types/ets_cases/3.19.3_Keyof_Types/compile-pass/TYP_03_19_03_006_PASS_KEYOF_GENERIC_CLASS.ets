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
 * @id TYP_03_19_03_006_PASS_KEYOF_GENERIC_CLASS
 * @expect compile-pass
 * @section 3.19.3
 * @design keyof 可用于泛型类实例化类型
 * @note 正向用例：keyof Box<int>
 */
class Box6<T> {
  value: T
  constructor(v: T) { this.value = v }
  get(): T { return this.value }
}
type KeysOfBox6 = keyof Box6<int>

function testKeyofGenericClass(): void {
  let k: KeysOfBox6 = "value"
  k = "get"
}