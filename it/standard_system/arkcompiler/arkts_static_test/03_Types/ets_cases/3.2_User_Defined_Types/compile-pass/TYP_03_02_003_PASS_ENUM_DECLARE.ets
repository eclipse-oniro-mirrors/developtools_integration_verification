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
 * @id TYP_03_02_003_PASS_ENUM_DECLARE
 * @expect compile-pass
 * @section 3.2
 * @design 用户定义枚举类型声明(int 基类型)、成员引用、值比较
 * @note 正向用例：验证该特性编译通过的正确用法
 */
enum Color {
  Red,
  Green,
  Blue
}

enum Status {
  OK = 200,
  NotFound = 404,
  Error = 500
}

function testEnumDeclare(): void {
  let c: Color = Color.Red
  let cmp: boolean = c == Color.Red
  let cmp2: boolean = c != Color.Blue

  let s: Status = Status.OK
  let s2: Status = Status.NotFound
}