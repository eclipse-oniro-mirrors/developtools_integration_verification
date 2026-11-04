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
 * @id STMT_08_15_3_005_FAIL_try_no_catch_no_finally
 * @expect compile-fail
 * @section 8.15.3
 * @design 验证 try 块既没有 catch 子句也没有 finally 子句时产生编译错误。规范要求 try 语句必须至少包含 catch 或 finally。
 * @note 反向测试：try 块后直接结束，无 catch 也无 finally，编译器应报错。
 */
function testTryNoCatchNoFinally(): void {
    let x: int = 0;
    try {
        x = 1;
    }
}
