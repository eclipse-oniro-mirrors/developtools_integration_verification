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
 * @id CON_06_02_018_RUNTIME_BOOL_STRING_CONVERSION
 * @expect runtime
 * @section 6.2
 * @design boolean string 转换运行时行为：true→"true"，false→"false"
 * @note 运行时用例：实际执行验证 boolean → "true"/"false"
 */
function main(): void {
  let r1: string = 'flag=' + true
  if (r1 != 'flag=true') {
    throw new Error('assertion failed: expected 'flag=true', got '' + r1 + ''')
  }

  let r2: string = false + ' is answer'
  if (r2 != 'false is answer') {
    throw new Error('assertion failed: expected 'false is answer', got '' + r2 + ''')
  }

  let b: boolean = true
  let r3: string = '' + b
  if (r3 != 'true') {
    throw new Error('assertion failed: expected 'true', got '' + r3 + ''')
  }

  console.log('Boolean string conversion verified')
}
