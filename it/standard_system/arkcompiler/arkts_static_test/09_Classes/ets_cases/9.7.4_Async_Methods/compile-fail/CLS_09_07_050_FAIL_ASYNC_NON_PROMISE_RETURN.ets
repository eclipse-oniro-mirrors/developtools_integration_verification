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
 * @id CLS_09_07_050_FAIL_ASYNC_NON_PROMISE_RETURN
 * @expect compile-fail
 * @section 9.7.4
 * @design async 方法必须返回 Promise<T>，不可返回非 Promise 类型
 * @note 编译错误：async 方法返回类型必须是 Promise<T>
 */
class BadAsync050 {
  async badReturn(): string { // 编译错误
    return "bad"
  }
}
