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
 * @id TYP_03_01_027_FAIL_FUNCTION_SIGNATURE
 * @expect compile-fail
 * @section 3.1
 * @design 函数类型签名不匹配赋值应编译失败: 参数数量不匹配、参数类型不匹配、返回值类型不匹配、参数精度不匹配(int vs double)
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testFunctionSignatureMismatchFail(): void {
  let f1: () => int = (x: int): int => { return x }

  let f2: (x: int) => int = (): int => { return 42 }

  let f3: (x: int) => int = (x: string): int => { return 0 }

  let f4: () => int = (): string => { return "hello" }

  let f5: (x: double) => void = (x: int): void => {}
}

function testFunctionAssignFail(): void {
  function takesIntToString(x: int): string { return "" + x }
  let f: (x: int) => int = takesIntToString
}