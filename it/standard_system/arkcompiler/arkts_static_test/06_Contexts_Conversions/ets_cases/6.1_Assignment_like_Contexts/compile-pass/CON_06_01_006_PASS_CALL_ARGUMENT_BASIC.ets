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
 * @id CON_06_01_006_PASS_CALL_ARGUMENT_BASIC
 * @expect compile-pass
 * @section 6.1
 * @design Call context: 函数调用实参类型与形参类型完全匹配
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function takeInt(value: int): void {
  let x: int = value
}

function takeString(value: string): void {
  let s: string = value
}

function takeBool(value: boolean): void {
  let b: boolean = value
}

function testCallArgumentBasic(): void {
  takeInt(42)
  takeString('hello')
  takeBool(true)
}
