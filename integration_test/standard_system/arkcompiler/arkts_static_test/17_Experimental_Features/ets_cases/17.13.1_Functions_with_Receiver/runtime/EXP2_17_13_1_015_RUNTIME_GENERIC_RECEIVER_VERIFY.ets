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
 * @id EXP2_17_13_1_015_RUNTIME_GENERIC_RECEIVER_VERIFY
 * @expect runtime
 * @section 17.13.1
 * @design 运行时验证：泛型接收者函数在运行时正确执行
 * @note 运行时用例：实际执行验证泛型接收者函数
 */
class StorageBox<T> { public data: T | undefined }
function store<T>(this: StorageBox<T>, value: T): void { this.data = value }
function retrieve<T>(this: StorageBox<T>): T | undefined { return this.data }
function main(): void {
  let s1: StorageBox<string> = new StorageBox<string>()
  s1.store('hello world')
  let r1: string | undefined = s1.retrieve()
  if (r1 != 'hello world') { throw new Error("assertion failed: expected 'hello world', got '" + r1 + ''') }
  let s2: StorageBox<number> = new StorageBox<number>()
  store(s2, 42)
  let r2: number | undefined = retrieve(s2)
  if (r2 != 42) { throw new Error("assertion failed: expected 42, got " + r2) }
  console.log('verified')}
