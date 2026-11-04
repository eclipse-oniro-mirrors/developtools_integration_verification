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
 * @id CLS_09_07_033_RUNTIME_METHOD_BODY_CONTROL_FLOW
 * @expect runtime
 * @section 9.7.7
 */
class Flow { compute(n: int): int { let r: int = 1; for (let i: int = 1; i <= n; i++) { r = r * i } return r } }
function main(): void { let f: Flow = new Flow(); if (f.compute(5) != 120) { throw new Error("fail") } console.log("verified") }
