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
 * @id CLS_09_07_049_RUNTIME_OVERRIDE_CHAIN
 * @expect runtime
 * @section 9.7.2
 * @design Auto-added metadata
 * @note Auto-fixed missing metadata
 */
class Base049 { val(): int { return 1 } }
class Mid049 extends Base049 { override val(): int { return super.val()+1 } }
class Derived049 extends Mid049 { override val(): int { return super.val()+1 } }
function main(): void { let d: Derived049 = new Derived049(); if (d.val()!=3) { throw new Error("fail") } console.log("verified") }
