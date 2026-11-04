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
 * @id TYP_03_04_014_FAIL_USE_UNDEFINED_NAMED_TYPE
 * @expect compile-fail
 * @section 3.4
 * @design 引用未声明的命名类型应失败
 * @note 反向用例：用一个不存在的类型名作类型注解
 */
function testUndefinedNamedFail(): void {
  let x: Undeclared = 1
  let y: AnotherMissing<int> = null
}