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
 * @id CCY_16_CI_006_PASS_promise_catch_error_propagation
 * @expect compile-pass
 * @section 16.6.3
 * @design Promise rejection 通过 .catch 捕获
 * @note 正向用例：验证 Promise 错误传播通过 .catch 处理编译通过
 */
new Promise<void>((_: (value: void) => void, reject: (reason: Error) => void): void => {
  reject(new Error('fail'));
}).catch((e: Error): void => {
  console.error(e.message);
});
