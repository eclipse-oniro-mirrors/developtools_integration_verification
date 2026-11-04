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
 * @id CLS_09_08_032_RUNTIME_ACCESSOR_VALIDATION
 * @expect runtime
 * @section 9.8
 * @design 运行时验证 setter 内置校验逻辑：非法值被拒绝写入，原值保持
 * @note 运行时用例：age setter 对负值不写入，getter 返回受保护的原值
 */
class Age { private _age: int = 0; get age(): int { return this._age } set age(a: int) { if (a < 0) { return } this._age = a } }
function main(): void { let p: Age = new Age(); p.age = 25; if (p.age != 25) { throw new Error("fail") } p.age = -1; if (p.age != 25) { throw new Error("setter validation fail") } console.log("verified") }
