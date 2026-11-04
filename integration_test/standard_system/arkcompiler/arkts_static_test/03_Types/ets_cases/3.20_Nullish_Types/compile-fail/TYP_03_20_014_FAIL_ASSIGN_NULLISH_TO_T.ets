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
 * @id TYP_03_20_014_FAIL_ASSIGN_NULLISH_TO_T
 * @expect compile-fail
 * @section 3.20
 * @design nullish 类型未转换前不能赋值给非 nullish T
 * @note 反向用例：T|undefined/T|null 参数赋值给 T 不允许，避免初始化智能收窄
 */
function testAssignNullishToTFail(s: string | undefined, n: int | null): void {
  let t: string = s
  let i: int = n
}