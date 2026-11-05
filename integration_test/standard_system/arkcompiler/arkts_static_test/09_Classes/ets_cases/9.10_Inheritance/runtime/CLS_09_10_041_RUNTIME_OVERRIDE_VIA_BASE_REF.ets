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
 * @id CLS_09_10_041_RUNTIME_OVERRIDE_VIA_BASE_REF
 * @expect runtime
 * @section 9.10
 */
class Base23 { getValue(): int { return 100 } }
class Child23 extends Base23 { override getValue(): int { return 200 } }
function main(): void { let b: Base23 = new Child23(); if (b.getValue() != 200) { throw new Error("fail") } console.log("verified") }
