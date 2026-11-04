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
// arktsid: compound_assignment_add_expression
// description: Compound addition assignment returns the assigned value
function main(): void {
    let x: int = 1;
    let x1: int = x += 1;
    arktest.assertEQ(x1, 2);
    let y: int = 0;
    let y1: int = 0;
    y = 1;
    y1 = y += 1;
    arktest.assertEQ(y1, 2);
}
