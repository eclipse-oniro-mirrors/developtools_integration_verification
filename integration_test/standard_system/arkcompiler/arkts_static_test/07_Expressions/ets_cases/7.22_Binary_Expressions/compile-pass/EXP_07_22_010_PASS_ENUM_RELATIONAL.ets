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
 * @id EXP_07_22_010_PASS_ENUM_RELATIONAL
 * @expect compile-pass
 * @section 7.22
 * @design 验证枚举关系运算符 < / <= / > / >=：
 *          enum(numeric value) 之间可比较
 *          enum(string value) 之间可比较，
 *          结果类型为 boolean
 * @note 正向用例：同类型枚举可进行关系比较
 */
// 数值型枚举
enum Color {
  RED,
  GREEN,
  BLUE
}

// 字符串型枚举
enum Direction {
  UP = 'UP',
  DOWN = 'DOWN',
  LEFT = 'LEFT',
  RIGHT = 'RIGHT'
}

function main(): void {
  // 数值枚举比较：RED < BLUE → boolean
  let r1 = Color.RED < Color.BLUE
  let r1Type = typeof(r1)
  if (r1Type != 'boolean') {
    throw new Error('enum<enum should be boolean, got ' + r1Type)
  }

  // 数值枚举 >=
  let r2 = Color.GREEN >= Color.RED
  let r2Type = typeof(r2)
  if (r2Type != 'boolean') {
    throw new Error('enum>=enum should be boolean, got ' + r2Type)
  }

  // 字符串枚举比较
  let r3 = Direction.UP < Direction.DOWN
  let r3Type = typeof(r3)
  if (r3Type != 'boolean') {
    throw new Error('string enum<string enum should be boolean, got ' + r3Type)
  }

  // 实际值验证
  if (Color.RED >= Color.BLUE) {
    throw new Error('expected RED < BLUE')
  }
console.log('verified')
}
main()
