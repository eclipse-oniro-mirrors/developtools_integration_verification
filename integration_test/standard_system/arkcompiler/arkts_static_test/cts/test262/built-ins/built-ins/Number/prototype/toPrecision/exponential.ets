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

// arktsid: exponential
// description: Number.prototype.toPrecision returns exponential notation for large/small values

function main(): void {
    arktest.assertEQ((10.0).toPrecision(1), '1e+1', '10 precision 1');
    arktest.assertEQ((1e21).toPrecision(1), '1e+21', '1e21 precision 1');
    arktest.assertEQ((1e-21).toPrecision(1), '1e-21', '1e-21 precision 1');
}