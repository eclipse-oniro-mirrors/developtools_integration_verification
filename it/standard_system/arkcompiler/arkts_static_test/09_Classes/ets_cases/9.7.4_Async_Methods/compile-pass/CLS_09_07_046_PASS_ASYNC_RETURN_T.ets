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
 * @id CLS_09_07_046_PASS_ASYNC_RETURN_T
 * @expect compile-pass
 * @section 9.7.4
 * @design async 方法返回非 Promise 的 T，自动装箱为 Promise<T>
 * @note 正向用例：async 方法返回 T，自动 wrap 为 Promise<T>
 */
class DataService046 {
  async getValue(): Promise<int> {
    return 42
  }
  async getName(): Promise<string> {
    return "hello"
  }
}
