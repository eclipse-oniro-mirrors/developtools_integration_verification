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
 * @id AMB_14_05_007_PASS_INTERFACE_INDEXER
 * @expect compile-pass
 * @section 14.5
 * @design declare interface 含 ambient indexer
 * @note 正向用例：验证 ambient interface 中 indexer 编译通过
 */
declare interface Indexable {
  [index: number]: string
}
