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
 * @id TYP_03_08_004_PASS_ARRAY_OF_ANY
 * @expect compile-pass
 * @section 3.8
 * @design Array<Any> 可包含异构元素
 * @note 正向用例：异构数组
 */
function testArrayOfAny(): void {
  let arr: Array<Any> = [1, "a", true, 3.14, null, undefined, 100n]
  let arr2: Any[] = [new Object(), 1, "b"]
}