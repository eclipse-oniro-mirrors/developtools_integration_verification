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
 * @id TYP_03_03_017_FAIL_NULLISH_TO_UNION_ARRAY
 * @expect compile-fail
 * @section 3.3
 * @design string | undefined[] 表示 string 或 undefined 数组（不是整体 nullish）
 *   因此整体不能赋 undefined
 * @note 反向用例：spec §3.3 中 b2 = undefined 应失败
 */
function testNullishToUnionArrayFail(): void {
  let b2: string | undefined[]
  b2 = undefined
}