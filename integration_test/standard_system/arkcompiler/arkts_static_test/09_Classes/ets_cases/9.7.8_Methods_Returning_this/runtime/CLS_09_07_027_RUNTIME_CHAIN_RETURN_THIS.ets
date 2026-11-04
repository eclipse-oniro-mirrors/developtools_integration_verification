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
 * @id CLS_09_07_027_RUNTIME_CHAIN_RETURN_THIS
 * @expect runtime
 * @section 9.7.8
 * @design return this链式调用运行时
 * @note 运行时用例
 */
class Chain { setA(v: int): this { return this } setB(v: string): this { return this } }
function main(): void { let c: Chain = new Chain(); let r: Chain = c.setA(1).setB("x"); console.log("verified") }
