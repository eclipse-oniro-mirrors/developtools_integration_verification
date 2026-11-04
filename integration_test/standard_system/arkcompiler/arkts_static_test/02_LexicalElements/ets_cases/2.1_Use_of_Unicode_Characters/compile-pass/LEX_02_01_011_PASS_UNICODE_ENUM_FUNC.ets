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
 * @id LEX_02_01_011_PASS_UNICODE_ENUM_FUNC
 * @expect compile-pass
 * @section 2.1
 * @design Unicode枚举成员名、函数名、参数名 * @note 正向用例：验证该特性编译通过的正确用法

 */
enum 方向 {
  北,
  南,
  东,
  西
}

function 加(a: number, b: number): number {
  return a + b
}

function greet(名字: string): string {
  return "Hello " + 名字
}

function testUnicodeEnumFunc(): void {
  let d: 方向 = 方向.北
  let r: number = 加(3, 4)
  let g: string = greet("世界")
}
