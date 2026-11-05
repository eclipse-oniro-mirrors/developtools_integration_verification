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
 * @id CLS_09_07_005_FAIL_DUPLICATE_MODIFIER
 * @expect compile-fail
 * @section 9.7
 * @design 方法修饰符重复出现 — spec: "Method modifier appears more than once"
 * @note 反向用例：同一声明重复修饰符应编译失败
 */
abstract class Bad005 {
  abstract abstract foo(): void
}
