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
 * @id LEX_02_01_040_FAIL_CHAR_UNICODE_OUT_OF_RANGE
 * @expect compile-fail
 * @section 2.1
 * @design char \u{FFFFF} 超出 Unicode 码点范围应报错
 * @note compile-fail 用例：spec/experimental.md 明确指出 c'\u{FFFFF}' 应产生 compile-time error
 */
let ch: char = c'\u{FFFFF}'
