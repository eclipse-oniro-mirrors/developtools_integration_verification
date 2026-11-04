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
 * @id CLS_09_07_021_RUNTIME_STATIC_ACCESS_PROTECTED
 * @expect runtime
 * @section 9.7.1
 * @design static方法访问protected static字段
 * @note 运行时用例
 */
class Container { protected static val: int = 42; static getVal(): int { return Container.val } }
function main(): void { if (Container.getVal() != 42) { throw new Error("fail") } console.log("verified") }
