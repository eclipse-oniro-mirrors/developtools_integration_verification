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
 * @id CLS_09_07_045_PASS_ASYNC_STATIC
 * @expect compile-pass
 * @section 9.7.4
 * @design static async 方法声明
 * @note 静态方法和 async 可组合使用
 */
class AsyncProcessor045 {
  static async process(): Promise<string> {
    return "static_async"
  }
}
