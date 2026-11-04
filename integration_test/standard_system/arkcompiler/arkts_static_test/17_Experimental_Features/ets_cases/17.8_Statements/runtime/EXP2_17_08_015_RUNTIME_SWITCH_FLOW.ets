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
 * @id EXP2_17_08_015_RUNTIME_SWITCH_FLOW
 * @expect runtime
 * @section 17.8
 * @design 验证 switch 语句和条件分支的运行时行为
 * @note 运行时用例：实际执行验证 switch 分支匹配、default 分支、if-else 条件判断行为正确
 */
function main(): void {
  // Test switch with integer
  let result: string = ''
  let day: number = 3
  switch (day) {
    case 1:
      result = 'Monday'
      break
    case 2:
      result = 'Tuesday'
      break
    case 3:
      result = 'Wednesday'
      break
    default:
      result = 'other'
      break
  }
  if (result != 'Wednesday') {
    throw new Error("switch int assertion failed: expected 'Wednesday', got '" + result + ''')
  }

  // Test switch with string
  let colorCode: number = 0
  let color: string = 'green'
  switch (color) {
    case 'red':
      colorCode = 1
      break
    case 'green':
      colorCode = 2
      break
    case 'blue':
      colorCode = 3
      break
    default:
      colorCode = 0
      break
  }
  if (colorCode != 2) {
    throw new Error("switch string assertion failed: expected 2, got " + colorCode)
  }

  // Test switch default fallback
  let defResult: string = ''
  let unknownVal: number = 99
  switch (unknownVal) {
    case 1:
      defResult = 'one'
      break
    case 2:
      defResult = 'two'
      break
    default:
      defResult = 'default'
      break
  }
  if (defResult != 'default') {
    throw new Error("switch default assertion failed: expected 'default', got '" + defResult + ''')
  }

  // Test if-else flow
  let x: number = 15
  let ifResult: string = ''
  if (x > 20) {
    ifResult = 'large'
  } else if (x > 10) {
    ifResult = 'medium'
  } else {
    ifResult = 'small'
  }
  if (ifResult != 'medium') {
    throw new Error("if-else assertion failed: expected 'medium', got '" + ifResult + ''')
  }

  // Test return value
  let returned: number = testReturn()
  if (returned != 42) {
    throw new Error("return assertion failed: expected 42, got " + returned)
  }

  console.log('verified')
}

function testReturn(): number {
  let a: number = 40
  let b: number = 2
  return a + b
}
