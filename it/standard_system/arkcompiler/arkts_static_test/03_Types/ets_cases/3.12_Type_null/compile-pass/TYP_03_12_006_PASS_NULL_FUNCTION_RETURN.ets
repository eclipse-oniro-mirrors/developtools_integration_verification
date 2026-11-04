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
 * @id TYP_03_12_006_PASS_NULL_FUNCTION_RETURN
 * @expect compile-pass
 * @section 3.12
 * @design 函数返回类型为 T | null
 * @note 正向用例：验证函数可以返回 null
 */
function maybeNull(v: int): string | null {
  if (v > 0) {
    return "positive"
  }
  return null
}

function testNullFunctionReturn(): void {
  let r1: string | null = maybeNull(1)
  let r2: string | null = maybeNull(-1)
}