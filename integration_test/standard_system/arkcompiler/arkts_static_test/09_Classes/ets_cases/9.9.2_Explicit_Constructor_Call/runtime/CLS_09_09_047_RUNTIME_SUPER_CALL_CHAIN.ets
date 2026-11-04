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
 * @id CLS_09_09_047_RUNTIME_SUPER_CALL_CHAIN
 * @expect runtime
 * @section 9.9.2
 * @design Auto-added metadata
 * @note Auto-fixed missing metadata
 */
class B047 { val: int; constructor(v: int) { this.val = v } }
class D047 extends B047 { extra: string; constructor(v: int, s: string) { super(v); this.extra = s } }
function main(): void { let d: D047 = new D047(10, "x"); if (d.val!=10||d.extra!="x") { throw new Error("fail") } console.log("verified") }
