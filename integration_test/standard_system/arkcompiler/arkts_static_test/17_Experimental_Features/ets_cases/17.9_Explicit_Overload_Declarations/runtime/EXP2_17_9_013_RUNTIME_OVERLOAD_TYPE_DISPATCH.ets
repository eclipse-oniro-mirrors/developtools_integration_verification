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
 * @id EXP2_17_9_013_RUNTIME_OVERLOAD_TYPE_DISPATCH
 * @expect runtime
 * @section 17.9
 * @design 运行时验证 overload 根据参数类型正确分发
 * @note 运行时用例：传递不同类型参数验证运行时调用正确的 overload 实现
 */
function clInt(v: int): string { return 'int:' + v.toString() }
function clStr(v: string): string { return 'str:' + v }
overload classify { clInt, clStr }

function main(): void {
  let r1: string = classify(100)
  let r2: string = classify('hello')
  console.log(r1 + '|' + r2)
}
