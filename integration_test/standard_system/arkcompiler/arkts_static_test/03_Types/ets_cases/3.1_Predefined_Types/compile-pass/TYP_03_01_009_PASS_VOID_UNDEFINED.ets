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
 * @id TYP_03_01_009_PASS_VOID_UNDEFINED
 * @expect compile-pass
 * @section 3.1
 * @design 函数返回 void、函数返回 undefined、return undefined 显式写法、undefined 变量声明
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function returnsVoid(): void {
  return
}

function returnsUndefined(): undefined {
  return undefined
}

function returnsExplicitVoid(): void {
  return undefined
}

function optParam(p?: int): void {}

function testVoidUndefined(): void {
  returnsVoid()
  let u: undefined = undefined
}

function callOptParam(): void {
  optParam()
  optParam(1)
  optParam(undefined)
}