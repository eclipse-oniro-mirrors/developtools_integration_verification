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
 * @id EXP_07_02_04_003_PASS_CONSTRUCTOR_ARGS_LTR
 * @expect compile-pass
 * @section 7.2.4
 * @design 构造函数(new)调用参数从左到右求值基本编译通过：验证 new 表达式中参数从左到右编译通过
 * @note 正向用例：验证构造函数调用的参数从左到右编译通过
 */
function computeX(): int {
  return 10
}

function computeY(): int {
  return 20
}

class Point {
  public x: int
  public y: int

  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }
}

let p: Point = new Point(computeX(), computeY())
