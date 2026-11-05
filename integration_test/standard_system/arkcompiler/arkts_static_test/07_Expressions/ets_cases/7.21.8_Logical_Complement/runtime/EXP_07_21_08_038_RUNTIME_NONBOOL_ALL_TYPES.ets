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
 * @id EXP_07_21_08_038_RUNTIME_NONBOOL_ALL_TYPES
 * @expect runtime
 * @section 7.21.8
 * @design 验证多种非 boolean 类型的 truthy/falsy 综合对比
 * @note 运行时用例：不同类型 truthy/falsy 一致性校验
 */
function testFalsy(): void {
    // Falsy values in ArkTS Extended Conditional
    if (!null != true) {
    throw new Error('null')
  }
    if (!undefined != true) {
    throw new Error('undefined')
  }
    if (!0 != true) {
    throw new Error('0')
  }
    if (!'' != true) {
    throw new Error('empty string')
  }
    if (!false != true) {
    throw new Error('false')
  }
}

function testTruthy(): void {
    if (!42 != false) {
    throw new Error('42')
  }
    if (!'hello' != false) {
    throw new Error('hello')
  }
    let o: Object = {}
    if (!o != false) {
    throw new Error('Object')
  }
    if (!(-1) != false) {
    throw new Error('-1')
  }
    if (!3.14 != false) {
    throw new Error('3.14')
  }
    if (!true != false) {
    throw new Error('true')
  }
}

function main(): void {
    testFalsy()
    testTruthy()
    console.log('verified')
}
