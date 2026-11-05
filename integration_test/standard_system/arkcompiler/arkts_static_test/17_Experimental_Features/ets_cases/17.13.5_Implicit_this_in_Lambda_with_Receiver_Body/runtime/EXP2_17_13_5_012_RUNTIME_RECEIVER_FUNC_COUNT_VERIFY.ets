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
 * @id EXP2_17_13_5_012_RUNTIME_RECEIVER_FUNC_COUNT_VERIFY
 * @expect runtime
 * @section 17.13.5
 * @design 运行时验证：接收者函数中this.count自增正确反映接收者状态
 * @note 运行时用例：实际执行验证无歧义场景下this.count正确更新
 */
class DataStore { public count: number = 0 }
function update(this: DataStore): number { this.count = this.count + 1; return this.count }
function main(): void {
  let ds: DataStore = new DataStore(); ds.count = 10
  let r1: number = ds.update()
  if (r1 != 11) { throw new Error('assertion failed: expected 11, got ' + r1) }
  let r2: number = ds.update()
  if (r2 != 12) { throw new Error('assertion failed: expected 12, got ' + r2) }
  let r3: number = update(ds)
  if (r3 != 13) { throw new Error('assertion failed: expected 13, got ' + r3) }
  console.log('verified')
}
