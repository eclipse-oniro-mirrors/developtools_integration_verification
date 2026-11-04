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
 * @id STMT_08_12_019_RUNTIME_return_in_nested_if_else
 * @expect runtime
 * @section 8.12
 * @design 运行时验证嵌套if-else中所有分支return值类型兼容且正确
 * @note 运行时测试：三层嵌套if-else，每条路径均有return且返回int类型，通过不同输入触发全部4条路径并断言结果
 */

function scoreGrade(score: int): int {
    if (score >= 90) {
        if (score >= 95) {
            if (score >= 98) {
                return 5;
            } else {
                return 4;
            }
        } else {
            return 3;
        }
    } else {
        if (score >= 70) {
            if (score >= 80) {
                return 2;
            } else {
                return 1;
            }
        } else {
            return 0;
        }
    }
}

function main(): void {
    let g1: int = scoreGrade(99);
    if (g1 != 5) {
        throw new Error("scoreGrade(99) should be 5, got " + g1);
    }

    let g2: int = scoreGrade(96);
    if (g2 != 4) {
        throw new Error("scoreGrade(96) should be 4, got " + g2);
    }

    let g3: int = scoreGrade(91);
    if (g3 != 3) {
        throw new Error("scoreGrade(91) should be 3, got " + g3);
    }

    let g4: int = scoreGrade(82);
    if (g4 != 2) {
        throw new Error("scoreGrade(82) should be 2, got " + g4);
    }

    let g5: int = scoreGrade(75);
    if (g5 != 1) {
        throw new Error("scoreGrade(75) should be 1, got " + g5);
    }

    let g6: int = scoreGrade(50);
    if (g6 != 0) {
        throw new Error("scoreGrade(50) should be 0, got " + g6);
    }

    console.log("verified");
}
