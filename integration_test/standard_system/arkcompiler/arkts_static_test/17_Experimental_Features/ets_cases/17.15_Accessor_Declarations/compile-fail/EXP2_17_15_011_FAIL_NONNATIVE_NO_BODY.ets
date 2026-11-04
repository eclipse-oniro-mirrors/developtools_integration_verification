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
 * @id EXP2_17_15_011_FAIL_NONNATIVE_NO_BODY
 * @expect compile-fail
 * @section 17.15
 * @design 非原生 getter 声明缺少函数体，应编译失败
 * @note 反向用例：spec 规定非原生 accessor 必须有函数体
 *        编译器报 ESE0017: Only abstract or native methods can't have body
 */
get noBody(): int
