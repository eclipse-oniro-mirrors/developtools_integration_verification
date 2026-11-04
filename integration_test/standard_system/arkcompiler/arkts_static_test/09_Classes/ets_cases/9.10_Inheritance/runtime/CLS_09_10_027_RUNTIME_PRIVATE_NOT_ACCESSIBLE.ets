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
 * @id CLS_09_10_027_RUNTIME_PRIVATE_NOT_ACCESSIBLE
 * @expect runtime
 * @section 9.10
 * @design 运行时验证 private 成员不被子类继承，但可通过父类公有方法间接访问
 * @note 运行时用例：D27 不能直接访问 secret，但继承的 getSecret() 返回 99
 */
class B27 { private secret: int = 99; getSecret(): int { return this.secret } }
class D27 extends B27 {}
function main(): void { let d: D27 = new D27(); if (d.getSecret() != 99) { throw new Error("fail") } console.log("verified") }
