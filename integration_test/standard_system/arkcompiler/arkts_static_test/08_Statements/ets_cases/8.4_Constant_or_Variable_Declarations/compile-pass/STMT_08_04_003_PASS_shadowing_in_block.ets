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
 * @id STMT_08_04_003_PASS_shadowing_in_block
 * @expect compile-pass
 * @section 8.4
 * @design 测试块作用域中变量遮蔽：外层let和内层const同名变量合法
 * @note 规范明确允许内部块遮蔽外部同名变量
 */
function testShadowingBlock(): void {
    let item: int = 123;
    {
        const item: string = "123";
    }
    let value: string = "outer";
    {
        const value: string = "inner";
    }
}
