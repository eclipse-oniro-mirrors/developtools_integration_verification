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
 * @id STMT_08_15_018_FAIL_catch_identifier_outside_block
 * @expect compile-fail
 * @section 8.15
 * @design 验证 catch(e) 中的标识符 e 在 catch 块外部赋值和使用均产生编译错误
 * @note catch(e) 声明的 e 作用域严格限制在 catch 子句的块内部，在 finally 块或 try 语句之后的代码中引用均非法
 */
function testCatchIdentifierOutsideBlock(): void {
    let x: int = 0;
    try {
        x = 1;
    } catch (e) {
        x = 2;
    }
    // catch identifier e is out of scope - assigning to it outside catch must fail
    e = 3;
}
