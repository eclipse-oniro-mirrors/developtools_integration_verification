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
 * @id TYP_03_12_004_PASS_NULL_UNION_OBJECT
 * @expect compile-pass
 * @section 3.12
 * @design Object | null 联合类型声明、赋值对象实例和 null
 * @note 正向用例：验证 Object 与 null 的联合类型
 */
class MyClass04 {}
function testNullUnionObject(): void {
  let o: Object | null = null
  o = new Object()
  o = null
  let c: MyClass04 | null = null
  c = new MyClass04()
  c = null
}