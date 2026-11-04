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
 * @id STMT_08_06_017_FAIL_LabelInLambdaForOf
 * @expect compile-fail
 * @section 8.6
 * @design 标签关联 for-of 循环，循环体内 lambda 表达式引用该标签的 break/continue — 编译时错误
 * @note STATEMENTS.md: "A compile-time error occurs if the label identifier is used in lambda expressions within a loop body." for-of 同样受此约束
 */
function testLabelInLambdaForOfBreak(): void {
  let arr: int[] = [1, 2, 3];
  search: for (let v of arr) {
    const h = (): void => {
      break search;
    };
  }
}

function testLabelInLambdaForOfContinue(): void {
  let arr: string[] = ["a", "b", "c"];
  filter: for (let s of arr) {
    const k = (): void => {
      continue filter;
    };
  }
}
