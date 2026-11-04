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
 * @id CON_06_04_018_RUNTIME_ENUM_TO_STRING_VALUES
 * @expect runtime
 * @section 6.4
 * @design Enumeration to string 运行时值保留
 * @note 运行时用例：实际执行验证 string 枚举→string 转换
 */
enum Status {
  Ready = 'ready',
  Running = 'running',
  Done = 'done'
}

function main(): void {
  let s1: string = 'status: ' + Status.Ready
  if (s1 != 'status: ready') {
    throw new Error('assertion failed: expected 'status: ready', got '' + s1 + ''')
  }

  let s2: string = Status.Running + ' now'
  if (s2 != 'running now') {
    throw new Error('assertion failed: expected 'running now', got '' + s2 + ''')
  }

  let s3: string = '' + Status.Done
  if (s3 != 'done') {
    throw new Error('assertion failed: expected 'done', got '' + s3 + ''')
  }

  console.log('Enum to string values verified')
}
