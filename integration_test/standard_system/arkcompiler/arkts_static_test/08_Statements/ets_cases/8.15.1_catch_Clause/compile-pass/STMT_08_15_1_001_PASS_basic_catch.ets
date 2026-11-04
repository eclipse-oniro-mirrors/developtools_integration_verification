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
 * @id STMT_08_15_1_001_PASS_basic_catch
 * @expect compile-pass
 * @section 8.15.1
 * @design 验证基本的 try-catch 结构编译通过。catch 子句捕获 Error 类型对象，在块内访问 error 对象。
 * @note 正向测试：最基本的 catch 语法结构，try 后跟 catch (e) 块，标识符 e 类型为 Error。
 */
function testBasicCatch(): void {
    try {
        throw new Error("basic error");
    } catch (e) {
        let msg: string = (e as Error).message;
    }
}
