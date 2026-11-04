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
 * @id CLS_09_10_013_PASS_MULTI_INTERFACE
 * @expect compile-pass
 * @section 9.10
 * @design 类实现多个接口
 * @note 正向用例：implements多个接口
 */
interface A13 { a(): int }
interface B13 { b(): string }
class Impl implements A13, B13 {
  a(): int { return 1 }
  b(): string { return "b" }
}
