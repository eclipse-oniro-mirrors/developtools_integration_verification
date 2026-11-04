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
 * @id TYP_03_12_007_PASS_NULL_FUNCTION_PARAM
 * @expect compile-pass
 * @section 3.12
 * @design 函数参数类型为 T | null，传入 null 和 T 值
 * @note 正向用例：验证 null 作为函数参数传递
 */
function acceptNullable(p: string | null): int {
  if (p == null) {
    return -1
  }
  return p.length
}

function testNullFunctionParam(): void {
  acceptNullable(null)
  acceptNullable("hello")
}