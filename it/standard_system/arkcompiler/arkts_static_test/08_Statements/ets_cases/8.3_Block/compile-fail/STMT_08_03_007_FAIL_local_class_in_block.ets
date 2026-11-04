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
 * @id STMT_08_03_007_FAIL_local_class_in_block
 * @expect compile-fail
 * @section 8.3
 * @design 块内声明局部类应编译失败（ArkTS 不允许块级类声明）
 * @note 反向用例：块中 class 声明，违反 ArkTS 限制
 */
function testLocalClassInBlockFail(): void {
    let x: int = 0;
    {
        class LocalPoint {
            x: int = 0;
            y: int = 0;
        }
        let p: LocalPoint = new LocalPoint();
        x = p.x;
    }
}
