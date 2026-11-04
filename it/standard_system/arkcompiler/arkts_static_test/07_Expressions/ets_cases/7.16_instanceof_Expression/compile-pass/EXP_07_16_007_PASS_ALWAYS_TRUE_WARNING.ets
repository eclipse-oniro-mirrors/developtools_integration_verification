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
 * @id EXP_07_16_007_PASS_ALWAYS_TRUE_WARNING
 * @expect compile-pass
 * @section 7.16
 * @design 验证 instanceof 始终为 true 时编译通过（附带编译时警告）
 * @note 正向用例：子类实例 instanceof 父类始终为 true，编译警告但不报错
 */
class A {}
class B extends A {}

function test(b: B): boolean {
  return b instanceof A
}
