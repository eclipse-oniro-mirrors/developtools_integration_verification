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
 * @id CON_06_02_020_RUNTIME_UNDEFINED_STRING_CONVERSION
 * @expect runtime
 * @section 6.2
 * @design undefined string 转换运行时行为：undefined → "undefined"
 * @note 运行时用例：实际执行验证 undefined → "undefined"
 */
function main(): void {
  let u: string | undefined = undefined
  let r1: string = 'value: ' + u
  if (r1 != 'value: undefined') {
    throw new Error('assertion failed: expected 'value: undefined', got '' + r1 + ''')
  }

  let r2: string = '' + undefined
  if (r2 != 'undefined') {
    throw new Error('assertion failed: expected 'undefined', got '' + r2 + ''')
  }

  console.log('Undefined string conversion verified')
}
