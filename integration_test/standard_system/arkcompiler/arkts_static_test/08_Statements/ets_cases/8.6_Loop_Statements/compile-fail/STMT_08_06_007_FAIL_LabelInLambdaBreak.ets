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
 * @id STMT_08_06_007_FAIL_LabelInLambdaBreak
 * @expect compile-fail
 * @section 8.6
 * @design 在标签循环体内使用lambda表达式，lambda中引用外层标签的break语句
 * @note 标签不能在lambda表达式中使用，编译时报错
 */
function testLabelInLambdaBreak(): void {
    outer: while (true) {
        const g = (): void => {
            break outer;
        };
    }
}
