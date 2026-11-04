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
 * @id GEN_05_01_02_002_PASS_MULTI_DEFAULT
 * @expect compile-pass
 * @section 5.1.2
 * @design 多参数部分默认
 * @note 正向用例：验证多类型参数部分有默认值
 */
class C2<T1, T2 = number, T3 = string> {}
let c1: C2<number> = new C2<number>();
let c2: C2<number, string> = new C2<number, string>();
