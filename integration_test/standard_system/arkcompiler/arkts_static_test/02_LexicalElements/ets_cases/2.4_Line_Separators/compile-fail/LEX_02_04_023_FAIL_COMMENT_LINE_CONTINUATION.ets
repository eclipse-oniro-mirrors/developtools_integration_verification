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
 * @id LEX_02_04_023_FAIL_COMMENT_LINE_CONTINUATION
 * @expect compile-fail
 * @section 2.4
 * @design 单行注释 // 应在行终止符处结束，后续若试图反斜杠续行也无效（会引入错误的 Token）
 * @note 反向用例：// comment \\
    next line 实际被解释为下一行有效代码导致语法错
 */
function testCommentLineContinuation(): void {
  // this should be a comment \
  this is not a valid statement
}
