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
 * @id CON_06_04_006_PASS_WIDENING_IN_CALL
 * @expect compile-pass
 * @section 6.4
 * @design Widening 在调用上下文中：int 实参传递给 long/double 形参
 * @note 正向用例：验证 widening 在调用上下文中隐式生效
 */
function takeLong(val: long): void {
  let x: long = val
}

function takeDouble(val: double): void {
  let x: double = val
}

function testWideningInCall(): void {
  let a: int = 42
  takeLong(a)
  takeDouble(a)
}
