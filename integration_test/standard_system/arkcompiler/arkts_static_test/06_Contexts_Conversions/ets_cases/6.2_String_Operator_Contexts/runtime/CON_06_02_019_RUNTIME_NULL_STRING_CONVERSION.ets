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
 * @id CON_06_02_019_RUNTIME_NULL_STRING_CONVERSION
 * @expect runtime
 * @section 6.2
 * @design null string 转换运行时行为：null → "null"
 * @note 运行时用例：实际执行验证 null → "null"
 */
function main(): void {
  let r1: string = '' + null
  if (r1 != 'null') {
    throw new Error('assertion failed: expected 'null', got '' + r1 + ''')
  }

  let r2: string = 'result: ' + null
  if (r2 != 'result: null') {
    throw new Error('assertion failed: expected 'result: null', got '' + r2 + ''')
  }

  let r3: string = null + ' value'
  if (r3 != 'null value') {
    throw new Error('assertion failed: expected 'null value', got '' + r3 + ''')
  }

  console.log('Null string conversion verified')
}
