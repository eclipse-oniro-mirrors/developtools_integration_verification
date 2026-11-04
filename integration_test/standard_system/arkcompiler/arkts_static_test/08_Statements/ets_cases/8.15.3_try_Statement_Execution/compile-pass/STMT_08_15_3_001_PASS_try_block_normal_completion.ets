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
 * @id STMT_08_15_3_001_PASS_try_block_normal_completion
 * @expect compile-pass
 * @section 8.15.3
 * @design 验证规则1：try 块正常完成时整个 try 语句正常完成。try-finally 结构中 try 块不抛出异常，catch 不存在。
 * @note 正向测试：try 块体执行完毕未抛出异常，finally 后续执行，整个 try 语句正常完成。
 */
function testTryBlockNormalCompletion(): void {
    let x: int = 0;
    try {
        x = 42;
    } finally {
        x = 100;
    }
}
