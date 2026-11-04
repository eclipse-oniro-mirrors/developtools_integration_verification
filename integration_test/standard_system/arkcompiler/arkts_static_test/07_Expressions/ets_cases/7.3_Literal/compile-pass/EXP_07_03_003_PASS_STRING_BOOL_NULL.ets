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
 * @id EXP_07_03_003_PASS_STRING_BOOL_NULL
 * @expect compile-pass
 * @section 7.3
 * @design 验证字符串、布尔、null、undefined 字面量编译通过
 * @note 正向用例：验证非数值字面量作为表达式的基本编译通过用法
 */
function main(): void {
  let s1: string = 'Hello'
  let s2: string = 'World'
  let s3: string = ''
  let s4: string = 'line1\nline2'
  let s5: string = 'tab\there'
  let s6: string = 'unicodeA'
  let s7: string = 'hex\xFF'
  let b1: boolean = true
  let b2: boolean = false
  let n: null = null
  let u: undefined = undefined
  console.log('verified')
}
