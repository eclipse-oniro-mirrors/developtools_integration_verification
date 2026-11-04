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
 * @id STMT_08_04_015_RUNTIME_multi_level_shadow
 * @expect runtime
 * @section 8.4
 * @design 运行时验证多级作用域遮蔽：外层let被if块内let遮蔽，if块内let再被内层块中const遮蔽，离开各级块后恢复外层值
 * @note 块作用域规则决定可见性；内层声明遮蔽外层但不影响外层绑定
 */
function main(): void {
    let item: int = 1;
    if (item != 1) {
        throw new Error("outer item should be 1");
    }
    if (1) {
        let item: int = 2;
        if (item != 2) {
            throw new Error("middle item should be 2");
        }
        {
            const item: int = 3;
            if (item != 3) {
                throw new Error("inner item should be 3");
            }
        }
        if (item != 2) {
            throw new Error("item should be 2 after inner block");
        }
    }
    if (item != 1) {
        throw new Error("item should be 1 after if block");
    }
    let text: string = "A";
    if (1) {
        let text: string = "B";
        if (text != "B") {
            throw new Error("middle text should be B");
        }
        {
            const text: string = "C";
            if (text != "C") {
                throw new Error("inner text should be C");
            }
        }
        if (text != "B") {
            throw new Error("text should be B after inner block");
        }
    }
    if (text != "A") {
        throw new Error("text should be A after if block");
    }
    console.log("verified");
}
