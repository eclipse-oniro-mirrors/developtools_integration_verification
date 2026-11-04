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
 * @id CON_06_04_022_RUNTIME_BOOL_STRING_VALUES
 * @expect runtime
 * @section 6.4
 * @design boolean→string 运行时行为: true→"true", false→"false"
 * @note 运行时用例：实际执行验证 boolean string 转换
 */
function main(): void {
  let s1: string = '' + true
  if (s1 != 'true') {
    throw new Error('assertion failed: true→'true', got '' + s1 + ''')
  }

  let s2: string = '' + false
  if (s2 != 'false') {
    throw new Error('assertion failed: false→'false', got '' + s2 + ''')
  }

  console.log('Bool string values verified')
}
