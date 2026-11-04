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

// arktsid: return_values
// description: Number.prototype.toExponential returns exponential string for values

function main(): void {
    arktest.assertEQ((25.0).toExponential(), '2.5e+1', '25');
    arktest.assertEQ((12345.0).toExponential(0), '1e+4', '12345 fd 0');
    arktest.assertEQ((123.456).toExponential(0), '1e+2', '123.456 fd 0');
}