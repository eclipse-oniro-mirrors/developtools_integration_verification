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
 * @id STMT_08_06_012_FAIL_label_declared_not_used
 * @expect compile-fail
 * @section 8.6
 * @design spec §8.6 要求：loop label 声明后若未在 loopStatement 中被 break/continue 使用，应产生 compile-time error
 * @note ⚠️ 编译器差异 C-8.06-01：es2panda 未实现此检查，实际编译通过(exit0)。本用例按 spec 标为 compile-fail，运行时表现为 unexpected pass，差异见 issue_report C-8.06-01
 */
function testLabelNotUsed(): void {
  unused_label:
  for (let i: int = 0; i < 10; i++) {
    console.log("iteration")
  }
}
