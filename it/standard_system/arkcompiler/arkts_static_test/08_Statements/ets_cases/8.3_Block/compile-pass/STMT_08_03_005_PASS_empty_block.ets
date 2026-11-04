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
 * @id STMT_08_03_005_PASS_empty_block
 * @expect compile-pass
 * @section 8.3
 * @design 空块语句：完全空的块 {}，以及仅有注释的块，验证边界情况
 * @note 正向用例：空块和注释块的编译通过
 */
function testEmptyBlock(): void {
    let x: int = 0;
    {
    }
    x = 1;
}

function testCommentOnlyBlock(): void {
    let x: int = 0;
    {
        /* this is a comment */
    }
    x = 1;
}

function testBlockWithOnlySemicolon(): void {
    let x: int = 0;
    {
        ;
        ;
    }
    x = 1;
}

function testManyEmptyBlocks(): void {
    let x: int = 0;
    {
    }
    {
    }
    {
        x = 42;
    }
}
