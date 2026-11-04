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

// arktsid: flags_return_order
// description: RegExp.prototype.flags come in a single order, independent of source order
// Conversion notes:
// - The flags getter returns flags in canonical order ('dgimsuy') regardless of the order the flags were passed to the
// constructor.

function main(): void {
    arktest.assertEQ(new RegExp('', 'dgimsuy').flags, 'dgimsuy', 'dgimsuy => dgimsuy');
    arktest.assertEQ(new RegExp('', 'yusmigd').flags, 'dgimsuy', 'yusmigd => dgimsuy');
}