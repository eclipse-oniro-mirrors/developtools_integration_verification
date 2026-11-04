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
 * @id STMT_08_04_013_PASS_loop_body_shadows_param
 * @expect compile-pass
 * @section 8.4
 * @design 测试for循环体内let声明与函数参数同名编译错误：参数和局部变量在同一作用域导致重复
 * @note 规范：参数和局部变量在同一作用域同名 -> 编译时错误；for循环体内的let视为同一函数作用域
 */
function testLoopBodyShadowsParam(item: boolean): void {
    for (let i: int = 0; i < 10; i = i + 1) {
        let item: int = i;
    }
}
