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
 * @id EXP2_17_13_3_012_RUNTIME_GENERIC_FUNC_TYPE_RECEIVER
 * @expect runtime
 * @section 17.13.3
 * @design 运行时验证：泛型接收者函数类型变量正确执行
 * @note 运行时用例：实际执行验证泛型函数类型带接收者
 */
class Slot<T> { public item: T | undefined }
type SlotAccessor<T> = (this: Slot<T>) => T | undefined
function main(): void {
  let getItem: SlotAccessor<string> = (this: Slot<string>): string | undefined => { return this.item }
  let slot: Slot<string> = new Slot<string>(); slot.item = 'found'
  let r: string | undefined = getItem(slot)
  if (r != 'found') { throw new Error("assertion failed: expected 'found', got '" + r + ''') }
  console.log('verified')
}
