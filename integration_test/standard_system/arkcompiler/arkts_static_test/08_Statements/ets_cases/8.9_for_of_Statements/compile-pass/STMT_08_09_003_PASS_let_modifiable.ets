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
 * @id STMT_08_09_003_PASS_let_modifiable
 * @expect compile-pass
 * @section 8.9
 * @design 使用let声明forVariable，验证可在循环体内修改
 * @note let修饰的forVariable允许修改，每次迭代重置为当前元素值
 */
function testLetModifiable(): void {
    let arr: Array<int> = [1, 2, 3];
    for (let x of arr) {
        x = x * 2;
    }
}
