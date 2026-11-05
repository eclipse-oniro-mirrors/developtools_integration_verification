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
 * @id TYP_03_02_009_PASS_LITERAL_TYPE_STRING
 * @expect compile-pass
 * @section 3.2
 * @design 字符串字面量类型作为类型注解、赋值
 * @note 正向用例：验证字符串字面量类型（ArkTS 唯一支持的字面量类型）
 *       注：嵌套函数和 type alias 移到顶层
 */
type Direction = "up" | "down" | "left" | "right"

function acceptHello(s: "hello"): void {}

function testLiteralString(): void {
  let s1: "hello" = "hello"
  let s2: "world" = "world"

  acceptHello("hello")

  let d: Direction = "up"
  d = "down"
}