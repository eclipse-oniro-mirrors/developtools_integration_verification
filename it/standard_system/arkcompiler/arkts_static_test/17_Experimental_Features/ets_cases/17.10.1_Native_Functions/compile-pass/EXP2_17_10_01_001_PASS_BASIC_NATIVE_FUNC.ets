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
 * @id EXP2_17_10_01_001_PASS_BASIC_NATIVE_FUNC
 * @expect compile-pass
 * @section 17.10.1
 * @design 基本原生函数声明：验证使用 native 关键字声明的无函数体原生函数可以编译通过
 * @note 正向用例：验证该特性编译通过的正确用法
 */
native function nativePrint(msg: string): void
