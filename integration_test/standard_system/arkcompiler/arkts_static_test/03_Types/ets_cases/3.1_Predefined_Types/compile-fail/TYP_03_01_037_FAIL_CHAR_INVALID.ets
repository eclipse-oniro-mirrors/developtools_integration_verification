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
 * @id TYP_03_01_037_FAIL_CHAR_INVALID
 * @expect compile-fail
 * @section 3.1
 * @design 非法 char 字面量、超出范围、char 不能直接接受 int
 * @note 反向用例：验证 char 类型边界检查
 */
function testCharInvalidFail(): void {
  // int 不能直接赋值给 char (narrowing)
  let n: int = 65
  let c: char = n

  // 字符串不能赋值给 char
  let s: string = "a"
  let c2: char = s

  // char 不能直接 narrowing 到 byte
  let ch: char = c'A'
  let b: byte = ch
}