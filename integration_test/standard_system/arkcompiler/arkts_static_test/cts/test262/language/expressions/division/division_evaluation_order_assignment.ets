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

// arktsid: division_evaluation_order_assignment
// description: Division evaluates the left operand before the right operand

function main(): void {
    let x: int = 0;
    arktest.assertEQ((x = 1) / x, 1, 'left assignment is evaluated first');
    x = 0;
    arktest.assertEQ(x / (x = 1), 0, 'right assignment is evaluated after left operand');
}

