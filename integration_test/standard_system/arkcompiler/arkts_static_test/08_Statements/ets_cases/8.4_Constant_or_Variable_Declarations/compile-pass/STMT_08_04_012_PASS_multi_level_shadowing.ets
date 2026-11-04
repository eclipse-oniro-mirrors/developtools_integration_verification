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
 * @id STMT_08_04_012_PASS_multi_level_shadowing
 * @expect compile-pass
 * @section 8.4
 * @design 测试函数作用域内多级块遮蔽：外层let被if块遮蔽，if块内let再被内层块遮蔽（规范允许任意声明遮蔽同作用域内同名声明）
 * @note let在函数体、if块体、内层块体各层合法遮蔽；离开块后恢复外层可见性
 */
function testMultiLevelShadowing(): void {
    let item: int = 1;
    let value: string = "outer";
    if (1) {
        let item: int = 2;
        let value: string = "middle";
        {
            const item: int = 3;
            const value: string = "inner";
        }
    }
    let count: number = 10.0;
    if (1) {
        let count: number = 20.0;
        {
            let count: number = 30.0;
        }
    }
}
