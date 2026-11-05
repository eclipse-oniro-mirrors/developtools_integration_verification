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
 * @id STMT_08_13_002_PASS_fall_through
 * @expect compile-pass
 * @section 8.13
 * @design int类型switch中case无break时的fall-through穿透执行流程验证
 * @note case 1匹配后无break，继续执行case 2的语句直到遇到break才退出，验证fall-through机制
 */
function testFallThrough(): void {
    let x: int = 1;
    let result: string = "";
    switch (x) {
        case 1:
            result = "one_";
        case 2:
            result += "two";
            break;
        default:
            result = "default";
            break;
    }
}
