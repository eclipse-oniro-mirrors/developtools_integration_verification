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
 * @id CON_06_02_024_RUNTIME_UNION_NULLISH_STRING
 * @expect runtime
 * @section 6.2
 * @design string|null|undefined 联合类型 string context 运行时行为
 * @note 运行时用例：实际执行验证 union 类型各分支的 string 转换
 */
function main(): void {
  let x: string | null | undefined = null
  let r1: string = 'string is ' + x
  if (r1 != 'string is null') {
    throw new Error('assertion failed: expected 'string is null', got '' + r1 + ''')
  }

  x = undefined
  let r2: string = 'string is ' + x
  if (r2 != 'string is undefined') {
    throw new Error('assertion failed: expected 'string is undefined', got '' + r2 + ''')
  }

  x = 'hello'
  let r3: string = 'string is ' + x
  if (r3 != 'string is hello') {
    throw new Error('assertion failed: expected 'string is hello', got '' + r3 + ''')
  }

  console.log('Union nullish string conversion verified')
}
