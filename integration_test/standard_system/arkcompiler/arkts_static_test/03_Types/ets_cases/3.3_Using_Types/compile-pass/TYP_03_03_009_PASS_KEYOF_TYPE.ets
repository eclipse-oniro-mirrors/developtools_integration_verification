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
 * @id TYP_03_03_009_PASS_KEYOF_TYPE
 * @expect compile-pass
 * @section 3.3
 * @design 就地 keyof 类型 keyof C 生成 union of 字符串字面量
 * @note 正向用例：验证 keyof 类型作为就地类型
 */
class C9 {
  name: string = ""
  age: int = 0
  active: boolean = false
}

function testKeyofType(): void {
  let k: keyof C9 = "name"
  k = "age"
  k = "active"
}