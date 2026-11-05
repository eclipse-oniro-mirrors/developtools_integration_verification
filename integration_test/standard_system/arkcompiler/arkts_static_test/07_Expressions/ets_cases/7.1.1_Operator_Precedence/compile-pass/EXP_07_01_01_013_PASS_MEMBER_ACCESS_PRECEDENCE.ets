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
 * @id EXP_07_01_01_013_PASS_MEMBER_ACCESS_PRECEDENCE
 * @expect compile-pass
 * @section 7.1.1
 * @design 成员访问 `.` 优先级高于算术运算符，字段值先取出再参与运算
 * @note 正向用例：验证成员访问优先级高于算术
 */
class Point {
  public x: int = 3
  public y: int = 4
}

function testMemberAccessPrecedence(): void {
  let p: Point = new Point()
  let a: int = p.x * 2 + p.y
  let b: int = p.x + p.y * 2
}
