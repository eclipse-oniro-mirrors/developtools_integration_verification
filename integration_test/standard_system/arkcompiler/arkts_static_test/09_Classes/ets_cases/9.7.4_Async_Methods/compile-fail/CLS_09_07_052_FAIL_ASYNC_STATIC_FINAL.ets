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
 * @id CLS_09_07_052_FAIL_ASYNC_STATIC_FINAL
 * @expect compile-fail
 * @section 9.7.4
 * @design async + static + final 修饰符组合检查
 * @note 编译错误：final 不能与 async 组合
 */
class BadAsync052 {
  static final async combo(): Promise<void> {} // 编译错误
}
