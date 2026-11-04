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
 * @id EXP2_17_09_1_002_PASS_FUNCOVERLOAD_DIFFERENTPARAMCOUNT
 * @expect compile-pass
 * @section 17.9.1
 * @design overload 函数重载：不同参数数量(0/1/2/3 参数)
 * @note 正向用例：验证不同参数数量的函数可以组成重载集
 */
function greet0(): string {
  return 'Hello'
}
function greet1(name: string): string {
  return 'Hello ' + name
}
function greet2(first: string, last: string): string {
  return 'Hello ' + first + ' ' + last
}
overload greet { greet0, greet1, greet2 }
