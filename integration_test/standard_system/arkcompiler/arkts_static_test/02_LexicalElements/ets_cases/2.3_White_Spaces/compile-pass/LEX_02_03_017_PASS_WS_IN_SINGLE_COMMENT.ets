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
 * @id LEX_02_03_017_PASS_WS_IN_SINGLE_COMMENT
 * @expect compile-pass
 * @section 2.3
 * @design 单行注释内含各种空白符（spec显式允许） * @note 正向用例：验证该特性编译通过的正确用法

 */
function testWsInSingleComment(): void {
  let x: int = 1 // comment with	tab and﻿zwnbsp
  let y: int = 2 //        leading spaces in comment
}
