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
 * @id CON_06_01_025_FAIL_COMPOSITE_ARRAY_MISMATCH
 * @expect compile-fail
 * @section 6.1
 * @design Composite literal context: 数组字面量中元素类型(string)与数组元素类型(int)不匹配且无隐式转换
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testCompositeArrayMismatchFail(): void {
  let invalidArr: int[] = [1, 'two', 3]
}
