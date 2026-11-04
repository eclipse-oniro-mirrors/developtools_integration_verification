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
 * @id STMT_08_06_016_FAIL_LabelInLambdaDoWhile
 * @expect compile-fail
 * @section 8.6
 * @design 标签关联 do-while 循环，循环体内 lambda 表达式引用该标签的 break 语句 — 编译时错误
 * @note STATEMENTS.md: "A compile-time error occurs if the label identifier is used in lambda expressions within a loop body." do-while 同样受此约束
 */
function testLabelInLambdaDoWhileBreak(): void {
  let i: int = 0;
  dwl: do {
    const f = (): void => {
      break dwl;
    };
    i++;
  } while (i < 5);
}

function testLabelInLambdaDoWhileContinue(): void {
  let j: int = 0;
  loopDwl: do {
    const g = (): void => {
      continue loopDwl;
    };
    j++;
  } while (j < 3);
}
