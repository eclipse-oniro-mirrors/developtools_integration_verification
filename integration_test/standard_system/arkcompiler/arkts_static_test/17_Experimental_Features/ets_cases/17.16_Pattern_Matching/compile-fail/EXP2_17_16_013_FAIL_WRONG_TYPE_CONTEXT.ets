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
 * @id EXP2_17_16_013_FAIL_WRONG_TYPE_CONTEXT
 * @expect compile-fail
 * @section 17.16
 * @design 类型名在错误上下文中使用——instanceof 右侧必须为类型引用
 * @note 反向用例：验证 instanceof 右侧使用非类型表达式触发编译错误
 */
function testWrongTypeContext(): void {
  let x: Object = 'hello'
  let typeName: string = 'String'
  // typeof / runtime type string is not a valid instanceof operand
  if (x instanceof typeName) {
    console.log('invalid')
  }
}
