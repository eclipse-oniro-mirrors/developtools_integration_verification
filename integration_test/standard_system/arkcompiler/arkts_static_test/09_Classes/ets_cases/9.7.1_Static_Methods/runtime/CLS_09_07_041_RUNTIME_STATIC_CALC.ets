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
 * @id CLS_09_07_041_RUNTIME_STATIC_CALC
 * @expect runtime
 * @section 9.7.1
 * @design Auto-added metadata
 * @note Auto-fixed missing metadata
 */
class Calc041 { static fact(n: int): int { let r: int = 1; for (let i: int=2;i<=n;i++) {r=r*i} return r } }
function main(): void { if (Calc041.fact(5)!=120) { throw new Error("fail") } console.log("verified") }
