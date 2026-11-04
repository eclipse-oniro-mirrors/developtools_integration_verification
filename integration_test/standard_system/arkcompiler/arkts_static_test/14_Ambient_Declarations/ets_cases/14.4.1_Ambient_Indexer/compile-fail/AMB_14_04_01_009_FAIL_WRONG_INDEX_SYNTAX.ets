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
 * @id AMB_14_04_01_009_FAIL_WRONG_INDEX_SYNTAX
 * @expect compile-fail
 * @section 14.4.1
 * @design ambient indexer 缺少返回类型，违反语法规则
 * @note 反向用例：indexer 缺少返回类型应产生编译时错误
 */
declare class BadSyntax {
  [index: number]
}
