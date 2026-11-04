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
 * @id AMB_14_07_01_001_PASS_IMPLEMENT_SAME_NAME
 * @expect compile-pass
 * @section 14.7.1
 * @design 实现 ambient namespace：同名非 declare namespace
 * @note 正向用例：spec 允许同名实现
 *       ⚠️ SPEC 不一致：当前编译器报 "Unable to merge namespaces"（modifier 不同），待修复
 *       分类：D 类（Spec 与实现不一致）
 */
declare namespace A {}
namespace A {}
