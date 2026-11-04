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

// arktsid: division_identifier_operands_no_asi
// description: Identifier operands remain a division expression across the line

function main(): void {
    let instance: int = 60;
    let ofValue: int = 6;
    let g: int = 2;
    let notRegExp: int = instance / ofValue / g;
    arktest.assertEQ(notRegExp, 5);
}
