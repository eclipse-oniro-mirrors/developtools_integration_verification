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
 * @id STMT_08_09_004_PASS_external_variable
 * @expect compile-pass
 * @section 8.9
 * @design 使用外部声明的变量作为forVariable，元素类型可赋值给变量类型
 * @note 在循环外部声明的变量可被for-of使用，元素类型必须可赋值给变量类型，此处int可赋值给int
 */
function testExternalVariable(): void {
    let arr: Array<int> = [1, 2, 3];
    let elem: int = 0;
    for (elem of arr) {
        console.log(elem.toString());
    }
}
