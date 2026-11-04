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
 * @id STMT_08_09_007_FAIL_type_mismatch
 * @expect compile-fail
 * @section 8.9
 * @design 外部变量类型与迭代元素类型不匹配，应产生编译时错误
 * @note 元素类型string不能赋值给变量类型int，编译时报错
 */
function testTypeMismatch(): void {
    let str: string = "hello";
    let num: int = 0;
    for (num of str) {
        console.log(num.toString());
    }
}
