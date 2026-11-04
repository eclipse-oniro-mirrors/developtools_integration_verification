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
 * @id CLS_09_07_040_PASS_STATIC_MULTI_PARAM
 * @expect compile-pass
 * @section 9.7.1
 * @design Auto-added metadata
 * @note Auto-fixed missing metadata
 */
class Math040 { static sum3(a: int, b: int, c: int): int { return a+b+c } static max(a: int, b: int): int { if (a>b) {return a} return b } }
