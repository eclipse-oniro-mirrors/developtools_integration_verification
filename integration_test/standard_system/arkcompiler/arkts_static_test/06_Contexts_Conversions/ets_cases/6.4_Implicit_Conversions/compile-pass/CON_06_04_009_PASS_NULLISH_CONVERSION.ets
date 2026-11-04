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
 * @id CON_06_04_009_PASS_NULLISH_CONVERSION
 * @expect compile-pass
 * @section 6.4
 * @design null/undefined 在 string 上下文中的隐式转换
 * @note 正向用例：验证 nullish 值的隐式 string 转换
 */
function testNullishConversion(): void {
  let s1: string = '' + null
  let s2: string = '' + undefined
  let s3: string = 'val: ' + null
}
