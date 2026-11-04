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
 * @id CON_06_01_015_PASS_RETURN_WIDENING
 * @expect compile-pass
 * @section 6.1
 * @design Return context: return 表达式利用隐式 widening 转换（int -> number, int -> long）
 * @note 正向用例：验证返回上下文允许使用隐式转换的用法
 */
function returnAsNumber(): number {
  let intVal: int = 42
  return intVal
}

function returnAsLong(): long {
  return 100
}

function returnAsDouble(): double {
  return 7
}

function testReturnWidening(): void {
  let n: number = returnAsNumber()
  let l: long = returnAsLong()
  let d: double = returnAsDouble()
}
