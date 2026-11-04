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
 * @id TYP_03_19_03_004_PASS_KEYOF_TYPE_ALIAS
 * @expect compile-pass
 * @section 3.19.3
 * @design keyof 可用于 class/interface 类型别名引用
 * @note 正向用例：type alias 指向 class 后使用 keyof
 */
class C4 {
  a: int = 0
  b: string = ""
}
type AliasC4 = C4
type KeysOfAliasC4 = keyof AliasC4

function testKeyofAlias(): void {
  let k: KeysOfAliasC4 = "a"
  k = "b"
}