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
 * @id EXP2_17_10_02_011_FAIL_NATIVE_IN_INTERFACE
 * @expect compile-fail
 * @section 17.10.2
 * @design interface 中不能使用 native 方法：验证 interface 中使用 native 关键字产生语法错误 ESY0224
 * @note 反向用例：验证该场景应产生编译时错误 - Identifier expected, got 'native'
 */
interface BadInterface {
  native foo(): void
}
