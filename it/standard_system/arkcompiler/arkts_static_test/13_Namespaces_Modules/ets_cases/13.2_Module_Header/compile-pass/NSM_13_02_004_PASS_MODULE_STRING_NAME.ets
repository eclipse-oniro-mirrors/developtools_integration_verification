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
/*
 * NSM_13_02_004_PASS_MODULE_STRING_NAME
 * @id NSM_13_02_004_PASS_MODULE_STRING_NAME
 * @expect compile-pass
 * @section 13.2
 * @design moduleName 为 StringLiteral 的 module header 声明
 * @note 正向用例：验证 module StringLiteral name 编译通过
 *       ⚠️ C 类：es2panda 不支持 module header 语法
 *       分类：C 类（编译器实现限制 — 不支持 module header 语法）
 */
export module 'com.example.app'

export function hello(): void {
  console.log('Module with string literal name')
}
