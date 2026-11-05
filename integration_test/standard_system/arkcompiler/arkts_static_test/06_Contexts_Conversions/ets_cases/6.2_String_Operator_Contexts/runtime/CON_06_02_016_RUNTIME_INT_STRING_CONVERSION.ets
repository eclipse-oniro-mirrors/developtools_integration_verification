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
 * @id CON_06_02_016_RUNTIME_INT_STRING_CONVERSION
 * @expect runtime
 * @section 6.2
 * @design 整数类型 string 转换运行时行为：int 转换为十进制字符串，包含正数、负数、零
 * @note 运行时用例：实际执行验证 int → string 十进制转换
 */
function main(): void {
  let r1: string = 'value: ' + 42
  if (r1 != 'value: 42') {
    throw new Error('assertion failed: expected 'value: 42', got '' + r1 + ''')
  }

  let r2: string = (-7) + ' items'
  if (r2 != '-7 items') {
    throw new Error('assertion failed: expected '-7 items', got '' + r2 + ''')
  }

  let r3: string = 'zero: ' + 0
  if (r3 != 'zero: 0') {
    throw new Error('assertion failed: expected 'zero: 0', got '' + r3 + ''')
  }

  let r4: string = '' + 123
  if (r4 != '123') {
    throw new Error('assertion failed: expected '123', got '' + r4 + ''')
  }

  let intVar: int = 999
  let r5: string = 'n=' + intVar
  if (r5 != 'n=999') {
    throw new Error('assertion failed: expected 'n=999', got '' + r5 + ''')
  }

  console.log('Int string conversion verified')
}
