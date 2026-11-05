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
 * @id CON_06_04_021_RUNTIME_NULLISH_STRING_VALUES
 * @expect runtime
 * @section 6.4
 * @design null/undefined 在 string 上下文中转换运行时行为
 * @note 运行时用例：实际执行验证 null→"null", undefined→"undefined"
 */
function main(): void {
  let s1: string = '' + null
  if (s1 != 'null') {
    throw new Error('assertion failed: null→'null', got '' + s1 + ''')
  }

  let s2: string = '' + undefined
  if (s2 != 'undefined') {
    throw new Error('assertion failed: undefined→'undefined', got '' + s2 + ''')
  }

  console.log('Nullish string values verified')
}
