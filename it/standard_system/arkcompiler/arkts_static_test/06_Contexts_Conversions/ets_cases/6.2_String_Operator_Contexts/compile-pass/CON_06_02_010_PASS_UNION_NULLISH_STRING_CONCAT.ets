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
 * @id CON_06_02_010_PASS_UNION_NULLISH_STRING_CONCAT
 * @expect compile-pass
 * @section 6.2
 * @design String context: string|null|undefined 联合类型 + string
 * @note 正向用例：验证 union 类型中 null/undefined 分支的 string context 转换
 */
function testUnionNullishStringConcat(): void {
  let x: string | null | undefined = null
  let s1: string = 'string is ' + x

  x = undefined
  let s2: string = 'string is ' + x

  x = 'hello'
  let s3: string = 'string is ' + x
}
