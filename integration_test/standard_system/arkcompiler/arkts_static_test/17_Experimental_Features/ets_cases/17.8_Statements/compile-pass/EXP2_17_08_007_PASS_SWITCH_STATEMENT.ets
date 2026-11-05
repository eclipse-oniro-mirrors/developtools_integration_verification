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
 * @id EXP2_17_08_007_PASS_SWITCH_STATEMENT
 * @expect compile-pass
 * @section 17.8
 * @design 验证 switch 语句（整数匹配、字符串匹配、含 default、含 break）在 ArkTS 中编译通过
 * @note 正向用例：验证 switch 语句的标准用法编译通过
 */
function testSwitchInt(): void {
  let day: number = 3
  let dayName: string = 'unknown'
  switch (day) {
    case 1:
      dayName = 'Monday'
      break
    case 2:
      dayName = 'Tuesday'
      break
    case 3:
      dayName = 'Wednesday'
      break
    default:
      dayName = 'other'
      break
  }
}

function testSwitchString(): void {
  let color: string = 'red'
  let code: number = 0
  switch (color) {
    case 'red':
      code = 0xFF0000
      break
    case 'green':
      code = 0x00FF00
      break
    case 'blue':
      code = 0x0000FF
      break
    default:
      code = 0
      break
  }
}

function testSwitchFallThrough(): void {
  let val: number = 1
  let result: number = 0
  switch (val) {
    case 1:
    case 2:
      result = 10
      break
    case 3:
      result = 20
      break
    default:
      result = 0
      break
  }
}
