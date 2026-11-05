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
 * @id CLS_09_08_028_RUNTIME_GETTER_INFERRED
 * @expect runtime
 * @section 9.8
 * @design getter返回类型推断运行时验证
 * @note 运行时用例
 */
class GetterBox028 { private _val: int = 99; get val() { return this._val } }
function main(): void { let b: GetterBox028 = new GetterBox028(); if (b.val != 99) { throw new Error("fail") } console.log("verified") }
