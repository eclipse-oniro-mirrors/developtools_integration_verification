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
 * @id EXP_07_05_01_019_FAIL_TUPLE_ELEMENT_MISMATCH
 * @expect compile-fail
 * @section 7.5.1
 * @design Tuple 元素类型不匹配：let incorrect: [number, string] = ["hello", 1]
 * @note 反向用例：元素类型与 tuple 对应位置不匹配应报编译时错误
 *       各元素必须可赋值到对应位置的构成类型
 */
let incorrect: [number, string] = ['hello', 1]
