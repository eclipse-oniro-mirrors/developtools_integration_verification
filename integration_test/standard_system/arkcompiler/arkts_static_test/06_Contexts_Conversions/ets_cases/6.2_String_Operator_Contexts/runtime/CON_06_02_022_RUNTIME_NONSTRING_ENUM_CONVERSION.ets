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
 * @id CON_06_02_022_RUNTIME_NONSTRING_ENUM_CONVERSION
 * @expect runtime
 * @section 6.2
 * @design 非 string 值枚举 string 转换运行时行为：通过 toString() 转换
 * @note 运行时用例：实际执行验证非 string enum → toString() 结果
 */
enum Level {
  Low,
  Medium,
  High
}

function main(): void {
  let r1: string = 'level: ' + Level.Low
  if (r1 != 'level: 0') {
    throw new Error('assertion failed: expected 'level: 0', got '' + r1 + ''')
  }

  let r2: string = Level.High + ' priority'
  if (r2 != '2 priority') {
    throw new Error('assertion failed: expected '2 priority', got '' + r2 + ''')
  }

  let r3: string = '' + Level.Medium
  if (r3 != '1') {
    throw new Error('assertion failed: expected '1', got '' + r3 + ''')
  }

  console.log('Non-string enum conversion verified')
}
