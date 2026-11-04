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
 * @id CLS_09_07_038_RUNTIME_STATIC_FACTORY
 * @expect runtime
 * @section 9.7.1
 * @design Auto-added metadata
 * @note Auto-fixed missing metadata
 */
class S38 { private constructor() {} static create(): S38 { return new S38() } }
function main(): void { let s: S38 = S38.create(); console.log("verified") }
