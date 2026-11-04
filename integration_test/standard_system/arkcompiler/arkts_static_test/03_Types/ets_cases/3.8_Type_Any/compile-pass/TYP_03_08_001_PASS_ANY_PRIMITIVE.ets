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
 * @id TYP_03_08_001_PASS_ANY_PRIMITIVE
 * @expect compile-pass
 * @section 3.8
 * @design Any 接受所有原始类型
 * @note 正向用例：Any 是顶类型
 */
function testAnyPrimitive(): void {
  let a: Any = 1
  a = 100000000000
  a = 3.14f
  a = 3.14
  a = true
  a = "hello"
  a = 100n
}