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
 * @id AMB_14_06_006_FAIL_MEMBER_INITIALIZER
 * @expect compile-fail
 * @section 14.6
 * @design declare enum 成员有初始化器 A = 5，违反 spec
 * @note 反向用例：ambient enum 成员带初始化器应产生编译时错误
 *       ✅ 编译器正确拒绝（原 D 类已修复）
 */
declare enum Err1 { A = 5 }
