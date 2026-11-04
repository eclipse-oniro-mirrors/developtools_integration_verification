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
 * @id EXP_07_02_02_018_RUNTIME_CLASS_CAST_ERROR
 * @expect runtime
 * @section 7.2.2
 * @design 验证类型转换失败时抛出 ClassCastError：as 表达式在运行时类型不兼容
 * @note 运行时用例：验证该场景的运行时行为
 * @runtime-throws=ClassCastError
 */
class A {}

class B extends A {}

class C extends A {}

function main(): void {
  let a: A = new B();
  let c: C = a as C;
  console.log('verified');
}
