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
 * @id CON_06_04_01_006_PASS_WIDENING_IN_CALL
 * @expect compile-pass
 * @section 6.4.1
 * @design Widening 在调用上下文中: byte/short/int→long, int/float→double
 * @note 正向用例：验证 spec 示例中的 widening 调用
 */
function takeLong(val: long): void {}
function takeDouble(val: double): void {}

function testWideningInCall(): void {
  let b: byte = 1
  let s: short = 2
  let i: int = 3

  takeLong(b)
  takeLong(s)
  takeLong(i)

  let f: float = i
  takeDouble(f)
}
