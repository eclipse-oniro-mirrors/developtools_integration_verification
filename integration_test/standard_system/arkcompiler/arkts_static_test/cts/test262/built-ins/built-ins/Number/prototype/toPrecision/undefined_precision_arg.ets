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

// arktsid: undefined_precision_arg
// description: Number.prototype.toPrecision with no argument returns default precision

function main(): void {
    arktest.assertEQ((7.0).toPrecision(), '7', '7');
    arktest.assertEQ((39.0).toPrecision(), '39', '39');
    arktest.assertEQ((42.0).toPrecision(), '42', '42');
}