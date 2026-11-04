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

// arktsid: assignment_expression_returns_rhs
// description: An assignment expression evaluates to its right-hand side

function main(): void {
    let x: int = 0;
    let result: int = (x = 1);
    arktest.assertEQ(result, 1);
    x = 0;
    result = (x = 1);
    arktest.assertEQ(result, 1);
}
