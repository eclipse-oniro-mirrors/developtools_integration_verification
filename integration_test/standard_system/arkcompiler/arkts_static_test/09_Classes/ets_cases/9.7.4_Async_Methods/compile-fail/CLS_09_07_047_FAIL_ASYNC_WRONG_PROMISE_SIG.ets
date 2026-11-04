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
 * @id CLS_09_07_047_FAIL_ASYNC_WRONG_PROMISE_SIG
 * @expect compile-fail
 * @section 9.7.4
 * @design async 方法返回 Promise 但构造函数签名不匹配
 * @note 编译错误：Promise 构造器参数签名必须匹配
 */
class BadAsync047 {
  async fetch(): Promise<string> {
    // Promise constructor expects (resolve, reject) => void, not () => T
    return new Promise<string>(() => "direct") // 编译错误：构造器签名不匹配
  }
}
