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
 * @id CLS_09_07_054_FAIL_ASYNC_NON_ABSTRACT_EMPTY_BODY
 * @expect compile-fail
 * @section 9.7.4
 * @design 非 abstract 非 native 的 async 方法必须有方法体
 * @note 编译错误：方法体不能为空
 */
class BadAsync054 {
  async fetch(): Promise<void> // 编译错误：缺少方法体
}
