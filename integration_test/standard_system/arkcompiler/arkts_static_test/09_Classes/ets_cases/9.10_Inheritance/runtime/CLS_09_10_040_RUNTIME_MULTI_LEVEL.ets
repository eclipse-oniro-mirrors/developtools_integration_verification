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
 * @id CLS_09_10_040_RUNTIME_MULTI_LEVEL
 * @expect runtime
 * @section 9.10
 * @design 三级继承链方法调用
 * @note 运行时用例
 */
class L1 { l1(): string { return "L1" } }
class L2 extends L1 { l2(): string { return "L2" } }
class L3 extends L2 { l3(): string { return "L3" } }
function main(): void { let obj: L3 = new L3(); if (obj.l1() != "L1" || obj.l2() != "L2" || obj.l3() != "L3") { throw new Error("fail") } console.log("verified") }
