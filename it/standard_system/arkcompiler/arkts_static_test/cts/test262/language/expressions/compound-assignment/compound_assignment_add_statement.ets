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
// arktsid: compound_assignment_add_statement
// description: Compound addition assignment updates a variable
function main(): void {
    let x: int = 1;
    x += 1;
    arktest.assertEQ(x, 2);
    let y: int = 0;
    y = 1;
    y += 1;
    arktest.assertEQ(y, 2);
}
