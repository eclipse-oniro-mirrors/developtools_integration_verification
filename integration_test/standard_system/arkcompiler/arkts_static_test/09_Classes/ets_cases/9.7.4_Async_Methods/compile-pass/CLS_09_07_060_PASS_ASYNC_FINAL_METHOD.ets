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
 * @id CLS_09_07_060_PASS_ASYNC_FINAL_METHOD
 * @expect compile-pass
 * @section 9.7.4
 * @design final async 方法被编译器接受（spec 可能禁止但 es2panda 未强制）
 * @note CLS-I5: final+async 修饰符组合未被 es2panda 检查
 */
class AsyncFinal060 {
  final async doLock(): Promise<void> {} // 编译器接受（spec 层面可能应禁止）
}
