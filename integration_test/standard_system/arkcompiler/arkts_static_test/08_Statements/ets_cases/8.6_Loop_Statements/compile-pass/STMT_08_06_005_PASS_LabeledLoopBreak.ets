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
 * @id STMT_08_06_005_PASS_LabeledLoopBreak
 * @expect compile-pass
 * @section 8.6
 * @design 带标签的for循环：在循环体内使用break label正确引用标签以提前终止外层循环
 * @note 验证标签循环中break引用标签的合法性，标签必须被使用
 */
function testLabeledLoopBreak(): void {
    let sum: int = 0;
    outerLoop: for (let i: int = 0; i < 5; i++) {
        if (i > 2) {
            break outerLoop;
        }
        sum += i;
    }
}
