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
 * @id EXP2_17_10_01_003_PASS_MULTIPLE_NATIVE_FUNCS
 * @expect compile-pass
 * @section 17.10.1
 * @design 多个原生函数声明：验证可以同时声明多个具有不同签名的原生函数
 * @note 正向用例：验证该特性编译通过的正确用法
 */
native function getValue(): int
native function setValue(v: int): void
native function getName(): string
native function isReady(): boolean
