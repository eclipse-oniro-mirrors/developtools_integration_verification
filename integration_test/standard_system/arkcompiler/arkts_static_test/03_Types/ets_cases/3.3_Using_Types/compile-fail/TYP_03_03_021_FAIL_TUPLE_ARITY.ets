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
 * @id TYP_03_03_021_FAIL_TUPLE_ARITY
 * @expect compile-fail
 * @section 3.3
 * @design 就地元组类型字面量元素数量不匹配
 * @note 反向用例：元组类型与字面量元素数量不一致
 */
function testTupleArityFail(): void {
  let t1: [int, string] = [1]
  let t2: [int, string, boolean] = [1, "a"]
  let t3: [int, string] = [1, "a", true]
}