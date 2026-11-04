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
 * @id CON_06_02_025_RUNTIME_MULTI_TYPE_CONCAT
 * @expect runtime
 * @section 6.2
 * @design 多类型混合 '+' 拼接运行时行为：综合验证各种类型的 string 转换
 * @note 运行时用例：实际执行综合验证 string context 的正确行为
 */
enum Color {
  Red = 'red',
  Blue = 'blue'
}

function main(): void {
  let r1: string = 'a=' + 10 + ', b=' + 3.14 + ', ok=' + true
  if (r1 != 'a=10, b=3.14, ok=true') {
    throw new Error('assertion failed: expected 'a=10, b=3.14, ok=true', got '' + r1 + ''')
  }

  let r2: string = 1 + ' + ' + 2 + ' = ' + 3
  if (r2 != '1 + 2 = 3') {
    throw new Error('assertion failed: expected '1 + 2 = 3', got '' + r2 + ''')
  }

  let r3: string = '' + null + ',' + undefined
  if (r3 != 'null,undefined') {
    throw new Error('assertion failed: expected 'null,undefined', got '' + r3 + ''')
  }

  let r4: string = 'color=' + Color.Red + ', neg=' + (-5) + ', flag=' + false
  if (r4 != 'color=red, neg=-5, flag=false') {
    throw new Error('assertion failed: multi-concat mismatch, got '' + r4 + ''')
  }

  console.log('Multi-type string concatenation verified')
}
