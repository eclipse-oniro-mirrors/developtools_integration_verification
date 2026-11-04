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
 * @id CON_06_01_014_PASS_CALL_WIDENING
 * @expect compile-pass
 * @section 6.1
 * @design Call context: 函数调用实参利用隐式 widening 转换（int -> number, int -> long）
 * @note 正向用例：验证调用上下文允许使用隐式转换的用法
 */
function acceptNumber(n: number): void {
  let x: number = n
}

function acceptLong(l: long): void {
  let x: long = l
}

function acceptDouble(d: double): void {
  let x: double = d
}

function testCallWidening(): void {
  let intVal: int = 42
  acceptNumber(intVal)
  acceptLong(100)
  acceptDouble(3)
}
