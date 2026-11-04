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
 * @id LEX_02_02_018_FAIL_INLINE_NEWLINE_IN_STRING
 * @expect compile-fail
 * @section 2.2
 * @design 单引号字符串内包含未转义换行，应编译失败 * @note 反向用例：验证该场景应产生编译时错误

 */
function testInlineNewlineInString(): void {
  let s: string = 'hello
world'
}
