/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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

// arktsid: identifier_other_id_continue
// description: Grandfathered Unicode characters are valid identifier continues

function main(): void {
    let a℘: int = 1;
    arktest.assertEQ(a℘, 1);
    let a℮: int = 1;
    arktest.assertEQ(a℮, 1);
    let a゛: int = 1;
    arktest.assertEQ(a゛, 1);
    let a゜: int = 1;
    arktest.assertEQ(a゜, 1);
    let aᢅ: int = 1;
    arktest.assertEQ(aᢅ, 1);
    let aᢆ: int = 1;
    arktest.assertEQ(aᢆ, 1);
    let a፩: int = 1;
    arktest.assertEQ(a፩, 1);
    let a፪: int = 1;
    arktest.assertEQ(a፪, 1);
    let a፫: int = 1;
    arktest.assertEQ(a፫, 1);
    let a፬: int = 1;
    arktest.assertEQ(a፬, 1);
    let a፭: int = 1;
    arktest.assertEQ(a፭, 1);
    let a፮: int = 1;
    arktest.assertEQ(a፮, 1);
    let a፯: int = 1;
    arktest.assertEQ(a፯, 1);
    let a፰: int = 1;
    arktest.assertEQ(a፰, 1);
    let a፱: int = 1;
    arktest.assertEQ(a፱, 1);
    let a·: int = 1;
    arktest.assertEQ(a·, 1);
    let a·: int = 1;
    arktest.assertEQ(a·, 1);
    let a᧚: int = 1;
    arktest.assertEQ(a᧚, 1);
}
