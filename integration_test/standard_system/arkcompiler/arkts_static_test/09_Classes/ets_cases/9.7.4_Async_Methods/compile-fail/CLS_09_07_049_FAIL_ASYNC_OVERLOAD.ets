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
 * @id CLS_09_07_049_FAIL_ASYNC_OVERLOAD
 * @expect compile-fail
 * @section 9.7.4
 * @design async 方法不支持方法重载（overload）
 * @note 编译错误：async 方法不能有 overload 签名
 */
class BadAsync049 {
  async fetch(): Promise<string>
  async fetch(id: int): Promise<string>
  async fetch(id?: int): Promise<string> { // 编译错误：async 不支持 overload
    if (id) {
      return "item_" + id
    }
    return "all"
  }
}
