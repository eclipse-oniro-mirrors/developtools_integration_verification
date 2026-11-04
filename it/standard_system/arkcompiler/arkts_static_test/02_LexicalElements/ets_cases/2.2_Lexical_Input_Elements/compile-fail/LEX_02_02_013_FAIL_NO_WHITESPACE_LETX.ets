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
 * @id LEX_02_02_013_FAIL_NO_WHITESPACE_LETX
 * @expect compile-fail
 * @section 2.2
 * @design 无空白符导致let和x合并为一个标识符letx，应编译失败 * @note 反向用例：验证该场景应产生编译时错误

 */
function testNoWhitespaceLetx(): void {
  letx: number = 1
}
